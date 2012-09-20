package org.seforge.monitor.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;


@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class GroupOwner {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "group_owner_seq")
    @SequenceGenerator(name = "group_owner_seq", sequenceName = "group_owner_seq", allocationSize = 1)
	@Column(name = "id")
	private Integer id;
	
	//如何与部署系统的用户关联？
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "groupOwner")
	private Set<ResourceGroup> resourceGroups;
	

}
