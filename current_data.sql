--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: group_owner; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_owner (
    id integer NOT NULL,
    name character varying(255),
    version integer
);


ALTER TABLE public.group_owner OWNER TO postgres;

--
-- Name: group_owner_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_owner_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_owner_seq OWNER TO postgres;

--
-- Name: group_owner_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_owner_seq', 1, true);


--
-- Name: group_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_seq OWNER TO postgres;

--
-- Name: group_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_seq', 1, false);


--
-- Name: metric; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE metric (
    id integer NOT NULL,
    enabled boolean NOT NULL,
    monitor_interval bigint,
    version integer,
    metric_template integer,
    resource_group integer,
    resource_prototype integer
);


ALTER TABLE public.metric OWNER TO postgres;

--
-- Name: metric_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metric_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_seq OWNER TO postgres;

--
-- Name: metric_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metric_seq', 247, true);


--
-- Name: metric_template; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE metric_template (
    id integer NOT NULL,
    alias character varying(255),
    category character varying(255),
    collection_type character varying(255),
    default_interval bigint NOT NULL,
    default_on boolean NOT NULL,
    indicator boolean NOT NULL,
    name character varying(255),
    plugin character varying(255),
    units character varying(255),
    version integer,
    resource_prototype integer
);


ALTER TABLE public.metric_template OWNER TO postgres;

--
-- Name: metric_template_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE metric_template_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_template_seq OWNER TO postgres;

--
-- Name: metric_template_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('metric_template_seq', 247, true);


--
-- Name: profile_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_seq OWNER TO postgres;

--
-- Name: profile_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profile_seq', 1, false);


--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id integer NOT NULL,
    instance_id integer,
    name character varying(255),
    resource_id integer,
    type_id integer,
    version integer,
    resource_prototype integer
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resource_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_group (
    id integer NOT NULL,
    version integer,
    group_owner integer
);


ALTER TABLE public.resource_group OWNER TO postgres;

--
-- Name: resource_group_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_group_seq OWNER TO postgres;

--
-- Name: resource_group_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_group_seq', 1, true);


--
-- Name: resource_property_key; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_property_key (
    id integer NOT NULL,
    key character varying(255),
    version integer,
    resource_prototype integer
);


ALTER TABLE public.resource_property_key OWNER TO postgres;

--
-- Name: resource_property_key_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_property_key_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_property_key_seq OWNER TO postgres;

--
-- Name: resource_property_key_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_property_key_seq', 25, true);


--
-- Name: resource_property_value; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_property_value (
    id integer NOT NULL,
    value character varying(255),
    version integer,
    resource integer,
    resource_property_key integer
);


ALTER TABLE public.resource_property_value OWNER TO postgres;

--
-- Name: resource_property_value_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_property_value_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_property_value_seq OWNER TO postgres;

--
-- Name: resource_property_value_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_property_value_seq', 100, true);


--
-- Name: resource_prototype; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_prototype (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type_id integer,
    version integer
);


ALTER TABLE public.resource_prototype OWNER TO postgres;

--
-- Name: resource_prototype_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_prototype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_prototype_seq OWNER TO postgres;

--
-- Name: resource_prototype_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_prototype_seq', 25, true);


--
-- Name: resource_relationship; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_relationship (
    parent_id integer NOT NULL,
    children_id integer NOT NULL
);


ALTER TABLE public.resource_relationship OWNER TO postgres;

--
-- Name: resource_resourcegroup; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource_resourcegroup (
    resource_group_id integer NOT NULL,
    resource_id integer NOT NULL
);


ALTER TABLE public.resource_resourcegroup OWNER TO postgres;

--
-- Name: resource_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_seq OWNER TO postgres;

--
-- Name: resource_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_seq', 775, true);


--
-- Data for Name: group_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO group_owner (id, name, version) VALUES (1, 'SuperAdmin', 0);


