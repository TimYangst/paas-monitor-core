INSERT INTO group_owner(id, version, name) VALUES(1, 0, 'SuperAdmin');
INSERT INTO resource_group(id, version, group_owner) VALUES(1, 0, 1);

INSERT INTO resource_prototype (id, name, type_id, version) VALUES (1, 'VMware Vsphere', 1, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (2, 'Win32', 2, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (3, 'WindowsServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (4, 'ProcessServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (5, 'FileServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (6, 'NetworkServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (7, 'Net Services', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (8, 'CPU', 4, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (9, 'FileServer Mount', 4, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (10, 'NetworkServer Interface', 4, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (11, 'Apache httpd', 5, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (12, 'Apache Tomcat 6.0', 5, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (13, 'Apache Tomcat 7.0', 5, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (14, 'Apache Tomcat 6.0 Servlet Monitor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (15, 'Apache Tomcat 6.0 Thread Pools', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (16, 'Apache Tomcat 6.0 Web Module Stats', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (17, 'Apache Tomcat 6.0 Cache', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (18, 'Apache Tomcat 6.0 DataSource Pool', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (19, 'Apache Tomcat 6.0 Global Request Processor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (20, 'Apache Tomcat 6.0 JSP Monitor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (21, 'Apache Tomcat 7.0 Servlet Monitor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (22, 'Apache Tomcat 7.0 Thread Pools', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (23, 'Apache Tomcat 7.0 Global Request Processor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (24, 'Apache Tomcat 7.0 Web Module Stats', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (25, 'Apache Tomcat 7.0 JSP Monitor', 6, 0);

INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (1, 'ip', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (2, 'username', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (3, 'password', 0, 1);
SELECT pg_catalog.setval('group_owner_seq', (SELECT MAX(id) FROM group_owner), true);
SELECT pg_catalog.setval('resource_group_seq', (SELECT MAX(id) FROM resource_group), true);
SELECT pg_catalog.setval('resource_property_key_seq', (SELECT MAX(id) FROM resource_property_key), true);
SELECT pg_catalog.setval('resource_prototype_seq', (SELECT MAX(id) FROM resource_prototype), true);