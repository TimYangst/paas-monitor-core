package org.seforge.monitor.manager.impl;

import java.util.List;
import java.util.Set;

import org.seforge.monitor.domain.Metric;
import org.seforge.monitor.domain.MetricTemplate;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.hqapi.HQProxy;
import org.seforge.monitor.manager.MetricManager;
import org.springframework.beans.factory.annotation.Autowired;

public class MetricManagerImpl implements MetricManager{
	
	@Autowired
	private HQProxy hqProxy;

	@Override
	public void saveAndUpdateMetrics(List<Metric> metrics) {
		// TODO First, save these metrics to our database;
		// Second, call hqproxy and update metric in hqserver
		for(Metric metric : metrics){
			metric.persist();			
		}
		hqProxy.syncMetrics(metrics);
		
	}
	
	
	public void initiateMetrics(ResourceGroup resourceGroup){
		for(Resource resource: resourceGroup.getResources()){
			ResourcePrototype resourcePrototype = resource.getResourcePrototype();
			for(MetricTemplate metricTemplate : resourcePrototype.getMetricTemplates()){
				Metric metric = new Metric();
				metric.setResourceGroup(resourceGroup);
				metric.setMetricTemplate(metricTemplate);
				metric.setResourcePrototype(resourcePrototype);
				metric.setInterval(metricTemplate.getDefaultInterval());
				metric.setEnabled(false);
				metric.persist();
			}
		}
	}	
	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup){
		return Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, resourcePrototype).getResultList();
	}
	
	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup, int start, int limit){
		return Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, resourcePrototype).getResultList().subList(start, start + limit -1);
	}

}
