package org.seforge.monitor.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class ResourcePropertyValue {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "resource_property_value_seq")
    @SequenceGenerator(name = "resource_property_value_seq", sequenceName = "resource_property_value_seq", allocationSize = 1)
	@Column(name = "id")
	private Integer id;
	
	private String value;
	
	@ManyToOne
	private ResourcePropertyKey resourcePropertyKey;
	
	@ManyToOne
	private Resource resource;
}
