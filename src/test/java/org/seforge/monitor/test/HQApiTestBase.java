package org.seforge.monitor.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import junit.framework.TestCase;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.PropertyConfigurator;
import org.hyperic.hq.hqapi1.AgentApi;
import org.hyperic.hq.hqapi1.ErrorCode;
import org.hyperic.hq.hqapi1.GroupApi;
import org.hyperic.hq.hqapi1.HQApi;
import org.hyperic.hq.hqapi1.MetricApi;
import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.RoleApi;
import org.hyperic.hq.hqapi1.UserApi;
import org.hyperic.hq.hqapi1.types.Agent;
import org.hyperic.hq.hqapi1.types.AgentsResponse;
import org.hyperic.hq.hqapi1.types.Group;
import org.hyperic.hq.hqapi1.types.GroupResponse;
import org.hyperic.hq.hqapi1.types.Metric;
import org.hyperic.hq.hqapi1.types.MetricsResponse;
import org.hyperic.hq.hqapi1.types.Operation;
import org.hyperic.hq.hqapi1.types.PingAgentResponse;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourcePrototype;
import org.hyperic.hq.hqapi1.types.ResourcePrototypeResponse;
import org.hyperic.hq.hqapi1.types.ResourceResponse;
import org.hyperic.hq.hqapi1.types.ResourcesResponse;
import org.hyperic.hq.hqapi1.types.Response;
import org.hyperic.hq.hqapi1.types.ResponseStatus;
import org.hyperic.hq.hqapi1.types.Role;
import org.hyperic.hq.hqapi1.types.RoleResponse;
import org.hyperic.hq.hqapi1.types.RolesResponse;
import org.hyperic.hq.hqapi1.types.StatusResponse;
import org.hyperic.hq.hqapi1.types.User;
import org.hyperic.hq.hqapi1.types.UserResponse;

public abstract class HQApiTestBase extends TestCase {

    private static boolean _logConfigured = false;

    private static final String  HOST        = "192.168.4.191";
    private static final int     PORT        = 7080;
    private static final int     SSL_PORT    = 7443;
    private static final boolean IS_SECURE   = false;
    private static final String  USER        = "hqadmin";
    private static final String  PASSWORD    = "paaspaas";

    static final String  TESTUSER_PASSWORD    = "apitest";
    static final String  TESTUSER_NAME_PREFIX = "apitest";
    static final String  TESTUSER_FIRSTNAME   = "API";
    static final String  TESTUSER_LASTNAME    = "Test";
    static final String  TESTUSER_EMAIL       = "apitest@hyperic.com";
    static final boolean TESTUSER_ACTIVE      = true;

    static final String TESTROLE_NAME_PREFIX = "API Test Role ";
    static final String TESTROLE_DESCRIPTION = "API Test Role Description";

    private Log _log = LogFactory.getLog(HQApiTestBase.class);

    private static Agent      _localAgent = null;
    private static ConnectionProps _connectionProps = null;

    private class ConnectionProps {
        public String  host   = HOST;
        public int     port   = PORT;
        public boolean secure = IS_SECURE;
        public String user = USER;
        public String password = PASSWORD;
    }

    public HQApiTestBase(String name) {
        super(name);
    }

    // Ripped out from PluginMain.java
    private static final String[][] LOG_PROPS = {
        { "log4j.appender.R", "org.apache.log4j.ConsoleAppender" },
        { "log4j.appender.R.layout.ConversionPattern", "%-5p [%t] [%c{1}] %m%n" },
        { "log4j.appender.R.layout", "org.apache.log4j.PatternLayout" }
    };

    private void configureLogging(String level) {
        Properties props = new Properties();
        props.setProperty("log4j.rootLogger", level.toUpperCase() + ", R");
        props.setProperty("log4j.logger.httpclient.wire", level.toUpperCase());
        props.setProperty("log4j.logger.org.apache.commons.httpclient",
                          level.toUpperCase());

        for (String[] PROPS : LOG_PROPS) {
            props.setProperty(PROPS[0], PROPS[1]);
        }

        props.putAll(System.getProperties());
        PropertyConfigurator.configure(props);
    }

    protected Log getLog() {
        return _log;
    }

    static private Properties getClientProperties() {
        Properties props = new Properties();

        String home = System.getProperty("user.home");
        File hq = new File(home, ".hq");
        File clientProperties = new File(hq, "client.properties");

        if (clientProperties.exists()) {
            FileInputStream fis = null;
            props = new Properties();
            try {
                fis = new FileInputStream(clientProperties);
                props.load(fis);
            } catch (IOException e) {
                return props;
            } finally {
                try {
                    if (fis != null) {
                        fis.close();
                    }
                } catch (IOException ioe) {
                    // Ignore
                }
            }
        }
        return props;
    }

