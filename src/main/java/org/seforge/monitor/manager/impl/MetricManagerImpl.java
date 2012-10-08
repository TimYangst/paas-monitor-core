package org.seforge.monitor.manager.impl;

import java.util.ArrayList;
import java.util.List;
import org.seforge.monitor.domain.Metric;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.hqapi.HQProxy;
import org.seforge.monitor.manager.MetricManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MetricManagerImpl implements MetricManager{
	
	@Autowired
	private HQProxy hqProxy;

	@Override
	public void saveAndUpdateMetrics(List<Metric> metrics, ResourcePrototype resourcePrototype) {
		// TODO First, save these metrics to our database;
		// Second, call hqproxy and update metric in hqserver
		for(Metric metric : metrics){
			Integer id = metric.getId();
			Metric pmetric = Metric.findMetric(id);
			pmetric.setEnabled(true);
			pmetric.setInterval(metric.getInterval());
			pmetric.merge();			
		}
		hqProxy.syncMetrics(metrics, resourcePrototype);
		
	}

	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup){
		return Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, resourcePrototype).getResultList();
	}
	
	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup, int start, int limit){
		List result = Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, resourcePrototype).getResultList();
		int total = result.size();
		if(start+limit < total)
			return result.subList(start, start + limit);
		else
			return result.subList(start, total);
	}
	
	public List<Metric> getEnabledMetrics(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup, int start, int limit){
		List<Metric> all = getMetricsByResourcePrototypeAndGroup(resourcePrototype, resourceGroup);
		ArrayList<Metric> enabledList = new ArrayList<Metric>();
		for(Metric m : all){
			if(m.isEnabled())
				enabledList.add(m);
		}
		return enabledList.subList(start, start+limit);
	}

}
