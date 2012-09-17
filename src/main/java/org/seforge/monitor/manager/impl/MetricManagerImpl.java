package org.seforge.monitor.manager.impl;

import java.util.List;

import org.seforge.monitor.domain.Metric;
import org.seforge.monitor.manager.MetricManager;

public class MetricManagerImpl implements MetricManager{

	@Override
	public void saveAndUpdateMetrics(List<Metric> metrics) {
		// TODO First, save these metrics to our database;
		// Second, call hqproxy and update metric in hqserver
		
	}

}
