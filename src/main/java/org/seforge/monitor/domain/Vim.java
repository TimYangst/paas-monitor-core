package org.seforge.monitor.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJson
public class Vim {
	private String name;
	private String ip;
	private String state;
	private String os;
	
	private Integer parentId;
}
