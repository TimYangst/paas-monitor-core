package org.seforge.monitor.manager.impl;

import java.io.IOException;


import org.hyperic.hq.hqapi1.AlertDefinitionBuilder.AlertPriority;
import org.junit.Test;
import org.seforge.monitor.domain.Condition;
import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;
import org.seforge.monitor.manager.ConstraintManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration(locations={"classpath:META-INF/spring/applicationContext.xml"})
public class ConstraintManagerImplTest extends AbstractJUnit4SpringContextTests {
	@Autowired
	ConstraintManager constraintManager;
	
	
	@Test
	public void testAddNewConstraint() throws IOException{
		
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
		
		ResourceGroup rg = ResourceGroup.findResourceGroup(1);
		
		ResourcePrototype rp = ResourcePrototype.findResourcePrototype(2);
		
		c.setResourceGroup(rg);
		c.setResourcePrototype(rp);
		
		constraintManager.addNewConstraint(c);		
	}
	
	
	@Test
	public void deleteConstraint() throws IOException{
		Constraint constraint = Constraint.findConstraint(1l);
		constraintManager.deleteConstraint(constraint);		
	}
	
}
