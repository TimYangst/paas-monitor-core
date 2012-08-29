// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.monitor.domain;

import java.util.Set;
import org.seforge.monitor.domain.MetricTemplate;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourcePropertyKey;
import org.seforge.monitor.domain.ResourcePrototype;

privileged aspect ResourcePrototype_Roo_JavaBean {
    
    public Integer ResourcePrototype.getId() {
        return this.id;
    }
    
    public void ResourcePrototype.setId(Integer id) {
        this.id = id;
    }
    
    public String ResourcePrototype.getName() {
        return this.name;
    }
    
    public void ResourcePrototype.setName(String name) {
        this.name = name;
    }
    
    public Integer ResourcePrototype.getTypeId() {
        return this.typeId;
    }
    
    public void ResourcePrototype.setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
    
    public Set<ResourcePropertyKey> ResourcePrototype.getResourcePropertyKeys() {
        return this.resourcePropertyKeys;
    }
    
    public void ResourcePrototype.setResourcePropertyKeys(Set<ResourcePropertyKey> resourcePropertyKeys) {
        this.resourcePropertyKeys = resourcePropertyKeys;
    }
    
    public Set<Resource> ResourcePrototype.getResources() {
        return this.resources;
    }
    
    public void ResourcePrototype.setResources(Set<Resource> resources) {
        this.resources = resources;
    }
    
    public Set<MetricTemplate> ResourcePrototype.getMetricTemplates() {
        return this.metricTemplates;
    }
    
    public void ResourcePrototype.setMetricTemplates(Set<MetricTemplate> metricTemplates) {
        this.metricTemplates = metricTemplates;
    }
    
}
