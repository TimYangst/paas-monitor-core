package org.seforge.monitor.hqapi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hyperic.hq.hqapi1.AlertDefinitionApi;
import org.hyperic.hq.hqapi1.HQApi;
import org.hyperic.hq.hqapi1.MetricApi;
import org.hyperic.hq.hqapi1.MetricDataApi;
import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.types.AlertActionConfig;
import org.hyperic.hq.hqapi1.types.AlertCondition;
import org.hyperic.hq.hqapi1.types.AlertDefinitionsResponse;
import org.hyperic.hq.hqapi1.types.LastMetricData;
import org.hyperic.hq.hqapi1.types.Metric;
import org.hyperic.hq.hqapi1.types.MetricData;
import org.hyperic.hq.hqapi1.types.MetricTemplate;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourceInfo;
import org.hyperic.hq.hqapi1.types.ResourceProperty;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.hyperic.hq.hqapi1.types.ResponseStatus;
import org.hyperic.hq.hqapi1.types.AlertDefinition;
import org.hyperic.hq.hqapi1.types.StatusResponse;
import org.hyperic.hq.hqapi1.types.User;
import org.seforge.monitor.domain.Condition;
import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePropertyKey;
import org.seforge.monitor.domain.ResourcePropertyValue;
import org.seforge.monitor.exception.NotMonitoredException;
import org.seforge.monitor.service.PrototypeMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HQProxy {

	private Log log = LogFactory.getLog(HQProxy.class);

	@Autowired
	private HQApi hqapi;

	@Autowired
	private PrototypeMapping mapping;	

	public HQApi getHQApi() {
		return this.hqapi;
	}
	
	public AlertDefinitionApi getAlertDefinitionApi(){
		return this.hqapi.getAlertDefinitionApi();
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
		// First, save the prototype of the resource if it does not exist
		
		String ptName = resource.getResourcePrototype().getName();
		Integer typeId = mapping.getTypeByPrototype(ptName);
		org.seforge.monitor.domain.ResourcePrototype rpt = org.seforge.monitor.domain.ResourcePrototype
				.findResourcePrototypeByName(ptName);
		if (rpt == null) {
			rpt = new org.seforge.monitor.domain.ResourcePrototype(ptName,
					typeId);
			rpt.persist();
		}
		
		
		org.seforge.monitor.domain.Resource r = new org.seforge.monitor.domain.Resource();
		r.setName(resource.getName());
		r.setTypeId(rpt.getTypeId());
		r.setResourceId(resource.getId());
		r.setInstanceId(resource.getInstanceId());
		r.setResourcePrototype(rpt);		
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
		
		if(rpt.getName().equals("Apache Tomcat 6.0") || rpt.getName().equals("Apache Tomcat 7.0")){		
			Pattern servletPattern = Pattern.compile("^Apache Tomcat/[\\d\\.]+[\\s\\d]*\\s(.*)\\s.*\\s.*\\s.*//localhost/((.*))\\sServlet Monitor$");
			Pattern webModulePattern = Pattern.compile("^Apache Tomcat/[\\d\\.]+[\\s\\d]*\\s//localhost/((.*))\\s.*\\s.*\\sWeb Module Stats$");
			Pattern cachePattern = Pattern.compile("^Apache Tomcat/[\\d\\.]+[\\s\\d]*\\s(.*)\\s/((.*))\\sCache$");
			Pattern jspPattern = Pattern.compile("^Apache Tomcat/[\\d\\.]+[\\s\\d]*\\s.*\\s.*\\s//localhost/((.*))\\sJSP Monitor$");
			Pattern dbPattern = Pattern.compile("^Apache Tomcat/[\\d\\.]+[\\s\\d]*\\s\"(.*)\"\\s.*\\s(.*)\\s/((.*))\\sDataSource Pool$");

			for (Resource child : resource.getResource()) {				
				org.seforge.monitor.domain.Resource childResource = new org.seforge.monitor.domain.Resource();
				org.seforge.monitor.domain.ResourcePrototype childRpt = org.seforge.monitor.domain.ResourcePrototype
						.findResourcePrototypeByName(child.getResourcePrototype().getName());				
				childResource.setTypeId(childRpt.getTypeId());
				childResource.setResourceId(child.getId());
				childResource.setInstanceId(child.getInstanceId());
				childResource.setResourcePrototype(childRpt);
				
				String name = child.getName();
				if(name.contains("Servlet Monitor")){					
					Matcher m = servletPattern.matcher(name);
					if(m.matches()){
						String appName = m.group(2);
						if(appName.equals(""))
							appName = "ROOT";
						childResource.setName(m.group(1) + " Servlet");
						org.seforge.monitor.domain.Resource appParent = org.seforge.monitor.domain.Resource.findResourceByNameAndParent(appName, r);
						if(appParent==null){
							appParent = new org.seforge.monitor.domain.Resource(appName, true, r);
							appParent.persist();						
						}
						childResource.setParent(appParent);
						childResource.persist();
					}else{
						System.out.println(name);
					}
					
				}else if(name.contains("Web Module Stats")){					
					Matcher m = webModulePattern.matcher(name);
					if(m.matches()){
						String appName = m.group(1);
						if(appName.equals(""))
							appName = "ROOT";
						childResource.setName(appName + " Web Module Stats");
						org.seforge.monitor.domain.Resource appParent = org.seforge.monitor.domain.Resource.findResourceByNameAndParent(appName, r);
						if(appParent==null){
							appParent = new org.seforge.monitor.domain.Resource(appName, true, r);
							appParent.persist();						
						}
						childResource.setParent(appParent);
						childResource.persist();
					}else{
						System.out.println(name);
					}					
				}else if(name.contains("Cache")){					
					Matcher m = cachePattern.matcher(name);
					if(m.matches()){
						String appName = m.group(2);
						if(appName.equals(""))
							appName = "ROOT";
						childResource.setName(appName + " Cache");
						org.seforge.monitor.domain.Resource appParent = org.seforge.monitor.domain.Resource.findResourceByNameAndParent(appName, r);
						if(appParent==null){
							appParent = new org.seforge.monitor.domain.Resource(appName, true, r);
							appParent.persist();						
						}
						childResource.setParent(appParent);
						childResource.persist();
					}else{
						System.out.println(name);
					}					
				}else if(name.contains("JSP Monitor")){					
					Matcher m = jspPattern.matcher(name);
					if(m.matches()){
						String appName = m.group(1);
						if(appName.equals(""))
							appName = "ROOT";
						childResource.setName(appName + " JSP Monitor");
						org.seforge.monitor.domain.Resource appParent = org.seforge.monitor.domain.Resource.findResourceByNameAndParent(appName, r);
						if(appParent==null){
							appParent = new org.seforge.monitor.domain.Resource(appName, true, r);
							appParent.persist();						
						}
						childResource.setParent(appParent);
						childResource.persist();
					}else{
						System.out.println(name);
					}					
				}else if(name.contains("DataSource Pool")){					
					Matcher m = dbPattern.matcher(name);
					if(m.matches()){
						String appName = m.group(3);
						if(appName.equals(""))
							appName = "ROOT";
						childResource.setName( m.group(1) + " " +  m.group(2));
						org.seforge.monitor.domain.Resource appParent = org.seforge.monitor.domain.Resource.findResourceByNameAndParent(appName, r);
						if(appParent==null){
							appParent = new org.seforge.monitor.domain.Resource(appName, true, r);
							appParent.persist();						
						}
						childResource.setParent(appParent);
						childResource.persist();
					}else{
						System.out.println(name);
					}					
				}				
				else{					
					saveResource(child, r, cascade);
				}			
			}
			return r;
			
		}
		if (cascade && !resource.getResource().isEmpty()) {
			for (Resource child : resource.getResource()) {
				saveResource(child, r, cascade);
			}
		}
		return r;
	}	
	
	@Transactional
	public void propogateMetricTemplatesForAll(){
		List<org.seforge.monitor.domain.ResourcePrototype> prototypes = org.seforge.monitor.domain.ResourcePrototype.findAllResourcePrototypes();
		for(org.seforge.monitor.domain.ResourcePrototype rp : prototypes){
			if(rp.getId() !=1 && rp.getId() !=18 && rp.getId() !=19){
				List<MetricTemplate> templates;
				try {
					templates = getMetricTemplatesByResourcePrototype(rp.getName());
					for (MetricTemplate template : templates) {
						org.seforge.monitor.domain.MetricTemplate metricTemplate = new org.seforge.monitor.domain.MetricTemplate(
								template);
						metricTemplate.setResourcePrototype(rp);
						metricTemplate.persist();								
					}
				} catch (IOException e) {
					log.error("Cannot get metric templates of Resource Prototype "
							+ rp.getName());
				}
			}		
		}		
	}
	


	private List<MetricTemplate> getMetricTemplatesByResourcePrototype(
			ResourcePrototype resourcePrototype) throws IOException {
		MetricApi metricApi = hqapi.getMetricApi();
		return metricApi.getMetricTemplates(resourcePrototype)
				.getMetricTemplate();
	}

	private List<MetricTemplate> getMetricTemplatesByResourcePrototype(
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

	public Resource getHqResource(org.seforge.monitor.domain.Resource r) throws IOException{		
			return hqapi.getResourceApi().getResource(
					r.getResourceId(), false, false)
					.getResource();	
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
	
	//Return the id of synced alertDefinition 
	public int syncAlert(List<org.seforge.monitor.domain.Resource> resources, Constraint constraint) throws IOException{
		List<AlertDefinition> definitions = new ArrayList<AlertDefinition>();
		Condition c = constraint.getCondition();		
		for(org.seforge.monitor.domain.Resource pResource : resources){
			AlertDefinition alertDefinition = new AlertDefinition();
			alertDefinition.setName(constraint.getName());
			alertDefinition.setDescription(constraint.getDescription());
			alertDefinition.setPriority(constraint.getPriority());
			alertDefinition.setActive(constraint.isActive());
			alertDefinition.setResource(getHqResource(pResource));		
			alertDefinition.getAlertCondition().add(
	                AlertDefinitionBuilder.createThresholdCondition(true, c.getThresholdMetric(), c.getThresholdComparator(), c.getThresholdValue()));					
			AlertDefinitionBuilder.addEmailAction(alertDefinition, new String[] {constraint.getResourceGroup().getGroupOwner().getEmail(),constraint.getOtherReceipts()});		
			definitions.add(alertDefinition);
		}
		AlertDefinitionApi api = hqapi.getAlertDefinitionApi();
		AlertDefinitionsResponse response = api.syncAlertDefinitions(definitions);
		return response.getAlertDefinition().get(0).getId();
	}	
	
	public boolean deleteAlert(Constraint constraint) throws IOException {
		AlertDefinitionApi api = hqapi.getAlertDefinitionApi();
		StatusResponse response=api.deleteAlertDefinition(constraint.getAlertDefinitionId());
		if(response.getStatus().equals(ResponseStatus.SUCCESS))
			return true;
		else 
			return false;		
	}


}
