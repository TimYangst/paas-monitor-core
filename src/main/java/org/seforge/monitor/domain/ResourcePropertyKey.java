package org.seforge.monitor.domain;

import java.util.List;

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
@RooJpaActiveRecord(finders = {"findResourcePropertyKeysByKeyAndResourcePrototype"})
@RooJson
public class ResourcePropertyKey {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "resource_property_key_seq")
    @SequenceGenerator(name = "resource_property_key_seq", sequenceName = "resource_property_key_seq", allocationSize = 1)
	@Column(name = "id")
	private Integer id;
	
	private String key;
	
	@ManyToOne
	private ResourcePrototype resourcePrototype;
	
	public static ResourcePropertyKey findKey(String key, ResourcePrototype resourcePrototype){
		List<ResourcePropertyKey> result = findResourcePropertyKeysByKeyAndResourcePrototype(key, resourcePrototype).getResultList();
		if(result.isEmpty())
			return null;
		else 
			return result.get(0);					
	}
}
