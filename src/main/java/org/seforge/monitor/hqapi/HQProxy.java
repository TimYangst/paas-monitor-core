package org.seforge.monitor.hqapi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hyperic.hq.hqapi1.HQApi;
import org.hyperic.hq.hqapi1.MetricApi;
import org.hyperic.hq.hqapi1.MetricDataApi;
import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.types.LastMetricData;
import org.hyperic.hq.hqapi1.types.Metric;
import org.hyperic.hq.hqapi1.types.MetricData;
import org.hyperic.hq.hqapi1.types.MetricTemplate;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourceInfo;
import org.hyperic.hq.hqapi1.types.ResourceProperty;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.seforge.monitor.domain.ResourcePropertyKey;
import org.seforge.monitor.domain.ResourcePropertyValue;
import org.seforge.monitor.service.PrototypeMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HQProxy {

	private Log log = LogFactory.getLog(HQProxy.class);

	private HQApi hqapi;

	@Autowired
	private PrototypeMapping mapping;

	@Autowired
	public HQProxy(@Value("${hq.host}") String host,
			@Value("${hq.port}") int port,
			@Value("${hq.secure}") boolean secure,
			@Value("${hq.username}") String username,
			@Value("${hq.password}") String password) {
		this.hqapi = new HQApi(host, port, secure, username, password);
		log.info("hqapi has fetched successfully.");
	}

	public HQApi getHQApi() {
		return this.hqapi;
	}

	public List<Resource> getWin32PlatformResources(boolean verbose,
			boolean children) throws IOException {
		ResourceApi api = hqapi.getResourceApi();		
		ResourcePrototype win32Prototype = api.getResourcePrototype("Win32")
				.getResourcePrototype();
		List<Resource> resources = api.getResources(win32Prototype, verbose,
				children).getResource();
		return resources;
	}
	
	public Resource getPlatformResource(String fqdn, boolean verbose, boolean children) throws IOException{		
		ResourceApi resourceApi = hqapi.getResourceApi();		
		return resourceApi.getPlatformResourceByFqdn(fqdn, verbose, children).getResource();		
	}	

	@Transactional
	public org.seforge.monitor.domain.Resource saveResource(Resource resource, org.seforge.monitor.domain.Resource parent, boolean cascade) {
		// First, save the prototype of the resource if it does not exist
		String ptName = resource.getResourcePrototype().getName();
		Integer typeId = mapping.getTypeByPrototype(ptName);
		org.seforge.monitor.domain.ResourcePrototype rpt = org.seforge.monitor.domain.ResourcePrototype
				.findResourcePrototypeByName(ptName);
		if (rpt == null) {
			rpt = new org.seforge.monitor.domain.ResourcePrototype(ptName,
					typeId);
			rpt.persist();
			// 同时保存prototype对应的metrictemplates
			List<MetricTemplate> templates;
			try {
				templates = getMetricTemplatesByResourcePrototype(resource
						.getResourcePrototype());
				for (MetricTemplate template : templates) {
					org.seforge.monitor.domain.MetricTemplate metricTemplate = new org.seforge.monitor.domain.MetricTemplate(
							template);
					metricTemplate.setResourcePrototype(rpt);
					metricTemplate.persist();
				}
			} catch (IOException e) {
				log.error("Cannot get metric templates of Resource Prototype "
						+ resource.getResourcePrototype().getName());
			}
		}

		// Third, save the resource
		org.seforge.monitor.domain.Resource r = new org.seforge.monitor.domain.Resource();
		r.setName(resource.getName());
		r.setTypeId(rpt.getTypeId());
		r.setResourceId(resource.getId());
		r.setInstanceId(resource.getInstanceId());		
		r.setResourcePrototype(rpt);
		if(parent !=null){
			r.setParent(parent);
		}		
		r.persist();	

		// Fourth, save the properties of the resource
		List<ResourceProperty> rpList = resource.getResourceProperty();
		for (ResourceProperty rp : rpList) {
			String key = rp.getKey();
			ResourcePropertyKey rpKey = ResourcePropertyKey.findKey(key, rpt);
			if (rpKey == null) {
				rpKey = new ResourcePropertyKey();
				rpKey.setKey(key);
				rpKey.setResourcePrototype(rpt);
				rpKey.persist();
			}
			ResourcePropertyValue value = new ResourcePropertyValue();
			value.setValue(rp.getValue());
			value.setResource(r);
			value.setResourcePropertyKey(rpKey);
			value.persist();
		}

		// Last, save the enabled metrics of the resource
		try {
			for (Metric metric : getMetricsByResource(resource)) {
				org.seforge.monitor.domain.Metric m = new org.seforge.monitor.domain.Metric(
						metric);
				m.setResource(r);
				m.setInterval(metric.getInterval());
				m.setMetricId(metric.getId());
				org.seforge.monitor.domain.MetricTemplate mt = org.seforge.monitor.domain.MetricTemplate
						.findMetricTemplateByNameAndResourcePrototype(
								metric.getName(), rpt);
				if (mt != null)
					m.setMetricTemplate(mt);
				m.persist();
			}
		} catch (IOException e) {
			log.error("Cannot get metricss of Resource "
					+ resource.getResourcePrototype().getName());
		}
		
		if(cascade && !resource.getResource().isEmpty()){
			for(Resource child : resource.getResource()){
				saveResource(child, r, cascade);
			}
		}
		return r;
	}

	private List<MetricTemplate> getMetricTemplatesByResourcePrototype(
			ResourcePrototype resourcePrototype) throws IOException {
		MetricApi metricApi = hqapi.getMetricApi();
		return metricApi.getMetricTemplates(resourcePrototype)
				.getMetricTemplate();
	}
	
    private String getFqdn(Resource r) {
        String fqdn = null;
        for (ResourceInfo ri : r.getResourceInfo()) {
            if ("fqdn".equals(ri.getKey())) {
                fqdn = ri.getValue();
                break;
            }
        }
        return fqdn;
    }

	private List<Metric> getMetricsByResource(Resource resource)
			throws IOException {
		MetricApi metricApi = hqapi.getMetricApi();
		return metricApi.getMetrics(resource, true).getMetric();
	}

	public List<LastMetricData> getLastMetricData(
			org.seforge.monitor.domain.Resource r) throws IOException {
		List<Metric> metrics = new ArrayList<Metric>();
		Set<org.seforge.monitor.domain.Metric> metricSet = r.getMetrics();
		for (org.seforge.monitor.domain.Metric m : metricSet) {
			Metric metric = new Metric();
			metric.setId(m.getMetricId());
			metrics.add(metric);
		}
		MetricDataApi metricDataApi = hqapi.getMetricDataApi();
		return metricDataApi.getData(metrics).getLastMetricData();
	}

	public LastMetricData getLastMetricData(org.seforge.monitor.domain.Metric m)
			throws IOException {
		Metric metric = new Metric();
		metric.setId(m.getMetricId());
		MetricDataApi metricDataApi = hqapi.getMetricDataApi();
		return metricDataApi.getData(metric).getLastMetricData();
	}

	public MetricData getMetricData(org.seforge.monitor.domain.Metric m,
			long start, long end) throws IOException {
		Metric metric = new Metric();
		metric.setId(m.getMetricId());
		MetricDataApi metricDataApi = hqapi.getMetricDataApi();
		return metricDataApi.getData(metric, start, end).getMetricData();
	}

	public List<MetricData> getMetricData(
			org.seforge.monitor.domain.Resource r, long start, long end)
			throws IOException {
		List<Metric> metrics = new ArrayList<Metric>();
		Set<org.seforge.monitor.domain.Metric> metricSet = r.getMetrics();
		for (org.seforge.monitor.domain.Metric m : metricSet) {
			Metric metric = new Metric();
			metric.setId(m.getMetricId());
			metrics.add(metric);
		}
		MetricDataApi metricDataApi = hqapi.getMetricDataApi();
		return metricDataApi.getData(metrics, start, end).getMetricData();
	}

}
