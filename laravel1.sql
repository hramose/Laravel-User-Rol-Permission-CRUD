--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.9
-- Dumped by pg_dump version 9.4.9
-- Started on 2016-10-30 14:39:07 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11861)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 33776)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE migrations (
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 33795)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE password_resets OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 33852)
-- Name: permission_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permission_role (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE permission_role OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 33850)
-- Name: permission_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permission_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permission_role_id_seq OWNER TO postgres;

--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 183
-- Name: permission_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permission_role_id_seq OWNED BY permission_role.id;


--
-- TOC entry 186 (class 1259 OID 33872)
-- Name: permission_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permission_user (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE permission_user OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 33870)
-- Name: permission_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permission_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permission_user_id_seq OWNER TO postgres;

--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 185
-- Name: permission_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permission_user_id_seq OWNED BY permission_user.id;


--
-- TOC entry 182 (class 1259 OID 33839)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE permissions OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 33837)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 181
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- TOC entry 180 (class 1259 OID 33819)
-- Name: role_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role_user (
    id integer NOT NULL,
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE role_user OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 33817)
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_user_id_seq OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 179
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_user_id_seq OWNED BY role_user.id;


--
-- TOC entry 178 (class 1259 OID 33805)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255),
    level integer DEFAULT 1 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE roles OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 33803)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO postgres;

