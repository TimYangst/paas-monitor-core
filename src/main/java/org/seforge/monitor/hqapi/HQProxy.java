package org.seforge.monitor.hqapi;

import java.io.IOException;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hyperic.hq.hqapi1.HQApi;
import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.types.Ip;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourceProperty;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.seforge.monitor.domain.ResourcePropertyKey;
import org.seforge.monitor.domain.ResourcePropertyValue;
import org.seforge.monitor.service.PrototypeMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HQProxy {

	private Log log = LogFactory.getLog(HQProxy.class);

	private HQApi hqapi;	
	
	@Autowired
	private PrototypeMapping mapping;

	@Autowired
	public HQProxy(@Value("${hq.host}") String host,
			@Value("${hq.port}") int port,
			@Value("${hq.secure}") boolean secure,
			@Value("${hq.username}") String username,
			@Value("${hq.password}") String password) {
		this.hqapi = new HQApi(host, port, secure, username, password);
		log.info("hqapi has fetched successfully.");
	}

	public HQApi getHQApi() {
		return this.hqapi;
	}

	public List<Resource> getWin32PlatformResources(boolean verbose, boolean children) throws IOException{
		ResourceApi api = hqapi.getResourceApi();        
        ResourcePrototype win32Prototype = api.getResourcePrototype("Win32").getResourcePrototype();        
        List<Resource> resources = api.getResources(win32Prototype, verbose, children).getResource();        
        return resources;
	}
	
	@Transactional
	public void saveResources() throws IOException{
		List<Resource> resources = getWin32PlatformResources(true, true);
		for(Resource resource : resources){			
			org.seforge.monitor.domain.Resource r = saveResource(resource);			
			for(Resource server : resource.getResource()){
				org.seforge.monitor.domain.Resource serverResource = saveResource(server);
				serverResource.setParent(r);
				serverResource.merge();
				for(Resource service : server.getResource()){
					org.seforge.monitor.domain.Resource serviceResource = saveResource(service);
					serviceResource.setParent(serverResource);
					serviceResource.merge();	
				}	
			}
		}
	}
	
	@Transactional
	public org.seforge.monitor.domain.Resource saveResource(Resource resource){
		//First, save the prototype of the resource if it does not exist
		String ptName = resource.getResourcePrototype().getName();
		Integer typeId = mapping.getTypeByPrototype(ptName);
		org.seforge.monitor.domain.ResourcePrototype rpt = org.seforge.monitor.domain.ResourcePrototype.findResourcePrototypeByName(ptName);
		if(rpt == null){
			rpt = new org.seforge.monitor.domain.ResourcePrototype(ptName, typeId);
			rpt.persist();
		}
		
		//Second, save the resource
		org.seforge.monitor.domain.Resource r = new org.seforge.monitor.domain.Resource();
		r.setName(resource.getName());
		r.setTypeId(rpt.getTypeId());
		r.setResourceId(resource.getId());
		r.setInstanceId(resource.getInstanceId());			
		for(Ip ip : resource.getIp()){
			if(!(ip.getAddress().equals("127.0.0.1"))){
				System.out.println(ip.getAddress());
				r.setIp(ip.getAddress());
				break;
			}						
		}		
		r.setResourcePrototype(rpt);		
		r.persist();
		
		
		//Third, save the properties of the resource
		List<ResourceProperty> rpList = resource.getResourceProperty();
		for(ResourceProperty rp : rpList){
			String key = rp.getKey();
			ResourcePropertyKey rpKey = ResourcePropertyKey.findKey(key, rpt);
			if(rpKey == null){
				rpKey = new ResourcePropertyKey();
				rpKey.setKey(key);
				rpKey.setResourcePrototype(rpt);
				rpKey.persist();
			}	
			ResourcePropertyValue value = new ResourcePropertyValue();
			value.setValue(rp.getValue());
			value.setResource(r);
			value.setResourcePropertyKey(rpKey);
			value.persist();
		}		
		return r;
	}
}
