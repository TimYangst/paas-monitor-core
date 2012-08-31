package org.seforge.monitor.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourcePropertyKey;
import org.seforge.monitor.domain.ResourcePropertyValue;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.domain.Vim;
import org.springframework.stereotype.Service;
import com.vmware.apputils.version.ExtendedAppUtil;
import com.vmware.vim25.DynamicProperty;
import com.vmware.vim25.GuestInfo;
import com.vmware.vim25.ObjectContent;
import com.vmware.vim25.VirtualMachinePowerState;
import com.vmware.vim25.VirtualMachineSummary;

@Service
public class VsphereService {	
	public List<Vim> getVims(String ip, String username, String password, String phymName) throws Exception {	
		List<Vim> vims = new ArrayList<Vim>();
		String[] args = generateArgs(ip, username, password);

		ExtendedAppUtil cb = ExtendedAppUtil.initialize("VsphereService", args);
		cb.connect();
		String[][] phymTypeInfo = new String[][] { new String[] { "HostSystem",
				"name" } };
		String[][] vimTypeInfo = new String[][] { new String[] {
				"VirtualMachine", "name", "summary", "guest" } };
		ObjectContent[] phymOcary = cb.getServiceUtil3()
				.getContentsRecursively(null, null, phymTypeInfo, true);
		ObjectContent[] vimOcary = cb.getServiceUtil3().getContentsRecursively(
				null, null, vimTypeInfo, true);
		// 如果没有访问HostSystem的权限，phymOcary可能会为null		
		if (phymOcary == null) {
			phymName = "UNknown";
		} else {
			phymName = (String) phymOcary[0].getPropSet(0).getVal();
		}		
		//连接成功后再向数据库中保存phym
		Resource phym = savePhym(ip, username, password, phymName);
		HashMap propMap = null;
		for (int i = 0; i < vimOcary.length; i++) {
			ObjectContent oc = vimOcary[i];
			propMap = propSetToHashMap(oc.getPropSet());
			Vim vim = new Vim();
			vim.setName((String) propMap.get("name"));
			VirtualMachineSummary sum = (VirtualMachineSummary) propMap
					.get("summary");
			if (sum.getRuntime().getPowerState() == VirtualMachinePowerState.poweredOn) {
				vim.setIp(sum.getGuest().getIpAddress());
			}
			vim.setState(sum.getRuntime().getPowerState().toString());
			GuestInfo guest = (GuestInfo) propMap.get("guest");
			vim.setOs(guest.getGuestFullName());
			vim.setParentId(phym.getId());
			vims.add(vim);
		}
		cb.disConnect();
		return vims;
	}
	
	
	public Resource savePhym(String ip, String username, String password, String name){
		ResourcePrototype resourcePrototype = ResourcePrototype.findResourcePrototypeByName("VMware Vsphere");
        Resource resource = new Resource();   
        resource.setName(name);
        resource.setTypeId(resourcePrototype.getTypeId());
        resource.setResourcePrototype(resourcePrototype);
        resource.persist();
        
        ResourcePropertyValue ipValue = new ResourcePropertyValue();
        ResourcePropertyKey ipKey = ResourcePropertyKey.findKey("ip", resourcePrototype);
        ipValue.setResourcePropertyKey(ipKey);
        ipValue.setValue(ip);
        ipValue.setResource(resource);
        ipValue.persist();
        
        ResourcePropertyValue userValue = new ResourcePropertyValue();
        ResourcePropertyKey userKey = ResourcePropertyKey.findKey("username", resourcePrototype);
        userValue.setResourcePropertyKey(userKey);
        userValue.setValue(username);
        userValue.setResource(resource);
        userValue.persist();
        
        ResourcePropertyValue pwValue = new ResourcePropertyValue();
        ResourcePropertyKey pwKey = ResourcePropertyKey.findKey("password", resourcePrototype);
        pwValue.setResourcePropertyKey(pwKey);
        pwValue.setValue(password);
        pwValue.setResource(resource);
        pwValue.persist();		
        
        return resource;
	}

	private String[] generateArgs(String ip, String username, String password) {
		String[] args = new String[] { "--url", "http://" + ip + "/sdk",
				"--username", username, "--password", password };
		return args;
	}

	private HashMap<String, Object> propSetToHashMap(DynamicProperty[] set) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < set.length; i++) {
			map.put(set[i].getName(), set[i].getVal());
		}
		return map;
	}

}
