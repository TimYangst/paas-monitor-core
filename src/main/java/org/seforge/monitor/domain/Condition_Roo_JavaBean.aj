// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.monitor.domain;

import org.seforge.monitor.domain.Condition;

privileged aspect Condition_Roo_JavaBean {
    
    public String Condition.getThresholdMetric() {
        return this.thresholdMetric;
    }
    
    public void Condition.setThresholdMetric(String thresholdMetric) {
        this.thresholdMetric = thresholdMetric;
    }
    
    public String Condition.getThresholdComparator() {
        return this.thresholdComparator;
    }
    
    public void Condition.setThresholdComparator(String thresholdComparator) {
        this.thresholdComparator = thresholdComparator;
    }
    
    public Double Condition.getThresholdValue() {
        return this.thresholdValue;
    }
    
    public void Condition.setThresholdValue(Double thresholdValue) {
        this.thresholdValue = thresholdValue;
    }
    
}