    public void setUp() throws Exception {
        super.setUp();
        if (!_logConfigured) {
            String level = System.getProperty("log");
            if (level != null) {
                configureLogging(level);
            } else {
                configureLogging("INFO");
            }
            _logConfigured = true;
        }

        if (_connectionProps == null) {
            _connectionProps = new ConnectionProps();

            Properties props = getClientProperties();
            String host = props.getProperty("host");
            if (host != null) {
                _connectionProps.host = host;
            }
            String port = props.getProperty("port");
            if (port != null) {
                _connectionProps.port = Integer.valueOf(port);
            }
            String secure = props.getProperty("secure");
            if (secure != null) {
                _connectionProps.secure = Boolean.valueOf(secure);
            }
            String user = props.getProperty("user");
            if (user != null) {
            	_connectionProps.user = user;
            }
            String password = props.getProperty("password");
            if (password != null) {
            	_connectionProps.password = password;
            }
        }
    }

    HQApi getApi() {
        return new HQApi(_connectionProps.host, _connectionProps.port,
                         _connectionProps.secure, _connectionProps.user,
                         _connectionProps.password);
    }

    HQApi getApi(boolean secure) {
        // Must fudge a bit here since our client properties only allows the
        // specification of 1 port.
        if (_connectionProps.secure) {
            // Already secure
            return getApi();
        } else {
            // Assume 80 and 443, so SSL port is always + 363 from standard port
            int port = _connectionProps.port + 363;

            return new HQApi(_connectionProps.host, port, secure,
            				 _connectionProps.user, _connectionProps.password);
        }
    }

    HQApi getApi(String user, String password) {
        return new HQApi(_connectionProps.host, _connectionProps.port,
                         _connectionProps.secure, user, password);
    }

    /**
     * Get the locally running agent.
     *
     * @return The locally running agent or null if one does not exist.
     * @throws Exception If a running agent could not be found.
     */
    protected Agent getRunningAgent() throws Exception {

        if (_localAgent != null) {
            return _localAgent;
        }

        AgentApi api = getApi().getAgentApi();

        AgentsResponse response = api.getAgents();
        if (response.getStatus().equals(ResponseStatus.FAILURE)) {
            String err = "Error querying agents: " +
                    response.getError().getReasonText();
            _log.error(err);
            throw new Exception(err);
        }

        for (Agent a : response.getAgent()) {
            PingAgentResponse pingRespnse = api.pingAgent(a);
            if (pingRespnse.getStatus().equals(ResponseStatus.SUCCESS) &&
                pingRespnse.isUp()) {
                _localAgent = a;
                return _localAgent;
            }
        }

        String err = "No running agents found.";
        _log.error(err);
        throw new Exception(err);
    }

    protected Resource getLocalPlatformResource(boolean verbose,
                                                boolean children)
            throws Exception
    {
        Agent a = getRunningAgent();

        ResourceApi api = getApi().getResourceApi();
        ResourcesResponse resourceResponse = api.getResources(a, verbose,
                                                              children);
        hqAssertSuccess(resourceResponse);

        Resource localPlatform = null;
        List<String> invalidPlatforms = new ArrayList<String>();
        invalidPlatforms.add("Network Device");
        invalidPlatforms.add("Network Host");
        invalidPlatforms.add("VMware vSphere Host");
        invalidPlatforms.add("VMware vSphere VM");
        
        for (Resource r : resourceResponse.getResource()) {
            if (!invalidPlatforms.contains(r.getResourcePrototype().getName())) {
                localPlatform = r;
                break;
            }
        }
        
        if (localPlatform == null) {
            String err = "Unable to find platform associated with agent " +
                         a.getAddress() + ":" + a.getPort();
            getLog().error(err);
            throw new Exception(err);
        }

        return localPlatform;
    }

    public Resource createControllableResource(HQApi api)
        throws Exception
    {
        ResourceApi rApi = api.getResourceApi();

        ResourcePrototypeResponse protoResponse =
                rApi.getResourcePrototype("FileServer File");
        hqAssertSuccess(protoResponse);

        Resource localPlatform = getLocalPlatformResource(false, false);

        Map<String,String> config = new HashMap<String,String>();
        if (localPlatform.getResourcePrototype().getName().equals("Win32")) {
            config.put("path", "C:\\windows\\system32\\cmd.exe");
        } else if (new File("/usr/bin/true").exists()){
            config.put("path", "/usr/bin/true");
        } else if (new File("/bin/true").exists()) {
            config.put("path", "/bin/true");
        } else {
            fail("Cannot find a file for which to create a FileServer File resource.  Test cannot be setup.");
        }

        Random r = new Random();
        String name = "Controllable-Resource-" + r.nextInt();

        ResourceResponse resourceCreateResponse =
                rApi.createService(protoResponse.getResourcePrototype(),
                                   localPlatform, name, config);

        hqAssertSuccess(resourceCreateResponse);

        pauseTest();

        return resourceCreateResponse.getResource();
    }