--
-- Data for Name: metric; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (1, false, 60000, 0, 1, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (2, false, 28800000, 0, 2, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (3, false, 600000, 0, 3, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (4, false, 600000, 0, 4, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (5, false, 300000, 0, 5, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (6, false, 300000, 0, 6, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (7, false, 300000, 0, 7, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (8, false, 300000, 0, 8, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (9, false, 300000, 0, 9, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (10, false, 300000, 0, 10, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (11, false, 300000, 0, 11, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (12, false, 300000, 0, 12, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (13, false, 300000, 0, 13, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (14, false, 300000, 0, 14, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (15, false, 300000, 0, 15, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (16, false, 600000, 0, 16, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (17, false, 600000, 0, 17, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (18, false, 600000, 0, 18, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (19, false, 600000, 0, 19, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (20, false, 300000, 0, 20, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (21, false, 300000, 0, 21, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (22, false, 300000, 0, 22, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (23, false, 600000, 0, 23, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (24, false, 600000, 0, 24, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (25, false, 60000, 0, 25, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (26, false, 600000, 0, 26, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (27, false, 600000, 0, 27, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (28, false, 600000, 0, 28, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (29, false, 600000, 0, 29, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (30, false, 300000, 0, 30, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (31, false, 600000, 0, 31, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (32, false, 600000, 0, 32, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (33, false, 600000, 0, 33, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (34, false, 600000, 0, 34, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (35, false, 600000, 0, 35, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (36, false, 600000, 0, 36, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (37, false, 300000, 0, 37, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (38, false, 600000, 0, 38, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (39, false, 600000, 0, 39, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (40, false, 600000, 0, 40, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (41, false, 600000, 0, 41, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (42, false, 300000, 0, 42, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (43, false, 600000, 0, 43, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (44, false, 600000, 0, 44, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (45, false, 600000, 0, 45, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (46, false, 600000, 0, 46, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (47, false, 300000, 0, 47, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (48, false, 300000, 0, 48, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (49, false, 300000, 0, 49, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (50, false, 300000, 0, 50, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (51, false, 300000, 0, 51, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (52, false, 300000, 0, 52, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (53, false, 300000, 0, 53, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (54, false, 300000, 0, 54, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (55, false, 300000, 0, 55, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (56, false, 300000, 0, 56, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (57, false, 300000, 0, 57, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (58, false, 300000, 0, 58, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (59, false, 300000, 0, 59, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (60, false, 300000, 0, 60, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (61, false, 300000, 0, 61, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (62, false, 600000, 0, 62, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (63, false, 600000, 0, 63, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (64, false, 300000, 0, 64, 1, 2);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (65, false, 600000, 0, 65, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (66, false, 300000, 0, 66, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (67, false, 600000, 0, 67, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (68, false, 600000, 0, 68, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (69, false, 300000, 0, 69, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (70, false, 600000, 0, 70, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (71, false, 600000, 0, 71, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (72, false, 300000, 0, 72, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (73, false, 600000, 0, 73, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (74, false, 600000, 0, 74, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (75, false, 300000, 0, 75, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (76, false, 600000, 0, 76, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (77, false, 600000, 0, 77, 1, 5);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (78, false, 600000, 0, 78, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (79, false, 600000, 0, 79, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (80, false, 600000, 0, 80, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (81, false, 600000, 0, 81, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (82, false, 600000, 0, 82, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (83, false, 600000, 0, 83, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (84, false, 600000, 0, 84, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (85, false, 600000, 0, 85, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (86, false, 600000, 0, 86, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (87, false, 600000, 0, 87, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (88, false, 600000, 0, 88, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (89, false, 600000, 0, 89, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (90, false, 600000, 0, 90, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (91, false, 600000, 0, 91, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (92, false, 600000, 0, 92, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (93, false, 600000, 0, 93, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (94, false, 600000, 0, 94, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (95, false, 600000, 0, 95, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (96, false, 600000, 0, 96, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (97, false, 600000, 0, 97, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (98, false, 600000, 0, 98, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (99, false, 600000, 0, 99, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (100, false, 600000, 0, 100, 1, 7);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (101, false, 600000, 0, 101, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (102, false, 1800000, 0, 102, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (103, false, 300000, 0, 103, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (104, false, 600000, 0, 104, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (105, false, 600000, 0, 105, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (106, false, 600000, 0, 106, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (107, false, 600000, 0, 107, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (108, false, 300000, 0, 108, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (109, false, 600000, 0, 109, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (110, false, 600000, 0, 110, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (111, false, 600000, 0, 111, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (112, false, 600000, 0, 112, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (113, false, 300000, 0, 113, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (114, false, 300000, 0, 114, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (115, false, 300000, 0, 115, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (116, false, 300000, 0, 116, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (117, false, 300000, 0, 117, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (118, false, 300000, 0, 118, 1, 10);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (119, false, 300000, 0, 119, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (120, false, 600000, 0, 120, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (121, false, 600000, 0, 121, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (122, false, 600000, 0, 122, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (123, false, 600000, 0, 123, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (124, false, 300000, 0, 124, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (125, false, 300000, 0, 125, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (126, false, 300000, 0, 126, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (127, false, 300000, 0, 127, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (128, false, 300000, 0, 128, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (129, false, 1800000, 0, 129, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (130, false, 300000, 0, 130, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (131, false, 300000, 0, 131, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (132, false, 1800000, 0, 132, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (133, false, 600000, 0, 133, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (134, false, 600000, 0, 134, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (135, false, 600000, 0, 135, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (136, false, 600000, 0, 136, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (137, false, 1800000, 0, 137, 1, 11);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (138, false, 600000, 0, 138, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (139, false, 300000, 0, 139, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (140, false, 600000, 0, 140, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (141, false, 600000, 0, 141, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (142, false, 300000, 0, 142, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (143, false, 600000, 0, 143, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (144, false, 600000, 0, 144, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (145, false, 600000, 0, 145, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (146, false, 600000, 0, 146, 1, 12);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (147, false, 600000, 0, 147, 1, 13);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (148, false, 300000, 0, 148, 1, 13);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (149, false, 300000, 0, 149, 1, 13);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (150, false, 600000, 0, 150, 1, 14);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (151, false, 300000, 0, 151, 1, 14);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (152, false, 600000, 0, 152, 1, 15);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (153, false, 600000, 0, 153, 1, 15);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (154, false, 600000, 0, 154, 1, 15);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (155, false, 600000, 0, 155, 1, 15);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (156, false, 600000, 0, 156, 1, 15);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (157, false, 600000, 0, 157, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (158, false, 600000, 0, 158, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (159, false, 600000, 0, 159, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (160, false, 600000, 0, 160, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (161, false, 600000, 0, 161, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (162, false, 600000, 0, 162, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (163, false, 600000, 0, 163, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (164, false, 600000, 0, 164, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (165, false, 600000, 0, 165, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (166, false, 600000, 0, 166, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (167, false, 600000, 0, 167, 1, 16);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (168, false, 600000, 0, 168, 1, 17);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (169, false, 600000, 0, 169, 1, 17);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (170, false, 600000, 0, 170, 1, 17);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (171, false, 600000, 0, 171, 1, 17);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (172, false, 600000, 0, 172, 1, 17);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (173, false, 300000, 0, 173, 1, 18);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (174, false, 600000, 0, 174, 1, 18);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (175, false, 300000, 0, 175, 1, 18);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (176, false, 300000, 0, 176, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (177, false, 300000, 0, 177, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (178, false, 300000, 0, 178, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (179, false, 600000, 0, 179, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (180, false, 600000, 0, 180, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (181, false, 300000, 0, 181, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (182, false, 300000, 0, 182, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (183, false, 300000, 0, 183, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (184, false, 300000, 0, 184, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (185, false, 300000, 0, 185, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (186, false, 300000, 0, 186, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (187, false, 300000, 0, 187, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (188, false, 300000, 0, 188, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (189, false, 300000, 0, 189, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (190, false, 300000, 0, 190, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (191, false, 300000, 0, 191, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (192, false, 300000, 0, 192, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (193, false, 600000, 0, 193, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (194, false, 600000, 0, 194, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (195, false, 300000, 0, 195, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (196, false, 300000, 0, 196, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (197, false, 300000, 0, 197, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (198, false, 300000, 0, 198, 1, 19);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (199, false, 300000, 0, 199, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (200, false, 600000, 0, 200, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (201, false, 600000, 0, 201, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (202, false, 600000, 0, 202, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (203, false, 600000, 0, 203, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (204, false, 300000, 0, 204, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (205, false, 300000, 0, 205, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (206, false, 300000, 0, 206, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (207, false, 300000, 0, 207, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (208, false, 300000, 0, 208, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (209, false, 1800000, 0, 209, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (210, false, 300000, 0, 210, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (211, false, 300000, 0, 211, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (212, false, 1800000, 0, 212, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (213, false, 600000, 0, 213, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (214, false, 600000, 0, 214, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (215, false, 600000, 0, 215, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (216, false, 600000, 0, 216, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (217, false, 1800000, 0, 217, 1, 20);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (218, false, 600000, 0, 218, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (219, false, 300000, 0, 219, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (220, false, 600000, 0, 220, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (221, false, 600000, 0, 221, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (222, false, 300000, 0, 222, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (223, false, 600000, 0, 223, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (224, false, 600000, 0, 224, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (225, false, 600000, 0, 225, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (226, false, 600000, 0, 226, 1, 21);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (227, false, 600000, 0, 227, 1, 22);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (228, false, 300000, 0, 228, 1, 22);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (229, false, 300000, 0, 229, 1, 22);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (230, false, 600000, 0, 230, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (231, false, 600000, 0, 231, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (232, false, 600000, 0, 232, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (233, false, 600000, 0, 233, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (234, false, 600000, 0, 234, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (235, false, 600000, 0, 235, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (236, false, 600000, 0, 236, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (237, false, 600000, 0, 237, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (238, false, 600000, 0, 238, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (239, false, 600000, 0, 239, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (240, false, 600000, 0, 240, 1, 23);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (241, false, 600000, 0, 241, 1, 24);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (242, false, 300000, 0, 242, 1, 24);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (243, false, 600000, 0, 243, 1, 25);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (244, false, 600000, 0, 244, 1, 25);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (245, false, 600000, 0, 245, 1, 25);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (246, false, 600000, 0, 246, 1, 25);
INSERT INTO metric (id, enabled, monitor_interval, version, metric_template, resource_group, resource_prototype) VALUES (247, false, 600000, 0, 247, 1, 25);


--
-- Data for Name: metric_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (1, 'Availability', 'AVAILABILITY', '0', 60000, true, true, 'Availability', 'system', 'percentage', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (2, 'AvailableUpdates', 'AVAILABILITY', '0', 28800000, false, false, 'Available Updates', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (3, 'CpuIdleSec', 'UTILIZATION', '2', 600000, false, false, 'Cpu Idle Time', 'system', 'ms', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (4, 'CpuIdleSec1m', 'UTILIZATION', '0', 600000, false, false, 'Cpu Idle Time per Minute', 'system', 'ms', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (5, 'CpuUsage', 'UTILIZATION', '0', 300000, true, true, 'Cpu Usage', 'system', 'percentage', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (6, 'MemFree', 'UTILIZATION', '0', 300000, true, true, 'Free Memory', 'system', 'B', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (7, 'NumCPUs', 'UTILIZATION', '0', 300000, false, false, 'Number of CPUs', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (8, 'PercentFreeMemory', 'UTILIZATION', '0', 300000, false, false, 'Percent Free Memory', 'system', 'percent', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (9, 'PercentFreeSwap', 'UTILIZATION', '0', 300000, false, false, 'Percent Free Swap', 'system', 'percentage', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (10, 'PercentUsedMemory', 'UTILIZATION', '0', 300000, false, false, 'Percent Used Memory', 'system', 'percent', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (11, 'PercentUsedSwap', 'UTILIZATION', '0', 300000, false, false, 'Percent Used Swap', 'system', 'percentage', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (12, 'RunningProcesses', 'UTILIZATION', '0', 300000, false, false, 'Running Processes', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (13, 'SleepingProcesses', 'UTILIZATION', '0', 300000, false, false, 'Sleeping Processes', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (14, 'StoppedProcesses', 'UTILIZATION', '0', 300000, false, false, 'Stopped Processes', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (15, 'SwapFree', 'UTILIZATION', '0', 300000, false, false, 'Swap Free', 'system', 'B', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (16, 'SwapPagesIn', 'UTILIZATION', '2', 600000, false, false, 'Swap Pages In', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (17, 'SwapPagesIn1m', 'UTILIZATION', '0', 600000, false, false, 'Swap Pages In per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (18, 'SwapPagesOut', 'UTILIZATION', '2', 600000, false, false, 'Swap Pages Out', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (19, 'SwapPagesOut1m', 'UTILIZATION', '0', 600000, false, false, 'Swap Pages Out per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (20, 'SwapTotal', 'UTILIZATION', '0', 300000, false, false, 'Swap Total', 'system', 'B', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (21, 'SwapUsed', 'UTILIZATION', '0', 300000, true, true, 'Swap Used', 'system', 'B', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (22, 'CpuSys', 'UTILIZATION', '0', 300000, false, false, 'System Cpu', 'system', 'percentage', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (23, 'CpuSysSec', 'UTILIZATION', '2', 600000, false, false, 'System Cpu Time', 'system', 'ms', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (24, 'CpuSysSec1m', 'UTILIZATION', '0', 600000, false, false, 'System Cpu Time per Minute', 'system', 'ms', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (25, 'Uptime', 'AVAILABILITY', '1', 60000, false, false, 'System Uptime', 'system', 'sec', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (26, 'TcpActiveOpens', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Active Opens', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (27, 'TcpActiveOpens1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Active Opens per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (28, 'TcpAttemptFails', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Attempt Fails', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (29, 'TcpAttemptFails1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Attempt Fails per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (30, 'TcpCurrEstab', 'THROUGHPUT', '0', 300000, false, false, 'Tcp Curr Estab', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (31, 'TcpEstabResets', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Estab Resets', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (32, 'TcpEstabResets1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Estab Resets per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (33, 'TcpInErrs', 'THROUGHPUT', '2', 600000, false, false, 'Tcp In Errs', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (34, 'TcpInErrs1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp In Errs per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (35, 'TcpInSegs', 'THROUGHPUT', '2', 600000, false, false, 'Tcp In Segs', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (36, 'TcpInSegs1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp In Segs per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (37, 'TcpInboundConnections', 'THROUGHPUT', '0', 300000, false, false, 'Tcp Inbound Connections', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (38, 'TcpOutRsts', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Out Rsts', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (39, 'TcpOutRsts1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Out Rsts per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (40, 'TcpOutSegs', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Out Segs', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (41, 'TcpOutSegs1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Out Segs per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (42, 'TcpOutboundConnections', 'THROUGHPUT', '0', 300000, false, false, 'Tcp Outbound Connections', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (43, 'TcpPassiveOpens', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Passive Opens', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (44, 'TcpPassiveOpens1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Passive Opens per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (45, 'TcpRetransSegs', 'THROUGHPUT', '2', 600000, false, false, 'Tcp Retrans Segs', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (46, 'TcpRetransSegs1m', 'THROUGHPUT', '0', 600000, false, false, 'Tcp Retrans Segs per Minute', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (47, 'TcpStateCLOSE', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State CLOSE', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (48, 'TcpStateCLOSE_WAIT', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State CLOSE_WAIT', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (49, 'TcpStateCLOSING', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State CLOSING', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (50, 'TcpStateESTABLISHED', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State ESTABLISHED', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (51, 'TcpStateFIN_WAIT1', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State FIN_WAIT1', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (52, 'TcpStateFIN_WAIT2', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State FIN_WAIT2', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (53, 'TcpStateLAST_ACK', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State LAST_ACK', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (54, 'TcpStateLISTEN', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State LISTEN', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (55, 'TcpStateSYN_RECV', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State SYN_RECV', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (56, 'TcpStateSYN_SENT', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State SYN_SENT', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (57, 'TcpStateTIME_WAIT', 'THROUGHPUT', '0', 300000, false, false, 'Tcp State TIME_WAIT', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (58, 'MemTotal', 'UTILIZATION', '0', 300000, false, false, 'Total Memory', 'system', 'B', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (59, 'TotalProcesses', 'UTILIZATION', '0', 300000, false, false, 'Total Processes', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (60, 'MemUsed', 'UTILIZATION', '0', 300000, false, false, 'Used Memory', 'system', 'B', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (61, 'CpuUser', 'UTILIZATION', '0', 300000, false, false, 'User Cpu', 'system', 'percentage', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (62, 'CpuUserSec', 'UTILIZATION', '2', 600000, false, false, 'User Cpu Time', 'system', 'ms', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (63, 'CpuUserSec1m', 'UTILIZATION', '0', 600000, false, false, 'User Cpu Time per Minute', 'system', 'ms', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (64, 'ZombieProcesses', 'UTILIZATION', '0', 300000, false, false, 'Zombie Processes', 'system', 'none', 0, 2);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (65, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'system', 'percentage', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (66, 'CpuIdle', 'UTILIZATION', '0', 300000, true, true, 'Cpu Idle', 'system', 'percentage', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (67, 'CpuIdleSec', 'UTILIZATION', '2', 600000, false, false, 'Cpu Idle Time', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (68, 'CpuIdleSec1m', 'UTILIZATION', '0', 600000, false, false, 'Cpu Idle Time per Minute', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (69, 'CpuUsage', 'UTILIZATION', '0', 300000, true, true, 'Cpu Usage', 'system', 'percentage', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (70, 'CpuWaitSec', 'UTILIZATION', '2', 600000, false, false, 'Cpu Wait Time', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (71, 'CpuWaitSec1m', 'UTILIZATION', '0', 600000, false, false, 'Cpu Wait Time per Minute', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (72, 'CpuSys', 'UTILIZATION', '0', 300000, true, true, 'System Cpu', 'system', 'percentage', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (73, 'CpuSysSec', 'UTILIZATION', '2', 600000, false, false, 'System Cpu Time', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (74, 'CpuSysSec1m', 'UTILIZATION', '0', 600000, false, false, 'System Cpu Time per Minute', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (75, 'CpuUser', 'UTILIZATION', '0', 300000, true, true, 'User Cpu', 'system', 'percentage', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (76, 'CpuUserSec', 'UTILIZATION', '2', 600000, false, false, 'User Cpu Time', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (77, 'CpuUserSec1m', 'UTILIZATION', '0', 600000, false, false, 'User Cpu Time per Minute', 'system', 'ms', 0, 5);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (78, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'system', 'percentage', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (79, 'BitsIn', 'THROUGHPUT', '2', 600000, false, false, 'Bits Received', 'system', 'bytesToBits', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (80, 'BitsIn1s', 'THROUGHPUT', '0', 600000, true, true, 'Bits Received per Second', 'system', 'bytesToBits', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (81, 'BitsOut', 'THROUGHPUT', '2', 600000, false, false, 'Bits Transmitted', 'system', 'bytesToBits', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (82, 'BitsOut1s', 'THROUGHPUT', '0', 600000, true, true, 'Bits Transmitted per Second', 'system', 'bytesToBits', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (83, 'BytesIn', 'THROUGHPUT', '2', 600000, false, false, 'Bytes Received', 'system', 'B', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (84, 'BytesIn1m', 'THROUGHPUT', '0', 600000, false, false, 'Bytes Received per Minute', 'system', 'B', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (85, 'BytesOut', 'THROUGHPUT', '2', 600000, false, false, 'Bytes Transmitted', 'system', 'B', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (86, 'BytesOut1m', 'THROUGHPUT', '0', 600000, false, false, 'Bytes Transmitted per Minute', 'system', 'B', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (87, 'PacketsIn', 'UTILIZATION', '2', 600000, false, false, 'Packets Received', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (88, 'PacketsIn1m', 'UTILIZATION', '0', 600000, true, true, 'Packets Received per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (89, 'PacketsOut', 'UTILIZATION', '2', 600000, false, false, 'Packets Transmitted', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (90, 'PacketsOut1m', 'UTILIZATION', '0', 600000, true, true, 'Packets Transmitted per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (91, 'RxErrors', 'UTILIZATION', '2', 600000, false, false, 'Receive Errors', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (92, 'RxErrors1m', 'UTILIZATION', '0', 600000, false, false, 'Receive Errors per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (93, 'RxDropped', 'UTILIZATION', '2', 600000, false, false, 'Receive Packets Dropped', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (94, 'RxDropped1m', 'UTILIZATION', '0', 600000, false, false, 'Receive Packets Dropped per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (95, 'TxCollisions', 'UTILIZATION', '2', 600000, false, false, 'Transmit Collisions', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (96, 'TxCollisions1m', 'UTILIZATION', '0', 600000, false, false, 'Transmit Collisions per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (97, 'TxErrors', 'UTILIZATION', '2', 600000, false, false, 'Transmit Errors', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (98, 'TxErrors1m', 'UTILIZATION', '0', 600000, false, false, 'Transmit Errors per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (99, 'TxDropped', 'UTILIZATION', '2', 600000, false, false, 'Transmit Packets Dropped', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (100, 'TxDropped1m', 'UTILIZATION', '0', 600000, false, false, 'Transmit Packets Dropped per Minute', 'system', 'none', 0, 7);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (101, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'system', 'percentage', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (102, 'Capacity', 'UTILIZATION', '1', 1800000, false, false, 'Capacity', 'system', 'KB', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (103, 'DiskQueue', 'THROUGHPUT', '0', 300000, false, false, 'Disk Queue', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (104, 'DiskReadBytes', 'THROUGHPUT', '2', 600000, false, false, 'Disk Read Bytes', 'system', 'B', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (105, 'DiskReadBytes1m', 'THROUGHPUT', '0', 600000, false, false, 'Disk Read Bytes per Minute', 'system', 'B', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (106, 'DiskReads', 'THROUGHPUT', '2', 600000, false, false, 'Disk Reads', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (107, 'DiskReads1m', 'THROUGHPUT', '0', 600000, true, true, 'Disk Reads per Minute', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (108, 'DiskServiceTime', 'UTILIZATION', '0', 300000, false, false, 'Disk Service Time', 'system', 'ms', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (109, 'DiskWriteBytes', 'THROUGHPUT', '2', 600000, false, false, 'Disk Write Bytes', 'system', 'B', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (110, 'DiskWriteBytes1m', 'THROUGHPUT', '0', 600000, false, false, 'Disk Write Bytes per Minute', 'system', 'B', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (111, 'DiskWrites', 'THROUGHPUT', '2', 600000, false, false, 'Disk Writes', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (112, 'DiskWrites1m', 'THROUGHPUT', '0', 600000, true, true, 'Disk Writes per Minute', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (113, 'FreeFiles', 'UTILIZATION', '0', 300000, false, false, 'Free Files', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (114, 'TotFsAvail', 'UTILIZATION', '0', 300000, false, false, 'Total Bytes Avail', 'system', 'KB', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (115, 'TotFsFree', 'UTILIZATION', '0', 300000, true, true, 'Total Bytes Free', 'system', 'KB', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (116, 'TotFsUsed', 'UTILIZATION', '0', 300000, false, false, 'Total Bytes Used', 'system', 'KB', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (117, 'Files', 'UTILIZATION', '0', 300000, false, false, 'Total Files', 'system', 'none', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (118, 'UsePercent', 'UTILIZATION', '0', 300000, true, true, 'Use Percent', 'system', 'percentage', 0, 10);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (119, 'Availability', 'AVAILABILITY', '0', 300000, true, true, 'Availability', 'tomcat', 'percentage', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (120, 'CurrentThreadCpuTime', 'UTILIZATION', '2', 600000, false, false, 'Current Thread Cpu Time', 'tomcat', 'ms', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (121, 'CurrentThreadCpuTime1m', 'UTILIZATION', '0', 600000, false, false, 'Current Thread Cpu Time per Minute', 'tomcat', 'ms', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (122, 'CurrentThreadUserTime', 'UTILIZATION', '2', 600000, false, false, 'Current Thread User Time', 'tomcat', 'ms', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (123, 'CurrentThreadUserTime1m', 'UTILIZATION', '0', 600000, false, false, 'Current Thread User Time per Minute', 'tomcat', 'ms', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (124, 'DaemonThreadCount', 'UTILIZATION', '0', 300000, false, false, 'Daemon Thread Count', 'tomcat', 'none', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (125, 'FreePhysicalMemorySize', 'UTILIZATION', '0', 300000, false, false, 'Free Physical Memory Size', 'tomcat', 'B', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (126, 'FreeSwapSpaceSize', 'UTILIZATION', '0', 300000, false, false, 'Free Swap Space Size', 'tomcat', 'B', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (127, 'HeapMemoryCommitted', 'UTILIZATION', '0', 300000, false, false, 'Heap Memory Committed', 'tomcat', 'B', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (128, 'HeapMemoryFree', 'UTILIZATION', '0', 300000, true, true, 'Heap Memory Free', 'tomcat', 'B', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (129, 'HeapMemoryMax', 'UTILIZATION', '1', 1800000, false, false, 'Heap Memory Max', 'tomcat', 'B', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (130, 'HeapMemoryUsed', 'UTILIZATION', '0', 300000, false, false, 'Heap Memory Used', 'tomcat', 'B', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (131, 'OpenFileDescriptorCount', 'UTILIZATION', '0', 300000, false, false, 'Open File Descriptor Count', 'tomcat', 'none', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (132, 'PeakThreadCount', 'UTILIZATION', '1', 1800000, false, false, 'Peak Thread Count', 'tomcat', 'none', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (133, 'ProcessCpuTime', 'UTILIZATION', '2', 600000, false, false, 'Process Cpu Time', 'tomcat', 'ns', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (134, 'ProcessCpuTime1m', 'UTILIZATION', '0', 600000, true, true, 'Process Cpu Time per Minute', 'tomcat', 'ns', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (135, 'ThreadCount', 'UTILIZATION', '2', 600000, false, false, 'Thread Count', 'tomcat', 'none', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (136, 'ThreadCount1m', 'UTILIZATION', '0', 600000, false, false, 'Thread Count per Minute', 'tomcat', 'none', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (137, 'Uptime', 'UTILIZATION', '1', 1800000, true, true, 'UpTime', 'tomcat', 'ms', 0, 11);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (138, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (139, 'classLoadTime', 'UTILIZATION', '0', 300000, false, false, 'Class Load Time', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (140, 'errorCount', 'UTILIZATION', '2', 600000, false, false, 'Error Count', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (141, 'errorCount1m', 'UTILIZATION', '0', 600000, true, true, 'Error Count per Minute', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (142, 'loadTime', 'UTILIZATION', '0', 300000, false, false, 'Load Time', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (143, 'processingTime', 'UTILIZATION', '2', 600000, false, false, 'Processing Time', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (144, 'processingTime1m', 'UTILIZATION', '0', 600000, false, false, 'Processing Time per Minute', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (145, 'requestCount', 'UTILIZATION', '2', 600000, false, false, 'Request Count', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (146, 'requestCount1m', 'UTILIZATION', '0', 600000, true, true, 'Request Count per Minute', 'tomcat', 'none', 0, 12);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (147, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 13);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (148, 'currentThreadsBusy', 'UTILIZATION', '0', 300000, true, true, 'Current Thread Busy', 'tomcat', 'none', 0, 13);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (149, 'currentThreadCount', 'UTILIZATION', '0', 300000, true, true, 'Current Thread Count', 'tomcat', 'none', 0, 13);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (150, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 14);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (151, 'processingTime', 'UTILIZATION', '0', 300000, true, true, 'Processing Time', 'tomcat', 'sec', 0, 14);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (152, 'accessCount', 'UTILIZATION', '2', 600000, false, false, 'Access Count', 'tomcat', 'none', 0, 15);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (153, 'accessCount1m', 'UTILIZATION', '0', 600000, true, true, 'Access Count per Minute', 'tomcat', 'none', 0, 15);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (154, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 15);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (155, 'hitsCount', 'UTILIZATION', '2', 600000, false, false, 'Hits Count', 'tomcat', 'none', 0, 15);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (156, 'hitsCount1m', 'UTILIZATION', '0', 600000, true, true, 'Hits Count per Minute', 'tomcat', 'none', 0, 15);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (157, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (158, 'bytesReceived', 'UTILIZATION', '2', 600000, false, false, 'Bytes Received', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (159, 'bytesReceived1m', 'UTILIZATION', '0', 600000, false, false, 'Bytes Received per Minute', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (160, 'bytesSent', 'UTILIZATION', '2', 600000, false, false, 'Bytes Sent', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (161, 'bytesSent1m', 'UTILIZATION', '0', 600000, false, false, 'Bytes Sent per Minute', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (162, 'errorCount', 'UTILIZATION', '2', 600000, false, false, 'Error Count', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (163, 'errorCount1m', 'UTILIZATION', '0', 600000, true, true, 'Error Count per Minute', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (164, 'processingTime', 'UTILIZATION', '2', 600000, false, false, 'Processing Time', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (165, 'processingTime1m', 'UTILIZATION', '0', 600000, true, true, 'Processing Time per Minute', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (166, 'requestCount', 'UTILIZATION', '2', 600000, false, false, 'Request Count', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (167, 'requestCount1m', 'UTILIZATION', '0', 600000, true, true, 'Request Count per Minute', 'tomcat', 'none', 0, 16);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (168, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 17);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (169, 'jspCount', 'UTILIZATION', '2', 600000, false, false, 'JSP Count', 'tomcat', 'none', 0, 17);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (170, 'jspCount1m', 'UTILIZATION', '0', 600000, true, true, 'JSP Count per Minute', 'tomcat', 'none', 0, 17);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (171, 'jspReloadCount', 'UTILIZATION', '2', 600000, false, false, 'JSP Reload Count', 'tomcat', 'none', 0, 17);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (172, 'jspReloadCount1m', 'UTILIZATION', '0', 600000, true, true, 'JSP Reload Count per Minute', 'tomcat', 'none', 0, 17);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (173, 'numActive', 'UTILIZATION', '0', 300000, true, true, 'Active DataSource Connections', 'tomcat', 'none', 0, 18);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (174, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 18);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (175, 'numIdle', 'UTILIZATION', '0', 300000, true, true, 'Idle DataSource Connections', 'tomcat', 'none', 0, 18);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (176, 'Availability', 'AVAILABILITY', '0', 300000, true, true, 'Availability', 'apache', 'percentage', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (177, 'BusyServers', 'UTILIZATION', '0', 300000, false, false, 'Busy Servers', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (178, 'BusyWorkers', 'UTILIZATION', '0', 300000, false, false, 'Busy Workers', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (179, 'TotalkBytes', 'THROUGHPUT', '2', 600000, false, false, 'Bytes Served', 'apache', 'KB', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (180, 'TotalkBytes1m', 'THROUGHPUT', '0', 600000, true, true, 'Bytes Served per Minute', 'apache', 'KB', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (181, 'BytesPerReq', 'THROUGHPUT', '0', 300000, false, false, 'Bytes Served per Request', 'apache', 'B', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (182, 'BytesPerSec', 'THROUGHPUT', '0', 300000, false, false, 'Bytes Served per Second', 'apache', 'B', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (183, 'Closing', 'UTILIZATION', '0', 300000, false, false, 'Closing', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (184, 'CPULoad', 'UTILIZATION', '0', 300000, false, false, 'CPU Load', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (185, 'DNS', 'UTILIZATION', '0', 300000, false, false, 'DNS', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (186, 'Finishing', 'UTILIZATION', '0', 300000, false, false, 'Finishing', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (187, 'Free', 'UTILIZATION', '0', 300000, false, false, 'Free', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (188, 'IdleServers', 'UTILIZATION', '0', 300000, false, false, 'Idle Servers', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (189, 'IdleWorkers', 'UTILIZATION', '0', 300000, false, false, 'Idle Workers', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (190, 'Keepalive', 'UTILIZATION', '0', 300000, false, false, 'Keepalive', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (191, 'Logging', 'UTILIZATION', '0', 300000, false, false, 'Logging', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (192, 'Reading', 'UTILIZATION', '0', 300000, false, false, 'Reading', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (193, 'TotalAccesses', 'THROUGHPUT', '2', 600000, false, false, 'Requests Served', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (194, 'TotalAccesses1m', 'THROUGHPUT', '0', 600000, true, true, 'Requests Served per Minute', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (195, 'ReqPerSec', 'THROUGHPUT', '0', 300000, true, true, 'Requests Served per Second', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (196, 'Sending', 'UTILIZATION', '0', 300000, false, false, 'Sending', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (197, 'Starting', 'UTILIZATION', '0', 300000, false, false, 'Starting', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (198, 'Waiting', 'UTILIZATION', '0', 300000, false, false, 'Waiting', 'apache', 'none', 0, 19);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (199, 'Availability', 'AVAILABILITY', '0', 300000, true, true, 'Availability', 'tomcat', 'percentage', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (200, 'CurrentThreadCpuTime', 'UTILIZATION', '2', 600000, false, false, 'Current Thread Cpu Time', 'tomcat', 'ms', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (201, 'CurrentThreadCpuTime1m', 'UTILIZATION', '0', 600000, false, false, 'Current Thread Cpu Time per Minute', 'tomcat', 'ms', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (202, 'CurrentThreadUserTime', 'UTILIZATION', '2', 600000, false, false, 'Current Thread User Time', 'tomcat', 'ms', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (203, 'CurrentThreadUserTime1m', 'UTILIZATION', '0', 600000, false, false, 'Current Thread User Time per Minute', 'tomcat', 'ms', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (204, 'DaemonThreadCount', 'UTILIZATION', '0', 300000, false, false, 'Daemon Thread Count', 'tomcat', 'none', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (205, 'FreePhysicalMemorySize', 'UTILIZATION', '0', 300000, false, false, 'Free Physical Memory Size', 'tomcat', 'B', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (206, 'FreeSwapSpaceSize', 'UTILIZATION', '0', 300000, false, false, 'Free Swap Space Size', 'tomcat', 'B', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (207, 'HeapMemoryCommitted', 'UTILIZATION', '0', 300000, false, false, 'Heap Memory Committed', 'tomcat', 'B', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (208, 'HeapMemoryFree', 'UTILIZATION', '0', 300000, true, true, 'Heap Memory Free', 'tomcat', 'B', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (209, 'HeapMemoryMax', 'UTILIZATION', '1', 1800000, false, false, 'Heap Memory Max', 'tomcat', 'B', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (210, 'HeapMemoryUsed', 'UTILIZATION', '0', 300000, false, false, 'Heap Memory Used', 'tomcat', 'B', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (211, 'OpenFileDescriptorCount', 'UTILIZATION', '0', 300000, false, false, 'Open File Descriptor Count', 'tomcat', 'none', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (212, 'PeakThreadCount', 'UTILIZATION', '1', 1800000, false, false, 'Peak Thread Count', 'tomcat', 'none', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (213, 'ProcessCpuTime', 'UTILIZATION', '2', 600000, false, false, 'Process Cpu Time', 'tomcat', 'ns', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (214, 'ProcessCpuTime1m', 'UTILIZATION', '0', 600000, true, true, 'Process Cpu Time per Minute', 'tomcat', 'ns', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (215, 'ThreadCount', 'UTILIZATION', '2', 600000, false, false, 'Thread Count', 'tomcat', 'none', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (216, 'ThreadCount1m', 'UTILIZATION', '0', 600000, false, false, 'Thread Count per Minute', 'tomcat', 'none', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (217, 'Uptime', 'UTILIZATION', '1', 1800000, true, true, 'UpTime', 'tomcat', 'ms', 0, 20);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (218, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (219, 'classLoadTime', 'UTILIZATION', '0', 300000, false, false, 'Class Load Time', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (220, 'errorCount', 'UTILIZATION', '2', 600000, false, false, 'Error Count', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (221, 'errorCount1m', 'UTILIZATION', '0', 600000, true, true, 'Error Count per Minute', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (222, 'loadTime', 'UTILIZATION', '0', 300000, false, false, 'Load Time', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (223, 'processingTime', 'UTILIZATION', '2', 600000, false, false, 'Processing Time', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (224, 'processingTime1m', 'UTILIZATION', '0', 600000, false, false, 'Processing Time per Minute', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (225, 'requestCount', 'UTILIZATION', '2', 600000, false, false, 'Request Count', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (226, 'requestCount1m', 'UTILIZATION', '0', 600000, true, true, 'Request Count per Minute', 'tomcat', 'none', 0, 21);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (227, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 22);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (228, 'currentThreadsBusy', 'UTILIZATION', '0', 300000, true, true, 'Current Thread Busy', 'tomcat', 'none', 0, 22);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (229, 'currentThreadCount', 'UTILIZATION', '0', 300000, true, true, 'Current Thread Count', 'tomcat', 'none', 0, 22);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (230, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (231, 'bytesReceived', 'UTILIZATION', '2', 600000, false, false, 'Bytes Received', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (232, 'bytesReceived1m', 'UTILIZATION', '0', 600000, false, false, 'Bytes Received per Minute', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (233, 'bytesSent', 'UTILIZATION', '2', 600000, false, false, 'Bytes Sent', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (234, 'bytesSent1m', 'UTILIZATION', '0', 600000, false, false, 'Bytes Sent per Minute', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (235, 'errorCount', 'UTILIZATION', '2', 600000, false, false, 'Error Count', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (236, 'errorCount1m', 'UTILIZATION', '0', 600000, true, true, 'Error Count per Minute', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (237, 'processingTime', 'UTILIZATION', '2', 600000, false, false, 'Processing Time', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (238, 'processingTime1m', 'UTILIZATION', '0', 600000, true, true, 'Processing Time per Minute', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (239, 'requestCount', 'UTILIZATION', '2', 600000, false, false, 'Request Count', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (240, 'requestCount1m', 'UTILIZATION', '0', 600000, true, true, 'Request Count per Minute', 'tomcat', 'none', 0, 23);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (241, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 24);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (242, 'processingTime', 'UTILIZATION', '0', 300000, true, true, 'Processing Time', 'tomcat', 'sec', 0, 24);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (243, 'Availability', 'AVAILABILITY', '0', 600000, true, true, 'Availability', 'tomcat', 'percentage', 0, 25);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (244, 'jspCount', 'UTILIZATION', '2', 600000, false, false, 'JSP Count', 'tomcat', 'none', 0, 25);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (245, 'jspCount1m', 'UTILIZATION', '0', 600000, true, true, 'JSP Count per Minute', 'tomcat', 'none', 0, 25);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (246, 'jspReloadCount', 'UTILIZATION', '2', 600000, false, false, 'JSP Reload Count', 'tomcat', 'none', 0, 25);
INSERT INTO metric_template (id, alias, category, collection_type, default_interval, default_on, indicator, name, plugin, units, version, resource_prototype) VALUES (247, 'jspReloadCount1m', 'UTILIZATION', '0', 600000, true, true, 'JSP Reload Count per Minute', 'tomcat', 'none', 0, 25);


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (1, NULL, 'ESX1.seforge.org', NULL, 1, 0, 1);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (2, 10002, 'pku-4389c865c26-166', 10917, 2, 0, 2);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (3, 10006, '192.168.4.166 Net Services', 10918, 3, 0, 3);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (4, 10007, 'pku-4389c865c26 Win32 ProcessServer', 10919, 3, 0, 4);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (5, 10008, 'pku-4389c865c26 Win32 CPU 1 (2933Mhz Intel Xeon)', 10923, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (6, 10008, 'pku-4389c865c26 Win32 NetworkServer', 10920, 3, 0, 6);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (7, 10009, 'pku-4389c865c26 Win32 Network Interface eth0 (ethernet)', 10924, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (8, 10010, 'pku-4389c865c26 Win32 Network Interface lo0 (loopback)', 10925, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (9, 10009, 'pku-4389c865c26 Win32 WindowsServer', 10921, 3, 0, 8);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (10, 10010, 'pku-4389c865c26 Win32 FileServer', 10922, 3, 0, 9);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (11, 10011, 'pku-4389c865c26 Win32 File System C:\ (local/NTFS)', 10926, 4, 0, 10);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (12, 10021, 'Apache Tomcat/6.0.20', 10952, 5, 0, 11);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (13, 10025, 'Apache Tomcat/6.0.20 testdesignservlet none none //localhost/tm Servlet Monitor', 10953, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (14, 10026, 'Apache Tomcat/6.0.20 jsp none none //localhost/edu.pku.taas.web Servlet Monitor', 10954, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (15, 10027, 'Apache Tomcat/6.0.20 assetreportservlet none none //localhost/tm Servlet Monitor', 10955, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (16, 10028, 'Apache Tomcat/6.0.20 defectfilterservlet none none //localhost/tm Servlet Monitor', 10956, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (17, 10029, 'Apache Tomcat/6.0.20 default none none //localhost/gwtuml Servlet Monitor', 10957, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (18, 10030, 'Apache Tomcat/6.0.20 default none none //localhost/BPTestor Servlet Monitor', 10958, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (19, 10031, 'Apache Tomcat/6.0.20 default none none //localhost/CASCNewProject Servlet Monitor', 10959, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (20, 10032, 'Apache Tomcat/6.0.20 loginservlet none none //localhost/tm Servlet Monitor', 10960, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (21, 10033, 'Apache Tomcat/6.0.20 TCgenerate none none //localhost/BETWebsite Servlet Monitor', 10961, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (22, 10034, 'Apache Tomcat/6.0.20 action none none //localhost/tm Servlet Monitor', 10962, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (23, 10035, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/axis Servlet Monitor', 10963, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (24, 10036, 'Apache Tomcat/6.0.20 jsp none none //localhost/axis Servlet Monitor', 10964, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (25, 10037, 'Apache Tomcat/6.0.20 jsp none none //localhost/BPTestor Servlet Monitor', 10965, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (26, 10038, 'Apache Tomcat/6.0.20 jsp none none //localhost/BugDetectorUIWeb Servlet Monitor', 10966, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (27, 10039, 'Apache Tomcat/6.0.20 GenerateDNF_IDNF none none //localhost/BETWebsite Servlet Monitor', 10967, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (28, 10040, 'Apache Tomcat/6.0.20 AdminServlet none none //localhost/axis Servlet Monitor', 10968, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (29, 10041, 'Apache Tomcat/6.0.20 appservmngservlet none none //localhost/tm Servlet Monitor', 10969, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (30, 10042, 'Apache Tomcat/6.0.20 MessageBrokerServlet none none //localhost/edu.pku.taas.web Servlet Monitor', 10970, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (31, 10043, 'Apache Tomcat/6.0.20 action none none //localhost/BugDetectorUIWeb Servlet Monitor', 10971, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (32, 10044, 'Apache Tomcat/6.0.20 assetreportdefineservlet none none //localhost/tm Servlet Monitor', 10972, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (33, 10045, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/edu.pku.taas.web Servlet Monitor', 10973, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (34, 10046, 'Apache Tomcat/6.0.20 default none none //localhost/axis Servlet Monitor', 10974, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (35, 10047, 'Apache Tomcat/6.0.20 default none none //localhost/BETWebsite Servlet Monitor', 10975, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (36, 10048, 'Apache Tomcat/6.0.20 reportoperateservlet none none //localhost/tm Servlet Monitor', 10976, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (37, 10049, 'Apache Tomcat/6.0.20 usermngservlet none none //localhost/tm Servlet Monitor', 10977, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (38, 10050, 'Apache Tomcat/6.0.20 JspRedirector none none //localhost/tm Servlet Monitor', 10978, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (39, 10051, 'Apache Tomcat/6.0.20 default none none //localhost/edu.pku.taas.web Servlet Monitor', 10979, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (40, 10052, 'Apache Tomcat/6.0.20 default none none //localhost/blazeds Servlet Monitor', 10980, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (41, 10053, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BugDetectorUIWeb Servlet Monitor', 10981, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (42, 10054, 'Apache Tomcat/6.0.20 auEngine none none //localhost/BPTestor Servlet Monitor', 10982, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (43, 10055, 'Apache Tomcat/6.0.20 jsp none none //localhost/BETWebsite Servlet Monitor', 10983, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (44, 10056, 'Apache Tomcat/6.0.20 configServlet none none //localhost/tm Servlet Monitor', 10984, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (45, 10057, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/blazeds Servlet Monitor', 10985, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (46, 10058, 'Apache Tomcat/6.0.20 MessageBrokerServlet none none //localhost/BPWeb Servlet Monitor', 10986, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (47, 10059, 'Apache Tomcat/6.0.20 GenerateDNF4Ext none none //localhost/BETWebsite Servlet Monitor', 10987, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (48, 10060, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/dynamicanalysis Servlet Monitor', 10988, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (49, 10061, 'Apache Tomcat/6.0.20 testcasefilterservlet none none //localhost/tm Servlet Monitor', 10989, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (50, 10062, 'Apache Tomcat/6.0.20 testrunservlet none none //localhost/tm Servlet Monitor', 10990, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (51, 10063, 'Apache Tomcat/6.0.20 SOAPMonitorService none none //localhost/axis Servlet Monitor', 10991, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (52, 10064, 'Apache Tomcat/6.0.20 TxtGenerator none none //localhost/BETWebsite Servlet Monitor', 10992, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (53, 10065, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/tm Servlet Monitor', 10993, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (54, 10066, 'Apache Tomcat/6.0.20 default none none //localhost/BugDetectorUIWeb Servlet Monitor', 10994, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (55, 10067, 'Apache Tomcat/6.0.20 statisticanalyseservlet none none //localhost/tm Servlet Monitor', 10995, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (56, 10068, 'Apache Tomcat/6.0.20 RDSDispatchServlet none none //localhost/edu.pku.taas.web Servlet Monitor', 10996, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (57, 10069, 'Apache Tomcat/6.0.20 treeservlet none none //localhost/tm Servlet Monitor', 10997, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (58, 10070, 'Apache Tomcat/6.0.20 fileUpload none none //localhost/BPWeb Servlet Monitor', 10998, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (59, 10071, 'Apache Tomcat/6.0.20 AdminServlet none none //localhost/dynamicanalysis Servlet Monitor', 10999, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (60, 10072, 'Apache Tomcat/6.0.20 PublishServlet none none //localhost/edu.pku.taas.web Servlet Monitor', 11000, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (61, 10073, 'Apache Tomcat/6.0.20 XFireServlet none none //localhost/HospitalWebServices Servlet Monitor', 11001, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (62, 10074, 'Apache Tomcat/6.0.20 dbservmngservlet none none //localhost/tm Servlet Monitor', 11002, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (63, 10075, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/gwtuml Servlet Monitor', 11003, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (64, 10076, 'Apache Tomcat/6.0.20 resultservlet none none //localhost/tm Servlet Monitor', 11004, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (65, 10077, 'Apache Tomcat/6.0.20 action none none //localhost/edu.pku.taas.web Servlet Monitor', 11005, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (66, 10078, 'Apache Tomcat/6.0.20 zkLoader none none //localhost/BPTestor Servlet Monitor', 11006, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (67, 10079, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BETWebsite Servlet Monitor', 11007, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (68, 10080, 'Apache Tomcat/6.0.20 reportdisplayservlet none none //localhost/tm Servlet Monitor', 11008, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (69, 10081, 'Apache Tomcat/6.0.20 jsp none none //localhost/dynamicanalysis Servlet Monitor', 11009, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (70, 10082, 'Apache Tomcat/6.0.20 statisticanalyseprojectservlet none none //localhost/tm Servlet Monitor', 11010, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (71, 10083, 'Apache Tomcat/6.0.20 jsp none none //localhost/HospitalWebServices Servlet Monitor', 11011, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (72, 10084, 'Apache Tomcat/6.0.20 ListServiceServlet none none //localhost/edu.pku.taas.web Servlet Monitor', 11012, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (73, 10085, 'Apache Tomcat/6.0.20 jsp none none //localhost/tm Servlet Monitor', 11013, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (74, 10086, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/CASCNewProject Servlet Monitor', 11014, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (75, 10087, 'Apache Tomcat/6.0.20 GoalDrivenServlet none none //localhost/CASCNewProject Servlet Monitor', 11015, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (76, 10088, 'Apache Tomcat/6.0.20 default none none //localhost/HospitalWebServices Servlet Monitor', 11016, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (77, 10089, 'Apache Tomcat/6.0.20 DisplayChart none none //localhost/tm Servlet Monitor', 11017, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (78, 10090, 'Apache Tomcat/6.0.20 GenerateMutants4Ext none none //localhost/BETWebsite Servlet Monitor', 11018, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (79, 10091, 'Apache Tomcat/6.0.20 MessageBrokerServlet none none //localhost/blazeds Servlet Monitor', 11019, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (80, 10092, 'Apache Tomcat/6.0.20 jsp none none //localhost/CASCNewProject Servlet Monitor', 11020, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (81, 10093, 'Apache Tomcat/6.0.20 taskservlet none none //localhost/tm Servlet Monitor', 11021, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (82, 10094, 'Apache Tomcat/6.0.20 jsp none none //localhost/BPWeb Servlet Monitor', 11022, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (83, 10095, 'Apache Tomcat/6.0.20 default none none //localhost/tm Servlet Monitor', 11023, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (84, 10096, 'Apache Tomcat/6.0.20 context none none //localhost/BugDetectorUIWeb Servlet Monitor', 11024, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (85, 10097, 'Apache Tomcat/6.0.20 UploadSourceServlet none none //localhost/edu.pku.taas.web Servlet Monitor', 11025, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (86, 10098, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/HospitalWebServices Servlet Monitor', 11026, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (87, 10099, 'Apache Tomcat/6.0.20 ServletRedirector none none //localhost/tm Servlet Monitor', 11027, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (88, 10100, 'Apache Tomcat/6.0.20 popmenuservlet none none //localhost/tm Servlet Monitor', 11028, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (89, 10101, 'Apache Tomcat/6.0.20 prjmngservlet none none //localhost/tm Servlet Monitor', 11029, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (90, 10102, 'Apache Tomcat/6.0.20 menuservlet none none //localhost/tm Servlet Monitor', 11030, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (91, 10103, 'Apache Tomcat/6.0.20 testscenariofilterservlet none none //localhost/tm Servlet Monitor', 11031, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (92, 10104, 'Apache Tomcat/6.0.20 default none none //localhost/dynamicanalysis Servlet Monitor', 11032, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (93, 10105, 'Apache Tomcat/6.0.20 rolemngservlet none none //localhost/tm Servlet Monitor', 11033, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (94, 10106, 'Apache Tomcat/6.0.20 jsp none none //localhost/gwtuml Servlet Monitor', 11034, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (95, 10107, 'Apache Tomcat/6.0.20 Mgenerate none none //localhost/BETWebsite Servlet Monitor', 11035, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (96, 10108, 'Apache Tomcat/6.0.20 statistictreeservlet none none //localhost/tm Servlet Monitor', 11036, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (97, 10109, 'Apache Tomcat/6.0.20 reportservlet none none //localhost/tm Servlet Monitor', 11037, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (98, 10110, 'Apache Tomcat/6.0.20 jsp none none //localhost/blazeds Servlet Monitor', 11038, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (99, 10111, 'Apache Tomcat/6.0.20 GenerateTC4Ext none none //localhost/BETWebsite Servlet Monitor', 11039, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (100, 10112, 'Apache Tomcat/6.0.20 assettreeservlet none none //localhost/tm Servlet Monitor', 11040, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (101, 10113, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/dynamicanalysis Servlet Monitor', 11041, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (102, 10114, 'Apache Tomcat/6.0.20 default none none //localhost/BPWeb Servlet Monitor', 11042, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (103, 10115, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BPWeb Servlet Monitor', 11043, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (104, 10116, 'Apache Tomcat/6.0.20 assetopenreportservlet none none //localhost/tm Servlet Monitor', 11044, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (105, 10117, 'Apache Tomcat/6.0.20 defectservlet none none //localhost/tm Servlet Monitor', 11045, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (106, 10118, 'Apache Tomcat/6.0.20 assetviewreportservlet none none //localhost/tm Servlet Monitor', 11046, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (107, 10119, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BPTestor Servlet Monitor', 11047, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (108, 10120, 'Apache Tomcat/6.0.20 pdfviewservlet none none //localhost/tm Servlet Monitor', 11048, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (109, 10121, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/axis Servlet Monitor', 11049, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (110, 10122, 'Apache Tomcat/6.0.20 http-8088 Thread Pools', 11050, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (111, 10123, 'Apache Tomcat/6.0.20 jk-8009 Thread Pools', 11051, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (112, 10124, 'Apache Tomcat/6.0.20 //localhost/HospitalWebServices none none Web Module Stats', 11052, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (113, 10125, 'Apache Tomcat/6.0.20 //localhost/dynamicanalysis none none Web Module Stats', 11053, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (114, 10126, 'Apache Tomcat/6.0.20 //localhost/BPWeb none none Web Module Stats', 11054, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (115, 10127, 'Apache Tomcat/6.0.20 //localhost/gwtuml none none Web Module Stats', 11055, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (116, 10128, 'Apache Tomcat/6.0.20 //localhost/BETWebsite none none Web Module Stats', 11056, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (117, 10129, 'Apache Tomcat/6.0.20 //localhost/tm none none Web Module Stats', 11057, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (118, 10130, 'Apache Tomcat/6.0.20 //localhost/BPTestor none none Web Module Stats', 11058, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (119, 10131, 'Apache Tomcat/6.0.20 //localhost/axis none none Web Module Stats', 11059, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (120, 10132, 'Apache Tomcat/6.0.20 //localhost/edu.pku.taas.web none none Web Module Stats', 11060, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (121, 10133, 'Apache Tomcat/6.0.20 //localhost/blazeds none none Web Module Stats', 11061, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (122, 10134, 'Apache Tomcat/6.0.20 //localhost/CASCNewProject none none Web Module Stats', 11062, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (123, 10135, 'Apache Tomcat/6.0.20 //localhost/BugDetectorUIWeb none none Web Module Stats', 11063, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (124, 10136, 'Apache Tomcat/6.0.20 localhost /BPWeb Cache', 11064, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (125, 10137, 'Apache Tomcat/6.0.20 localhost /BugDetectorUIWeb Cache', 11065, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (126, 10138, 'Apache Tomcat/6.0.20 localhost /edu.pku.taas.web Cache', 11066, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (127, 10139, 'Apache Tomcat/6.0.20 localhost /BETWebsite Cache', 11067, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (128, 10140, 'Apache Tomcat/6.0.20 localhost /blazeds Cache', 11068, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (129, 10141, 'Apache Tomcat/6.0.20 localhost /CASCNewProject Cache', 11069, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (130, 10142, 'Apache Tomcat/6.0.20 localhost /gwtuml Cache', 11070, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (131, 10143, 'Apache Tomcat/6.0.20 localhost /tm Cache', 11071, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (132, 10144, 'Apache Tomcat/6.0.20 localhost /axis Cache', 11072, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (133, 10145, 'Apache Tomcat/6.0.20 localhost /dynamicanalysis Cache', 11073, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (134, 10146, 'Apache Tomcat/6.0.20 localhost /HospitalWebServices Cache', 11074, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (135, 10147, 'Apache Tomcat/6.0.20 localhost /BPTestor Cache', 11075, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (136, 10148, 'Apache Tomcat/6.0.20 jk-8009 Global Request Processor', 11076, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (137, 10149, 'Apache Tomcat/6.0.20 http-8088 Global Request Processor', 11077, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (138, 10150, 'Apache Tomcat/6.0.20 none none //localhost/BETWebsite JSP Monitor', 11078, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (139, 10151, 'Apache Tomcat/6.0.20 none none //localhost/dynamicanalysis JSP Monitor', 11079, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (140, 10152, 'Apache Tomcat/6.0.20 none none //localhost/CASCNewProject JSP Monitor', 11080, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (141, 10153, 'Apache Tomcat/6.0.20 none none //localhost/edu.pku.taas.web JSP Monitor', 11081, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (142, 10154, 'Apache Tomcat/6.0.20 none none //localhost/axis JSP Monitor', 11082, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (143, 10155, 'Apache Tomcat/6.0.20 none none //localhost/gwtuml JSP Monitor', 11083, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (144, 10156, 'Apache Tomcat/6.0.20 none none //localhost/BugDetectorUIWeb JSP Monitor', 11084, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (145, 10157, 'Apache Tomcat/6.0.20 none none //localhost/BPWeb JSP Monitor', 11085, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (146, 10158, 'Apache Tomcat/6.0.20 none none //localhost/tm JSP Monitor', 11086, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (147, 10159, 'Apache Tomcat/6.0.20 none none //localhost/blazeds JSP Monitor', 11087, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (148, 10160, 'Apache Tomcat/6.0.20 none none //localhost/BPTestor JSP Monitor', 11088, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (149, 10161, 'Apache Tomcat/6.0.20 none none //localhost/HospitalWebServices JSP Monitor', 11089, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (150, 10003, 'pku-c2b28575897-165', 10927, 2, 0, 2);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (151, 10011, 'pku-c2b28575897 Win32 WindowsServer', 10928, 3, 0, 8);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (152, 10012, 'pku-c2b28575897 Win32 FileServer', 10929, 3, 0, 9);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (153, 10012, 'pku-c2b28575897 Win32 File System C:\ (local/NTFS)', 10933, 4, 0, 10);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (154, 10013, '192.168.4.165 Net Services', 10930, 3, 0, 3);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (155, 10014, 'pku-c2b28575897 Win32 NetworkServer', 10931, 3, 0, 6);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (156, 10014, 'pku-c2b28575897 Win32 Network Interface eth0 (ethernet)', 10935, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (157, 10015, 'pku-c2b28575897 Win32 Network Interface lo0 (loopback)', 10936, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (158, 10015, 'pku-c2b28575897 Win32 ProcessServer', 10932, 3, 0, 4);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (159, 10013, 'pku-c2b28575897 Win32 CPU 1 (2933Mhz Intel Xeon)', 10934, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (160, 10023, 'Apache Tomcat/6.0.16 8999', 11402, 5, 0, 11);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (161, 10473, 'Apache Tomcat/6.0.16 dispatcher none none //localhost/cccc Servlet Monitor', 11403, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (162, 10474, 'Apache Tomcat/6.0.16 default none none //localhost/Hammurapi Servlet Monitor', 11404, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (163, 10475, 'Apache Tomcat/6.0.16 JMXWebappMetricServlet none none //localhost/Splint Servlet Monitor', 11405, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (164, 10476, 'Apache Tomcat/6.0.16 jsp none none //localhost/cccc Servlet Monitor', 11406, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (165, 10477, 'Apache Tomcat/6.0.16 JMXWebappMetricServlet none none //localhost/cccc Servlet Monitor', 11407, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (166, 10478, 'Apache Tomcat/6.0.16 xfire none none //localhost/cccc Servlet Monitor', 11408, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (167, 10479, 'Apache Tomcat/6.0.16 dwr-invoker none none //localhost/Hammurapi Servlet Monitor', 11409, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (168, 10480, 'Apache Tomcat/6.0.16 jsp none none //localhost/newhammurapiweb Servlet Monitor', 11410, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (169, 10481, 'Apache Tomcat/6.0.16 jsp none none //localhost/Splint Servlet Monitor', 11411, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (170, 10482, 'Apache Tomcat/6.0.16 dwr-invoker none none //localhost/cccc Servlet Monitor', 11412, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (171, 10483, 'Apache Tomcat/6.0.16 default none none //localhost/Splint Servlet Monitor', 11413, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (172, 10484, 'Apache Tomcat/6.0.16 JMXWebappMetricServlet none none //localhost/newhammurapiweb Servlet Monitor', 11414, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (173, 10485, 'Apache Tomcat/6.0.16 xfire none none //localhost/Hammurapi Servlet Monitor', 11415, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (174, 10486, 'Apache Tomcat/6.0.16 dispatcher none none //localhost/Hammurapi Servlet Monitor', 11416, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (175, 10487, 'Apache Tomcat/6.0.16 jsp none none //localhost/Hammurapi Servlet Monitor', 11417, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (176, 10488, 'Apache Tomcat/6.0.16 default none none //localhost/newhammurapiweb Servlet Monitor', 11418, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (177, 10489, 'Apache Tomcat/6.0.16 default none none //localhost/cccc Servlet Monitor', 11419, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (178, 10490, 'Apache Tomcat/6.0.16 JMXWebappMetricServlet none none //localhost/Hammurapi Servlet Monitor', 11420, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (179, 10491, 'Apache Tomcat/6.0.16 http-8080 Thread Pools', 11421, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (180, 10492, 'Apache Tomcat/6.0.16 jk-8010 Thread Pools', 11422, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (181, 10493, 'Apache Tomcat/6.0.16 //localhost/newhammurapiweb none none Web Module Stats', 11423, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (182, 10494, 'Apache Tomcat/6.0.16 //localhost/hammurapiweb none none Web Module Stats', 11424, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (183, 10495, 'Apache Tomcat/6.0.16 //localhost/Hammurapi none none Web Module Stats', 11425, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (184, 10496, 'Apache Tomcat/6.0.16 //localhost/Splint none none Web Module Stats', 11426, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (185, 10497, 'Apache Tomcat/6.0.16 //localhost/cccc none none Web Module Stats', 11427, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (186, 10498, 'Apache Tomcat/6.0.16 localhost /cccc Cache', 11428, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (187, 10499, 'Apache Tomcat/6.0.16 localhost /Hammurapi Cache', 11429, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (188, 10500, 'Apache Tomcat/6.0.16 localhost /Splint Cache', 11430, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (189, 10501, 'Apache Tomcat/6.0.16 localhost /newhammurapiweb Cache', 11431, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (190, 10502, 'Apache Tomcat/6.0.16 "jdbc/HammurapiDB" localhost javax.sql.DataSource /newhammurapiweb DataSource Pool', 11432, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (191, 10503, 'Apache Tomcat/6.0.16 http-8080 Global Request Processor', 11433, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (192, 10504, 'Apache Tomcat/6.0.16 jk-8010 Global Request Processor', 11434, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (193, 10505, 'Apache Tomcat/6.0.16 none none //localhost/newhammurapiweb JSP Monitor', 11435, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (194, 10506, 'Apache Tomcat/6.0.16 none none //localhost/Hammurapi JSP Monitor', 11436, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (195, 10507, 'Apache Tomcat/6.0.16 none none //localhost/cccc JSP Monitor', 11437, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (196, 10508, 'Apache Tomcat/6.0.16 none none //localhost/Splint JSP Monitor', 11438, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (197, 10509, 'Apache Tomcat/6.0.16 8999 dispatcher none none //localhost/cccc Servlet Monitor', 11440, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (198, 10510, 'Apache Tomcat/6.0.16 8999 default none none //localhost/Hammurapi Servlet Monitor', 11441, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (199, 10511, 'Apache Tomcat/6.0.16 8999 JMXWebappMetricServlet none none //localhost/Splint Servlet Monitor', 11442, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (200, 10512, 'Apache Tomcat/6.0.16 8999 jsp none none //localhost/cccc Servlet Monitor', 11443, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (201, 10513, 'Apache Tomcat/6.0.16 8999 JMXWebappMetricServlet none none //localhost/cccc Servlet Monitor', 11444, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (202, 10514, 'Apache Tomcat/6.0.16 8999 xfire none none //localhost/cccc Servlet Monitor', 11445, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (203, 10515, 'Apache Tomcat/6.0.16 8999 dwr-invoker none none //localhost/Hammurapi Servlet Monitor', 11446, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (204, 10516, 'Apache Tomcat/6.0.16 8999 jsp none none //localhost/newhammurapiweb Servlet Monitor', 11447, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (205, 10517, 'Apache Tomcat/6.0.16 8999 jsp none none //localhost/Splint Servlet Monitor', 11448, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (206, 10518, 'Apache Tomcat/6.0.16 8999 dwr-invoker none none //localhost/cccc Servlet Monitor', 11449, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (207, 10519, 'Apache Tomcat/6.0.16 8999 default none none //localhost/Splint Servlet Monitor', 11450, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (208, 10520, 'Apache Tomcat/6.0.16 8999 JMXWebappMetricServlet none none //localhost/newhammurapiweb Servlet Monitor', 11451, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (209, 10521, 'Apache Tomcat/6.0.16 8999 xfire none none //localhost/Hammurapi Servlet Monitor', 11452, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (210, 10522, 'Apache Tomcat/6.0.16 8999 dispatcher none none //localhost/Hammurapi Servlet Monitor', 11453, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (211, 10523, 'Apache Tomcat/6.0.16 8999 jsp none none //localhost/Hammurapi Servlet Monitor', 11454, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (212, 10524, 'Apache Tomcat/6.0.16 8999 default none none //localhost/newhammurapiweb Servlet Monitor', 11455, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (213, 10525, 'Apache Tomcat/6.0.16 8999 default none none //localhost/cccc Servlet Monitor', 11456, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (214, 10526, 'Apache Tomcat/6.0.16 8999 JMXWebappMetricServlet none none //localhost/Hammurapi Servlet Monitor', 11457, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (215, 10527, 'Apache Tomcat/6.0.16 8999 http-8080 Thread Pools', 11458, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (216, 10528, 'Apache Tomcat/6.0.16 8999 jk-8010 Thread Pools', 11459, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (217, 10529, 'Apache Tomcat/6.0.16 8999 //localhost/newhammurapiweb none none Web Module Stats', 11460, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (218, 10530, 'Apache Tomcat/6.0.16 8999 //localhost/hammurapiweb none none Web Module Stats', 11461, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (219, 10531, 'Apache Tomcat/6.0.16 8999 //localhost/Hammurapi none none Web Module Stats', 11462, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (220, 10532, 'Apache Tomcat/6.0.16 8999 //localhost/Splint none none Web Module Stats', 11463, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (221, 10533, 'Apache Tomcat/6.0.16 8999 //localhost/cccc none none Web Module Stats', 11464, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (222, 10534, 'Apache Tomcat/6.0.16 8999 localhost /cccc Cache', 11465, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (223, 10535, 'Apache Tomcat/6.0.16 8999 localhost /Hammurapi Cache', 11466, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (224, 10536, 'Apache Tomcat/6.0.16 8999 localhost /Splint Cache', 11467, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (225, 10537, 'Apache Tomcat/6.0.16 8999 localhost /newhammurapiweb Cache', 11468, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (226, 10538, 'Apache Tomcat/6.0.16 8999 "jdbc/HammurapiDB" localhost javax.sql.DataSource /newhammurapiweb DataSource Pool', 11469, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (227, 10539, 'Apache Tomcat/6.0.16 8999 http-8080 Global Request Processor', 11470, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (228, 10540, 'Apache Tomcat/6.0.16 8999 jk-8010 Global Request Processor', 11471, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (229, 10541, 'Apache Tomcat/6.0.16 8999 none none //localhost/newhammurapiweb JSP Monitor', 11472, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (230, 10542, 'Apache Tomcat/6.0.16 8999 none none //localhost/Hammurapi JSP Monitor', 11473, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (231, 10543, 'Apache Tomcat/6.0.16 8999 none none //localhost/cccc JSP Monitor', 11474, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (232, 10544, 'Apache Tomcat/6.0.16 8999 none none //localhost/Splint JSP Monitor', 11475, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (233, 10024, 'Apache Tomcat/6.0.16 8990', 11439, 5, 0, 11);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (234, 10545, 'Apache Tomcat/6.0.16 8990 polliwogDefault none none //localhost/polliwog Servlet Monitor', 11476, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (235, 10546, 'Apache Tomcat/6.0.16 8990 servletToJsp none none //localhost/RRFinder Servlet Monitor', 11477, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (236, 10547, 'Apache Tomcat/6.0.16 8990 JMXWebappMetricServlet none none //localhost/examples Servlet Monitor', 11478, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (237, 10548, 'Apache Tomcat/6.0.16 8990 default none none //localhost/codas2 Servlet Monitor', 11479, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (238, 10549, 'Apache Tomcat/6.0.16 8990 jsp none none //localhost/polliwog Servlet Monitor', 11480, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (239, 10550, 'Apache Tomcat/6.0.16 8990 xfire none none //localhost/codas2 Servlet Monitor', 11481, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (240, 10551, 'Apache Tomcat/6.0.16 8990 dwr-invoker none none //localhost/codas2 Servlet Monitor', 11482, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (241, 10552, 'Apache Tomcat/6.0.16 8990 ViewLog none none //localhost/polliwog Servlet Monitor', 11483, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (242, 10553, 'Apache Tomcat/6.0.16 8990 RequestHeaderExample none none //localhost/RRFinder Servlet Monitor', 11484, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (243, 10554, 'Apache Tomcat/6.0.16 8990 default none none //localhost/CppCheck Servlet Monitor', 11485, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (244, 10555, 'Apache Tomcat/6.0.16 8990 RequestParamExample none none //localhost/RRFinder Servlet Monitor', 11486, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (245, 10556, 'Apache Tomcat/6.0.16 8990 default none none //localhost/polliwog Servlet Monitor', 11487, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (246, 10557, 'Apache Tomcat/6.0.16 8990 jsp none none //localhost/RRFinder Servlet Monitor', 11488, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (247, 10558, 'Apache Tomcat/6.0.16 8990 HelloWorldExample none none //localhost/examples Servlet Monitor', 11489, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (248, 10559, 'Apache Tomcat/6.0.16 8990 ChatServlet none none //localhost/examples Servlet Monitor', 11490, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (249, 10560, 'Apache Tomcat/6.0.16 8990 RequestInfoExample none none //localhost/examples Servlet Monitor', 11491, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (250, 10561, 'Apache Tomcat/6.0.16 8990 CookieExample none none //localhost/RRFinder Servlet Monitor', 11492, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (251, 10562, 'Apache Tomcat/6.0.16 8990 DeleteConfig none none //localhost/polliwog Servlet Monitor', 11493, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (252, 10563, 'Apache Tomcat/6.0.16 8990 jsp none none //localhost/CppCheck Servlet Monitor', 11494, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (253, 10564, 'Apache Tomcat/6.0.16 8990 HelloWorldExample none none //localhost/RRFinder Servlet Monitor', 11495, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (254, 10565, 'Apache Tomcat/6.0.16 8990 RequestHeaderExample none none //localhost/examples Servlet Monitor', 11496, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (255, 10566, 'Apache Tomcat/6.0.16 8990 JMXWebappMetricServlet none none //localhost/RRFinder Servlet Monitor', 11497, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (256, 10567, 'Apache Tomcat/6.0.16 8990 xfire none none //localhost/CppCheck Servlet Monitor', 11498, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (257, 10568, 'Apache Tomcat/6.0.16 8990 jsp none none //localhost/examples Servlet Monitor', 11499, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (258, 10569, 'Apache Tomcat/6.0.16 8990 SessionExample none none //localhost/examples Servlet Monitor', 11500, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (259, 10570, 'Apache Tomcat/6.0.16 8990 dispatcher none none //localhost/codas2 Servlet Monitor', 11501, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (260, 10571, 'Apache Tomcat/6.0.16 8990 Index none none //localhost/polliwog Servlet Monitor', 11502, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (261, 10572, 'Apache Tomcat/6.0.16 8990 CookieExample none none //localhost/examples Servlet Monitor', 11503, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (262, 10573, 'Apache Tomcat/6.0.16 8990 JMXWebappMetricServlet none none //localhost/ase2012mum Servlet Monitor', 11504, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (263, 10574, 'Apache Tomcat/6.0.16 8990 JMXWebappMetricServlet none none //localhost/codas2 Servlet Monitor', 11505, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (264, 10575, 'Apache Tomcat/6.0.16 8990 CompressionFilterTestServlet none none //localhost/examples Servlet Monitor', 11506, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (265, 10576, 'Apache Tomcat/6.0.16 8990 dwr-invoker none none //localhost/CppCheck Servlet Monitor', 11507, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (266, 10577, 'Apache Tomcat/6.0.16 8990 ChatServlet none none //localhost/RRFinder Servlet Monitor', 11508, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (267, 10578, 'Apache Tomcat/6.0.16 8990 dispatcher none none //localhost/CppCheck Servlet Monitor', 11509, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (268, 10579, 'Apache Tomcat/6.0.16 8990 InitSystem none none //localhost/polliwog Servlet Monitor', 11510, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (269, 10580, 'Apache Tomcat/6.0.16 8990 default none none //localhost/examples Servlet Monitor', 11511, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (270, 10581, 'Apache Tomcat/6.0.16 8990 jsp none none //localhost/codas2 Servlet Monitor', 11512, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (271, 10582, 'Apache Tomcat/6.0.16 8990 servletToJsp none none //localhost/examples Servlet Monitor', 11513, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (272, 10583, 'Apache Tomcat/6.0.16 8990 default none none //localhost/RRFinder Servlet Monitor', 11514, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (273, 10584, 'Apache Tomcat/6.0.16 8990 RequestInfoExample none none //localhost/RRFinder Servlet Monitor', 11515, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (274, 10585, 'Apache Tomcat/6.0.16 8990 jsp none none //localhost/ase2012mum Servlet Monitor', 11516, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (275, 10586, 'Apache Tomcat/6.0.16 8990 JMXWebappMetricServlet none none //localhost/polliwog Servlet Monitor', 11517, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (276, 10587, 'Apache Tomcat/6.0.16 8990 Config none none //localhost/polliwog Servlet Monitor', 11518, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (277, 10588, 'Apache Tomcat/6.0.16 8990 default none none //localhost/ase2012mum Servlet Monitor', 11519, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (278, 10589, 'Apache Tomcat/6.0.16 8990 RequestParamExample none none //localhost/examples Servlet Monitor', 11520, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (279, 10590, 'Apache Tomcat/6.0.16 8990 JMXWebappMetricServlet none none //localhost/CppCheck Servlet Monitor', 11521, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (280, 10591, 'Apache Tomcat/6.0.16 8990 SessionExample none none //localhost/RRFinder Servlet Monitor', 11522, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (281, 10592, 'Apache Tomcat/6.0.16 8990 CompressionFilterTestServlet none none //localhost/RRFinder Servlet Monitor', 11523, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (282, 10593, 'Apache Tomcat/6.0.16 8990 http-8081 Thread Pools', 11524, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (283, 10594, 'Apache Tomcat/6.0.16 8990 jk-8009 Thread Pools', 11525, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (284, 10595, 'Apache Tomcat/6.0.16 8990 //localhost/ase2012mum none none Web Module Stats', 11526, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (285, 10596, 'Apache Tomcat/6.0.16 8990 //localhost/codas2 none none Web Module Stats', 11527, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (286, 10597, 'Apache Tomcat/6.0.16 8990 //localhost/CppCheck none none Web Module Stats', 11528, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (287, 10598, 'Apache Tomcat/6.0.16 8990 //localhost/polliwog none none Web Module Stats', 11529, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (288, 10599, 'Apache Tomcat/6.0.16 8990 //localhost/RRFinder none none Web Module Stats', 11530, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (289, 10600, 'Apache Tomcat/6.0.16 8990 //localhost/examples none none Web Module Stats', 11531, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (290, 10601, 'Apache Tomcat/6.0.16 8990 localhost /examples Cache', 11532, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (291, 10602, 'Apache Tomcat/6.0.16 8990 localhost /ase2012mum Cache', 11533, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (292, 10603, 'Apache Tomcat/6.0.16 8990 localhost /polliwog Cache', 11534, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (293, 10604, 'Apache Tomcat/6.0.16 8990 localhost /CppCheck Cache', 11535, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (294, 10605, 'Apache Tomcat/6.0.16 8990 localhost /codas2 Cache', 11536, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (295, 10606, 'Apache Tomcat/6.0.16 8990 localhost /RRFinder Cache', 11537, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (296, 10607, 'Apache Tomcat/6.0.16 8990 http-8081 Global Request Processor', 11538, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (297, 10608, 'Apache Tomcat/6.0.16 8990 jk-8009 Global Request Processor', 11539, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (298, 10609, 'Apache Tomcat/6.0.16 8990 none none //localhost/polliwog JSP Monitor', 11540, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (299, 10610, 'Apache Tomcat/6.0.16 8990 none none //localhost/RRFinder JSP Monitor', 11541, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (300, 10611, 'Apache Tomcat/6.0.16 8990 none none //localhost/CppCheck JSP Monitor', 11542, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (301, 10612, 'Apache Tomcat/6.0.16 8990 none none //localhost/codas2 JSP Monitor', 11543, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (302, 10613, 'Apache Tomcat/6.0.16 8990 none none //localhost/ase2012mum JSP Monitor', 11544, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (303, 10614, 'Apache Tomcat/6.0.16 8990 none none //localhost/examples JSP Monitor', 11545, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (304, 10001, 'mass-4eb52dd690-168', 10904, 2, 0, 2);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (305, 10001, 'mass-4eb52dd690 Win32 ProcessServer', 10905, 3, 0, 4);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (306, 10001, 'mass-4eb52dd690 Win32 CPU 1 (3694Mhz Intel Xeon)', 10910, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (307, 10002, 'mass-4eb52dd690 Win32 CPU 2 (3694Mhz Intel Xeon)', 10911, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (308, 10003, 'mass-4eb52dd690 Win32 CPU 3 (3694Mhz Intel Xeon)', 10912, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (309, 10004, 'mass-4eb52dd690 Win32 CPU 4 (3694Mhz Intel Xeon)', 10913, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (310, 10002, 'mass-4eb52dd690 Win32 FileServer', 10906, 3, 0, 9);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (311, 10007, 'mass-4eb52dd690 Win32 File System C:\ (local/NTFS)', 10916, 4, 0, 10);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (312, 10003, 'mass-4eb52dd690 Win32 WindowsServer', 10907, 3, 0, 8);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (313, 10004, 'mass-4eb52dd690 Win32 NetworkServer', 10908, 3, 0, 6);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (314, 10005, 'mass-4eb52dd690 Win32 Network Interface eth0 (ethernet)', 10914, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (315, 10006, 'mass-4eb52dd690 Win32 Network Interface lo0 (loopback)', 10915, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (316, 10005, '192.168.4.168 Net Services', 10909, 3, 0, 3);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (317, 10022, 'Apache Tomcat/6.0.20', 11090, 5, 0, 11);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (318, 10162, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.UDDIBrowser/security none none //localhost/uddi-portlets Servlet Monitor', 11091, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (319, 10163, 'Apache Tomcat/6.0.20 UDDIClerkServlet none none //localhost/uddi-portlets Servlet Monitor', 11092, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (320, 10164, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/TWeb Servlet Monitor', 11093, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (321, 10165, 'Apache Tomcat/6.0.20 StuCourseExam none none //localhost/STTP Servlet Monitor', 11094, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (322, 10166, 'Apache Tomcat/6.0.20 default none none //localhost/ Servlet Monitor', 11095, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (323, 10167, 'Apache Tomcat/6.0.20 default none none //localhost/wordtopdf Servlet Monitor', 11096, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (324, 10168, 'Apache Tomcat/6.0.20 default none none //localhost/SaseWeb Servlet Monitor', 11097, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (325, 10169, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.InquiryServiceImpl/org.apache.juddi.portlets.UDDIOntologyBasedSearch/inquiry none none //localhost/uddi-portlets Servlet Monitor', 11098, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (326, 10170, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.NotifyServiceImpl/org.apache.juddi.portlets.UDDIBrowser/notify none none //localhost/uddi-portlets Servlet Monitor', 11099, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (327, 10171, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/SaseWeb Servlet Monitor', 11100, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (328, 10172, 'Apache Tomcat/6.0.20 SimpleUploader none none //localhost/internetware Servlet Monitor', 11101, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (329, 10173, 'Apache Tomcat/6.0.20 AdminServlet none none //localhost/webide.sample Servlet Monitor', 11102, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (330, 10174, 'Apache Tomcat/6.0.20 action none none //localhost/fileFormatConversion Servlet Monitor', 11103, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (331, 10175, 'Apache Tomcat/6.0.20 default none none //localhost/NITS Servlet Monitor', 11104, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (332, 10176, 'Apache Tomcat/6.0.20 BETServlet none none //localhost/bet-en Servlet Monitor', 11105, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (333, 10177, 'Apache Tomcat/6.0.20 TeacherCoursesManage none none //localhost/STTP Servlet Monitor', 11106, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (334, 10178, 'Apache Tomcat/6.0.20 UDDISearchPortlet none none //localhost/uddi-portlets Servlet Monitor', 11107, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (335, 10179, 'Apache Tomcat/6.0.20 jsp none none //localhost/STTP Servlet Monitor', 11108, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (336, 10180, 'Apache Tomcat/6.0.20 GrubberServlet none none //localhost/MashRoom Servlet Monitor', 11109, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (337, 10181, 'Apache Tomcat/6.0.20 AxisAdminServlet none none //localhost/TWeb Servlet Monitor', 11110, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (338, 10182, 'Apache Tomcat/6.0.20 StuKPExam none none //localhost/STTP Servlet Monitor', 11111, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (339, 10183, 'Apache Tomcat/6.0.20 default none none //localhost/webide Servlet Monitor', 11112, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (340, 10184, 'Apache Tomcat/6.0.20 jsp none none //localhost/BETService Servlet Monitor', 11113, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (341, 10185, 'Apache Tomcat/6.0.20 jsp none none //localhost/juddiv3 Servlet Monitor', 11114, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (342, 10186, 'Apache Tomcat/6.0.20 default none none //localhost/gwtuml Servlet Monitor', 11115, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (343, 10187, 'Apache Tomcat/6.0.20 AxisAdminServlet none none //localhost/ConditionTestWSServer Servlet Monitor', 11116, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (344, 10188, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/ConditionTestWSServer Servlet Monitor', 11117, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (345, 10189, 'Apache Tomcat/6.0.20 default none none //localhost/BPTestor Servlet Monitor', 11118, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (346, 10190, 'Apache Tomcat/6.0.20 jsp none none //localhost/TWeb Servlet Monitor', 11119, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (347, 10191, 'Apache Tomcat/6.0.20 AddItemCourseKPs none none //localhost/STTP Servlet Monitor', 11120, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (348, 10192, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.UDDIOntologyBasedPublication/security none none //localhost/uddi-portlets Servlet Monitor', 11121, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (349, 10193, 'Apache Tomcat/6.0.20 default none none //localhost/extjs Servlet Monitor', 11122, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (350, 10194, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/ Servlet Monitor', 11123, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (351, 10195, 'Apache Tomcat/6.0.20 portletApplicationPublisher none none //localhost/pluto Servlet Monitor', 11124, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (352, 10196, 'Apache Tomcat/6.0.20 default none none //localhost/pluto Servlet Monitor', 11125, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (353, 10197, 'Apache Tomcat/6.0.20 jsp none none //localhost/webide Servlet Monitor', 11126, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (354, 10198, 'Apache Tomcat/6.0.20 TCgenerate none none //localhost/BETWebsite Servlet Monitor', 11127, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (355, 10199, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/NITS Servlet Monitor', 11128, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (356, 10200, 'Apache Tomcat/6.0.20 NotifyServlet none none //localhost/juddiv3 Servlet Monitor', 11129, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (357, 10201, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/juddiv3 Servlet Monitor', 11130, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (358, 10202, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/webide.sample Servlet Monitor', 11131, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (359, 10203, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.InquiryServiceImpl/org.apache.juddi.portlets.UDDIOntologyBasedPublication/inquiry none none //localhost/uddi-portlets Servlet Monitor', 11132, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (360, 10204, 'Apache Tomcat/6.0.20 jsp none none //localhost/bet-en Servlet Monitor', 11133, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (361, 10205, 'Apache Tomcat/6.0.20 default none none //localhost/juddiv3 Servlet Monitor', 11134, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (362, 10206, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/CTestor Servlet Monitor', 11135, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (363, 10207, 'Apache Tomcat/6.0.20 DownloadServlet none none //localhost/bet Servlet Monitor', 11136, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (364, 10208, 'Apache Tomcat/6.0.20 ParamServlet none none //localhost/webide.sample Servlet Monitor', 11137, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (365, 10209, 'Apache Tomcat/6.0.20 AddItem none none //localhost/STTP Servlet Monitor', 11138, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (366, 10210, 'Apache Tomcat/6.0.20 default none none //localhost/internetware Servlet Monitor', 11139, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (367, 10211, 'Apache Tomcat/6.0.20 dwr none none //localhost/MashRoom Servlet Monitor', 11140, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (368, 10212, 'Apache Tomcat/6.0.20 jsp none none //localhost/BPTestor Servlet Monitor', 11141, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (369, 10213, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.UDDIOWLSBasedSearch/security none none //localhost/uddi-portlets Servlet Monitor', 11142, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (370, 10214, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.InquiryServiceImpl/org.apache.juddi.portlets.OntologyRegister/inquiry none none //localhost/uddi-portlets Servlet Monitor', 11143, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (371, 10215, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/MashRoom Servlet Monitor', 11144, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (372, 10216, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/extjs Servlet Monitor', 11145, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (373, 10217, 'Apache Tomcat/6.0.20 GenerateDNF_IDNF none none //localhost/BETWebsite Servlet Monitor', 11146, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (374, 10218, 'Apache Tomcat/6.0.20 jsp none none //localhost/bet Servlet Monitor', 11147, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (375, 10219, 'Apache Tomcat/6.0.20 jsp none none //localhost/SaseWeb Servlet Monitor', 11148, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (376, 10220, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/pluto Servlet Monitor', 11149, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (377, 10221, 'Apache Tomcat/6.0.20 jsp none none //localhost/ConditionTestWSClient Servlet Monitor', 11150, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (378, 10222, 'Apache Tomcat/6.0.20 jsp none none //localhost/ConditionTestWSServer Servlet Monitor', 11151, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (379, 10223, 'Apache Tomcat/6.0.20 DownloadServlet none none //localhost/bet-en Servlet Monitor', 11152, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (380, 10224, 'Apache Tomcat/6.0.20 CXFServlet none none //localhost/juddiv3 Servlet Monitor', 11153, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (381, 10225, 'Apache Tomcat/6.0.20 MashupServlet none none //localhost/MashRoom Servlet Monitor', 11154, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (382, 10226, 'Apache Tomcat/6.0.20 default none none //localhost/BETWebsite Servlet Monitor', 11155, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (383, 10227, 'Apache Tomcat/6.0.20 default none none //localhost/STTP Servlet Monitor', 11156, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (384, 10228, 'Apache Tomcat/6.0.20 Register none none //localhost/STTP Servlet Monitor', 11157, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (385, 10229, 'Apache Tomcat/6.0.20 tckDriver none none //localhost/pluto Servlet Monitor', 11158, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (386, 10230, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/TWeb Servlet Monitor', 11159, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (387, 10231, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.PublicationServiceImpl/org.apache.juddi.portlets.UDDISearch/publication none none //localhost/uddi-portlets Servlet Monitor', 11160, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (388, 10232, 'Apache Tomcat/6.0.20 default none none //localhost/TestWar Servlet Monitor', 11161, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (389, 10233, 'Apache Tomcat/6.0.20 UserManage none none //localhost/STTP Servlet Monitor', 11162, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (390, 10234, 'Apache Tomcat/6.0.20 TestServlet none none //localhost/ Servlet Monitor', 11163, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (391, 10235, 'Apache Tomcat/6.0.20 auEngine none none //localhost/BPTestor Servlet Monitor', 11164, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (392, 10236, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.FindServiceImpl/org.apache.juddi.portlets.UDDIBrowser/find none none //localhost/uddi-portlets Servlet Monitor', 11165, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (393, 10237, 'Apache Tomcat/6.0.20 default none none //localhost/fileFormatConversion Servlet Monitor', 11166, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (394, 10238, 'Apache Tomcat/6.0.20 jsp none none //localhost/BETWebsite Servlet Monitor', 11167, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (395, 10239, 'Apache Tomcat/6.0.20 OntologyRegisterPortlet none none //localhost/uddi-portlets Servlet Monitor', 11168, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (396, 10240, 'Apache Tomcat/6.0.20 AxisAdminServlet none none //localhost/ConditionTestWSClient Servlet Monitor', 11169, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (397, 10241, 'Apache Tomcat/6.0.20 jsp none none //localhost/deploy Servlet Monitor', 11170, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (398, 10242, 'Apache Tomcat/6.0.20 MessageBrokerServlet none none //localhost/BPWeb Servlet Monitor', 11171, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (399, 10243, 'Apache Tomcat/6.0.20 jsp none none //localhost/webide.sample Servlet Monitor', 11172, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (400, 10244, 'Apache Tomcat/6.0.20 StuCourseExamInfo none none //localhost/STTP Servlet Monitor', 11173, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (401, 10245, 'Apache Tomcat/6.0.20 GenerateDNF4Ext none none //localhost/BETWebsite Servlet Monitor', 11174, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (402, 10246, 'Apache Tomcat/6.0.20 HtmlServiceServlet none none //localhost/webide Servlet Monitor', 11175, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (403, 10247, 'Apache Tomcat/6.0.20 default none none //localhost/deploy Servlet Monitor', 11176, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (404, 10248, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.PublicationServiceImpl/org.apache.juddi.portlets.UDDIOntologyBasedSearch/publication none none //localhost/uddi-portlets Servlet Monitor', 11177, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (405, 10249, 'Apache Tomcat/6.0.20 RegistryServlet none none //localhost/juddiv3 Servlet Monitor', 11178, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (406, 10250, 'Apache Tomcat/6.0.20 FoxtidyServlet none none //localhost/webide Servlet Monitor', 11179, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (407, 10251, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/MashRoom Servlet Monitor', 11180, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (408, 10252, 'Apache Tomcat/6.0.20 CourseExamResult none none //localhost/STTP Servlet Monitor', 11181, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (409, 10253, 'Apache Tomcat/6.0.20 TxtGenerator none none //localhost/BETWebsite Servlet Monitor', 11182, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (410, 10254, 'Apache Tomcat/6.0.20 TestServlet none none //localhost/sase Servlet Monitor', 11183, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (411, 10255, 'Apache Tomcat/6.0.20 default none none //localhost/bet-en Servlet Monitor', 11184, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (412, 10256, 'Apache Tomcat/6.0.20 dwr-invoker none none //localhost/webide.sample Servlet Monitor', 11185, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (413, 10257, 'Apache Tomcat/6.0.20 fileUpload none none //localhost/BPWeb Servlet Monitor', 11186, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (414, 10258, 'Apache Tomcat/6.0.20 struts none none //localhost/sase Servlet Monitor', 11187, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (415, 10259, 'Apache Tomcat/6.0.20 JUDDIPublisherPortlet none none //localhost/uddi-portlets Servlet Monitor', 11188, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (416, 10260, 'Apache Tomcat/6.0.20 default none none //localhost/MashRoom Servlet Monitor', 11189, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (417, 10261, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BETService Servlet Monitor', 11190, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (418, 10262, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.UDDISearch/security none none //localhost/uddi-portlets Servlet Monitor', 11191, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (419, 10263, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/wordtopdf Servlet Monitor', 11192, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (420, 10264, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/sase Servlet Monitor', 11193, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (421, 10265, 'Apache Tomcat/6.0.20 UDDIOWLSBasedSearchPortlet none none //localhost/uddi-portlets Servlet Monitor', 11194, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (422, 10266, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.PublicationServiceImpl/org.apache.juddi.portlets.OntologyRegister/publication none none //localhost/uddi-portlets Servlet Monitor', 11195, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (423, 10267, 'Apache Tomcat/6.0.20 default none none //localhost/TWeb Servlet Monitor', 11196, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (424, 10268, 'Apache Tomcat/6.0.20 UDDISubscriptionPortlet none none //localhost/uddi-portlets Servlet Monitor', 11197, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (425, 10269, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SubscriptionServiceImpl/org.apache.juddi.portlets.UDDISubscription/subscription none none //localhost/uddi-portlets Servlet Monitor', 11198, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (426, 10270, 'Apache Tomcat/6.0.20 jsp none none //localhost/CTestor Servlet Monitor', 11199, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (427, 10271, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/uddi-portlets Servlet Monitor', 11200, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (428, 10272, 'Apache Tomcat/6.0.20 AboutPortlet none none //localhost/pluto Servlet Monitor', 11201, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (429, 10273, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/gwtuml Servlet Monitor', 11202, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (430, 10274, 'Apache Tomcat/6.0.20 WidgetServlet none none //localhost/webide Servlet Monitor', 11203, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (431, 10275, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/ConditionTestWSClient Servlet Monitor', 11204, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (432, 10276, 'Apache Tomcat/6.0.20 jsp none none //localhost/fileFormatConversion Servlet Monitor', 11205, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (433, 10277, 'Apache Tomcat/6.0.20 jsp none none //localhost/NITS Servlet Monitor', 11206, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (434, 10278, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.JUDDIPublisher/security none none //localhost/uddi-portlets Servlet Monitor', 11207, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (435, 10279, 'Apache Tomcat/6.0.20 action none none //localhost/wordtopdf Servlet Monitor', 11208, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (436, 10280, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/bet-en Servlet Monitor', 11209, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (437, 10281, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.PublicationServiceImpl/org.apache.juddi.portlets.UDDIBrowser/publication none none //localhost/uddi-portlets Servlet Monitor', 11210, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (438, 10282, 'Apache Tomcat/6.0.20 CXFServlet none none //localhost/BETService Servlet Monitor', 11211, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (439, 10283, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.UDDISubscription/security none none //localhost/uddi-portlets Servlet Monitor', 11212, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (440, 10284, 'Apache Tomcat/6.0.20 default none none //localhost/webide.sample Servlet Monitor', 11213, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (441, 10285, 'Apache Tomcat/6.0.20 UDDISubscriptionNotificationPortlet none none //localhost/uddi-portlets Servlet Monitor', 11214, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (442, 10286, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/fileFormatConversion Servlet Monitor', 11215, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (443, 10287, 'Apache Tomcat/6.0.20 plutoPortalDriver none none //localhost/pluto Servlet Monitor', 11216, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (444, 10288, 'Apache Tomcat/6.0.20 zkLoader none none //localhost/BPTestor Servlet Monitor', 11217, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (445, 10289, 'Apache Tomcat/6.0.20 jsp none none //localhost/wordtopdf Servlet Monitor', 11218, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (446, 10290, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/ConditionTestWSServer Servlet Monitor', 11219, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (447, 10291, 'Apache Tomcat/6.0.20 jsp none none //localhost/sase Servlet Monitor', 11220, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (448, 10292, 'Apache Tomcat/6.0.20 UDDIBrowserPortlet none none //localhost/uddi-portlets Servlet Monitor', 11221, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (449, 10293, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BETWebsite Servlet Monitor', 11222, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (450, 10294, 'Apache Tomcat/6.0.20 dwr-invoker none none //localhost/NITS Servlet Monitor', 11223, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (451, 10295, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.PublicationServiceImpl/org.apache.juddi.portlets.UDDIOWLSBasedSearch/publication none none //localhost/uddi-portlets Servlet Monitor', 11224, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (452, 10296, 'Apache Tomcat/6.0.20 WidgetServlet none none //localhost/MashRoom Servlet Monitor', 11225, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (453, 10297, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.NotifyServiceImpl/org.apache.juddi.portlets.UDDISubscriptionNotification/notify none none //localhost/uddi-portlets Servlet Monitor', 11226, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (454, 10298, 'Apache Tomcat/6.0.20 jsp none none //localhost/ Servlet Monitor', 11227, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (455, 10299, 'Apache Tomcat/6.0.20 StuStudyInfo none none //localhost/STTP Servlet Monitor', 11228, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (456, 10300, 'Apache Tomcat/6.0.20 FileUploadServlet none none //localhost/uddi-portlets Servlet Monitor', 11229, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (457, 10301, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/STTP Servlet Monitor', 11230, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (458, 10302, 'Apache Tomcat/6.0.20 jsp none none //localhost/TestWar Servlet Monitor', 11231, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (459, 10303, 'Apache Tomcat/6.0.20 AxisServlet none none //localhost/ConditionTestWSClient Servlet Monitor', 11232, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (460, 10304, 'Apache Tomcat/6.0.20 FileUploaded none none //localhost/TWeb Servlet Monitor', 11233, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (461, 10305, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.InquiryServiceImpl/org.apache.juddi.portlets.UDDISearch/inquiry none none //localhost/uddi-portlets Servlet Monitor', 11234, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (462, 10306, 'Apache Tomcat/6.0.20 Login none none //localhost/STTP Servlet Monitor', 11235, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (463, 10307, 'Apache Tomcat/6.0.20 MessageBrokerServlet none none //localhost/CTestor Servlet Monitor', 11236, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (464, 10308, 'Apache Tomcat/6.0.20 default none none //localhost/ConditionTestWSServer Servlet Monitor', 11237, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (465, 10309, 'Apache Tomcat/6.0.20 GenerateMutants4Ext none none //localhost/BETWebsite Servlet Monitor', 11238, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (466, 10310, 'Apache Tomcat/6.0.20 BETServlet none none //localhost/bet Servlet Monitor', 11239, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (467, 10311, 'Apache Tomcat/6.0.20 jsp none none //localhost/extjs Servlet Monitor', 11240, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (468, 10312, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/webide.sample Servlet Monitor', 11241, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (469, 10313, 'Apache Tomcat/6.0.20 AdminServlet none none //localhost/MashRoom Servlet Monitor', 11242, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (470, 10314, 'Apache Tomcat/6.0.20 struts none none //localhost/ Servlet Monitor', 11243, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (471, 10315, 'Apache Tomcat/6.0.20 jsp none none //localhost/pluto Servlet Monitor', 11244, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (472, 10316, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/bet Servlet Monitor', 11245, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (473, 10317, 'Apache Tomcat/6.0.20 jsp none none //localhost/BPWeb Servlet Monitor', 11246, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (474, 10318, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/TestWar Servlet Monitor', 11247, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (475, 10319, 'Apache Tomcat/6.0.20 default none none //localhost/ConditionTestWSClient Servlet Monitor', 11248, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (476, 10320, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.JUDDIApiServiceImpl/org.apache.juddi.portlets.JUDDIPublisher/juddi-api none none //localhost/uddi-portlets Servlet Monitor', 11249, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (477, 10321, 'Apache Tomcat/6.0.20 jsp none none //localhost/MashRoom Servlet Monitor', 11250, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (478, 10322, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.OntologyRegister/security none none //localhost/uddi-portlets Servlet Monitor', 11251, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (479, 10323, 'Apache Tomcat/6.0.20 jsp none none //localhost/uddi-portlets Servlet Monitor', 11252, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (480, 10324, 'Apache Tomcat/6.0.20 UDDIOntologyBasedSearchPortlet none none //localhost/uddi-portlets Servlet Monitor', 11253, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (481, 10325, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.InquiryServiceImpl/org.apache.juddi.portlets.UDDIOWLSBasedSearch/inquiry none none //localhost/uddi-portlets Servlet Monitor', 11254, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (482, 10326, 'Apache Tomcat/6.0.20 PlutoPageAdmin none none //localhost/pluto Servlet Monitor', 11255, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (483, 10327, 'Apache Tomcat/6.0.20 jsp none none //localhost/internetware Servlet Monitor', 11256, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (484, 10328, 'Apache Tomcat/6.0.20 jsp none none //localhost/gwtuml Servlet Monitor', 11257, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (485, 10329, 'Apache Tomcat/6.0.20 default none none //localhost/sase Servlet Monitor', 11258, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (486, 10330, 'Apache Tomcat/6.0.20 Mgenerate none none //localhost/BETWebsite Servlet Monitor', 11259, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (487, 10331, 'Apache Tomcat/6.0.20 dwr-invoker none none //localhost/webide Servlet Monitor', 11260, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (488, 10332, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/internetware Servlet Monitor', 11261, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (489, 10333, 'Apache Tomcat/6.0.20 AdminPortlet none none //localhost/pluto Servlet Monitor', 11262, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (490, 10334, 'Apache Tomcat/6.0.20 LoginServlet none none //localhost/webide.sample Servlet Monitor', 11263, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (491, 10335, 'Apache Tomcat/6.0.20 default none none //localhost/CTestor Servlet Monitor', 11264, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (492, 10336, 'Apache Tomcat/6.0.20 GenerateTC4Ext none none //localhost/BETWebsite Servlet Monitor', 11265, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (493, 10337, 'Apache Tomcat/6.0.20 webideService none none //localhost/webide.sample Servlet Monitor', 11266, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (494, 10338, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/deploy Servlet Monitor', 11267, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (495, 10339, 'Apache Tomcat/6.0.20 default none none //localhost/BPWeb Servlet Monitor', 11268, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (496, 10340, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.PublicationServiceImpl/org.apache.juddi.portlets.UDDIOntologyBasedPublication/publication none none //localhost/uddi-portlets Servlet Monitor', 11269, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (497, 10341, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BPWeb Servlet Monitor', 11270, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (498, 10342, 'Apache Tomcat/6.0.20 default none none //localhost/uddi-portlets Servlet Monitor', 11271, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (499, 10343, 'Apache Tomcat/6.0.20 plutoPortalDriverLogout none none //localhost/pluto Servlet Monitor', 11272, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (500, 10344, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.InquiryServiceImpl/org.apache.juddi.portlets.UDDIBrowser/inquiry none none //localhost/uddi-portlets Servlet Monitor', 11273, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (501, 10345, 'Apache Tomcat/6.0.20 TeacherCourses none none //localhost/STTP Servlet Monitor', 11274, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (502, 10346, 'Apache Tomcat/6.0.20 fileUpload none none //localhost/CTestor Servlet Monitor', 11275, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (503, 10347, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/BPTestor Servlet Monitor', 11276, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (504, 10348, 'Apache Tomcat/6.0.20 CopyWidgetServlet none none //localhost/webide.sample Servlet Monitor', 11277, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (505, 10349, 'Apache Tomcat/6.0.20 UDDIOntologyBasedPublicationPortlet none none //localhost/uddi-portlets Servlet Monitor', 11278, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (506, 10350, 'Apache Tomcat/6.0.20 default none none //localhost/bet Servlet Monitor', 11279, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (507, 10351, 'Apache Tomcat/6.0.20 JMXWebappMetricServlet none none //localhost/webide Servlet Monitor', 11280, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (508, 10352, 'Apache Tomcat/6.0.20 default none none //localhost/BETService Servlet Monitor', 11281, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (509, 10353, 'Apache Tomcat/6.0.20 org.apache.juddi.portlets.server.service.SecurityServiceImpl/org.apache.juddi.portlets.UDDIOntologyBasedSearch/security none none //localhost/uddi-portlets Servlet Monitor', 11282, 6, 0, 12);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (510, 10354, 'Apache Tomcat/6.0.20 http-8080 Thread Pools', 11283, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (511, 10355, 'Apache Tomcat/6.0.20 http-80 Thread Pools', 11284, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (512, 10356, 'Apache Tomcat/6.0.20 jk-8009 Thread Pools', 11285, 6, 0, 13);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (513, 10357, 'Apache Tomcat/6.0.20 //localhost/ none none Web Module Stats', 11286, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (514, 10358, 'Apache Tomcat/6.0.20 //localhost/SaseWeb none none Web Module Stats', 11287, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (515, 10359, 'Apache Tomcat/6.0.20 //localhost/webide none none Web Module Stats', 11288, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (516, 10360, 'Apache Tomcat/6.0.20 //localhost/internetware none none Web Module Stats', 11289, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (517, 10361, 'Apache Tomcat/6.0.20 //localhost/bet none none Web Module Stats', 11290, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (518, 10362, 'Apache Tomcat/6.0.20 //localhost/wordtopdf none none Web Module Stats', 11291, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (519, 10363, 'Apache Tomcat/6.0.20 //localhost/bet-en none none Web Module Stats', 11292, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (520, 10364, 'Apache Tomcat/6.0.20 //localhost/BPWeb none none Web Module Stats', 11293, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (521, 10365, 'Apache Tomcat/6.0.20 //localhost/ConditionTestWSClient none none Web Module Stats', 11294, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (522, 10366, 'Apache Tomcat/6.0.20 //localhost/webide.sample none none Web Module Stats', 11295, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (523, 10367, 'Apache Tomcat/6.0.20 //localhost/MashRoom none none Web Module Stats', 11296, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (524, 10368, 'Apache Tomcat/6.0.20 //localhost/STTP none none Web Module Stats', 11297, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (525, 10369, 'Apache Tomcat/6.0.20 //localhost/uddi-portlets none none Web Module Stats', 11298, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (526, 10370, 'Apache Tomcat/6.0.20 //localhost/extjs none none Web Module Stats', 11299, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (527, 10371, 'Apache Tomcat/6.0.20 //localhost/sase none none Web Module Stats', 11300, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (528, 10372, 'Apache Tomcat/6.0.20 //localhost/gwtuml none none Web Module Stats', 11301, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (529, 10373, 'Apache Tomcat/6.0.20 //localhost/BETWebsite none none Web Module Stats', 11302, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (530, 10374, 'Apache Tomcat/6.0.20 //localhost/deploy none none Web Module Stats', 11303, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (531, 10375, 'Apache Tomcat/6.0.20 //localhost/pluto none none Web Module Stats', 11304, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (532, 10376, 'Apache Tomcat/6.0.20 //localhost/CTestor none none Web Module Stats', 11305, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (533, 10377, 'Apache Tomcat/6.0.20 //localhost/NITS none none Web Module Stats', 11306, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (534, 10378, 'Apache Tomcat/6.0.20 //localhost/TWeb none none Web Module Stats', 11307, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (535, 10379, 'Apache Tomcat/6.0.20 //localhost/BPTestor none none Web Module Stats', 11308, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (536, 10380, 'Apache Tomcat/6.0.20 //localhost/fileFormatConversion none none Web Module Stats', 11309, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (537, 10381, 'Apache Tomcat/6.0.20 //localhost/juddiv3 none none Web Module Stats', 11310, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (538, 10382, 'Apache Tomcat/6.0.20 //localhost/TestWar none none Web Module Stats', 11311, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (539, 10383, 'Apache Tomcat/6.0.20 //localhost/BETService none none Web Module Stats', 11312, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (540, 10384, 'Apache Tomcat/6.0.20 //localhost/ConditionTestWSServer none none Web Module Stats', 11313, 6, 0, 14);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (541, 10385, 'Apache Tomcat/6.0.20 localhost /internetware Cache', 11314, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (542, 10386, 'Apache Tomcat/6.0.20 localhost /STTP Cache', 11315, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (543, 10387, 'Apache Tomcat/6.0.20 localhost / Cache', 11316, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (544, 10388, 'Apache Tomcat/6.0.20 localhost /TWeb Cache', 11317, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (545, 10389, 'Apache Tomcat/6.0.20 localhost /NITS Cache', 11318, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (546, 10390, 'Apache Tomcat/6.0.20 localhost /deploy Cache', 11319, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (547, 10391, 'Apache Tomcat/6.0.20 localhost /BPTestor Cache', 11320, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (548, 10392, 'Apache Tomcat/6.0.20 localhost /pluto Cache', 11321, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (549, 10393, 'Apache Tomcat/6.0.20 localhost /BPWeb Cache', 11322, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (550, 10394, 'Apache Tomcat/6.0.20 localhost /BETService Cache', 11323, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (551, 10395, 'Apache Tomcat/6.0.20 localhost /BETWebsite Cache', 11324, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (552, 10396, 'Apache Tomcat/6.0.20 localhost /SaseWeb Cache', 11325, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (553, 10397, 'Apache Tomcat/6.0.20 localhost /extjs Cache', 11326, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (554, 10398, 'Apache Tomcat/6.0.20 localhost /ConditionTestWSClient Cache', 11327, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (555, 10399, 'Apache Tomcat/6.0.20 localhost /juddiv3 Cache', 11328, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (556, 10400, 'Apache Tomcat/6.0.20 localhost /ConditionTestWSServer Cache', 11329, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (557, 10401, 'Apache Tomcat/6.0.20 localhost /sase Cache', 11330, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (558, 10402, 'Apache Tomcat/6.0.20 localhost /TestWar Cache', 11331, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (559, 10403, 'Apache Tomcat/6.0.20 localhost /bet-en Cache', 11332, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (560, 10404, 'Apache Tomcat/6.0.20 localhost /webide.sample Cache', 11333, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (561, 10405, 'Apache Tomcat/6.0.20 localhost /bet Cache', 11334, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (562, 10406, 'Apache Tomcat/6.0.20 localhost /gwtuml Cache', 11335, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (563, 10407, 'Apache Tomcat/6.0.20 localhost /uddi-portlets Cache', 11336, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (564, 10408, 'Apache Tomcat/6.0.20 localhost /fileFormatConversion Cache', 11337, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (565, 10409, 'Apache Tomcat/6.0.20 localhost /webide Cache', 11338, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (566, 10410, 'Apache Tomcat/6.0.20 localhost /CTestor Cache', 11339, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (567, 10411, 'Apache Tomcat/6.0.20 localhost /MashRoom Cache', 11340, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (568, 10412, 'Apache Tomcat/6.0.20 localhost /wordtopdf Cache', 11341, 6, 0, 15);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (569, 10413, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /uddi-portlets DataSource Pool', 11342, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (570, 10414, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /MashRoom DataSource Pool', 11343, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (571, 10415, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /internetware DataSource Pool', 11344, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (572, 10416, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /TestWar DataSource Pool', 11345, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (573, 10417, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /fileFormatConversion DataSource Pool', 11346, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (574, 10418, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /extjs DataSource Pool', 11347, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (575, 10419, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /wordtopdf DataSource Pool', 11348, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (576, 10420, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /BPWeb DataSource Pool', 11349, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (577, 10421, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /BETService DataSource Pool', 11350, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (578, 10422, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /BPTestor DataSource Pool', 11351, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (579, 10423, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource / DataSource Pool', 11352, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (580, 10424, 'Apache Tomcat/6.0.20 "jdbc/juddiDB" localhost javax.sql.DataSource /juddiv3 DataSource Pool', 11353, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (581, 10425, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /juddiv3 DataSource Pool', 11354, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (582, 10426, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /deploy DataSource Pool', 11355, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (583, 10427, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /NITS DataSource Pool', 11356, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (584, 10428, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /STTP DataSource Pool', 11357, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (585, 10429, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /sase DataSource Pool', 11358, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (586, 10430, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /webide DataSource Pool', 11359, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (587, 10431, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /gwtuml DataSource Pool', 11360, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (588, 10432, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /webide.sample DataSource Pool', 11361, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (589, 10433, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /ConditionTestWSServer DataSource Pool', 11362, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (590, 10434, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /pluto DataSource Pool', 11363, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (591, 10435, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /SaseWeb DataSource Pool', 11364, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (592, 10436, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /CTestor DataSource Pool', 11365, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (593, 10437, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /bet-en DataSource Pool', 11366, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (594, 10438, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /bet DataSource Pool', 11367, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (595, 10439, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /TWeb DataSource Pool', 11368, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (596, 10440, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /BETWebsite DataSource Pool', 11369, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (597, 10441, 'Apache Tomcat/6.0.20 "jdbc/JuddiDS" localhost javax.sql.DataSource /ConditionTestWSClient DataSource Pool', 11370, 6, 0, 18);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (598, 10442, 'Apache Tomcat/6.0.20 http-80 Global Request Processor', 11371, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (599, 10443, 'Apache Tomcat/6.0.20 http-8080 Global Request Processor', 11372, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (600, 10444, 'Apache Tomcat/6.0.20 jk-8009 Global Request Processor', 11373, 6, 0, 16);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (601, 10445, 'Apache Tomcat/6.0.20 none none //localhost/internetware JSP Monitor', 11374, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (602, 10446, 'Apache Tomcat/6.0.20 none none //localhost/bet-en JSP Monitor', 11375, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (603, 10447, 'Apache Tomcat/6.0.20 none none //localhost/BPTestor JSP Monitor', 11376, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (604, 10448, 'Apache Tomcat/6.0.20 none none //localhost/ConditionTestWSServer JSP Monitor', 11377, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (605, 10449, 'Apache Tomcat/6.0.20 none none //localhost/TestWar JSP Monitor', 11378, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (606, 10450, 'Apache Tomcat/6.0.20 none none //localhost/fileFormatConversion JSP Monitor', 11379, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (607, 10451, 'Apache Tomcat/6.0.20 none none //localhost/webide JSP Monitor', 11380, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (608, 10452, 'Apache Tomcat/6.0.20 none none //localhost/MashRoom JSP Monitor', 11381, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (609, 10453, 'Apache Tomcat/6.0.20 none none //localhost/ JSP Monitor', 11382, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (610, 10454, 'Apache Tomcat/6.0.20 none none //localhost/juddiv3 JSP Monitor', 11383, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (611, 10455, 'Apache Tomcat/6.0.20 none none //localhost/wordtopdf JSP Monitor', 11384, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (612, 10456, 'Apache Tomcat/6.0.20 none none //localhost/ConditionTestWSClient JSP Monitor', 11385, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (613, 10457, 'Apache Tomcat/6.0.20 none none //localhost/CTestor JSP Monitor', 11386, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (614, 10458, 'Apache Tomcat/6.0.20 none none //localhost/BETWebsite JSP Monitor', 11387, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (615, 10459, 'Apache Tomcat/6.0.20 none none //localhost/bet JSP Monitor', 11388, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (616, 10460, 'Apache Tomcat/6.0.20 none none //localhost/pluto JSP Monitor', 11389, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (617, 10461, 'Apache Tomcat/6.0.20 none none //localhost/BPWeb JSP Monitor', 11390, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (618, 10462, 'Apache Tomcat/6.0.20 none none //localhost/deploy JSP Monitor', 11391, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (619, 10463, 'Apache Tomcat/6.0.20 none none //localhost/sase JSP Monitor', 11392, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (620, 10464, 'Apache Tomcat/6.0.20 none none //localhost/webide.sample JSP Monitor', 11393, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (621, 10465, 'Apache Tomcat/6.0.20 none none //localhost/extjs JSP Monitor', 11394, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (622, 10466, 'Apache Tomcat/6.0.20 none none //localhost/NITS JSP Monitor', 11395, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (623, 10467, 'Apache Tomcat/6.0.20 none none //localhost/gwtuml JSP Monitor', 11396, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (624, 10468, 'Apache Tomcat/6.0.20 none none //localhost/TWeb JSP Monitor', 11397, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (625, 10469, 'Apache Tomcat/6.0.20 none none //localhost/SaseWeb JSP Monitor', 11398, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (626, 10470, 'Apache Tomcat/6.0.20 none none //localhost/BETService JSP Monitor', 11399, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (627, 10471, 'Apache Tomcat/6.0.20 none none //localhost/STTP JSP Monitor', 11400, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (628, 10472, 'Apache Tomcat/6.0.20 none none //localhost/uddi-portlets JSP Monitor', 11401, 6, 0, 17);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (629, NULL, 'UNknown', NULL, 1, 0, 1);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (630, 10004, 'sei-3d3cb237184-243', 10937, 2, 0, 2);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (631, 10016, 'sei-3d3cb237184 Win32 FileServer', 10938, 3, 0, 9);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (632, 10016, 'sei-3d3cb237184 Win32 File System C:\ (local/NTFS)', 10943, 4, 0, 10);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (633, 10017, 'sei-3d3cb237184 Win32 File System D:\ (local/NTFS)', 10944, 4, 0, 10);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (634, 10018, 'sei-3d3cb237184 Win32 File System E:\ (local/NTFS)', 10945, 4, 0, 10);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (635, 10017, 'sei-3d3cb237184 Win32 NetworkServer', 10939, 3, 0, 6);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (636, 10023, 'sei-3d3cb237184 Win32 Network Interface eth0 (ethernet)', 10950, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (637, 10024, 'sei-3d3cb237184 Win32 Network Interface lo0 (loopback)', 10951, 4, 0, 7);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (638, 10018, 'sei-3d3cb237184 Win32 WindowsServer', 10940, 3, 0, 8);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (639, 10019, 'sei-3d3cb237184 Win32 ProcessServer', 10941, 3, 0, 4);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (640, 10019, 'sei-3d3cb237184 Win32 CPU 1 (2660Mhz Intel Xeon)', 10946, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (641, 10020, 'sei-3d3cb237184 Win32 CPU 2 (2660Mhz Intel Xeon)', 10947, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (642, 10021, 'sei-3d3cb237184 Win32 CPU 3 (2660Mhz Intel Xeon)', 10948, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (643, 10022, 'sei-3d3cb237184 Win32 CPU 4 (2660Mhz Intel Xeon)', 10949, 4, 0, 5);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (644, 10020, '192.168.4.243 Net Services', 10942, 3, 0, 3);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (645, 10025, 'sei-3d3cb237184 Apache 2.2.6', 11546, 5, 0, 19);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (646, 10026, 'Tomcat 7 21387', 11547, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (647, 10615, 'Tomcat 7 21387 jsp none none //localhost/a100242 Servlet Monitor', 11548, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (648, 10616, 'Tomcat 7 21387 default none none //localhost/a100242 Servlet Monitor', 11549, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (649, 10617, 'Tomcat 7 21387 JMXWebappMetricServlet none none //localhost/a100242 Servlet Monitor', 11550, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (650, 10618, 'Tomcat 7 21387 "ajp-bio-22387" Thread Pools', 11551, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (651, 10619, 'Tomcat 7 21387 "http-bio-21387" Thread Pools', 11552, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (652, 10620, 'Tomcat 7 21387 "http-bio-21387" Global Request Processor', 11553, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (653, 10621, 'Tomcat 7 21387 "ajp-bio-22387" Global Request Processor', 11554, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (654, 10622, 'Tomcat 7 21387 //localhost/a100242 none none Web Module Stats', 11555, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (655, 10623, 'Tomcat 7 21387 none none //localhost/a100242 JSP Monitor', 11556, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (656, 10027, 'Tomcat 7 21399', 11557, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (657, 10624, 'Tomcat 7 21399 controller none none //localhost/a101310 Servlet Monitor', 11558, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (658, 10625, 'Tomcat 7 21399 image none none //localhost/a101310 Servlet Monitor', 11559, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (659, 10626, 'Tomcat 7 21399 jsp none none //localhost/a101310 Servlet Monitor', 11560, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (660, 10627, 'Tomcat 7 21399 JMXWebappMetricServlet none none //localhost/a101310 Servlet Monitor', 11561, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (661, 10628, 'Tomcat 7 21399 default none none //localhost/a101310 Servlet Monitor', 11562, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (662, 10629, 'Tomcat 7 21399 "ajp-bio-22399" Thread Pools', 11563, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (663, 10630, 'Tomcat 7 21399 "http-bio-21399" Thread Pools', 11564, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (664, 10631, 'Tomcat 7 21399 "ajp-bio-22399" Global Request Processor', 11565, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (665, 10632, 'Tomcat 7 21399 "http-bio-21399" Global Request Processor', 11566, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (666, 10633, 'Tomcat 7 21399 //localhost/a101310 none none Web Module Stats', 11567, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (667, 10634, 'Tomcat 7 21399 none none //localhost/a101310 JSP Monitor', 11568, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (668, 10028, 'Tomcat 7 21398', 11569, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (669, 10635, 'Tomcat 7 21398 UserServlet none none //localhost/A101260 Servlet Monitor', 11570, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (670, 10636, 'Tomcat 7 21398 jsp none none //localhost/A101260 Servlet Monitor', 11571, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (671, 10637, 'Tomcat 7 21398 GoodsServlet none none //localhost/A101260 Servlet Monitor', 11572, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (672, 10638, 'Tomcat 7 21398 JMXWebappMetricServlet none none //localhost/A101260 Servlet Monitor', 11573, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (673, 10639, 'Tomcat 7 21398 default none none //localhost/A101260 Servlet Monitor', 11574, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (674, 10640, 'Tomcat 7 21398 NewGoodsServlet none none //localhost/A101260 Servlet Monitor', 11575, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (675, 10641, 'Tomcat 7 21398 IndexServlet none none //localhost/A101260 Servlet Monitor', 11576, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (676, 10642, 'Tomcat 7 21398 ClassServlet none none //localhost/A101260 Servlet Monitor', 11577, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (677, 10643, 'Tomcat 7 21398 adminServlet none none //localhost/A101260 Servlet Monitor', 11578, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (678, 10644, 'Tomcat 7 21398 RanklistServlet none none //localhost/A101260 Servlet Monitor', 11579, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (679, 10645, 'Tomcat 7 21398 AnnouncementSeverlet none none //localhost/A101260 Servlet Monitor', 11580, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (680, 10646, 'Tomcat 7 21398 MailMessageServlet none none //localhost/A101260 Servlet Monitor', 11581, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (681, 10647, 'Tomcat 7 21398 RegisterServlet none none //localhost/A101260 Servlet Monitor', 11582, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (682, 10648, 'Tomcat 7 21398 LogonServlet none none //localhost/A101260 Servlet Monitor', 11583, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (683, 10649, 'Tomcat 7 21398 "ajp-bio-22398" Thread Pools', 11584, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (684, 10650, 'Tomcat 7 21398 "http-bio-21398" Thread Pools', 11585, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (685, 10651, 'Tomcat 7 21398 "ajp-bio-22398" Global Request Processor', 11586, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (686, 10652, 'Tomcat 7 21398 "http-bio-21398" Global Request Processor', 11587, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (687, 10653, 'Tomcat 7 21398 //localhost/A101260 none none Web Module Stats', 11588, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (688, 10654, 'Tomcat 7 21398 none none //localhost/A101260 JSP Monitor', 11589, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (689, 10029, 'Tomcat 7 21392', 11590, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (690, 10655, 'Tomcat 7 21392 default none none //localhost/A100657 Servlet Monitor', 11591, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (691, 10656, 'Tomcat 7 21392 set_answer none none //localhost/A100657 Servlet Monitor', 11592, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (692, 10657, 'Tomcat 7 21392 testServlet none none //localhost/A100657 Servlet Monitor', 11593, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (693, 10658, 'Tomcat 7 21392 reg none none //localhost/A100657 Servlet Monitor', 11594, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (694, 10659, 'Tomcat 7 21392 JMXWebappMetricServlet none none //localhost/A100657 Servlet Monitor', 11595, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (695, 10660, 'Tomcat 7 21392 rewrite_Action none none //localhost/A100657 Servlet Monitor', 11596, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (696, 10661, 'Tomcat 7 21392 Check_01 none none //localhost/A100657 Servlet Monitor', 11597, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (697, 10662, 'Tomcat 7 21392 reset_Info none none //localhost/A100657 Servlet Monitor', 11598, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (698, 10663, 'Tomcat 7 21392 login none none //localhost/A100657 Servlet Monitor', 11599, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (699, 10664, 'Tomcat 7 21392 SendMail none none //localhost/A100657 Servlet Monitor', 11600, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (700, 10665, 'Tomcat 7 21392 set_Pinglun none none //localhost/A100657 Servlet Monitor', 11601, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (701, 10666, 'Tomcat 7 21392 loginOut none none //localhost/A100657 Servlet Monitor', 11602, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (702, 10667, 'Tomcat 7 21392 save_music none none //localhost/A100657 Servlet Monitor', 11603, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (703, 10668, 'Tomcat 7 21392 jsp none none //localhost/A100657 Servlet Monitor', 11604, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (704, 10669, 'Tomcat 7 21392 upload none none //localhost/A100657 Servlet Monitor', 11605, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (705, 10670, 'Tomcat 7 21392 "http-bio-21392" Thread Pools', 11606, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (706, 10671, 'Tomcat 7 21392 "ajp-bio-22392" Thread Pools', 11607, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (707, 10672, 'Tomcat 7 21392 "http-bio-21392" Global Request Processor', 11608, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (708, 10673, 'Tomcat 7 21392 "ajp-bio-22392" Global Request Processor', 11609, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (709, 10674, 'Tomcat 7 21392 //localhost/A100657 none none Web Module Stats', 11610, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (710, 10675, 'Tomcat 7 21392 none none //localhost/A100657 JSP Monitor', 11611, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (711, 10031, 'Tomcat 7 21389', 11622, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (712, 10685, 'Tomcat 7 21389 default none none //localhost/a100413 Servlet Monitor', 11623, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (713, 10686, 'Tomcat 7 21389 JMXWebappMetricServlet none none //localhost/a100413 Servlet Monitor', 11624, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (714, 10687, 'Tomcat 7 21389 jsp none none //localhost/a100413 Servlet Monitor', 11625, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (715, 10688, 'Tomcat 7 21389 "http-bio-21389" Thread Pools', 11626, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (716, 10689, 'Tomcat 7 21389 "ajp-bio-22389" Thread Pools', 11627, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (717, 10690, 'Tomcat 7 21389 "ajp-bio-22389" Global Request Processor', 11628, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (718, 10691, 'Tomcat 7 21389 "http-bio-21389" Global Request Processor', 11629, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (719, 10692, 'Tomcat 7 21389 //localhost/a100413 none none Web Module Stats', 11630, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (720, 10693, 'Tomcat 7 21389 none none //localhost/a100413 JSP Monitor', 11631, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (721, 10032, 'Tomcat 7 21397', 11632, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (722, 10694, 'Tomcat 7 21397 GetChart none none //localhost/a101201 Servlet Monitor', 11633, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (723, 10695, 'Tomcat 7 21397 default none none //localhost/a101201 Servlet Monitor', 11634, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (724, 10696, 'Tomcat 7 21397 JMXWebappMetricServlet none none //localhost/a101201 Servlet Monitor', 11635, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (725, 10697, 'Tomcat 7 21397 Print none none //localhost/a101201 Servlet Monitor', 11636, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (726, 10698, 'Tomcat 7 21397 dwr-invoker none none //localhost/a101201 Servlet Monitor', 11637, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (727, 10699, 'Tomcat 7 21397 jsp none none //localhost/a101201 Servlet Monitor', 11638, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (728, 10700, 'Tomcat 7 21397 DisplayChart none none //localhost/a101201 Servlet Monitor', 11639, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (729, 10701, 'Tomcat 7 21397 MondrianXmlaServlet none none //localhost/a101201 Servlet Monitor', 11640, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (730, 10702, 'Tomcat 7 21397 MDXQueryServlet none none //localhost/a101201 Servlet Monitor', 11641, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (731, 10703, 'Tomcat 7 21397 "ajp-bio-22397" Thread Pools', 11642, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (732, 10704, 'Tomcat 7 21397 "http-bio-21397" Thread Pools', 11643, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (733, 10705, 'Tomcat 7 21397 "http-bio-21397" Global Request Processor', 11644, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (734, 10706, 'Tomcat 7 21397 "ajp-bio-22397" Global Request Processor', 11645, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (735, 10707, 'Tomcat 7 21397 //localhost/a101201 none none Web Module Stats', 11646, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (736, 10708, 'Tomcat 7 21397 none none //localhost/a101201 JSP Monitor', 11647, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (737, 10030, 'Tomcat 7 21390', 11612, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (738, 10676, 'Tomcat 7 21390 jsp none none //localhost/a100501 Servlet Monitor', 11613, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (739, 10677, 'Tomcat 7 21390 JMXWebappMetricServlet none none //localhost/a100501 Servlet Monitor', 11614, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (740, 10678, 'Tomcat 7 21390 default none none //localhost/a100501 Servlet Monitor', 11615, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (741, 10679, 'Tomcat 7 21390 "http-bio-21390" Thread Pools', 11616, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (742, 10680, 'Tomcat 7 21390 "ajp-bio-22390" Thread Pools', 11617, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (743, 10681, 'Tomcat 7 21390 "ajp-bio-22390" Global Request Processor', 11618, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (744, 10682, 'Tomcat 7 21390 "http-bio-21390" Global Request Processor', 11619, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (745, 10683, 'Tomcat 7 21390 //localhost/a100501 none none Web Module Stats', 11620, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (746, 10684, 'Tomcat 7 21390 none none //localhost/a100501 JSP Monitor', 11621, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (747, 10033, 'Tomcat 7 21396', 11648, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (748, 10709, 'Tomcat 7 21396 jsp none none //localhost/a101145 Servlet Monitor', 11649, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (749, 10710, 'Tomcat 7 21396 JMXWebappMetricServlet none none //localhost/a101145 Servlet Monitor', 11650, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (750, 10711, 'Tomcat 7 21396 UploadPicture none none //localhost/a101145 Servlet Monitor', 11651, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (751, 10712, 'Tomcat 7 21396 default none none //localhost/a101145 Servlet Monitor', 11652, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (752, 10713, 'Tomcat 7 21396 "http-bio-21396" Thread Pools', 11653, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (753, 10714, 'Tomcat 7 21396 "ajp-bio-22396" Thread Pools', 11654, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (754, 10715, 'Tomcat 7 21396 "ajp-bio-22396" Global Request Processor', 11655, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (755, 10716, 'Tomcat 7 21396 "http-bio-21396" Global Request Processor', 11656, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (756, 10717, 'Tomcat 7 21396 //localhost/a101145 none none Web Module Stats', 11657, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (757, 10718, 'Tomcat 7 21396 none none //localhost/a101145 JSP Monitor', 11658, 6, 0, 25);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (758, 10034, 'Tomcat 7 21395', 11659, 5, 0, 20);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (759, 10719, 'Tomcat 7 21395 NewsAction none none //localhost/A100941 Servlet Monitor', 11660, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (760, 10720, 'Tomcat 7 21395 Consult none none //localhost/A100941 Servlet Monitor', 11661, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (761, 10721, 'Tomcat 7 21395 FriendAction none none //localhost/A100941 Servlet Monitor', 11662, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (762, 10722, 'Tomcat 7 21395 LoginSubmit none none //localhost/A100941 Servlet Monitor', 11663, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (763, 10723, 'Tomcat 7 21395 default none none //localhost/A100941 Servlet Monitor', 11664, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (764, 10724, 'Tomcat 7 21395 RegisterSubmit none none //localhost/A100941 Servlet Monitor', 11665, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (765, 10725, 'Tomcat 7 21395 JMXWebappMetricServlet none none //localhost/A100941 Servlet Monitor', 11666, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (766, 10726, 'Tomcat 7 21395 DetailAction none none //localhost/A100941 Servlet Monitor', 11667, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (767, 10727, 'Tomcat 7 21395 SceneAction none none //localhost/A100941 Servlet Monitor', 11668, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (768, 10728, 'Tomcat 7 21395 jsp none none //localhost/A100941 Servlet Monitor', 11669, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (769, 10729, 'Tomcat 7 21395 MessageAction none none //localhost/A100941 Servlet Monitor', 11670, 6, 0, 21);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (770, 10730, 'Tomcat 7 21395 "http-bio-21395" Thread Pools', 11671, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (771, 10731, 'Tomcat 7 21395 "ajp-bio-22395" Thread Pools', 11672, 6, 0, 22);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (772, 10732, 'Tomcat 7 21395 "http-bio-21395" Global Request Processor', 11673, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (773, 10733, 'Tomcat 7 21395 "ajp-bio-22395" Global Request Processor', 11674, NULL, 0, 23);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (774, 10734, 'Tomcat 7 21395 //localhost/A100941 none none Web Module Stats', 11675, 6, 0, 24);
INSERT INTO resource (id, instance_id, name, resource_id, type_id, version, resource_prototype) VALUES (775, 10735, 'Tomcat 7 21395 none none //localhost/A100941 JSP Monitor', 11676, 6, 0, 25);


--
-- Data for Name: resource_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource_group (id, version, group_owner) VALUES (1, 0, 1);


--
-- Data for Name: resource_property_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (1, 'ip', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (2, 'username', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (3, 'password', 0, 1);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (4, 'arch', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (5, 'version', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (6, 'vendor', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (7, 'vendorVersion', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (8, 'ram', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (9, 'cpuSpeed', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (10, 'ip', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (11, 'primaryDNS', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (12, 'secondaryDNS', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (13, 'defaultGateway', 0, 2);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (14, 'mtu', 0, 7);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (15, 'flags', 0, 7);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (16, 'mac', 0, 7);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (17, 'address', 0, 7);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (18, 'netmask', 0, 7);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (19, 'broadcast', 0, 7);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (20, 'built', 0, 19);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (21, 'exe', 0, 19);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (22, 'mpm', 0, 19);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (23, 'serverAdmin', 0, 19);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (24, 'serverTokens', 0, 19);
INSERT INTO resource_property_key (id, key, version, resource_prototype) VALUES (25, 'version', 0, 19);


--
-- Data for Name: resource_property_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (1, '192.168.4.59', 0, 1, 1);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (2, 'root', 0, 1, 2);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (3, 'seforge520', 0, 1, 3);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (4, 'x86', 0, 2, 4);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (5, '5.2', 0, 2, 5);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (6, 'Microsoft', 0, 2, 6);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (7, '2003', 0, 2, 7);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (8, '2048 MB', 0, 2, 8);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (9, '2933 MHz', 0, 2, 9);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (10, '192.168.4.166', 0, 2, 10);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (11, '162.105.129.27', 0, 2, 11);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (12, '162.105.129.26', 0, 2, 12);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (13, '192.168.4.1', 0, 2, 13);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (14, '1500', 0, 7, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (15, 'UP BROADCAST RUNNING MULTICAST', 0, 7, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (16, '00:0C:29:1C:51:0D', 0, 7, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (17, '192.168.4.166', 0, 7, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (18, '255.255.255.0', 0, 7, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (19, '192.168.4.255', 0, 7, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (20, '1520', 0, 8, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (21, 'UP LOOPBACK RUNNING', 0, 8, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (22, '', 0, 8, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (23, '127.0.0.1', 0, 8, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (24, '255.0.0.0', 0, 8, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (25, '', 0, 8, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (26, 'x86', 0, 150, 4);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (27, '5.2', 0, 150, 5);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (28, 'Microsoft', 0, 150, 6);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (29, '2003', 0, 150, 7);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (30, '2048 MB', 0, 150, 8);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (31, '2933 MHz', 0, 150, 9);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (32, '192.168.4.165', 0, 150, 10);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (33, '162.105.129.27', 0, 150, 11);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (34, '162.105.129.26', 0, 150, 12);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (35, '192.168.4.1', 0, 150, 13);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (36, '1500', 0, 156, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (37, 'UP BROADCAST RUNNING MULTICAST', 0, 156, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (38, '00:0C:29:A5:D0:3E', 0, 156, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (39, '192.168.4.165', 0, 156, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (40, '255.255.255.0', 0, 156, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (41, '192.168.4.255', 0, 156, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (42, '1520', 0, 157, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (43, 'UP LOOPBACK RUNNING', 0, 157, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (44, '', 0, 157, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (45, '127.0.0.1', 0, 157, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (46, '255.0.0.0', 0, 157, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (47, '', 0, 157, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (48, 'x86', 0, 304, 4);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (49, '5.2', 0, 304, 5);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (50, 'Microsoft', 0, 304, 6);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (51, '2003', 0, 304, 7);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (52, '3840 MB', 0, 304, 8);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (53, '4 @ 3694 MHz', 0, 304, 9);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (54, '192.168.4.168', 0, 304, 10);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (55, '162.105.129.27', 0, 304, 11);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (56, '162.105.129.26', 0, 304, 12);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (57, '192.168.4.1', 0, 304, 13);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (58, '1500', 0, 314, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (59, 'UP BROADCAST RUNNING MULTICAST', 0, 314, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (60, '00:0C:29:FE:D0:3C', 0, 314, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (61, '192.168.4.168', 0, 314, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (62, '255.255.255.0', 0, 314, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (63, '192.168.4.255', 0, 314, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (64, '1520', 0, 315, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (65, 'UP LOOPBACK RUNNING', 0, 315, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (66, '', 0, 315, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (67, '127.0.0.1', 0, 315, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (68, '255.0.0.0', 0, 315, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (69, '', 0, 315, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (70, '192.168.4.22', 0, 629, 1);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (71, 'mass', 0, 629, 2);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (72, 'seforge520', 0, 629, 3);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (73, 'x86', 0, 630, 4);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (74, '5.2', 0, 630, 5);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (75, 'Microsoft', 0, 630, 6);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (76, '2003', 0, 630, 7);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (77, '4096 MB', 0, 630, 8);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (78, '4 @ 2660 MHz', 0, 630, 9);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (79, '192.168.4.243', 0, 630, 10);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (80, '162.105.129.27', 0, 630, 11);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (81, '162.105.129.26', 0, 630, 12);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (82, '192.168.4.1', 0, 630, 13);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (83, '1500', 0, 636, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (84, 'UP BROADCAST RUNNING MULTICAST', 0, 636, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (85, '00:0C:29:21:D4:57', 0, 636, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (86, '192.168.4.243', 0, 636, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (87, '255.255.255.0', 0, 636, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (88, '192.168.4.255', 0, 636, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (89, '1520', 0, 637, 14);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (90, 'UP LOOPBACK RUNNING', 0, 637, 15);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (91, '', 0, 637, 16);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (92, '127.0.0.1', 0, 637, 17);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (93, '255.0.0.0', 0, 637, 18);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (94, '', 0, 637, 19);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (95, 'Sep  5 2007 08:58:56', 0, 645, 20);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (96, 'C:\wamp\apache2\bin\httpd.exe', 0, 645, 21);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (97, 'winnt', 0, 645, 22);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (98, '', 0, 645, 23);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (99, '', 0, 645, 24);
INSERT INTO resource_property_value (id, value, version, resource, resource_property_key) VALUES (100, '', 0, 645, 25);


--
-- Data for Name: resource_prototype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource_prototype (id, name, type_id, version) VALUES (1, 'VMware Vsphere', 1, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (2, 'Win32', 2, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (3, 'Net Services', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (4, 'ProcessServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (5, 'CPU', 4, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (6, 'NetworkServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (7, 'NetworkServer Interface', 4, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (8, 'WindowsServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (9, 'FileServer', 3, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (10, 'FileServer Mount', 4, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (11, 'Apache Tomcat 6.0', 5, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (12, 'Apache Tomcat 6.0 Servlet Monitor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (13, 'Apache Tomcat 6.0 Thread Pools', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (14, 'Apache Tomcat 6.0 Web Module Stats', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (15, 'Apache Tomcat 6.0 Cache', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (16, 'Apache Tomcat 6.0 Global Request Processor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (17, 'Apache Tomcat 6.0 JSP Monitor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (18, 'Apache Tomcat 6.0 DataSource Pool', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (19, 'Apache httpd', 5, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (20, 'Apache Tomcat 7.0', 5, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (21, 'Apache Tomcat 7.0 Servlet Monitor', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (22, 'Apache Tomcat 7.0 Thread Pools', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (23, 'Apache Tomcat 7.0 Global Request Processor', NULL, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (24, 'Apache Tomcat 7.0 Web Module Stats', 6, 0);
INSERT INTO resource_prototype (id, name, type_id, version) VALUES (25, 'Apache Tomcat 7.0 JSP Monitor', 6, 0);


--
-- Data for Name: resource_relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource_relationship (parent_id, children_id) VALUES (1, 2);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (2, 3);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (2, 4);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (4, 5);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (2, 6);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (6, 7);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (6, 8);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (2, 9);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (2, 10);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (10, 11);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (2, 12);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 13);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 14);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 15);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 16);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 17);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 18);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 19);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 20);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 21);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 22);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 23);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 24);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 25);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 26);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 27);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 28);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 29);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 30);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 31);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 32);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 33);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 34);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 35);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 36);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 37);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 38);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 39);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 40);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 41);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 42);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 43);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 44);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 45);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 46);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 47);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 48);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 49);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 50);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 51);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 52);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 53);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 54);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 55);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 56);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 57);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 58);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 59);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 60);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 61);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 62);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 63);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 64);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 65);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 66);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 67);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 68);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 69);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 70);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 71);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 72);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 73);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 74);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 75);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 76);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 77);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 78);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 79);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 80);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 81);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 82);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 83);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 84);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 85);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 86);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 87);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 88);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 89);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 90);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 91);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 92);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 93);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 94);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 95);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 96);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 97);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 98);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 99);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 100);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 101);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 102);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 103);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 104);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 105);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 106);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 107);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 108);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 109);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 110);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 111);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 112);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 113);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 114);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 115);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 116);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 117);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 118);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 119);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 120);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 121);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 122);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 123);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 124);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 125);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 126);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 127);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 128);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 129);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 130);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 131);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 132);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 133);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 134);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 135);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 136);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 137);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 138);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 139);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 140);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 141);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 142);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 143);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 144);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 145);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 146);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 147);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 148);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (12, 149);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (1, 150);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 151);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 152);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (152, 153);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 154);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 155);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (155, 156);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (155, 157);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 158);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (158, 159);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 160);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 161);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 162);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 163);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 164);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 165);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 166);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 167);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 168);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 169);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 170);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 171);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 172);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 173);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 174);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 175);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 176);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 177);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 178);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 179);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 180);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 181);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 182);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 183);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 184);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 185);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 186);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 187);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 188);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 189);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 190);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 191);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 192);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 193);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 194);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 195);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 196);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 197);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 198);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 199);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 200);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 201);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 202);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 203);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 204);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 205);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 206);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 207);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 208);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 209);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 210);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 211);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 212);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 213);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 214);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 215);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 216);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 217);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 218);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 219);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 220);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 221);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 222);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 223);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 224);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 225);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 226);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 227);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 228);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 229);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 230);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 231);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (160, 232);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (150, 233);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 234);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 235);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 236);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 237);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 238);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 239);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 240);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 241);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 242);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 243);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 244);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 245);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 246);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 247);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 248);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 249);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 250);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 251);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 252);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 253);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 254);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 255);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 256);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 257);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 258);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 259);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 260);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 261);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 262);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 263);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 264);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 265);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 266);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 267);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 268);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 269);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 270);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 271);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 272);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 273);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 274);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 275);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 276);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 277);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 278);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 279);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 280);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 281);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 282);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 283);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 284);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 285);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 286);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 287);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 288);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 289);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 290);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 291);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 292);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 293);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 294);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 295);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 296);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 297);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 298);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 299);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 300);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 301);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 302);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (233, 303);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (1, 304);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (304, 305);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (305, 306);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (305, 307);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (305, 308);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (305, 309);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (304, 310);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (310, 311);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (304, 312);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (304, 313);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (313, 314);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (313, 315);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (304, 316);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (304, 317);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 318);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 319);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 320);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 321);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 322);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 323);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 324);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 325);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 326);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 327);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 328);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 329);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 330);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 331);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 332);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 333);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 334);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 335);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 336);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 337);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 338);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 339);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 340);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 341);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 342);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 343);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 344);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 345);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 346);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 347);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 348);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 349);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 350);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 351);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 352);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 353);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 354);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 355);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 356);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 357);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 358);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 359);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 360);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 361);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 362);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 363);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 364);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 365);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 366);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 367);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 368);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 369);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 370);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 371);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 372);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 373);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 374);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 375);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 376);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 377);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 378);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 379);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 380);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 381);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 382);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 383);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 384);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 385);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 386);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 387);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 388);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 389);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 390);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 391);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 392);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 393);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 394);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 395);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 396);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 397);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 398);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 399);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 400);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 401);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 402);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 403);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 404);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 405);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 406);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 407);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 408);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 409);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 410);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 411);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 412);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 413);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 414);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 415);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 416);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 417);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 418);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 419);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 420);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 421);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 422);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 423);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 424);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 425);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 426);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 427);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 428);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 429);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 430);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 431);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 432);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 433);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 434);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 435);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 436);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 437);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 438);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 439);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 440);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 441);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 442);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 443);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 444);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 445);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 446);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 447);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 448);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 449);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 450);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 451);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 452);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 453);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 454);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 455);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 456);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 457);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 458);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 459);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 460);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 461);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 462);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 463);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 464);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 465);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 466);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 467);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 468);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 469);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 470);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 471);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 472);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 473);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 474);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 475);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 476);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 477);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 478);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 479);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 480);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 481);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 482);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 483);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 484);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 485);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 486);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 487);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 488);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 489);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 490);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 491);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 492);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 493);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 494);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 495);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 496);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 497);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 498);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 499);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 500);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 501);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 502);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 503);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 504);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 505);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 506);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 507);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 508);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 509);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 510);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 511);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 512);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 513);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 514);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 515);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 516);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 517);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 518);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 519);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 520);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 521);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 522);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 523);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 524);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 525);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 526);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 527);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 528);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 529);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 530);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 531);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 532);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 533);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 534);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 535);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 536);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 537);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 538);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 539);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 540);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 541);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 542);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 543);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 544);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 545);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 546);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 547);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 548);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 549);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 550);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 551);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 552);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 553);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 554);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 555);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 556);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 557);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 558);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 559);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 560);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 561);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 562);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 563);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 564);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 565);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 566);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 567);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 568);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 569);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 570);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 571);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 572);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 573);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 574);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 575);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 576);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 577);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 578);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 579);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 580);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 581);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 582);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 583);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 584);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 585);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 586);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 587);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 588);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 589);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 590);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 591);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 592);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 593);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 594);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 595);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 596);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 597);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 598);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 599);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 600);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 601);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 602);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 603);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 604);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 605);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 606);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 607);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 608);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 609);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 610);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 611);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 612);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 613);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 614);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 615);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 616);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 617);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 618);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 619);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 620);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 621);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 622);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 623);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 624);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 625);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 626);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 627);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (317, 628);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (629, 630);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 631);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (631, 632);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (631, 633);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (631, 634);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 635);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (635, 636);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (635, 637);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 638);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 639);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (639, 640);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (639, 641);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (639, 642);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (639, 643);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 644);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 645);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 646);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 647);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 648);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 649);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 650);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 651);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 652);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 653);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 654);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (646, 655);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 656);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 657);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 658);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 659);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 660);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 661);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 662);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 663);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 664);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 665);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 666);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (656, 667);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 668);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 669);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 670);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 671);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 672);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 673);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 674);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 675);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 676);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 677);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 678);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 679);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 680);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 681);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 682);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 683);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 684);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 685);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 686);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 687);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (668, 688);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 689);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 690);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 691);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 692);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 693);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 694);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 695);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 696);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 697);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 698);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 699);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 700);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 701);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 702);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 703);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 704);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 705);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 706);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 707);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 708);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 709);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (689, 710);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 711);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 712);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 713);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 714);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 715);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 716);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 717);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 718);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 719);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (711, 720);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 721);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 722);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 723);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 724);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 725);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 726);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 727);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 728);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 729);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 730);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 731);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 732);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 733);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 734);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 735);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (721, 736);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 737);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 738);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 739);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 740);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 741);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 742);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 743);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 744);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 745);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (737, 746);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 747);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 748);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 749);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 750);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 751);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 752);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 753);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 754);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 755);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 756);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (747, 757);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (630, 758);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 759);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 760);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 761);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 762);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 763);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 764);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 765);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 766);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 767);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 768);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 769);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 770);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 771);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 772);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 773);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 774);
INSERT INTO resource_relationship (parent_id, children_id) VALUES (758, 775);


