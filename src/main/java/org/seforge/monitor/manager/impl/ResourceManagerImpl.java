package org.seforge.monitor.manager.impl;

import java.util.List;

import org.seforge.monitor.common.ResourceType;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.manager.ResourceManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ResourceManagerImpl implements ResourceManager{

	@Transactional
	public List<Resource> getAllVims() {
		return Resource.findResourcesByTypeIdEquals(ResourceType.OPERATING_SYSTEM).getResultList();		
	}
	
	@Transactional
	public List<Resource> getAllPhyms() {
		return Resource.findResourcesByTypeIdEquals(ResourceType.PHYSICAL_MACHINE).getResultList();		
	}

	@Override
	@Transactional
	public void addNewServer(String jmxPort, String path, String serviceName) {
		// TODO 
		//先调用proxy.createServerResource把resource通过hqapi添加到hyperic server中，参见test中CreateTomcatServer.java中的内容
		//如果成功，获取相关的hyperic端resource信
		//根据得到的信息，在数据库中存入该resource
		
	}

}
