package org.seforge.monitor.manager;

import java.io.IOException;

import org.seforge.monitor.domain.Constraint;

public interface ConstraintManager {
	public void addNewConstraint(Constraint constraint) throws IOException;
	public void deleteConstraint(Constraint constraint) throws IOException ;
}