--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 177
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 175 (class 1259 OID 33781)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    foto character varying(255),
    login character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    fechainicio date,
    fechafin date,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 33779)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 174
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1933 (class 2604 OID 33855)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission_role ALTER COLUMN id SET DEFAULT nextval('permission_role_id_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 33875)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission_user ALTER COLUMN id SET DEFAULT nextval('permission_user_id_seq'::regclass);


--
-- TOC entry 1932 (class 2604 OID 33842)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- TOC entry 1931 (class 2604 OID 33822)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_user ALTER COLUMN id SET DEFAULT nextval('role_user_id_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 33808)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 1927 (class 2604 OID 33784)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2078 (class 0 OID 33776)
-- Dependencies: 173
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO migrations (migration, batch) VALUES ('2014_10_12_000000_create_users_table', 1);
INSERT INTO migrations (migration, batch) VALUES ('2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO migrations (migration, batch) VALUES ('2015_01_15_105324_create_roles_table', 1);
INSERT INTO migrations (migration, batch) VALUES ('2015_01_15_114412_create_role_user_table', 1);
INSERT INTO migrations (migration, batch) VALUES ('2015_01_26_115212_create_permissions_table', 1);
INSERT INTO migrations (migration, batch) VALUES ('2015_01_26_115523_create_permission_role_table', 1);
INSERT INTO migrations (migration, batch) VALUES ('2015_02_09_132439_create_permission_user_table', 1);


--
-- TOC entry 2081 (class 0 OID 33795)
-- Dependencies: 176
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2089 (class 0 OID 33852)
-- Dependencies: 184
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (1, 1, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (2, 2, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (3, 3, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (4, 4, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (5, 5, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (6, 6, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (7, 7, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (8, 8, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (9, 9, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (10, 10, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (11, 11, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_role (id, permission_id, role_id, created_at, updated_at) VALUES (12, 12, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 183
-- Name: permission_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permission_role_id_seq', 12, true);


--
-- TOC entry 2091 (class 0 OID 33872)
-- Dependencies: 186
-- Data for Name: permission_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (1, 1, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (2, 2, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (3, 3, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (4, 4, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (5, 5, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (6, 6, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (7, 7, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (8, 8, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (9, 9, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (10, 10, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (11, 11, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permission_user (id, permission_id, role_id, created_at, updated_at) VALUES (12, 12, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 185
-- Name: permission_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permission_user_id_seq', 12, true);


--
-- TOC entry 2087 (class 0 OID 33839)
-- Dependencies: 182
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (1, 'crear.usuarios', 'Permiso Para Crear Usuario', '2016-10-30 14:17:39', '2016-10-30 14:17:39');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (2, 'eliminar.usuarios', 'Permiso Para Eliminar Usuario', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (3, 'ver.usuarios', 'Permiso Para Ver Usuario', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (4, 'modificar.usuarios', 'Permiso Para Modificar Usuario', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (5, 'crear.perfiles', 'Permiso Para Crear Perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (6, 'eliminar.perfiles', 'Permiso Para Eliminar Perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (7, 'ver.perfiles', 'Permiso Para Ver perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (8, 'modificar.perfiles', 'Permiso para Modificar perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (9, 'crear.permisos', 'Para Crear perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (10, 'eliminar.permisos', 'Para Eliminar Perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (11, 'ver.permisos', 'Para Ver Perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO permissions (id, slug, description, created_at, updated_at) VALUES (12, 'modificar.permisos', 'Para Modificar Perfiles', '2016-10-30 14:17:40', '2016-10-30 14:17:40');


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 181
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permissions_id_seq', 12, true);


--
-- TOC entry 2085 (class 0 OID 33819)
-- Dependencies: 180
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO role_user (id, role_id, user_id, created_at, updated_at) VALUES (1, 1, 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 179
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_user_id_seq', 1, true);


--
-- TOC entry 2083 (class 0 OID 33805)
-- Dependencies: 178
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO roles (id, slug, description, level, created_at, updated_at) VALUES (1, 'root', 'Usuario Super Administrador', 1, '2016-10-30 14:17:40', '2016-10-30 14:17:40');
INSERT INTO roles (id, slug, description, level, created_at, updated_at) VALUES (2, 'admin', 'Usuario Administrador', 2, '2016-10-30 14:17:40', '2016-10-30 14:17:40');


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 177
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 2, true);


--
-- TOC entry 2080 (class 0 OID 33781)
-- Dependencies: 175
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, name, foto, login, email, password, activo, fechainicio, fechafin, remember_token, created_at, updated_at) VALUES (1, 'Tarsicio Carrizales', 've-tarsicio.jpg', 'gerente_tic', 'telecom.com.ve@gmail.com', '$2y$10$ghNJ1figtxH6EYd8Zo97neDrf/LtS0gCnOCwDRqpJG0aCQIdsuG1a', true, '2016-10-30', '2017-04-30', 'BfJLu3bD4tpyK5iGhBpTlYFueogsSWRR2cFs7KbalFjfCHxGKtJxKClk03urMp1smdHOxpffhQOVwNS0naIagmdIIKhO7hm7YrrA', '2016-10-30 14:17:40', '2016-10-30 14:17:40');


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 174
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- TOC entry 1957 (class 2606 OID 33857)
-- Name: permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (id);


--
-- TOC entry 1961 (class 2606 OID 33877)
-- Name: permission_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permission_user
    ADD CONSTRAINT permission_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1952 (class 2606 OID 33847)
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1954 (class 2606 OID 33849)
-- Name: permissions_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_slug_unique UNIQUE (slug);


--
-- TOC entry 1948 (class 2606 OID 33824)
-- Name: role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1944 (class 2606 OID 33814)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 1946 (class 2606 OID 33816)
-- Name: roles_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_slug_unique UNIQUE (slug);


--
-- TOC entry 1936 (class 2606 OID 33794)
-- Name: users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 1938 (class 2606 OID 33792)
-- Name: users_login_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_unique UNIQUE (login);


--
-- TOC entry 1940 (class 2606 OID 33790)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1941 (class 1259 OID 33801)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- TOC entry 1942 (class 1259 OID 33802)
-- Name: password_resets_token_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX password_resets_token_index ON password_resets USING btree (token);


--
-- TOC entry 1955 (class 1259 OID 33868)
-- Name: permission_role_permission_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX permission_role_permission_id_index ON permission_role USING btree (permission_id);


--
-- TOC entry 1958 (class 1259 OID 33869)
-- Name: permission_role_role_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX permission_role_role_id_index ON permission_role USING btree (role_id);


--
-- TOC entry 1959 (class 1259 OID 33888)
-- Name: permission_user_permission_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX permission_user_permission_id_index ON permission_user USING btree (permission_id);


--
-- TOC entry 1962 (class 1259 OID 33889)
-- Name: permission_user_role_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX permission_user_role_id_index ON permission_user USING btree (role_id);


--
-- TOC entry 1949 (class 1259 OID 33835)
-- Name: role_user_role_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX role_user_role_id_index ON role_user USING btree (role_id);


--
-- TOC entry 1950 (class 1259 OID 33836)
-- Name: role_user_user_id_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX role_user_user_id_index ON role_user USING btree (user_id);


--
-- TOC entry 1965 (class 2606 OID 33858)
-- Name: permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE;


--
-- TOC entry 1966 (class 2606 OID 33863)
-- Name: permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 1967 (class 2606 OID 33878)
-- Name: permission_user_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission_user
    ADD CONSTRAINT permission_user_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE;


--
-- TOC entry 1968 (class 2606 OID 33883)
-- Name: permission_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permission_user
    ADD CONSTRAINT permission_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 1963 (class 2606 OID 33825)
-- Name: role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE;


--
-- TOC entry 1964 (class 2606 OID 33830)
-- Name: role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-10-30 14:39:07 VET

--
-- PostgreSQL database dump complete
--

