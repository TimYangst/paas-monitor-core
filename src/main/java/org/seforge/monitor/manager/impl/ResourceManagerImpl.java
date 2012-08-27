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

}
