// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.monitor.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;
import org.seforge.monitor.domain.Resource;

privileged aspect Resource_Roo_Jpa_Entity {
    
    declare @type: Resource: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer Resource.version;
    
    public Integer Resource.getVersion() {
        return this.version;
    }
    
    public void Resource.setVersion(Integer version) {
        this.version = version;
    }
    
}
