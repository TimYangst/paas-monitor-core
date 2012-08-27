package org.seforge.monitor.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PostConstruct;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

@Service
public class PrototypeMapping {
	private HashMap<String, Integer> mapping = new HashMap<String, Integer>();
	private Resource resource;
	
	
	public PrototypeMapping(){		
	}
	
	public void setResource(Resource resource){
		this.resource = resource;
	}
	
	@PostConstruct
	public void parseMapping(){
		SAXReader saxReader = new SAXReader();
		Document document;
		try {
			document = saxReader.read(resource.getFile());			
			List<Node> prototypes = document.selectNodes("/prototypes/prototype");
			Iterator<Node> prototypeIt = prototypes.iterator();
			while (prototypeIt.hasNext()) {
				Element prototype = (Element) prototypeIt.next();				
				Node name = prototype.selectSingleNode("name");
				Node type = prototype.selectSingleNode("type");
				mapping.put(name.getText(), Integer.valueOf(type.getText()));
			}
		}catch(Exception e){
			e.printStackTrace();			
		}
	}
	
	public Integer getTypeByPrototype(String name){
		return mapping.get(name);
	}
}
