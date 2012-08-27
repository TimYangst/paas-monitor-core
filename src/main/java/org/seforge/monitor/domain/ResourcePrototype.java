package org.seforge.monitor.domain;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class ResourcePrototype {	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(unique = true, nullable = false)
	private String name;
	
	private Integer typeId;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "resourcePrototype")
	private Set<ResourcePropertyKey> resourcePropertyKeys;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "resourcePrototype")
	private Set<Resource> resources;	
	
	
	public ResourcePrototype(String name, Integer typeId){
		this.name = name;
		this.typeId = typeId;
	}
	
	public static ResourcePrototype findResourcePrototypeByName(String name) {
	        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
	        EntityManager em = ResourcePrototype.entityManager();
	        TypedQuery<ResourcePrototype> q = em.createQuery("SELECT o FROM ResourcePrototype AS o WHERE o.name = :name", ResourcePrototype.class);
	        q.setParameter("name", name);
	        List<ResourcePrototype> result = q.getResultList();
	        if(!result.isEmpty())
	        	return result.get(0);
	        else
	        	return null;        
	    }	
}
