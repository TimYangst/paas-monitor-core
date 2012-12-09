package org.seforge.monitor.manager;

import java.io.IOException;

import org.seforge.monitor.domain.Constraint;
import org.seforge.monitor.domain.ResourceGroup;
import org.seforge.monitor.domain.ResourcePrototype;

public interface ConstraintManager {
	public void addNewConstraint(ResourcePrototype rp, ResourceGroup rg, Constraint constraint) throws IOException;

}
