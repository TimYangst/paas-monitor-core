package org.seforge.monitor.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.JoinColumn;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = {"findResourcesByTypeIdEquals"})
@RooJson
public class Resource {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	private Integer typeId;
	private Integer resourceId;
	private Integer instanceId;	
	
	@Column(unique = true, nullable = false)
	private String name;

	@ManyToOne
	private ResourcePrototype resourcePrototype;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "resource")
	private Set<ResourcePropertyValue> resourcePropertyValues;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "resource")
	private Set<Metric> metrics;
	
	
	@OneToMany(cascade=CascadeType.ALL)	
	@JoinTable(
			name = "resource_relationship", 
			joinColumns = {@JoinColumn(name="parentId")},
			inverseJoinColumns = {@JoinColumn(name="childrenId")}	
			)
	private Set<Resource> children = new HashSet<Resource>();
	
	@ManyToOne
	@JoinTable(
			name = "resource_relationship", 
			joinColumns = {@JoinColumn(name="childrenId")},
			inverseJoinColumns = {@JoinColumn(name="parentId")}	
			)	
	private Resource parent;
	
	public void addChild(Resource resource){
		this.getChildren().add(resource);
	}
}
