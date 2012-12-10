package org.seforge.monitor.manager.impl;

import java.io.IOException;


import org.hyperic.hq.hqapi1.AlertDefinitionBuilder.AlertPriority;
import org.junit.Test;
import org.seforge.monitor.domain.Condition;
import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.exception.HQApiException;
import org.seforge.monitor.manager.ConstraintManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class ConstraintManagerImplTest extends AbstractJUnit4SpringContextTests {
	@Autowired
	ConstraintManager constraintManager;
	
	/*
	@Test
	@Transactional
	public void testAddNewConstraint() throws IOException{
		
		Condition con = new Condition();
		con.setThresholdMetric("Cpu Usage");
		con.setThresholdComparator("GREATER_THAN");
		con.setThresholdValue(0.0);
		con.persist();
		
		Constraint c = new Constraint();
		c.setName("remote alert");
		c.setDescription("remote");
		c.setCondition(con);	
		c.setPriority(AlertPriority.LOW.getPriority());
		c.setActive(true);
		c.setOtherReceipts("shaojin07@sei.pku.edu.cn,shaojinvivian@qq.com");
		
		ResourceGroup rg = ResourceGroup.findResourceGroup(1);
		
		ResourcePrototype rp = ResourcePrototype.findResourcePrototype(2);
		
		c.setResourceGroup(rg);
		c.setResourcePrototype(rp);
		
		constraintManager.addNewConstraint(c);		
	}	
	*/
	
	
	@Test
	@Transactional
	public void testDeleteConstraint() throws IOException, HQApiException{
		Constraint constraint = Constraint.findConstraint(5l);
		constraintManager.deleteConstraint(constraint);		
	}
	
}
