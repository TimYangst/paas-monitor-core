package org.seforge.monitor.domain;

import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class ResourceTest extends AbstractTransactionalJUnit4SpringContextTests{
	
	protected void setUp() {
		String ip = "192.168.4.59";
		String username = "root";
		String password = "ok";
		
		ResourcePrototype resourcePrototype = ResourcePrototype.findResourcePrototypeByName("VMware Vsphere");
        Resource resource = new Resource();
        resource.setName(ip);
        resource.setTypeId(resourcePrototype.getTypeId());
        resource.setResourcePrototype(resourcePrototype);
        resource.persist();
        
        ResourcePropertyValue ipValue = new ResourcePropertyValue();
        ResourcePropertyKey ipKey = ResourcePropertyKey.findKey("Ip", resourcePrototype);
        ipValue.setResourcePropertyKey(ipKey);
        ipValue.setValue(ip);
        ipValue.setResource(resource);
        ipValue.persist();
        
        ResourcePropertyValue userValue = new ResourcePropertyValue();
        ResourcePropertyKey userKey = ResourcePropertyKey.findKey("Username", resourcePrototype);
        userValue.setResourcePropertyKey(userKey);
        userValue.setValue(username);
        userValue.setResource(resource);
        userValue.persist();
        
        ResourcePropertyValue pwValue = new ResourcePropertyValue();
        ResourcePropertyKey pwKey = ResourcePropertyKey.findKey("Ip", resourcePrototype);
        pwValue.setResourcePropertyKey(pwKey);
        pwValue.setValue(password);
        pwValue.setResource(resource);
        pwValue.persist();  
	    }
	
	@Test
	public void testResourceQuery(){		
		Resource r = Resource.findPhymByIp("192.168.4.59");		
		if(r!=null){
			System.out.println(r.getName());
		}
	}
}
