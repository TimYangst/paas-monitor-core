package org.seforge.monitor.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.seforge.monitor.domain.Resource;
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
	
	//在添加PhymResource的controller中先把resource persist起来
	public List<Vim> getVims(String ip, String username, String password, Resource resource){
		List<Vim> vims = new ArrayList<Vim>();
		String[] args = generateArgs(ip, username, password);		
		try {
			ExtendedAppUtil cb = ExtendedAppUtil.initialize("VsphereService", args);
			cb.connect();
			String[][] phymTypeInfo = new String[][] {
					new String[] { "HostSystem", "name" } };
			String[][] vimTypeInfo = new String[][] {				
					new String[]  { "VirtualMachine", "name", "summary", "guest"} };
			ObjectContent[] phymOcary = cb.getServiceUtil3()
					.getContentsRecursively(null, null, phymTypeInfo, true);
			ObjectContent[] vimOcary = cb.getServiceUtil3()
					.getContentsRecursively(null, null, vimTypeInfo, true);
			//如果没有访问HostSystem的权限，phymOcary可能会为null			
			if(phymOcary == null){
				resource.setName("UNknown");
			}else{
				resource.setName((String) phymOcary[0].getPropSet(0).getVal());
			}		
			resource.merge();
			HashMap propMap = null;			
			for (int i = 0; i < vimOcary.length; i++) {
				ObjectContent oc = vimOcary[i];
				propMap = propSetToHashMap(oc.getPropSet());
				Vim vim = new Vim();
				vim.setName((String)propMap.get("name"));			
				VirtualMachineSummary sum = (VirtualMachineSummary) propMap.get("summary");					
				if (sum.getRuntime().getPowerState() == VirtualMachinePowerState.poweredOn) {
					vim.setIp(sum.getGuest().getIpAddress());											
				} 
					vim.setState(sum.getRuntime().getPowerState().toString());
				GuestInfo guest = (GuestInfo)propMap.get("guest");
				vim.setOs(guest.getGuestFullName());	
				vim.setParentId(resource.getId());
				vims.add(vim);
			}	
			cb.disConnect();
		} catch (Exception e) {			
			e.printStackTrace();
		}
		return vims;	
	}
	
	private String[] generateArgs(String ip, String username, String password) {
		String[] args = new String[] { "--url",
				"http://" + ip + "/sdk", "--username",
				username, "--password", password };
		return args;
	}
	
	private HashMap<String, Object> propSetToHashMap(DynamicProperty[] set){
		HashMap<String, Object> map = new HashMap<String, Object>();
		for(int i=0; i<set.length; i++){
			map.put(set[i].getName(),set[i].getVal());
		}
		return map;
	}

}
