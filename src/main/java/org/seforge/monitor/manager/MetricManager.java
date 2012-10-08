package org.seforge.monitor.manager;

import java.util.List;

import org.seforge.monitor.domain.Metric;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;

public interface MetricManager {
	public void saveAndUpdateMetrics(List<Metric> metrics, ResourcePrototype resourcePrototype);	
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup);
	public List<Metric> getMetricsByResourcePrototypeAndGroup(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup, int start, int limit);	
	public List<Metric> getEnabledMetrics(ResourcePrototype resourcePrototype, ResourceGroup resourceGroup, int start, int limit);
}
