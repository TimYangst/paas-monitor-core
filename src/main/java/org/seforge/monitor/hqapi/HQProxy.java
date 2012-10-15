package org.seforge.monitor.hqapi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
import org.hyperic.hq.hqapi1.types.ResponseStatus;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePropertyKey;
import org.seforge.monitor.domain.ResourcePropertyValue;
import org.seforge.monitor.exception.NotMonitoredException;
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

	public Resource getVimResource(String fqdn, boolean verbose,
			boolean children) throws IOException, NotMonitoredException {
		ResourceApi resourceApi = hqapi.getResourceApi();
		Resource vim = resourceApi.getPlatformResourceByFqdn(fqdn, verbose,
				children).getResource();
		if (vim == null)
			throw new NotMonitoredException("Vim of Ip " + fqdn
					+ " is not monitored.");
		return vim;
	}

	public Resource createServerResource(ResourcePrototype resourcePrototype,
			Resource parent, String name, Map<String, String> configs)
			throws IOException {
		ResourceApi resourceApi = hqapi.getResourceApi();
		Resource server = resourceApi.createServer(resourcePrototype, parent,
				name, configs).getResource();
		return server;
	}

	@Transactional
	public org.seforge.monitor.domain.Resource saveResource(Resource resource,
			org.seforge.monitor.domain.Resource parent, boolean cascade) {
		ResourceGroup resourceGroup = ResourceGroup.findResourceGroup(2);
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
				int metricSize = org.seforge.monitor.domain.Metric.findMetricsByResourceGroupAndResourcePrototype(resourceGroup, rpt).getResultList().size();
				for (MetricTemplate template : templates) {
					org.seforge.monitor.domain.MetricTemplate metricTemplate = new org.seforge.monitor.domain.MetricTemplate(
							template);
					metricTemplate.setResourcePrototype(rpt);
					metricTemplate.persist();					
					if(metricSize==0){						
						org.seforge.monitor.domain.Metric metric = new org.seforge.monitor.domain.Metric();
						metric.setResourceGroup(resourceGroup);
						metric.setMetricTemplate(metricTemplate);						
						metric.setResourcePrototype(rpt);
						metric.setInterval(metricTemplate.getDefaultInterval());
						metric.setEnabled(metricTemplate.isIndicator());
						metric.persist();						
					}					
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
		r.addResourceGroup(resourceGroup);
		if (parent != null) {
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
	
		
		if (cascade && !resource.getResource().isEmpty()) {
			for (Resource child : resource.getResource()) {
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

	public List<MetricTemplate> getMetricTemplatesByResourcePrototype(
			String name) throws IOException {
		ResourceApi api = hqapi.getResourceApi();
		ResourcePrototype prototype = api.getResourcePrototype(name)
				.getResourcePrototype();
		return getMetricTemplatesByResourcePrototype(prototype);
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

	/*
	 * public List<LastMetricData> getLastMetricData(
	 * org.seforge.monitor.domain.Resource r) throws IOException { List<Metric>
	 * metrics = new ArrayList<Metric>(); Set<org.seforge.monitor.domain.Metric>
	 * metricSet = r.getMetrics(); for (org.seforge.monitor.domain.Metric m :
	 * metricSet) { Metric metric = new Metric(); //
	 * metric.setId(m.getMetricId()); metrics.add(metric); } MetricDataApi
	 * metricDataApi = hqapi.getMetricDataApi(); return
	 * metricDataApi.getData(metrics).getLastMetricData(); }
	 */

	public Resource getHqResource(org.seforge.monitor.domain.Resource r){
		ResourceApi resourceApi = hqapi.getResourceApi();
		Resource resource;
		try {
			resource = resourceApi.getResource(
					r.getResourceId(), false, false)
					.getResource();
			return resource;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}		
	}
	
	public LastMetricData getLastMetricData(org.seforge.monitor.domain.Resource r, org.seforge.monitor.domain.Metric m)
			throws IOException {
		Metric metric = getHqMetircByResourceAndTemplateName(getHqResource(r),
				m.getMetricTemplate().getName());		
		MetricDataApi metricDataApi = hqapi.getMetricDataApi();
		return metricDataApi.getData(metric).getLastMetricData();
	}

	public MetricData getMetricData(org.seforge.monitor.domain.Resource r, org.seforge.monitor.domain.Metric m,
			long start, long end) throws IOException {
		Metric metric = getHqMetircByResourceAndTemplateName(getHqResource(r),
				m.getMetricTemplate().getName());
		MetricApi metricApi = hqapi.getMetricApi();
		MetricDataApi metricDataApi = hqapi.getMetricDataApi();
		return metricDataApi.getData(metric, start, end).getMetricData();
	}

	public Metric getHqMetircByResourceAndTemplateName(Resource resource,
			String templateName) {
		MetricApi metricApi = hqapi.getMetricApi();
		try {
			List<Metric> hqmetrics = metricApi.getMetrics(resource, false)
					.getMetric();
			for (Metric m : hqmetrics) {
				if (m.getMetricTemplate().getName().equals(templateName))
					return m;
			}
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public boolean syncMetrics(List<org.seforge.monitor.domain.Metric> metrics, org.seforge.monitor.domain.ResourcePrototype resourcePrototype) {
		ResourceApi resourceApi = hqapi.getResourceApi();
		MetricApi metricApi = hqapi.getMetricApi();
		List<Metric> toBeSynced = new ArrayList<Metric>();
		try {
			for (org.seforge.monitor.domain.Metric m : metrics) {
				ResourceGroup group = m.getResourceGroup();
				for (org.seforge.monitor.domain.Resource resource : group
						.getResources()) {
					if(resource.getResourcePrototype().equals(resourcePrototype)){
						Resource r = resourceApi.getResource(
								resource.getResourceId(), false, false)
								.getResource();
						if(r!=null){
							Metric metric = getHqMetircByResourceAndTemplateName(r, m
									.getMetricTemplate().getName());
							metric.setEnabled(m.isEnabled());
							metric.setInterval(m.getInterval());
							toBeSynced.add(metric);
						}						
					}					
				}
			}
			ResponseStatus response = metricApi.syncMetrics(toBeSynced).getStatus();
			if (response.equals(ResponseStatus.SUCCESS))
				return true;
			else
				return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}		
	}


}
