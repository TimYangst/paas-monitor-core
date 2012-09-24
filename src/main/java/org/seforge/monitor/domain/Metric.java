package org.seforge.monitor.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findMetricsByResourceGroupAndResourcePrototype"})
@RooJson
@Table(uniqueConstraints=@UniqueConstraint(columnNames = {"resource_group", "metric_template"})) 
public class Metric {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "metric_seq")
    @SequenceGenerator(name = "metric_seq", sequenceName = "metric_seq", allocationSize = 1)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "monitor_interval")
	private Long interval;	
	
	private boolean enabled; 
	
	@ManyToOne
	private ResourcePrototype resourcePrototype;
	
	@ManyToOne
	private ResourceGroup resourceGroup;
	
	@ManyToOne
	private MetricTemplate metricTemplate;


}
