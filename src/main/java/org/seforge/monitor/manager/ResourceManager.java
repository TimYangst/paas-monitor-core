package org.seforge.monitor.manager;

import java.io.IOException;
import java.util.List;

import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.exception.NotMonitoredException;

public interface ResourceManager {
	public List<Resource> getAllVims();
	
	public List<Resource> getAllPhyms();
	
	public List<Resource> getPhymsByGroup(int groupId);
	
	public List<Resource> getAppServersByGroup(int groupId);
	
	public Integer addNewServer(String ip, String jmxUrl, String path, String serviceName, String groupId, String protoytpe) throws IOException, NotMonitoredException;

	public void deleteServer(String id) throws NumberFormatException, IOException;	
	
}
