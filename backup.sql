--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE vagrant;
ALTER ROLE vagrant WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;






--
-- Database creation
--

CREATE DATABASE associations_app_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE associations_app_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE blogapp_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE blogapp_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE bootstrap_app_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE bootstrap_app_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE callback_app_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE callback_app_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE contact_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE contact_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE department WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE goya WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE heroku_test_app2_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE heroku_test_app2_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE mailer_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE mailer_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE manyo_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE manyo_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE practice_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE practice_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE rails_kadai_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE rails_kadai_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE sample3_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE sample3_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE sample_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE sample_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE shasin_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE shasin_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE shasintoukou_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE shasintoukou_test WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE startbootstrap_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE startbootstrap_test WITH TEMPLATE = template0 OWNER = vagrant;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;
CREATE DATABASE tomato WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE tunagari_development WITH TEMPLATE = template0 OWNER = vagrant;
CREATE DATABASE tunagari_test WITH TEMPLATE = template0 OWNER = vagrant;


\connect associations_app_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.authors (
    id bigint NOT NULL,
    name character varying,
    age integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.authors OWNER TO vagrant;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO vagrant;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    content text,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    title character varying,
    price integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    author_id bigint
);


ALTER TABLE public.books OWNER TO vagrant;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO vagrant;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-15 06:28:27.113641	2021-06-15 06:28:27.113641
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.authors (id, name, age, created_at, updated_at) FROM stdin;
1	Tom	20	2021-06-15 06:35:38.222393	2021-06-15 06:35:38.222393
2	Tom	20	2021-06-15 09:00:34.675395	2021-06-15 09:00:34.675395
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.authors_id_seq', 2, true);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.blogs (id, title, content, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.blogs_id_seq', 1, false);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.books (id, title, price, created_at, updated_at, author_id) FROM stdin;
1	Ruby入門	1500	2021-06-15 06:37:52.429808	2021-06-15 06:37:52.429808	1
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.books_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210615062518
20210615062651
20210615063007
20210615063015
20210615063228
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (id, name, email, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_blogs_on_user_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_blogs_on_user_id ON public.blogs USING btree (user_id);


--
-- Name: index_books_on_author_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_books_on_author_id ON public.books USING btree (author_id);


--
-- Name: fk_rails_40ebb3948d; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT fk_rails_40ebb3948d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_53d51ce16a; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT fk_rails_53d51ce16a FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect associations_app_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect blogapp_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-05-31 16:16:00.496811	2021-05-31 16:16:00.496811
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.blogs (id, title, content, created_at, updated_at) FROM stdin;
3	タイトルC	内容C	2021-05-31 16:29:34.049804	2021-05-31 16:29:34.049804
4	タイトルC2	内容C2	2021-05-31 16:29:55.809546	2021-05-31 16:29:55.809546
5	タイトルA	内容A	2021-06-01 02:21:25.00546	2021-06-01 02:21:25.00546
6	タイトルA	内容A	2021-06-01 04:53:12.131245	2021-06-01 04:53:12.131245
7	タイトルB	内容B	2021-06-01 04:55:23.230461	2021-06-01 04:55:23.230461
8	タイトルc1	内容c1	2021-06-01 04:56:11.287631	2021-06-01 04:56:11.287631
9	タイトルc2	内容c2	2021-06-01 04:56:37.971294	2021-06-01 04:56:37.971294
10	タイトルc3	内容c3	2021-06-01 04:57:03.91379	2021-06-01 04:57:03.91379
11	タイトルD3	内容D3	2021-06-01 04:57:21.2543	2021-06-01 04:57:21.2543
12	タイトルD4	内容D4	2021-06-01 04:57:37.623854	2021-06-01 04:57:37.623854
13	タイトルD1	内容D1	2021-06-01 04:58:31.267171	2021-06-01 04:58:31.267171
14	タイトルD2	内容D2	2021-06-01 04:58:43.580971	2021-06-01 04:58:43.580971
15	タイトルE1	内容E1	2021-06-01 04:59:11.606074	2021-06-01 04:59:11.606074
16	タイトルE2	内容E2	2021-06-01 04:59:24.349154	2021-06-01 04:59:24.349154
2	BB	内容B	2021-05-31 16:28:05.293651	2021-06-01 05:08:30.751029
17	Hello!	Today is ...	2021-06-01 06:25:19.269292	2021-06-01 06:25:19.269292
18	GoodMorning!	My Father will...	2021-06-01 06:30:09.102341	2021-06-01 06:30:09.102341
19	I’m fine.	How’s it going?	2021-06-01 06:33:59.473182	2021-06-01 06:33:59.473182
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.blogs_id_seq', 19, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210531161455
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect blogapp_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect bootstrap_app_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: samples; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.samples (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.samples OWNER TO vagrant;

--
-- Name: samples_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.samples_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.samples_id_seq OWNER TO vagrant;

--
-- Name: samples_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.samples_id_seq OWNED BY public.samples.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.samples ALTER COLUMN id SET DEFAULT nextval('public.samples_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-10 06:02:26.090062	2021-06-10 06:02:26.090062
\.


--
-- Data for Name: samples; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.samples (id, title, content, created_at, updated_at) FROM stdin;
23	テスト①	テスト①	2021-06-11 05:07:26.09637	2021-06-11 05:07:26.09637
24	テスト②	テスト②	2021-06-11 05:07:58.161334	2021-06-11 05:07:58.161334
22	テスト③	テスト③	2021-06-11 04:37:39.757488	2021-06-11 05:08:35.154594
\.


--
-- Name: samples_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.samples_id_seq', 24, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210610054018
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: samples_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.samples
    ADD CONSTRAINT samples_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect bootstrap_app_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect callback_app_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.admins (
    id bigint NOT NULL,
    name character varying,
    age integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO vagrant;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO vagrant;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    age integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.admins (id, name, age, created_at, updated_at) FROM stdin;
1	\N	18	2021-06-30 16:02:20.400905	2021-06-30 16:02:20.400905
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-30 09:52:29.472684	2021-06-30 09:52:29.472684
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210630094910
20210630155746
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (id, name, age, created_at, updated_at) FROM stdin;
1	\N	\N	2021-06-30 09:58:50.01992	2021-06-30 09:58:50.01992
2	\N	\N	2021-06-30 09:59:18.411794	2021-06-30 09:59:18.411794
3	Taro	\N	2021-06-30 09:59:36.625576	2021-06-30 09:59:36.625576
4	\N	\N	2021-06-30 15:53:10.135134	2021-06-30 15:53:10.135134
5	\N	18	2021-06-30 16:02:06.822921	2021-06-30 16:02:06.822921
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect callback_app_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect contact_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: contents; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.contents (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    content character varying
);


ALTER TABLE public.contents OWNER TO vagrant;

--
-- Name: contents_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contents_id_seq OWNER TO vagrant;

--
-- Name: contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.contents_id_seq OWNED BY public.contents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.contents ALTER COLUMN id SET DEFAULT nextval('public.contents_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-05 16:26:46.548854	2021-06-05 16:26:46.548854
\.


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.contents (id, name, email, content) FROM stdin;
1	\N	\N	\N
2	\N	\N	\N
3	市川	a@gmail.com	お問い合わせ内容
4	\N		
5	\N		
6	\N		
7	\N		
8	\N		
9	\N		
10	\N	\N	\N
11	\N	\N	\N
12	\N	\N	\N
13	\N	\N	\N
14	\N	\N	\N
15	\N	\N	\N
16	\N	\N	\N
17	\N		
18	\N		
19	\N	ｆだだｓががｇ	
20	daldl	ldlslal	lslalslalls
21	khfdd		kjhggffdss
22	khfdd	kjhgg	mnbghjul
23	khfdd	kjhgg	mnbghjul
24	khfdd	kjhgg	mnbghjul
25	khfdd	kjhgg	mnbghjul
26			fafaf
27	fsa		fafaf
28	daafafa	dafa	daafafa
29	aaaa	aaaaa	aaaaaa
30	aaaaa	aaaaa	aaaa
31	aaaa	aaaa	aaaa
32	あああ	sssss	gggggg
33	aaa	aaaa	aaa
34	a	a	a
35	a	a	a
36	hh	hhh	nnn
\.


--
-- Name: contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.contents_id_seq', 36, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210605155415
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contents_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT contents_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect contact_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect department

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: divisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divisions (
    division_id integer,
    division_name text
);


ALTER TABLE public.divisions OWNER TO postgres;

--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    member_id integer,
    name text,
    division_id integer
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divisions (division_id, division_name) FROM stdin;
101	営業部
102	人事部
103	システム部
104	総務部
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (member_id, name, division_id) FROM stdin;
1	 佐藤 	103
2	 鈴木 	101
3	 田中 	103
4	 伊藤 	104
5	 渡辺 	104
6	 山本 	103
7	 中村 	102
8	 小林 	101
9	 加藤 	103
10	 吉田 	102
11	 山田 	103
12	 佐々木 	103
\.


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect goya

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: crops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crops (
    length double precision,
    weight integer,
    quality boolean,
    give_for text,
    date date
);


ALTER TABLE public.crops OWNER TO postgres;

--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    give_for text,
    price integer
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Data for Name: crops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.crops (length, weight, quality, give_for, date) FROM stdin;
25.5	256	t	妻の実家	2015-06-21
12.5	105	t	自家消費	2015-06-21
14	118	t	自家消費	2015-06-23
28	344	t	自家消費	2015-06-26
11.5	92	f	自家消費	2015-06-26
27.5	330	t	自家消費	2015-06-27
24.5	324	t	自家消費	2015-06-27
29	374	t	総務のおばちゃん	2015-06-29
32.5	462	t	自家消費	2015-07-02
30	410	t	妻の実家	2015-07-04
20.5	153	t	自家消費	2015-07-04
30.5	320	t	会社の同僚	2015-07-09
32	331	t	自家消費	2015-07-11
27	266	t	自家消費	2015-07-15
28	278	t	会社の同僚	2015-07-16
27.5	249	t	総務のおばちゃん	2015-07-16
25.5	226	t	自家消費	2015-07-18
29	276	t	自家消費	2015-07-21
27.5	212	t	自家消費	2015-07-23
24	200	t	自家消費	2015-07-23
17	175	t	妻の実家	2015-07-25
15.5	107	f	自家消費	2015-07-26
21.5	143	t	自家消費	2015-07-28
24	195	t	総務のおばちゃん	2015-07-30
19.5	163	t	自家消費	2015-07-30
24	194	t	総務のおばちゃん	2015-07-31
22	162	t	自家消費	2015-07-31
22	159	t	妻の実家	2015-07-31
21	167	t	妻の実家	2015-07-31
22.5	191	t	自家消費	2015-08-01
21.5	175	t	自家消費	2015-08-01
21.5	134	t	自家消費	2015-08-01
20	184	t	自家消費	2015-08-01
19	145	f	自家消費	2015-08-01
21.5	212	t	自家消費	2015-08-02
17	140	t	妻の実家	2015-08-02
23	235	t	自家消費	2015-08-04
18.5	173	f	自家消費	2015-08-04
25.5	225	t	会社の同僚	2015-08-06
23	230	t	総務のおばちゃん	2015-08-06
24.5	257	t	総務のおばちゃん	2015-08-07
19	187	t	自家消費	2015-08-07
16	115	t	自家消費	2015-08-07
26.5	297	t	自家消費	2015-08-09
26.5	293	t	自家消費	2015-08-10
21.5	230	t	自家消費	2015-08-10
21	230	t	自家消費	2015-08-10
16	201	t	自家消費	2015-08-10
23.5	253	t	自家消費	2015-08-11
23	256	t	自家消費	2015-08-11
21.5	212	t	妻の実家	2015-08-11
17.5	165	t	妻の実家	2015-08-11
11.5	133	t	妻の実家	2015-08-11
24	233	t	自家消費	2015-08-15
20	222	t	妻の実家	2015-08-15
18.5	168	t	自家消費	2015-08-15
18	121	t	自家消費	2015-08-15
17	153	t	妻の実家	2015-08-15
9.5	25	f	自家消費	2015-08-15
17.5	200	t	自家消費	2015-08-16
16	158	t	自家消費	2015-08-16
12	109	t	自家消費	2015-08-16
14.5	129	t	総務のおばちゃん	2015-08-18
8	88	t	総務のおばちゃん	2015-08-18
8	67	f	自家消費	2015-08-19
16	160	t	会社の同僚	2015-08-21
7.5	66	t	自家消費	2015-08-21
15.5	117	t	自家消費	2015-08-22
11	73	t	自家消費	2015-08-27
9	56	t	自家消費	2015-08-27
19	172	t	会社の同僚	2015-08-28
12	100	t	妻の友人	2015-08-28
10.5	95	t	自家消費	2015-08-28
9.5	76	t	会社の同僚	2015-08-28
16.5	147	t	自家消費	2015-08-30
17.5	133	t	総務のおばちゃん	2015-09-01
14.5	164	t	総務のおばちゃん	2015-09-01
19.5	194	t	自家消費	2015-09-04
14.5	160	t	総務のおばちゃん	2015-09-04
14	139	t	総務のおばちゃん	2015-09-04
19	199	t	妻の実家	2015-09-06
18	102	t	いとこ	2015-09-06
16.5	162	t	いとこ	2015-09-06
15.5	146	t	妻の実家	2015-09-06
13	140	t	妻の実家	2015-09-06
12	119	t	いとこ	2015-09-06
11.5	122	t	自家消費	2015-09-06
11.5	95	t	総務のおばちゃん	2015-09-06
11	102	t	自家消費	2015-09-06
9.5	100	t	妻の実家	2015-09-06
19	190	t	総務のおばちゃん	2015-09-07
17	187	t	自家消費	2015-09-09
13.5	132	t	自家消費	2015-09-09
16	148	t	自家消費	2015-09-10
22.5	267	t	総務のおばちゃん	2015-09-11
16.5	191	t	会社の同僚	2015-09-11
8.5	73	f	自家消費	2015-09-11
17	184	t	自家消費	2015-09-13
17	181	t	自家消費	2015-09-13
12	86	t	自家消費	2015-09-13
11	66	t	自家消費	2015-09-13
10.5	107	t	自家消費	2015-09-13
22	214	t	総務のおばちゃん	2015-09-14
22	196	t	自家消費	2015-09-14
18	167	t	総務のおばちゃん	2015-09-14
16	185	t	自家消費	2015-09-14
15.5	119	t	自家消費	2015-09-14
15	160	t	総務のおばちゃん	2015-09-14
13	106	f	自家消費	2015-09-14
12.5	116	t	総務のおばちゃん	2015-09-14
12	107	t	自家消費	2015-09-14
22	255	t	自家消費	2015-09-17
20.5	191	t	自家消費	2015-09-17
16.5	115	t	自家消費	2015-09-17
22.5	209	t	会社の同僚	2015-09-18
20.5	161	t	総務のおばちゃん	2015-09-18
18	175	t	総務のおばちゃん	2015-09-18
14.5	119	t	自家消費	2015-09-18
24	239	t	友人	2015-09-20
22	220	t	友人	2015-09-20
21.5	225	t	妻の実家	2015-09-20
16	127	f	自家消費	2015-09-20
15.5	119	f	自家消費	2015-09-20
14	128	f	自家消費	2015-09-20
13.5	127	t	自家消費	2015-09-20
12.5	45	f	自家消費	2015-09-20
10	122	f	自家消費	2015-09-20
10	81	f	自家消費	2015-09-20
9	52	t	自家消費	2015-09-20
22	197	t	自家消費	2015-09-21
13.5	91	t	自家消費	2015-09-21
8	44	t	自家消費	2015-09-21
19.5	162	t	自家消費	2015-09-26
17.5	133	t	自家消費	2015-09-26
16.5	131	t	自家消費	2015-09-27
13.5	116	f	自家消費	2015-09-27
24.5	199	f	総務のおばちゃん	2015-09-30
19.5	155	f	自家消費	2015-10-03
16	123	f	自家消費	2015-10-03
15	93	t	自家消費	2015-10-03
8.5	46	t	自家消費	2015-10-03
25	215	t	自家消費	2015-10-10
15	51	f	自家消費	2015-10-10
13.5	68	t	自家消費	2015-10-10
10	56	t	自家消費	2015-10-17
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (give_for, price) FROM stdin;
いとこ	100
会社の同僚	150
妻の実家	0
妻の友人	50
自家消費	0
総務のおばちゃん	200
友人	100
\.


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect heroku_test_app2_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect heroku_test_app2_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect mailer_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO vagrant;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO vagrant;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-15 15:01:46.022266	2021-06-15 15:01:46.022266
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.contacts (id, name, email, content, created_at, updated_at) FROM stdin;
2	市川	yoiyoiman4416@gmail.com	テスト	2021-06-15 15:51:17.654319	2021-06-15 15:51:17.654319
3	テスト	yoiyoiman0318@outlook.jp 	市川	2021-06-15 15:55:02.355072	2021-06-15 15:55:02.355072
4	テスト	yoiyoiman0318@outlook.jp 	ｆさｄｆさｆさ	2021-06-15 16:09:32.555894	2021-06-15 16:09:32.555894
5	市川	yoiyoiman4416@gmail.com	テスト	2021-06-15 16:11:23.47759	2021-06-15 16:11:23.47759
6	いち			2021-06-15 16:16:17.825538	2021-06-15 16:16:17.825538
7	いち	yoiyoiman4416@gmail.com	あ	2021-06-15 16:17:59.327103	2021-06-15 16:17:59.327103
8	いち	yoiyoiman4416@gmail.com	ｓｆｇ	2021-06-15 16:24:17.824823	2021-06-15 16:24:17.824823
9	ｄｆｇｆ			2021-06-16 01:40:43.472422	2021-06-16 01:40:43.472422
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.contacts_id_seq', 9, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210615150103
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect mailer_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect manyo_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    name character varying,
    content character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks OWNER TO vagrant;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO vagrant;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-07-01 05:33:13.179189	2021-07-01 05:33:13.179189
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210701051837
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.tasks (id, name, content, created_at, updated_at) FROM stdin;
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.tasks_id_seq', 2, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect manyo_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect practice_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect practice_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect rails_kadai_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    content text,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image text
);


ALTER TABLE public.blogs OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    contact text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO vagrant;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO vagrant;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint,
    blog_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.favorites OWNER TO vagrant;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO vagrant;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image text
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-17 16:06:12.572175	2021-06-17 16:06:12.572175
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.blogs (id, title, content, user_id, created_at, updated_at, image) FROM stdin;
9	子供の写真	かわいい	3	2021-06-21 05:41:43.692216	2021-06-21 05:41:43.692216	DSC_0037.JPG
8	体温計	平熱	1	2021-06-18 07:10:34.367132	2021-06-21 05:42:25.649392	DSC_0023.JPG
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.blogs_id_seq', 9, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.contacts (id, name, email, contact, created_at, updated_at) FROM stdin;
1				2021-06-21 01:46:05.984466	2021-06-21 01:46:05.984466
2	市川	yoiyoiman4416@gmail.com	aa	2021-06-21 02:42:18.569099	2021-06-21 02:42:18.569099
3	市川	yoiyoiman4416@gmail.com	aa	2021-06-21 02:44:05.696226	2021-06-21 02:44:05.696226
4	yt	aden.yi21120821@gmail.com		2021-06-21 02:48:11.762417	2021-06-21 02:48:11.762417
5	yt	aden.yi21120821@gmail.com		2021-06-21 02:50:12.57889	2021-06-21 02:50:12.57889
6	yt	aden.yi21120821@gmail.com		2021-06-21 02:50:51.03758	2021-06-21 02:50:51.03758
7	s	aden.yi21120821@gmail.com	dfa	2021-06-21 02:53:00.468175	2021-06-21 02:53:00.468175
8	fafa			2021-06-21 03:05:21.181286	2021-06-21 03:05:21.181286
9	fafa			2021-06-21 03:05:24.045415	2021-06-21 03:05:24.045415
10	fafa			2021-06-21 03:07:50.716811	2021-06-21 03:07:50.716811
11	fafa			2021-06-21 03:08:03.016001	2021-06-21 03:08:03.016001
12	fafa			2021-06-21 03:08:16.977387	2021-06-21 03:08:16.977387
13	fafa			2021-06-21 03:08:29.100711	2021-06-21 03:08:29.100711
14	fafa			2021-06-21 03:08:44.441011	2021-06-21 03:08:44.441011
15	fafa			2021-06-21 03:11:50.431009	2021-06-21 03:11:50.431009
16	fafa			2021-06-21 03:11:56.216426	2021-06-21 03:11:56.216426
17	市川	aden.yi44162112@gmail.com	itikawa	2021-06-21 03:14:50.049502	2021-06-21 03:14:50.049502
18	市川	aden.yi44162112@gmail.com	itikawa	2021-06-21 03:16:43.853848	2021-06-21 03:16:43.853848
19	fafa			2021-06-21 03:22:57.279772	2021-06-21 03:22:57.279772
20	fafa			2021-06-21 03:23:18.617362	2021-06-21 03:23:18.617362
21	fafa			2021-06-21 03:23:51.570168	2021-06-21 03:23:51.570168
22	fafa			2021-06-21 03:23:59.856023	2021-06-21 03:23:59.856023
23	fafa			2021-06-21 03:24:23.050282	2021-06-21 03:24:23.050282
24	fafa			2021-06-21 03:25:08.22894	2021-06-21 03:25:08.22894
25				2021-06-21 03:25:38.541789	2021-06-21 03:25:38.541789
26				2021-06-21 03:26:16.575379	2021-06-21 03:26:16.575379
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.contacts_id_seq', 26, true);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.favorites (id, user_id, blog_id, created_at, updated_at) FROM stdin;
3	1	9	2021-06-21 07:42:52.814144	2021-06-21 07:42:52.814144
\.


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.favorites_id_seq', 3, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210614042819
20210614053756
20210615115122
20210615140155
20210617041425
20210621013408
20210621065152
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (id, name, email, password_digest, created_at, updated_at, image) FROM stdin;
1	市川	a@a.com	$2a$12$6vjluZ2AU6Q.VCkTH6k6mOMvTg6.t.s6U6aWA.uuY7rhOxAX7Vlty	2021-06-17 16:09:16.475622	2021-06-17 16:09:16.475622	\N
2	岸	k@k.cpm	$2a$12$2moFEDvRXWkoY2sEB7zEQ.Ita/nEiwLUySo8vlatYlGRUFRqF4Dl6	2021-06-18 05:21:00.520502	2021-06-18 05:21:00.520502	\N
3	森	b@b.com	$2a$12$nvSvrnBq77NsXMeIPw1T1Oew.7W/IBqplV7pbQ9D9dk5sk1pnHwUK	2021-06-21 05:40:43.78538	2021-06-21 05:40:43.78538	\N
4	yoshi	yoiyoima4416@gmail.com	$2a$12$mfGgMfNYlBeosks6XsdM4uPejCLjRwuTsdAhRGmtxkNbGfZGWhXZq	2021-06-21 05:47:27.110051	2021-06-21 05:47:27.110051	\N
7	yoshi	yoiyoiman4416@gmail.com	$2a$12$mr0O2AWgK9EBBk6vm.4yp.AG/HDBoLbMfNbIRJTg8DToWvZfKEMTq	2021-06-21 05:50:36.652136	2021-06-21 05:50:36.652136	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_blogs_on_user_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_blogs_on_user_id ON public.blogs USING btree (user_id);


--
-- Name: index_favorites_on_blog_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_favorites_on_blog_id ON public.favorites USING btree (blog_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: fk_rails_40ebb3948d; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT fk_rails_40ebb3948d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_4308a0913a; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_4308a0913a FOREIGN KEY (blog_id) REFERENCES public.blogs(id);


--
-- Name: fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect rails_kadai_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect sample3_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-05 12:34:58.902634	2021-06-05 12:34:58.902634
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.blogs (id, title, content, created_at, updated_at) FROM stdin;
1	,jjjlh		2021-06-05 12:40:04.102053	2021-06-05 12:40:04.102053
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.blogs_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210605123409
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect sample3_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect sample_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    content text
);


ALTER TABLE public.blogs OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO vagrant;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-04 15:19:24.97763	2021-06-04 15:19:24.97763
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.blogs (id, title, content) FROM stdin;
8	hjkkk	kjhhh
11	雪男	雪女
12	いｋｄかｋ	だあｆ
13	kkjhg	
14	aiidaifdlsafa	nvvdsajldl;sak;fdsa
5	テスト	あいうえお
15	ｋｄｋｋｋｓ	kdkakka
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.blogs_id_seq', 15, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210601155536
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect sample_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect shasin_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: favorites; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint,
    picture_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.favorites OWNER TO vagrant;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO vagrant;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: pictures; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.pictures (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint,
    img text
);


ALTER TABLE public.pictures OWNER TO vagrant;

--
-- Name: pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.pictures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_id_seq OWNER TO vagrant;

--
-- Name: pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    img text
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO vagrant;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-22 15:51:43.057707	2021-06-22 15:51:43.057707
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.favorites (id, user_id, picture_id, created_at, updated_at) FROM stdin;
26	1	16	2021-06-24 02:32:11.828097	2021-06-24 02:32:11.828097
27	1	17	2021-06-24 02:56:19.86839	2021-06-24 02:56:19.86839
28	5	22	2021-06-24 05:29:28.609099	2021-06-24 05:29:28.609099
29	1	13	2021-06-24 13:57:04.6691	2021-06-24 13:57:04.6691
30	1	18	2021-06-25 01:52:39.673373	2021-06-25 01:52:39.673373
31	1	46	2021-06-25 02:08:41.223701	2021-06-25 02:08:41.223701
\.


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.favorites_id_seq', 31, true);


--
-- Data for Name: pictures; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.pictures (id, title, content, created_at, updated_at, user_id, img) FROM stdin;
13	休日	休日	2021-06-23 16:52:01.465383	2021-06-23 16:52:01.465383	5	\N
15	んんんん	んんんｎ	2021-06-23 17:15:11.712695	2021-06-23 17:15:11.712695	5	\N
16	ふぁあｆ	ｆさふぁ	2021-06-23 17:51:04.311221	2021-06-23 17:51:04.311221	5	\N
17	ｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈｈ	ｈｈｈｈｈｈｈ	2021-06-23 17:51:20.68038	2021-06-23 17:51:20.68038	5	\N
18	gjkgkgk	gkjkkhk	2021-06-23 18:53:32.335563	2021-06-23 18:53:32.335563	5	\N
22	aaa	aaaaa	2021-06-24 05:20:55.93058	2021-06-24 05:20:55.93058	1	DSC_0021.JPG
14	市川	ｄｓふぁ	2021-06-23 16:57:08.248974	2021-06-24 05:59:59.874786	5	\N
23	fdsda	fafa	2021-06-24 07:42:59.72298	2021-06-24 07:42:59.72298	5	\N
24	fdsda	fafa	2021-06-24 07:46:47.45067	2021-06-24 07:46:47.45067	5	\N
25	fdsda	fafa	2021-06-24 07:49:35.8835	2021-06-24 07:49:35.8835	5	\N
26	fdsda	fafa	2021-06-24 07:50:12.976381	2021-06-24 07:50:12.976381	5	\N
27	fdsda	fafa	2021-06-24 07:52:31.20665	2021-06-24 07:52:31.20665	5	\N
28	fdsda	fafa	2021-06-24 07:52:49.868643	2021-06-24 07:52:49.868643	5	\N
29	fdsda	fafa	2021-06-24 07:56:09.843098	2021-06-24 07:56:09.843098	5	\N
30	aaaa	aaaa	2021-06-24 07:56:34.611721	2021-06-24 07:56:34.611721	5	\N
31	aa	aaa	2021-06-24 08:17:12.65668	2021-06-24 08:17:12.65668	5	\N
32	aa	aaa	2021-06-24 08:19:18.102132	2021-06-24 08:19:18.102132	5	\N
33	aaa	aaa	2021-06-24 08:23:36.826619	2021-06-24 08:23:36.826619	5	\N
34	aaa	aaa	2021-06-24 08:26:12.106237	2021-06-24 08:26:12.106237	5	\N
35	aaa	aaa	2021-06-24 08:32:04.796863	2021-06-24 08:32:04.796863	5	\N
36	aaaa	aaa	2021-06-24 08:34:43.767813	2021-06-24 08:34:43.767813	5	\N
37	aaaa	aaa	2021-06-24 08:36:38.957666	2021-06-24 08:36:38.957666	5	\N
38	aaaa	aaa	2021-06-24 08:37:31.136064	2021-06-24 08:37:31.136064	5	\N
39	aaaa	aaa	2021-06-24 08:37:50.049913	2021-06-24 08:37:50.049913	5	\N
40	aaaaaaa	aaaaaaaaaaaaa	2021-06-24 08:39:56.634059	2021-06-24 08:39:56.634059	5	\N
41	aaaaaaa	aaaaaaaaaaaaa	2021-06-24 08:40:36.239455	2021-06-24 08:40:36.239455	5	\N
42	aaaaaaa	aaaaaaaaaaaaa	2021-06-24 08:48:02.474212	2021-06-24 08:48:02.474212	5	\N
43	aaaaaa	aaaaaa	2021-06-24 09:00:47.404944	2021-06-24 09:00:47.404944	5	\N
44	aaaaaa	aaaaaa	2021-06-24 09:14:58.209042	2021-06-24 09:14:58.209042	5	\N
45	aaaaa	aaaaaa	2021-06-24 09:16:01.342941	2021-06-24 09:16:01.342941	5	\N
46	fdsafa	fsafafa	2021-06-24 13:09:33.666539	2021-06-24 13:09:33.666539	5	DSC_0027.JPG
47	体温計	体温計	2021-06-24 15:38:48.556549	2021-06-24 15:38:48.556549	6	DSC_0023.JPG
49	今日のタスク　	皿洗い、風呂洗い、食事作成、寝かしつけ、掃除洗濯	2021-06-26 12:49:28.295989	2021-06-26 12:49:28.295989	1	DSC_0022.JPG
\.


--
-- Name: pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.pictures_id_seq', 49, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210622032155
20210622084450
20210622091816
20210622155440
20210623015028
20210623161111
20210623161327
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (id, name, email, password_digest, created_at, updated_at, img) FROM stdin;
3	高橋	an@a.com	$2a$12$7VNQLaWsd/ViOGvhkt29feOWnoM2a7Slk4Irlb3M8v0/3MP/pR.nW	2021-06-23 01:38:46.016935	2021-06-23 01:38:46.016935	\N
4	宮本	a1@a.com	$2a$12$DbM1G9SnkvTzyC2DQycVrOzJc5tsURDXqIKh67O16Ba23I.vc9UTS	2021-06-23 01:40:02.793968	2021-06-23 01:40:02.793968	\N
1	市川	a@a.com	$2a$12$bw3el8i3OHuP6LqZ4h11DOoRxtkPgfEbAxQfdDUA/es.XbTRnJvBq	2021-06-22 16:06:50.79017	2021-06-24 05:21:20.746512	DSC_0021.JPG
5	akasaka	aka@a.com	$2a$12$sPKD.dYh/TmCosTZULPw6uAalilcS2Q5bpYhu.BpjUb7D.BFB3OJm	2021-06-23 05:59:15.794381	2021-06-24 05:29:03.656946	DSC_0030_1.JPG
6	石井	will.ichikawa.y@gmail.com	$2a$12$C81bM7BX0GuIuNLSIb/DCe1IrXrcQoSdOVa2KM9jMqFpmgxfPVT7i	2021-06-24 15:38:04.455449	2021-06-24 15:38:04.455449	\N
7	中村	ab@a.com	$2a$12$8T03SER0WAm8AOJnvMqiaOHfgBuetnknYUvWgCkHgbyY8TtVuLxu2	2021-06-26 06:50:36.369192	2021-06-26 06:50:36.369192	\N
8	テスト	p@a.com	$2a$12$6hGK6wFYv2XbGqNXt/gRoOIjxxGph9D3tirChRVT..8CTGH3QUjl2	2021-06-26 07:07:16.813624	2021-06-26 07:07:16.813624	\N
9	koki	yoiyoiman4416@gmail.com	$2a$12$DBQoWBBRC.RXfBeTkb5X7OVQVrygNz7bMabhuzj5nQorphVeuhWGu	2021-06-26 07:08:05.484575	2021-06-26 07:08:05.484575	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_favorites_on_picture_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_favorites_on_picture_id ON public.favorites USING btree (picture_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_pictures_on_user_id; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE INDEX index_pictures_on_user_id ON public.pictures USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: vagrant
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: fk_rails_3268570edc; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT fk_rails_3268570edc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: fk_rails_d0b788dd5f; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d0b788dd5f FOREIGN KEY (picture_id) REFERENCES public.pictures(id);


--
-- Name: fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect shasin_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect shasintoukou_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect shasintoukou_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect startbootstrap_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: straps; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.straps (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.straps OWNER TO vagrant;

--
-- Name: straps_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.straps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.straps_id_seq OWNER TO vagrant;

--
-- Name: straps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.straps_id_seq OWNED BY public.straps.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.straps ALTER COLUMN id SET DEFAULT nextval('public.straps_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-21 09:28:07.700309	2021-06-21 09:28:07.700309
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210621085721
\.


--
-- Data for Name: straps; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.straps (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: straps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.straps_id_seq', 1, false);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: straps_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.straps
    ADD CONSTRAINT straps_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect startbootstrap_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect tomato

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tastes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tastes (
    date date,
    score integer,
    memo text
);


ALTER TABLE public.tastes OWNER TO postgres;

--
-- Name: temperatures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temperatures (
    max double precision,
    min double precision,
    rain_flg boolean,
    date date
);


ALTER TABLE public.temperatures OWNER TO postgres;

--
-- Data for Name: tastes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tastes (date, score, memo) FROM stdin;
\.


--
-- Data for Name: temperatures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temperatures (max, min, rain_flg, date) FROM stdin;
\.


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect tunagari_development

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.movies (
    id bigint NOT NULL,
    title character varying,
    production_year integer,
    running_time integer,
    rating text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.movies OWNER TO vagrant;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO vagrant;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    content text
);


ALTER TABLE public.posts OWNER TO vagrant;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO vagrant;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-06-08 02:44:57.517987	2021-06-08 02:44:57.517987
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.movies (id, title, production_year, running_time, rating, created_at, updated_at) FROM stdin;
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.movies_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.posts (id, content) FROM stdin;
63	こんにちは！
64	あいうえおかきくけこさしすせそたちつてとなにぬねの
65	fsafafdafa
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.posts_id_seq', 65, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210608023416
20210630053539
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: movies_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect tunagari_test

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO vagrant;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.movies (
    id bigint NOT NULL,
    title character varying,
    production_year integer,
    running_time integer,
    rating text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.movies OWNER TO vagrant;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO vagrant;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    content text
);


ALTER TABLE public.posts OWNER TO vagrant;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO vagrant;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO vagrant;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	test	2021-06-30 05:40:34.712456	2021-06-30 05:40:34.712456
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.movies (id, title, production_year, running_time, rating, created_at, updated_at) FROM stdin;
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.movies_id_seq', 1, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.posts (id, content) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.schema_migrations (version) FROM stdin;
20210630053539
20210608023416
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: movies_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

