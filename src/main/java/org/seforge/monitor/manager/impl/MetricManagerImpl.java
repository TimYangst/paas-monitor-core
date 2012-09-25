package org.seforge.monitor.manager.impl;

import java.util.List;
import java.util.Set;

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
	public void saveAndUpdateMetrics(List<Metric> metrics) {
		// TODO First, save these metrics to our database;
		// Second, call hqproxy and update metric in hqserver
		for(Metric metric : metrics){
			Integer id = metric.getId();
			Metric pmetric = Metric.findMetric(id);
			pmetric.setEnabled(true);
			pmetric.setInterval(metric.getInterval());
			pmetric.merge();			
		}
//		hqProxy.syncMetrics(metrics);
		
	}

	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup){
		return Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, resourcePrototype).getResultList();
	}
	
	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup, int start, int limit){
		return Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, resourcePrototype).getResultList().subList(start, start + limit);
	}

}
