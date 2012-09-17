package org.seforge.monitor.manager;

import java.util.List;

import org.seforge.monitor.domain.Metric;

public interface MetricManager {
	public void saveAndUpdateMetrics(List<Metric> metrics);

}