--
-- Data for Name: resource_resourcegroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 2);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 3);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 4);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 5);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 6);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 7);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 8);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 9);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 10);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 11);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 12);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 13);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 14);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 15);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 16);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 17);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 18);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 19);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 20);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 21);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 22);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 23);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 24);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 25);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 26);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 27);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 28);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 29);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 30);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 31);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 32);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 33);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 34);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 35);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 36);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 37);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 38);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 39);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 40);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 41);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 42);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 43);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 44);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 45);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 46);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 47);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 48);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 49);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 50);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 51);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 52);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 53);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 54);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 55);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 56);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 57);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 58);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 59);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 60);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 61);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 62);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 63);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 64);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 65);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 66);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 67);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 68);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 69);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 70);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 71);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 72);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 73);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 74);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 75);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 76);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 77);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 78);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 79);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 80);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 81);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 82);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 83);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 84);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 85);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 86);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 87);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 88);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 89);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 90);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 91);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 92);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 93);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 94);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 95);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 96);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 97);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 98);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 99);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 100);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 101);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 102);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 103);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 104);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 105);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 106);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 107);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 108);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 109);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 110);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 111);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 112);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 113);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 114);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 115);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 116);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 117);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 118);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 119);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 120);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 121);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 122);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 123);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 124);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 125);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 126);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 127);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 128);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 129);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 130);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 131);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 132);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 133);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 134);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 135);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 136);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 137);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 138);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 139);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 140);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 141);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 142);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 143);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 144);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 145);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 146);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 147);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 148);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 149);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 150);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 151);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 152);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 153);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 154);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 155);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 156);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 157);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 158);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 159);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 160);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 161);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 162);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 163);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 164);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 165);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 166);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 167);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 168);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 169);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 170);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 171);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 172);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 173);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 174);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 175);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 176);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 177);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 178);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 179);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 180);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 181);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 182);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 183);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 184);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 185);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 186);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 187);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 188);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 189);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 190);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 191);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 192);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 193);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 194);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 195);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 196);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 197);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 198);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 199);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 200);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 201);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 202);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 203);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 204);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 205);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 206);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 207);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 208);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 209);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 210);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 211);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 212);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 213);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 214);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 215);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 216);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 217);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 218);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 219);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 220);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 221);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 222);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 223);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 224);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 225);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 226);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 227);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 228);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 229);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 230);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 231);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 232);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 233);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 234);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 235);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 236);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 237);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 238);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 239);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 240);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 241);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 242);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 243);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 244);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 245);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 246);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 247);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 248);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 249);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 250);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 251);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 252);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 253);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 254);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 255);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 256);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 257);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 258);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 259);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 260);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 261);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 262);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 263);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 264);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 265);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 266);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 267);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 268);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 269);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 270);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 271);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 272);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 273);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 274);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 275);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 276);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 277);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 278);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 279);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 280);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 281);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 282);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 283);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 284);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 285);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 286);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 287);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 288);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 289);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 290);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 291);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 292);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 293);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 294);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 295);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 296);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 297);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 298);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 299);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 300);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 301);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 302);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 303);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 304);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 305);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 306);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 307);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 308);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 309);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 310);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 311);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 312);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 313);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 314);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 315);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 316);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 317);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 318);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 319);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 320);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 321);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 322);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 323);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 324);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 325);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 326);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 327);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 328);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 329);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 330);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 331);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 332);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 333);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 334);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 335);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 336);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 337);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 338);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 339);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 340);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 341);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 342);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 343);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 344);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 345);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 346);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 347);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 348);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 349);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 350);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 351);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 352);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 353);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 354);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 355);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 356);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 357);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 358);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 359);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 360);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 361);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 362);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 363);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 364);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 365);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 366);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 367);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 368);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 369);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 370);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 371);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 372);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 373);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 374);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 375);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 376);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 377);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 378);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 379);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 380);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 381);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 382);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 383);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 384);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 385);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 386);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 387);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 388);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 389);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 390);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 391);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 392);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 393);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 394);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 395);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 396);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 397);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 398);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 399);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 400);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 401);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 402);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 403);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 404);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 405);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 406);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 407);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 408);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 409);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 410);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 411);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 412);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 413);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 414);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 415);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 416);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 417);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 418);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 419);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 420);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 421);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 422);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 423);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 424);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 425);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 426);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 427);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 428);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 429);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 430);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 431);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 432);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 433);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 434);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 435);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 436);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 437);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 438);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 439);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 440);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 441);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 442);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 443);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 444);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 445);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 446);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 447);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 448);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 449);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 450);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 451);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 452);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 453);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 454);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 455);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 456);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 457);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 458);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 459);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 460);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 461);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 462);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 463);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 464);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 465);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 466);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 467);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 468);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 469);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 470);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 471);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 472);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 473);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 474);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 475);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 476);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 477);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 478);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 479);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 480);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 481);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 482);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 483);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 484);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 485);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 486);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 487);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 488);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 489);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 490);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 491);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 492);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 493);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 494);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 495);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 496);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 497);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 498);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 499);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 500);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 501);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 502);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 503);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 504);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 505);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 506);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 507);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 508);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 509);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 510);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 511);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 512);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 513);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 514);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 515);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 516);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 517);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 518);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 519);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 520);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 521);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 522);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 523);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 524);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 525);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 526);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 527);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 528);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 529);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 530);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 531);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 532);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 533);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 534);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 535);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 536);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 537);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 538);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 539);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 540);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 541);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 542);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 543);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 544);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 545);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 546);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 547);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 548);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 549);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 550);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 551);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 552);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 553);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 554);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 555);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 556);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 557);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 558);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 559);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 560);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 561);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 562);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 563);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 564);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 565);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 566);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 567);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 568);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 569);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 570);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 571);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 572);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 573);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 574);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 575);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 576);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 577);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 578);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 579);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 580);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 581);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 582);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 583);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 584);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 585);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 586);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 587);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 588);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 589);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 590);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 591);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 592);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 593);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 594);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 595);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 596);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 597);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 598);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 599);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 600);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 601);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 602);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 603);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 604);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 605);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 606);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 607);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 608);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 609);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 610);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 611);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 612);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 613);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 614);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 615);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 616);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 617);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 618);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 619);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 620);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 621);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 622);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 623);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 624);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 625);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 626);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 627);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 628);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 630);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 631);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 632);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 633);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 634);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 635);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 636);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 637);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 638);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 639);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 640);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 641);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 642);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 643);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 644);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 645);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 646);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 647);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 648);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 649);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 650);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 651);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 652);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 653);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 654);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 655);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 656);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 657);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 658);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 659);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 660);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 661);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 662);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 663);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 664);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 665);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 666);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 667);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 668);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 669);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 670);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 671);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 672);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 673);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 674);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 675);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 676);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 677);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 678);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 679);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 680);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 681);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 682);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 683);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 684);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 685);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 686);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 687);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 688);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 689);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 690);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 691);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 692);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 693);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 694);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 695);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 696);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 697);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 698);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 699);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 700);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 701);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 702);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 703);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 704);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 705);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 706);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 707);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 708);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 709);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 710);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 711);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 712);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 713);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 714);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 715);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 716);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 717);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 718);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 719);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 720);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 721);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 722);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 723);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 724);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 725);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 726);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 727);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 728);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 729);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 730);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 731);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 732);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 733);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 734);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 735);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 736);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 737);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 738);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 739);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 740);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 741);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 742);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 743);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 744);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 745);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 746);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 747);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 748);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 749);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 750);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 751);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 752);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 753);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 754);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 755);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 756);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 757);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 758);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 759);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 760);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 761);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 762);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 763);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 764);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 765);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 766);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 767);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 768);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 769);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 770);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 771);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 772);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 773);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 774);
INSERT INTO resource_resourcegroup (resource_group_id, resource_id) VALUES (1, 775);