    public void cleanupResource(HQApi api, Resource r)
        throws Exception
    {
        pauseTest();

        ResourceApi rApi = api.getResourceApi();

        StatusResponse response = rApi.deleteResource(r.getId());
        hqAssertSuccess(response);
    }

    protected Group createGroup(List<Resource> resources)
        throws Exception {
        
        return createGroup(resources, null);
    }

    protected Group createGroup(List<Resource> resources, List<Role> roles) 
        throws Exception {

        // determine whether to create a mixed or compatible group
        ResourcePrototype prototype = null;
        for (Resource r : resources) {
            if (prototype == null) {
                prototype = r.getResourcePrototype();
            } else {
                if (!prototype.getName().equals(r.getResourcePrototype().getName())) {
                    prototype = null;
                    break;
                }
            }
        }
        
        // create group
        Random r = new Random();
        Group g = new Group();
        String name = (prototype == null ? "Mixed" : "Compatible") 
                        + " Group for Tests" + r.nextInt();
        g.setName(name);
        if (prototype != null) {
            g.setResourcePrototype(prototype);
        }
        g.getResource().addAll(resources);
        GroupResponse groupResponse = getApi().getGroupApi().createGroup(g);
        hqAssertSuccess(groupResponse);
        Group createdGroup = groupResponse.getGroup();
        assertEquals(resources.size(), createdGroup.getResource().size());
        if (prototype == null) {
            assertNull("This should be a mixed group",
                        createdGroup.getResourcePrototype());
        } else {
            assertNotNull("This should be a compatible group",
                           createdGroup.getResourcePrototype());
            assertEquals(prototype.getName(),
                         createdGroup.getResourcePrototype().getName());
        }
        
        if (roles != null) {
            createdGroup.getRole().addAll(roles);

            groupResponse = getApi().getGroupApi().updateGroup(createdGroup);
            hqAssertSuccess(groupResponse);
            
            createdGroup = groupResponse.getGroup();
            
            assertEquals(roles.size(), createdGroup.getRole().size());            
        }
        
        return createdGroup;
    }
    
    /**
     * Generate a valid User object that's guaranteed to have a unique Name
     * @return A valid User object.
     */
    public User generateTestUser() {

        Random r = new Random();

        User user = new User();
        user.setName(TESTUSER_NAME_PREFIX + r.nextInt());
        user.setFirstName(TESTUSER_FIRSTNAME);
        user.setLastName(TESTUSER_LASTNAME);
        user.setEmailAddress(TESTUSER_EMAIL);
        user.setActive(TESTUSER_ACTIVE);
        return user;
    }

    /**
     * Create a List of Users.
     *
     * @param num The number of users to generate
     * @return The list of create Users
     * @exception Exception If an error occurs while creating the users.
     */
    public List<User> createTestUsers(int num) throws Exception {
        ArrayList<User> users = new ArrayList<User>();
        for (int i = 0; i < num; i++) {
            User u = generateTestUser();
            UserResponse createResponse = getApi().getUserApi().createUser(u, TESTUSER_PASSWORD);
            hqAssertSuccess(createResponse);
            users.add(createResponse.getUser());
        }
        return users;
    }

    public void deleteTestUsers(List<User> users) throws Exception {
        UserApi api = getApi().getUserApi();

        for (User u : users) {
            StatusResponse response = api.deleteUser(u.getId());
            hqAssertSuccess(response);
        }
    }
    
    /**
     * Generate a valid Role object that's guaranteed to have a unique Name
     * @return A valid Role object.
     */
    protected Role generateTestRole() {

        Random r = new Random();

        Role role = new Role();
        role.setName(TESTROLE_NAME_PREFIX + r.nextInt());
        role.setDescription(TESTROLE_DESCRIPTION);

        return role;
    }
    
    protected Role createRole(List<User> users, List<Operation> operations) 
        throws Exception {
        
        Role r = generateTestRole();
        
        r.getOperation().addAll(operations);
        r.getUser().addAll(users);
        
        RoleResponse roleResponse = getApi().getRoleApi().createRole(r);
        hqAssertSuccess(roleResponse);
        Role createdRole = roleResponse.getRole();

        assertEquals("The role should have " + users.size() + " users",
                     users.size(), createdRole.getUser().size());

        for (Operation o : operations) {
            assertTrue("Created role does not contain operation " + o.value(),
                       createdRole.getOperation().contains(o));
        }
        
        return createdRole;
    }

