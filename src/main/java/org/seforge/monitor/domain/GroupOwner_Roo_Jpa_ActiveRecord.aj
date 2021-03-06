// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.monitor.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.seforge.monitor.domain.GroupOwner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GroupOwner_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager GroupOwner.entityManager;
    
    public static final EntityManager GroupOwner.entityManager() {
        EntityManager em = new GroupOwner().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long GroupOwner.countGroupOwners() {
        return entityManager().createQuery("SELECT COUNT(o) FROM GroupOwner o", Long.class).getSingleResult();
    }
    
    public static List<GroupOwner> GroupOwner.findAllGroupOwners() {
        return entityManager().createQuery("SELECT o FROM GroupOwner o", GroupOwner.class).getResultList();
    }
    
    public static GroupOwner GroupOwner.findGroupOwner(Integer id) {
        if (id == null) return null;
        return entityManager().find(GroupOwner.class, id);
    }
    
    public static List<GroupOwner> GroupOwner.findGroupOwnerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM GroupOwner o", GroupOwner.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void GroupOwner.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void GroupOwner.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            GroupOwner attached = GroupOwner.findGroupOwner(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void GroupOwner.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void GroupOwner.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public GroupOwner GroupOwner.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        GroupOwner merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
