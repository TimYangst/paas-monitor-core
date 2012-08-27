package org.seforge.monitor.service;

import org.junit.Test;
import org.seforge.monitor.hqapi.HQProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;


@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class MappingServiceTest  extends AbstractTransactionalJUnit4SpringContextTests {
	
	@Autowired
	private HQProxy proxy;
	
	@Autowired
	private PrototypeMapping prototypeMapping;
	
	@Test
	public void simpleTest() {
		System.out.println(prototypeMapping.getTypeByPrototype("Win32"));
//		assert(prototypeMapping.getTypeByPrototype("Win32"), 2);
	}

}
