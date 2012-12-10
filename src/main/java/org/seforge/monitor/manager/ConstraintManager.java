package org.seforge.monitor.manager;

import java.io.IOException;

import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.exception.HQApiException;

public interface ConstraintManager {
	public void addNewConstraint(Constraint constraint) throws IOException;
	public void deleteConstraint(Constraint constraint) throws IOException, HQApiException ;
}
