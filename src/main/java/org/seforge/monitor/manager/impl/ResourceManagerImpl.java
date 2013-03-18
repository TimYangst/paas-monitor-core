package org.seforge.monitor.manager.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.hyperic.hq.hqapi1.types.ResponseStatus;
import org.hyperic.hq.hqapi1.types.ResourceResponse;
import org.seforge.monitor.common.ResourceType;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.exception.NotMonitoredException;
import org.seforge.monitor.hqapi.HQProxy;
import org.seforge.monitor.manager.ResourceManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResourceManagerImpl implements ResourceManager{
	
	@Autowired
	private HQProxy proxy;

	@Transactional
	public List<Resource> getAllVims() {
		return Resource.findResourcesByTypeIdEquals(ResourceType.OPERATING_SYSTEM).getResultList();		
	}
	
	@Transactional
	public List<Resource> getAllPhyms() {
		List<Resource> phyms = Resource.findResourcesByTypeIdEquals(ResourceType.PHYSICAL_MACHINE).getResultList();	
		for(Resource phym : phyms){
			phym.setChildrenCount(phym.getChildren().size());
		}
		return phyms;
	}
	
	@Transactional
	public List<Resource> getPhymsByGroup(int groupId){
		List<Resource> resources = Resource.findResourcesByTypeIdEquals(ResourceType.PHYSICAL_MACHINE).getResultList();
		List<Resource> result = new ArrayList<Resource>();
		for(Resource r : resources){
			for(ResourceGroup rg : r.getResourceGroups()){
				if(rg.getId() == groupId){
					result.add(r);
				}					
			}			
		}
		return result;
	}
	
	@Transactional
	public List<Resource> getAppServersByGroup(int groupId){
		List<Resource> resources = Resource.findResourcesByTypeIdEquals(ResourceType.APPLICATION_SERVER).getResultList();
		List<Resource> result = new ArrayList<Resource>();
		for(Resource r : resources){
			for(ResourceGroup rg : r.getResourceGroups()){
				if(rg.getId() == groupId){
					result.add(r);
				}					
			}			
		}
		return result;
	}

	@Override
	@Transactional
	public Integer addNewServer(String ip, String jmxUrl, String path, String serviceName, String groupId, String prototype) throws IOException, NotMonitoredException {
		// TODO 
		//先调用proxy.createServerResource把resource通过hqapi添加到hyperic server中，参见test中CreateTomcatServer.java中的内容
		//如果成功，获取相关的hyperic端resource信
		//根据得到的信息，在数据库中存入该resource
		org.hyperic.hq.hqapi1.types.Resource vim = proxy.getVimResource(ip, false, false);
		Resource vimHQ = Resource.findResourcesByResourceIdEquals(vim.getId()).getSingleResult();  
		if (vimHQ == null){
			Resource r = new Resource(vim);
			r.persist();
		}		
		ResourcePrototype resourcePrototype = proxy.getHQApi().getResourceApi().getResourcePrototype(prototype).getResourcePrototype();
		Map<String,String> configs = new HashMap<String,String>();
		configs.put("jmx.url", jmxUrl);		 
		configs.put("process.query", "State.Name.eq=java,Args.*.sw=-Dcatalina.base="+ path);
		//configs.put("server.log_track.enable", "true");
		//configs.put("server.log_track.files", "logs\\catalina.out");
		configs.put("service_name", serviceName);
		String name = prototype + " " + ip + " " + serviceName;
		ResourceResponse response = proxy.getHQApi().getResourceApi().createServer(resourcePrototype, vim, name, configs);
		if (response.getStatus() == ResponseStatus.SUCCESS) {
			org.hyperic.hq.hqapi1.types.Resource newServer = response.getResource();
			proxy.saveResource(newServer, vimHQ, true);
			return newServer.getId();
		}
		else
		{
			System.out.println(response.getStatus().name());
			System.out.println(response.getError().getReasonText());
			return new Integer(-1);
		}
			
	}

	@Override
	@Transactional
	public void deleteServer(String id) throws NumberFormatException, IOException {
		ResourceApi ra = proxy.getHQApi().getResourceApi();
		ra.deleteResource(Integer.parseInt(id));
		Resource resource = Resource.findResource(Integer.parseInt(id));
		resource.remove();
	}

}
