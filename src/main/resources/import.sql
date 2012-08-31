INSERT INTO resource_prototype(id, version, name, type_id) VALUES(1, 0, 'VMware Vsphere',1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (1, 'ip', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (2, 'username', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (3, 'password', 0, 1);
SELECT pg_catalog.setval('resource_property_key_seq', (SELECT MAX(id) FROM resource_property_key), true);
SELECT pg_catalog.setval('resource_prototype_seq', (SELECT MAX(id) FROM resource_prototype), true);