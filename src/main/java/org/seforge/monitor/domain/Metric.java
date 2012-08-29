package org.seforge.monitor.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Metric {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	private Long interval;
	
	private Integer metricId;
	
	@ManyToOne
	private Resource resource;
	
	@ManyToOne
	private MetricTemplate metricTemplate;
	
	
	public Metric(org.hyperic.hq.hqapi1.types.Metric metric){
		this.interval = metric.getInterval();		
	}

}
