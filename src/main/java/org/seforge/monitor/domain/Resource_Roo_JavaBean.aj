// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.monitor.domain;

import java.util.Set;
import org.seforge.monitor.domain.Metric;
import org.seforge.monitor.domain.Resource;
import org.seforge.monitor.domain.ResourcePropertyValue;
import org.seforge.monitor.domain.ResourcePrototype;

privileged aspect Resource_Roo_JavaBean {
    
    public Integer Resource.getId() {
        return this.id;
    }
    
    public void Resource.setId(Integer id) {
        this.id = id;
    }
    
    public Integer Resource.getTypeId() {
        return this.typeId;
    }
    
    public void Resource.setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
    
    public Integer Resource.getResourceId() {
        return this.resourceId;
    }
    
    public void Resource.setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }
    
    public Integer Resource.getInstanceId() {
        return this.instanceId;
    }
    
    public void Resource.setInstanceId(Integer instanceId) {
        this.instanceId = instanceId;
    }
    
    public String Resource.getName() {
        return this.name;
    }
    
    public void Resource.setName(String name) {
        this.name = name;
    }
    
    public ResourcePrototype Resource.getResourcePrototype() {
        return this.resourcePrototype;
    }
    
    public void Resource.setResourcePrototype(ResourcePrototype resourcePrototype) {
        this.resourcePrototype = resourcePrototype;
    }
    
    public Set<ResourcePropertyValue> Resource.getResourcePropertyValues() {
        return this.resourcePropertyValues;
    }
    
    public void Resource.setResourcePropertyValues(Set<ResourcePropertyValue> resourcePropertyValues) {
        this.resourcePropertyValues = resourcePropertyValues;
    }
    
    public Set<Metric> Resource.getMetrics() {
        return this.metrics;
    }
    
    public void Resource.setMetrics(Set<Metric> metrics) {
        this.metrics = metrics;
    }
    
    public Set<Resource> Resource.getChildren() {
        return this.children;
    }
    
    public void Resource.setChildren(Set<Resource> children) {
        this.children = children;
    }
    
    public Resource Resource.getParent() {
        return this.parent;
    }
    
    public void Resource.setParent(Resource parent) {
        this.parent = parent;
    }
    
}