--
-- Name: group_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_owner
    ADD CONSTRAINT group_owner_pkey PRIMARY KEY (id);


--
-- Name: metric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY metric
    ADD CONSTRAINT metric_pkey PRIMARY KEY (id);


--
-- Name: metric_resource_group_metric_template_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY metric
    ADD CONSTRAINT metric_resource_group_metric_template_key UNIQUE (resource_group, metric_template);


--
-- Name: metric_template_name_resource_prototype_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY metric_template
    ADD CONSTRAINT metric_template_name_resource_prototype_key UNIQUE (name, resource_prototype);


--
-- Name: metric_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY metric_template
    ADD CONSTRAINT metric_template_pkey PRIMARY KEY (id);


--
-- Name: resource_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_group
    ADD CONSTRAINT resource_group_pkey PRIMARY KEY (id);


--
-- Name: resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resource_property_key_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_property_key
    ADD CONSTRAINT resource_property_key_pkey PRIMARY KEY (id);


--
-- Name: resource_property_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_property_value
    ADD CONSTRAINT resource_property_value_pkey PRIMARY KEY (id);


--
-- Name: resource_prototype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_prototype
    ADD CONSTRAINT resource_prototype_name_key UNIQUE (name);


--
-- Name: resource_prototype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_prototype
    ADD CONSTRAINT resource_prototype_pkey PRIMARY KEY (id);


