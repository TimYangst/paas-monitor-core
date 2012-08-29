package org.seforge.monitor.hqapi;

import java.io.IOException;
import java.util.List;

import org.hyperic.hq.hqapi1.MetricApi;
import org.hyperic.hq.hqapi1.MetricDataApi;
import org.hyperic.hq.hqapi1.ResourceEdgeApi;
import org.hyperic.hq.hqapi1.types.Metric;
import org.hyperic.hq.hqapi1.types.MetricTemplate;
import org.hyperic.hq.hqapi1.types.MetricTemplatesResponse;
import org.hyperic.hq.hqapi1.types.MetricsResponse;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourceInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class HQProxyTest extends AbstractTransactionalJUnit4SpringContextTests {
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
	
	
	@Test
	public void testSaveResources() throws IOException{
		Resource r = proxy.getPlatformResource("192.168.4.165", true, true);
		proxy.saveResource(r, null, true);
//		System.out.println(org.seforge.monitor.domain.Resource.countResources());
	}
	

	

}
