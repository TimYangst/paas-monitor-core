package org.seforge.monitor.domain;

import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson

//Class that represents AlertDefinition
@Table(name="monitor_constraint")
public class Constraint {
	private String name;
	private String description;
	private int priority;
	private boolean active;
	private String otherReceipts;
	private int alertDefinitionId;
	
	@OneToOne
	private Condition condition;
	
	@ManyToOne
	private ResourcePrototype resourcePrototype;
	
	@ManyToOne
	private ResourceGroup resourceGroup;
}
