package org.seforge.monitor.hqapi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.hyperic.hq.hqapi1.AlertDefinitionBuilder.AlertPriority;
import org.hyperic.hq.hqapi1.HQApi;
import org.junit.Test;
import org.seforge.monitor.domain.Condition;
import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.exception.NotMonitoredException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class HQProxyTest extends AbstractTransactionalJUnit4SpringContextTests {
	@Autowired
	private HQApi hqapi;
	
	@Autowired
	private HQProxy proxy;
	
//	@Test
//	public void testMetriApi() throws IOException{
//		//一个ResourcePrototype的metric template的总数和一个resource的所有metric的总数是相等的
//		//Metric和MetricTemplate的collectionType、defaultOn、indicator属性是一致的
//		MetricApi metricApi = proxy.getHQApi().getMetricApi();
//		List<Resource> list = proxy.getWin32PlatformResources(false, false);
//		for(Resource resource: list){
//			MetricsResponse metricResponse = metricApi.getMetrics(resource, false);
//			System.out.println("Total metric number: " + metricResponse.getMetric().size());
//			for(Metric metric : metricResponse.getMetric()){
//				System.out.println(metric.getName());
//				System.out.println(metric.getMetricTemplate().getName());
//				System.out.println(metric.getCollectionType());
//				System.out.println(metric.getMetricTemplate().getCollectionType());
//				System.out.println(metric.isIndicator());
//				System.out.println(metric.getMetricTemplate().isIndicator());
//				System.out.println(metric.isDefaultOn());
//				System.out.println(metric.getMetricTemplate().isDefaultOn());
//			}
//			
//			
////			MetricTemplatesResponse  response = metricApi.getMetricTemplates(resource.getResourcePrototype());
////			System.out.println("Total metric template number: " + response.getMetricTemplate().size());
////			for(MetricTemplate template :response.getMetricTemplate()){
////				System.out.println(template.getName());
////			}
//		}
//		
//	}
	
	
//	@Test
//	public void testSaveResources() throws IOException{
//		Resource r = proxy.getPlatformResource("192.168.4.165", true, true);
//		proxy.saveResource(r, null, true);
////		System.out.println(org.seforge.monitor.domain.Resource.countResources());
//	}
	/*
	@Test
	public void testResourceQuery() throws IOException{
		
			GroupApi api = proxy.getHQApi().getGroupApi();

		    GroupsResponse groupResponse = api.getGroups();
		   Group group = new Group();
//		   group.
		    List groups = groupResponse.getGroup();

		    System.out.println(groups.size());
		
	}
	*/
	
	@Test
	public void testResourceQuery() throws IOException, NotMonitoredException{
		/*
		 AlertDefinitionApi defApi = hqapi.getAlertDefinitionApi();
		 AlertDefinitionsResponse response =  defApi.getAlertDefinitions(proxy.getVimResource("192.168.4.165", false, false), true);
		 List<AlertDefinition> alerts = response.getAlertDefinition();
		 System.out.println(alerts.size());
		 for(AlertDefinition alert : alerts){	
			 System.out.println(alert.getName());
			System.out.println( alert.getAlertAction().size());
			//System.out.println(alert.getAlertAction().get(0).getClassName());
			
		 }
		 */
		 
		
		List<Resource> resources = new ArrayList<Resource>();
		resources.add(Resource.findResource(149));
		
		Condition con = new Condition();
		con.setThresholdMetric("Cpu Usage");
		con.setThresholdComparator("GREATER_THAN");
		con.setThresholdValue(0.0);
		
		Constraint c = new Constraint();
		c.setName("remote alert");
		c.setDescription("remote");
		c.setCondition(con);	
		c.setPriority(AlertPriority.LOW.getPriority());
		c.setActive(true);
		
		proxy.syncAlert(resources, c, "shaojinvivian@gmail.com");
		
		
	}
	

	

}
