package org.seforge.monitor.manager.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.hqapi.HQProxy;
import org.seforge.monitor.manager.ConstraintManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConstraintManagerImpl implements ConstraintManager{
	@Autowired
	private HQProxy hqProxy;	
	
	public void addNewConstraint(ResourcePrototype rp, ResourceGroup rg, Constraint constraint) throws IOException{
		//Find all the resources that of rp and in rg		
		Set<Resource> resources = rg.getResources();
		List<Resource> gResources = new ArrayList<Resource>();
		for(Resource r: resources){
			if(r.getResourcePrototype().getName().equals(rp.getName()))				
				gResources.add(r);
		}		
		hqProxy.syncAlert(gResources, constraint, rg.getGroupOwner().getEmail());
	}	
	
}
