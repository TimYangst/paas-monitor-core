package org.seforge.monitor.manager;

import java.util.List;

import org.seforge.monitor.domain.Resource;

public interface ResourceManager {
	List<Resource> getAllVims();
	
	List<Resource> getAllPhyms();
	
}
