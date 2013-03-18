package org.seforge.monitor.hqapi;

import java.util.HashMap;
import java.util.Map;

import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.hyperic.hq.hqapi1.types.ResourceResponse;
import org.junit.Test;
import org.seforge.monitor.manager.ResourceManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class CreateTomcatServer extends AbstractTransactionalJUnit4SpringContextTests{
	@Autowired
	private HQProxy proxy;
	
	
	@Autowired
	private ResourceManager rm;
	/*
	
//	@Test
	public void findExistingServer() throws IOException{
		ResourceApi resourceApi = proxy.getHQApi().getResourceApi();	
//		Resource vim = resourceApi.getPlatformResourceByFqdn("192.168.4.243", true, true).getResource();	
		Resource tomcat21387 = resourceApi.getResource(11547, true, true).getResource();
		System.out.println(tomcat21387.getResourcePrototype().getName());
		for(ResourceInfo info : tomcat21387.getResourceInfo()){
			System.out.println(info.getKey());
			System.out.println(info.getValue());
		}
		for(ResourceConfig config :tomcat21387.getResourceConfig()){
			System.out.println(config.getKey());
			System.out.println(config.getValue());
		}		
	}
	*/
	
	@Test
	public void createTomcatServer() throws Exception{		
		/*
		Resource vim = proxy.getVimResource("192.168.4.242", false, false);
		ResourcePrototype resourcePrototype = proxy.getHQApi().getResourceApi().getResourcePrototype("Apache Tomcat 7.0").getResourcePrototype();
		 Map<String,String> configs = new HashMap<String,String>();
		 configs.put("jmx.url", "service:jmx:rmi:///jndi/rmi://localhost:24395/jmxrmi");		 
		 configs.put("process.query", "State.Name.eq=java,Args.*.sw=-Dcatalina.base=E:\\ServerBase\\server21395");
		 configs.put("server.log_track.enable", "true");
		 configs.put("server.log_track.files", "logs\\catalina.out");
		 configs.put("service_name", "wampapache");
		ResourceResponse response = proxy.getHQApi().getResourceApi().createServer(resourcePrototype, vim, "Tomcat 7 21395", configs);
		System.out.println(response.getStatus().name());
		System.out.println(response.getError().getReasonText());
//		System.out.println(r.getId());
 * */
		rm.addNewServer("192.168.4.242", "service:jmx:rmi:///jndi/rmi://localhost:25411/jmxrmi", "E:\\sasep\\jsp\\tomcat7_21411", "tomcat7_21411", "100", "Apache Tomcat 7.0");
	}

}