--
-- Name: resource_relationship_children_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_relationship
    ADD CONSTRAINT resource_relationship_children_id_key UNIQUE (children_id);


--
-- Name: resource_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_relationship
    ADD CONSTRAINT resource_relationship_pkey PRIMARY KEY (parent_id, children_id);


--
-- Name: resource_resourcegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource_resourcegroup
    ADD CONSTRAINT resource_resourcegroup_pkey PRIMARY KEY (resource_id, resource_group_id);


--
-- Name: fk115d5b0e7c2b877a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_group
    ADD CONSTRAINT fk115d5b0e7c2b877a FOREIGN KEY (group_owner) REFERENCES group_owner(id);


--
-- Name: fk19d0e586d497bc72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_property_key
    ADD CONSTRAINT fk19d0e586d497bc72 FOREIGN KEY (resource_prototype) REFERENCES resource_prototype(id);


--
-- Name: fk203b6e29d497bc72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metric_template
    ADD CONSTRAINT fk203b6e29d497bc72 FOREIGN KEY (resource_prototype) REFERENCES resource_prototype(id);


--
-- Name: fk3db7a2c963df5f3c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_relationship
    ADD CONSTRAINT fk3db7a2c963df5f3c FOREIGN KEY (children_id) REFERENCES resource(id);


