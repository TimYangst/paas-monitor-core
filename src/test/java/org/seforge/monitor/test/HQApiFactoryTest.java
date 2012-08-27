package org.seforge.monitor.test;

import java.util.List;

import org.hyperic.hq.hqapi1.AgentApi;
import org.hyperic.hq.hqapi1.HQApi;
import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.types.Agent;
import org.hyperic.hq.hqapi1.types.AgentsResponse;
import org.hyperic.hq.hqapi1.types.Ip;
import org.hyperic.hq.hqapi1.types.PingAgentResponse;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourceConfig;
import org.hyperic.hq.hqapi1.types.ResourceInfo;
import org.hyperic.hq.hqapi1.types.ResourceProperty;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.hyperic.hq.hqapi1.types.ResourcePrototypeResponse;
import org.hyperic.hq.hqapi1.types.ResourcePrototypesResponse;
import org.hyperic.hq.hqapi1.types.ResourceResponse;
import org.hyperic.hq.hqapi1.types.ResourcesResponse;
import org.hyperic.hq.hqapi1.types.ResponseStatus;

import org.junit.Test;
import org.seforge.monitor.hqapi.HQProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;


@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class HQApiFactoryTest extends AbstractTransactionalJUnit4SpringContextTests {
	
	@Autowired
	private HQProxy proxy;
	
	@Test
	public void simpleTest()  throws Exception {
		HQApi hqapi = proxy.getHQApi();
		proxy.saveResources();
		
//
//		        ResourceApi api = hqapi.getResourceApi();
//		        
//		        ResourcePrototypeResponse response = api.getResourcePrototype("Win32");
//		        ResourcePrototype prototype = response.getResourcePrototype();
//		        
//		        ResourcesResponse rresponse = api.getResources(prototype, true, true);
//		        List<Resource> resources = rresponse.getResource();
//		        for(Resource r : resources){
////		        	List<ResourceConfig> l = r.getResourceConfig();
////		        	for(ResourceConfig config : l){
////		        		System.out.println(config.getKey());
////		        		System.out.println(config.getValue());
////		        		
////		        	}
//		        	System.out.println(r.getTypeId());
//		        	System.out.println(r.getLocation());
//		        	for(Ip ip : r.getIp()){
//		        		System.out.println(ip.getAddress());
//		        	}
//		        	
//		        	for(ResourceInfo p: r.getResourceInfo()){
//		        		
//		        		System.out.println(p.getKey() + ":" + p.getValue());
//		        	}
//		        	
//		        	for(ResourceProperty p: r.getResourceProperty()){
//		        		System.out.println(p.getKey() + ":" + p.getValue());
//		        	}
//		        	List<Resource> ll = r.getResource();
//		        	for(Resource config : ll){
//		        		System.out.println(config.getTypeId());
//		        		System.out.println(config.getName());
//		        		System.out.println(config.getLocation());
//		        		for(ResourceProperty p: config.getResourceProperty()){
//			        		System.out.println(p.getKey() + ":" + p.getValue());
//			        	}
//		        		
//		        		
//		        	}
//		        	
//		        }
//		        
//		        
////		        ResourcePrototypesResponse presponse = api.getAllResourcePrototypes();
////		        List<ResourcePrototype> plist = presponse.getResourcePrototype();
////		        for(ResourcePrototype prototype : plist){
////		        	System.out.println(prototype.getName());
////		        }
//		        
////		        ResourcesResponse response = api.getResources("windows", true, true);
////		        List list = response.getResource();
////		        
////		        System.out.println(list.size());
////		        
//
////		        Resource r = factory.getLocalPlatformResource(false, false);
////		        System.out.println(r.getIp().get(0).getAddress());
////
////		        ResourceResponse getResponse = api.getPlatformResource(r.getName(),
////		                                                               false, false);
////		        
////		        Resource resource = getResponse.getResource();
////		        System.out.println(resource.getDescription());
//		   
		
		
	}
	

}
