package org.seforge.monitor.test;


import java.util.List;

import org.hyperic.hq.hqapi1.HQApi;
import org.hyperic.hq.hqapi1.ResourceApi;
import org.hyperic.hq.hqapi1.types.Resource;
import org.hyperic.hq.hqapi1.types.ResourceInfo;
import org.hyperic.hq.hqapi1.types.ResourceResponse;
import org.hyperic.hq.hqapi1.types.ResourcesResponse;
import org.hyperic.hq.hqapi1.types.User;

public class ResourceGet_test extends ResourceTestBase {

    public ResourceGet_test(String name) {
        super(name);
    }

    public void testGetInvalidResource() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        ResourceResponse resp = api.getResource(Integer.MAX_VALUE, false, false);
        hqAssertFailureObjectNotFound(resp);
    }

    public void testGetResource() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        Resource r = getLocalPlatformResource(false, false);

        ResourceResponse getResponse = api.getResource(r.getId(), false, false);
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
    }

    public void testGetResourceVerboseWithChildren() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        Resource r = getLocalPlatformResource(false, false);

        ResourceResponse getResponse = api.getResource(r.getId(), true, true);
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
        assertTrue("No configuration found for resource " + r.getName(),
                   resource.getResourceConfig().size() > 0);
        assertTrue("No properties found for resource " + r.getName(),
                   resource.getResourceProperty().size() > 0);
        assertTrue("No child resources found for resource " + r.getName(),
                   resource.getResource().size() > 0);
    }

    public void testGetResourceNoConfigNoChildren() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        Resource r = getLocalPlatformResource(false, false);

        ResourceResponse getResponse = api.getResource(r.getId(), false, false);
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
        assertTrue("Configuration found for resource " + r.getName(),
                   resource.getResourceConfig().size() == 0);
        assertTrue("Properties found for resource " + r.getName(),
                   resource.getResourceProperty().size() == 0);
        assertTrue("Child resources found for resource " + r.getName(),
                   resource.getResource().size() == 0);
    }

    public void testGetResourceConfigOnly() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        Resource r = getLocalPlatformResource(false, false);

        ResourceResponse getResponse = api.getResource(r.getId(), true, false);
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
        assertTrue("No configuration found for resource " + r.getName(),
                   resource.getResourceConfig().size() > 0);
        assertTrue("No properties found for resource " + r.getName(),
                   resource.getResourceProperty().size() > 0);
        assertTrue("Child resources found for resource " + r.getName(),
                   resource.getResource().size() == 0);
    }

    public void testGetResourceChildrenOnly() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        Resource r = getLocalPlatformResource(false, false);

        ResourceResponse getResponse = api.getResource(r.getId(), false, true);
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
        assertTrue("Configuration found for resource " + r.getName(),
                   resource.getResourceConfig().size() == 0);
        assertTrue("Properties found for resource " + r.getName(),
                   resource.getResourceProperty().size() == 0);
        assertTrue("No child resources found for resource " + r.getName(),
                   resource.getResource().size() > 0);
    }

    public void testGetPlatformResource() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        Resource r = getLocalPlatformResource(false, false);

        ResourceResponse getResponse = api.getPlatformResource(r.getName(),
                                                               false, false);
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
    }

    public void testGetInvalidPlatformResource() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        ResourceResponse getResponse = api.getPlatformResource("Invalid platform",
                                                               false, false);
        hqAssertFailureObjectNotFound(getResponse);
    }
    
    public void testGetPlatformResourceByFqdn() throws Exception {

        Resource r = getLocalPlatformResource(false, false);
        
        String fqdn = getFqdn(r);
        assertNotNull("Platform has no fqdn", fqdn);
        
        ResourceResponse getResponse = 
            getApi().getResourceApi().getPlatformResourceByFqdn(fqdn, false, false);
        
        hqAssertSuccess(getResponse);
        Resource resource = getResponse.getResource();
        validateResource(resource);
    }

    public void testGetPlatformResourceByFqdnNoPermission() throws Exception {

        Resource r = getLocalPlatformResource(false, false);
        
        String fqdn = getFqdn(r);
        assertNotNull("Platform has no fqdn", fqdn);

        List<User> users = createTestUsers(1);
        User user = users.get(0);
        HQApi apiUnpriv = getApi(user.getName(), TESTUSER_PASSWORD);

        ResourceResponse getResponse = 
            apiUnpriv.getResourceApi().getPlatformResourceByFqdn(fqdn, false, false);
        
        hqAssertFailurePermissionDenied(getResponse);

        deleteTestUsers(users);
    }
    
    public void testGetInvalidPlatformResourceByFqdn() throws Exception {

        ResourceApi api = getApi().getResourceApi();

        ResourceResponse getResponse = api.getPlatformResourceByFqdn("Invalid platform fqdn",
                                                                     false, false);
        hqAssertFailureObjectNotFound(getResponse);
    }
    
    private String getFqdn(Resource r) {
        String fqdn = null;
        for (ResourceInfo ri : r.getResourceInfo()) {
            if ("fqdn".equals(ri.getKey())) {
                fqdn = ri.getValue();
                break;
            }
        }
        return fqdn;
    }

    public void testGetResourceByIdUnauthorized() throws Exception {
        List<User> users = createTestUsers(1);
        User user = users.get(0);
        ResourceApi api = getApi(user.getName(), TESTUSER_PASSWORD).getResourceApi();

        // Use admin user to get local platform..
        Resource localPlatform = getLocalPlatformResource(false, false);

        // Test find by ID
        ResourceResponse response = api.getResource(localPlatform.getId(), false, false);
        hqAssertFailurePermissionDenied(response);

        deleteTestUsers(users);
    }

    public void testGetResourceByNameUnauthorized() throws Exception {
        List<User> users = createTestUsers(1);
        User user = users.get(0);
        ResourceApi api = getApi(user.getName(), TESTUSER_PASSWORD).getResourceApi();

        // Use admin user to get local platform..
        Resource localPlatform = getLocalPlatformResource(false, false);

        // Test find by name
        ResourceResponse response = api.getPlatformResource(localPlatform.getName(), false, false);
        hqAssertFailurePermissionDenied(response);

        deleteTestUsers(users);
    }

    public void testGetPlatformResourceByPlatform() throws Exception {

        ResourceApi api = getApi().getResourceApi();
        Resource localPlatform = getLocalPlatformResource(false, false);

        ResourceResponse response = api.getPlatformResource(localPlatform.getId(), false, false);
        hqAssertSuccess(response);

        assertEquals("Platform ids not equal", localPlatform.getId(),
                     response.getResource().getId());
    }

    public void testGetPlatformResourceByServer() throws Exception {

        ResourceApi api = getApi().getResourceApi();
        Resource localPlatform = getLocalPlatformResource(false, true);

        List<Resource> servers = localPlatform.getResource();
        assertTrue("No servers found for " + localPlatform.getName(),
                   servers.size() > 0);

        Resource server = servers.get(0);

        ResourceResponse response = api.getPlatformResource(server.getId(), false, false);
        hqAssertSuccess(response);

        assertEquals("Platform ids not equal", localPlatform.getId(),
                     response.getResource().getId());
    }

    public void testGetPlatformResourceByService() throws Exception {

        ResourceApi api = getApi().getResourceApi();
        Resource localPlatform = getLocalPlatformResource(false, true);

        List<Resource> servers = localPlatform.getResource();
        assertTrue("No servers found for " + localPlatform.getName(),
                   servers.size() > 0);
        Resource service = null;
        for (Resource server : servers) {
            if (server.getResource().size() > 0) {
                service = server.getResource().get(0);
                break;
            }
        }

        assertNotNull("Unable to find a service for platform " + localPlatform.getName(),
                      service);

        ResourceResponse response = api.getPlatformResource(service.getId(), false, false);
        hqAssertSuccess(response);

        assertEquals("Platform ids not equal", localPlatform.getId(),
                     response.getResource().getId());
    }

    public void testGetPlatformResourceInvalidId() throws Exception {
        ResourceApi api = getApi().getResourceApi();

        ResourceResponse response = api.getPlatformResource(Integer.MAX_VALUE, false, false);
        hqAssertFailureObjectNotFound(response);
    }

    public void testGetParentForPlatform() throws Exception {
        ResourceApi api = getApi().getResourceApi();

        Resource platform = getLocalPlatformResource(false, false);
        ResourceResponse response = api.getParent(platform);

        hqAssertFailureObjectNotFound(response);
    }

    public void testGetParentForServer() throws Exception {
        ResourceApi api = getApi().getResourceApi();

        Resource platform = getLocalPlatformResource(false, true);
        List<Resource> servers = platform.getResource();

        assertTrue("No servers found for platform " + platform.getName(), servers.size() > 0);
        Resource server = servers.get(0);

        ResourceResponse response = api.getParent(server);
        hqAssertSuccess(response);

        assertEquals("Id mismatch for parent resource", platform.getId(), response.getResource().getId());
    }

    public void testGetParentForService() throws Exception {
        ResourceApi api = getApi().getResourceApi();

        Resource platform = getLocalPlatformResource(false, true);
        List<Resource> servers = platform.getResource();

        assertTrue("No servers found for platform " + platform.getName(), servers.size() > 0);

        Resource server = null;
        Resource service = null;
        for (Resource r : servers) {
            if (r.getResource().size() > 0) {
                server = r;
                service = r.getResource().get(0);
            }
        }

        assertNotNull("No services found for platform " + platform.getName(), service);

        ResourceResponse response = api.getParent(service);
        hqAssertSuccess(response);

        assertEquals("Id mismatch for parent resource", server.getId(), response.getResource().getId());
    }

    public void testGetParentInvalidId() throws Exception {
        ResourceApi api = getApi().getResourceApi();

        Resource r = new Resource();
        r.setId(Integer.MAX_VALUE);
        ResourceResponse response = api.getParent(r);

        hqAssertFailureObjectNotFound(response);
    }
    
//    public void testGetPlatformResources() throws Exception {
//        ResourceApi api = getApi().getResourceApi();
//        
//        Resource localPlatform = getLocalPlatformResource(false, false);
//        ResourcesResponse response = api.getPlatformResources(false,  false);
//        
//        assertTrue(response.getResource().size() > 0);
//    }
//    
//    public void testGetPlatformResourceByIp() throws Exception {
//
//        Resource r = getLocalPlatformResource(false, false);
//        
//        String ip = "127.0.0.1";
//        assertNotNull("Platform has no ip", ip);
//        
//        ResourcesResponse resourcesResponse = 
//            getApi().getResourceApi().getPlatformResourceByIp(ip, false, false);
//        
//        hqAssertSuccess(resourcesResponse);
//        assertTrue(resourcesResponse.getResource().size() > 0);
//    }
//    
//    public void testGetInvalidPlatformResourceByIp() throws Exception {
//
//        ResourceApi api = getApi().getResourceApi();
//
//        ResourcesResponse getResponse = api.getPlatformResourceByIp("Invalid platform ip",
//                                                                     false, false);
//        hqAssertFailureObjectNotFound(getResponse);
//    }

}