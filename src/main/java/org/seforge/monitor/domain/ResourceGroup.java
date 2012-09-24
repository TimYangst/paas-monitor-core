package org.seforge.monitor.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.JoinColumn;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;


@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class ResourceGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "resource_group_seq")
    @SequenceGenerator(name = "resource_group_seq", sequenceName = "resource_group_seq", allocationSize = 1)
	@Column(name = "id")
	private Integer id;
	
	@ManyToMany(cascade = CascadeType.REFRESH)  
    @JoinTable(name = "resource_resourcegroup", inverseJoinColumns = @JoinColumn(name = "resource_id"), joinColumns = @JoinColumn(name = "resource_group_id"))   
   	private Set<Resource> resources;
	
	@ManyToOne
	private GroupOwner groupOwner;

}