    protected void cleanupRole(Role r) throws Exception {
        RoleApi api = getApi().getRoleApi();
        StatusResponse response = api.deleteRole(r.getId());
        hqAssertSuccess(response);
    }
    
    protected void cleanupRoles() throws Exception {
        RoleApi api = getApi().getRoleApi();
        RolesResponse response = api.getRoles();

        for (Role r : response.getRole()) {
            if (r.getName().startsWith(TESTROLE_NAME_PREFIX)) {
                api.deleteRole(r.getId());
            }
        }
    }
    
    protected void cleanupGroup(Group g) throws Exception {
        cleanupGroup(g, false);
    }

    protected void cleanupGroup(Group g, boolean deleteMembers) throws Exception {
        
        if (deleteMembers) {
            ResourceApi api = getApi().getResourceApi();
            for (Resource r : g.getResource()) {
                StatusResponse response = api.deleteResource(r.getId());
                hqAssertSuccess(response);
            }
        }
        
        GroupApi api = getApi().getGroupApi();
        StatusResponse response = api.deleteGroup(g.getId());
        hqAssertSuccess(response);
    }
    
    protected Metric findAvailabilityMetric(Resource resource)
        throws IOException {
        
        return findAvailabilityMetric(resource, true); 
    }
    
    protected Metric findAvailabilityMetric(Resource resource, boolean enabled) 
        throws IOException {

        MetricApi metricApi = getApi().getMetricApi();

        // Find availability metric for the resource
        MetricsResponse metricsResponse = metricApi.getMetrics(resource, enabled);
        hqAssertSuccess(metricsResponse);
        Metric availMetric = null;
        for (Metric m : metricsResponse.getMetric()) {
            if (m.getName().equals("Availability")) {
                availMetric = m;
                break;
            }
        }

        assertNotNull("Unable to find "
                        + (enabled ? "an enabled" : "a disabled") 
                        + " availability metric for " + resource.getName(),
                      availMetric);
        
        return availMetric;
    }
    
    /**
     * Need to pause test because HQ does not like it when resources
     * are modified or deleted so quickly after being created.
     * 
     * TODO: This issue needs to be fixed in the HQ Core code
     * @param timeMillis Time in milliseconds to pause.
     */
    void pauseTest(long timeMillis) {
        try {
            Thread.sleep(timeMillis);
        } catch (InterruptedException e) {
            // Ignore
        }
    }
    
    void pauseTest() {
        // default pause time
        pauseTest(2500);
    }
    
    // Assert SUCCESS

    void hqAssertSuccess(Response response) {
        String error = (response.getError() != null) ?
            response.getError().getReasonText() : "";
        assertEquals(error, ResponseStatus.SUCCESS, response.getStatus());
    }

    // Assert a particular FAILURE
    
    void hqAssertFailureLoginFailure(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.LOGIN_FAILURE.getErrorCode(),
                     response.getError().getErrorCode());
    }

    void hqAssertFailureObjectNotFound(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.OBJECT_NOT_FOUND.getErrorCode(),
                     response.getError().getErrorCode());
    }

    void hqAssertFailureObjectExists(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.OBJECT_EXISTS.getErrorCode(),
                     response.getError().getErrorCode());
    }

    void hqAssertFailureInvalidParameters(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.INVALID_PARAMETERS.getErrorCode(),
                     response.getError().getErrorCode());
    }

    // Unlikely, but here for completeness.
    void hqAssertFailureUnexpectedError(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.UNEXPECTED_ERROR.getErrorCode(),
                     response.getError().getErrorCode());
    }

    void hqAssertFailurePermissionDenied(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.PERMISSION_DENIED.getErrorCode(),
                     response.getError().getErrorCode());
    }

    void hqAssertFailureOperationDenied(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.OPERATION_DENIED.getErrorCode(),
                     response.getError().getErrorCode());
    }
    
    void hqAssertFailureNotImplemented(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.NOT_IMPLEMENTED.getErrorCode(),
                     response.getError().getErrorCode());
    }

    void hqAssertFailureNotSupported(Response response) {
        assertEquals(ResponseStatus.FAILURE, response.getStatus());
        assertEquals(response.getError().getReasonText(),
                     ErrorCode.NOT_SUPPORTED.getErrorCode(),
                     response.getError().getErrorCode());
    }
}