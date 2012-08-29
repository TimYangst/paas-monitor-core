package org.seforge.monitor.domain;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findMetricTemplatesByNameAndResourcePrototype"})
@RooJson
@Table(uniqueConstraints=@UniqueConstraint(columnNames = {"name", "resource_prototype"})) 
public class MetricTemplate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	private String name;
	private String alias;
	private String units;
	private String plugin;
	private boolean indicator;
	private long defaultInterval;
	private String category;
	private String collectionType;
	private boolean defaultOn;
	
	@ManyToOne
	private ResourcePrototype resourcePrototype;
	
	public MetricTemplate(org.hyperic.hq.hqapi1.types.MetricTemplate template){
		this.name = template.getName();
		this.alias = template.getAlias();
		this.units = template.getUnits();
		this.plugin = template.getPlugin();
		this.indicator = template.isIndicator();
		this.defaultInterval = template.getDefaultInterval();
		this.category = template.getCategory();
		this.collectionType = template.getCollectionType();
		this.defaultOn = template.isDefaultOn();
	}
	
	public static MetricTemplate findMetricTemplateByNameAndResourcePrototype(String name, ResourcePrototype resourcePrototype){
		List<MetricTemplate> list = findMetricTemplatesByNameAndResourcePrototype(name, resourcePrototype).getResultList();
		if(!list.isEmpty())
			return list.get(0);
		else
			return null;
	}

}
