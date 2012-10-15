package org.seforge.monitor.manager;

import java.util.List;

import org.seforge.monitor.domain.Resource;

public interface ResourceManager {
	public List<Resource> getAllVims();
	
	public List<Resource> getAllPhyms();
	
	public List<Resource> getPhymsByGroup(int groupId);
	
	public void addNewServer(String jmxPort, String path, String serviceName);	
}
