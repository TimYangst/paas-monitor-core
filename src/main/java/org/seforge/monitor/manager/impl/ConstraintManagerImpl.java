package org.seforge.monitor.manager.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.exception.HQApiException;
import org.seforge.monitor.hqapi.HQProxy;
import org.seforge.monitor.manager.ConstraintManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConstraintManagerImpl implements ConstraintManager{
	@Autowired
	private HQProxy hqProxy;	
	
	public void addNewConstraint(Constraint constraint) throws IOException{	
		constraint.setActive(true);
		//Find all the resources that of rp and in rg
		ResourcePrototype rp = constraint.getResourcePrototype();
		ResourceGroup rg = constraint.getResourceGroup();
		Set<Resource> resources = rg.getResources();
		List<Resource> gResources = new ArrayList<Resource>();
		for(Resource r: resources){
			if(r.getResourcePrototype().getName().equals(rp.getName()))				
				gResources.add(r);
		}		
		int adId = hqProxy.syncAlert(gResources, constraint);		
		constraint.setAlertDefinitionId(adId);
		constraint.getCondition().persist();
		constraint.persist();
	}
	
	public void deleteConstraint(Constraint constraint) throws IOException, HQApiException{
		if(hqProxy.deleteAlert(constraint))
		{
			constraint.getCondition().remove();
			constraint.remove();
		}else{
			throw new HQApiException();
		}
	}
	
}