--
-- Name: fk3db7a2c9f7b430b1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_relationship
    ADD CONSTRAINT fk3db7a2c9f7b430b1 FOREIGN KEY (parent_id) REFERENCES resource(id);


--
-- Name: fk97e5f0c02642df0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_resourcegroup
    ADD CONSTRAINT fk97e5f0c02642df0a FOREIGN KEY (resource_group_id) REFERENCES resource_group(id);


--
-- Name: fk97e5f0c0c5e30acd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_resourcegroup
    ADD CONSTRAINT fk97e5f0c0c5e30acd FOREIGN KEY (resource_id) REFERENCES resource(id);


--
-- Name: fkbfc5f5b078b7a62c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metric
    ADD CONSTRAINT fkbfc5f5b078b7a62c FOREIGN KEY (resource_group) REFERENCES resource_group(id);


--
-- Name: fkbfc5f5b084a3606; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metric
    ADD CONSTRAINT fkbfc5f5b084a3606 FOREIGN KEY (metric_template) REFERENCES metric_template(id);


--
-- Name: fkbfc5f5b0d497bc72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY metric
    ADD CONSTRAINT fkbfc5f5b0d497bc72 FOREIGN KEY (resource_prototype) REFERENCES resource_prototype(id);


--
-- Name: fke9c6aad867f943ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_property_value
    ADD CONSTRAINT fke9c6aad867f943ef FOREIGN KEY (resource) REFERENCES resource(id);


--
-- Name: fke9c6aad873e5032f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource_property_value
    ADD CONSTRAINT fke9c6aad873e5032f FOREIGN KEY (resource_property_key) REFERENCES resource_property_key(id);


--
-- Name: fkebabc40ed497bc72; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT fkebabc40ed497bc72 FOREIGN KEY (resource_prototype) REFERENCES resource_prototype(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

