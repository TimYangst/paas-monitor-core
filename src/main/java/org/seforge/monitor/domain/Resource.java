package org.seforge.monitor.domain;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.JoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.TypedQuery;

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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "resource_seq")
    @SequenceGenerator(name = "resource_seq", sequenceName = "resource_seq", allocationSize = 1)
	@Column(name = "id")
	private Integer id;

	private Integer typeId;
	private Integer resourceId;
	private Integer instanceId;	
	
	private String name;

	@ManyToOne
	private ResourcePrototype resourcePrototype;
	
	@ManyToMany(cascade = CascadeType.REFRESH)  
    @JoinTable(name = "resource_resourcegroup", inverseJoinColumns = @JoinColumn(name = "resource_group_id"), joinColumns = @JoinColumn(name = "resource_id"))      
	private Set<ResourceGroup> resourceGroups = new HashSet<ResourceGroup>();;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "resource")
	private Set<ResourcePropertyValue> resourcePropertyValues;
	
	
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
	
	public void addResourceGroup(ResourceGroup resourceGroup){
		this.resourceGroups.add(resourceGroup);
	}
	
	public static Resource findPhymByIp(String ip){
		 if (ip == null) throw new IllegalArgumentException("The ip argument is required");
	        EntityManager em = Resource.entityManager();
	        TypedQuery<Resource> q = em.createQuery("SELECT r FROM Resource AS r , IN ( r.resourcePropertyValues ) AS v  WHERE r.typeId = 1 AND v.value = :ip AND v.resourcePropertyKey.key = 'Ip'", Resource.class);
	        q.setParameter("ip", ip);
	        List<Resource> result = q.getResultList();
	        if(!result.isEmpty())
	        	return result.get(0);
	        else
	        	return null;
	}
}
