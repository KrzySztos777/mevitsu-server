--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2
/*
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;
*/
--
-- Name: auth_activation_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_activation_attempts (
    id integer NOT NULL,
    ip_address character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    token character varying(255),
    created_at timestamp without time zone NOT NULL
);


--ALTER TABLE public.auth_activation_attempts OWNER TO postgres;

--
-- Name: auth_activation_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_activation_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_activation_attempts_id_seq OWNER TO postgres;

--
-- Name: auth_activation_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_activation_attempts_id_seq OWNED BY public.auth_activation_attempts.id;


--
-- Name: auth_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


--ALTER TABLE public.auth_groups OWNER TO postgres;

--
-- Name: auth_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_groups_id_seq OWNER TO postgres;

--
-- Name: auth_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_groups_id_seq OWNED BY public.auth_groups.id;


--
-- Name: auth_groups_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_groups_permissions (
    group_id integer DEFAULT 0 NOT NULL,
    permission_id integer DEFAULT 0 NOT NULL
);


--ALTER TABLE public.auth_groups_permissions OWNER TO postgres;

--
-- Name: auth_groups_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_groups_users (
    group_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL
);


--ALTER TABLE public.auth_groups_users OWNER TO postgres;

--
-- Name: auth_logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_logins (
    id integer NOT NULL,
    ip_address character varying(255),
    email character varying(255),
    user_id integer,
    date timestamp without time zone NOT NULL,
    success smallint NOT NULL
);


--ALTER TABLE public.auth_logins OWNER TO postgres;

--
-- Name: auth_logins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_logins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_logins_id_seq OWNER TO postgres;

--
-- Name: auth_logins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_logins_id_seq OWNED BY public.auth_logins.id;


--
-- Name: auth_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permissions (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


--ALTER TABLE public.auth_permissions OWNER TO postgres;

--
-- Name: auth_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permissions_id_seq OWNED BY public.auth_permissions.id;


--
-- Name: auth_reset_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_reset_attempts (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    ip_address character varying(255) NOT NULL,
    user_agent character varying(255) NOT NULL,
    token character varying(255),
    created_at timestamp without time zone NOT NULL
);


--ALTER TABLE public.auth_reset_attempts OWNER TO postgres;

--
-- Name: auth_reset_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_reset_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_reset_attempts_id_seq OWNER TO postgres;

--
-- Name: auth_reset_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_reset_attempts_id_seq OWNED BY public.auth_reset_attempts.id;


--
-- Name: auth_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_tokens (
    id integer NOT NULL,
    selector character varying(255) NOT NULL,
    "hashedValidator" character varying(255) NOT NULL,
    user_id integer NOT NULL,
    expires timestamp without time zone NOT NULL
);


--ALTER TABLE public.auth_tokens OWNER TO postgres;

--
-- Name: auth_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_tokens_id_seq OWNER TO postgres;

--
-- Name: auth_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_tokens_id_seq OWNED BY public.auth_tokens.id;


--
-- Name: auth_users_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_users_permissions (
    user_id integer DEFAULT 0 NOT NULL,
    permission_id integer DEFAULT 0 NOT NULL
);


--ALTER TABLE public.auth_users_permissions OWNER TO postgres;

--
-- Name: ci_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ci_sessions (
    id character varying(128) NOT NULL,
    ip_address inet NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    data bytea DEFAULT '\x'::bytea NOT NULL
);


--ALTER TABLE public.ci_sessions OWNER TO postgres;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id bigint NOT NULL,
    version character varying(255) NOT NULL,
    class character varying(255) NOT NULL,
    "group" character varying(255) NOT NULL,
    namespace character varying(255) NOT NULL,
    "time" integer NOT NULL,
    batch integer NOT NULL
);


--ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(30),
    password_hash character varying(255) NOT NULL,
    reset_hash character varying(255),
    reset_at timestamp without time zone,
    reset_expires timestamp without time zone,
    activate_hash character varying(255),
    status character varying(255),
    status_message character varying(255),
    active smallint DEFAULT 0 NOT NULL,
    force_pass_reset smallint DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


--ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

--ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: auth_activation_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_activation_attempts ALTER COLUMN id SET DEFAULT nextval('public.auth_activation_attempts_id_seq'::regclass);


--
-- Name: auth_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_groups_id_seq'::regclass);


--
-- Name: auth_logins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_logins ALTER COLUMN id SET DEFAULT nextval('public.auth_logins_id_seq'::regclass);


--
-- Name: auth_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_permissions_id_seq'::regclass);


--
-- Name: auth_reset_attempts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_reset_attempts ALTER COLUMN id SET DEFAULT nextval('public.auth_reset_attempts_id_seq'::regclass);


--
-- Name: auth_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_tokens ALTER COLUMN id SET DEFAULT nextval('public.auth_tokens_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ci_sessions ci_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ci_sessions
    ADD CONSTRAINT ci_sessions_pkey PRIMARY KEY (id);


--
-- Name: auth_activation_attempts pk_auth_activation_attempts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_activation_attempts
    ADD CONSTRAINT pk_auth_activation_attempts PRIMARY KEY (id);


--
-- Name: auth_groups pk_auth_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_groups
    ADD CONSTRAINT pk_auth_groups PRIMARY KEY (id);


--
-- Name: auth_logins pk_auth_logins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_logins
    ADD CONSTRAINT pk_auth_logins PRIMARY KEY (id);


--
-- Name: auth_permissions pk_auth_permissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permissions
    ADD CONSTRAINT pk_auth_permissions PRIMARY KEY (id);


--
-- Name: auth_reset_attempts pk_auth_reset_attempts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_reset_attempts
    ADD CONSTRAINT pk_auth_reset_attempts PRIMARY KEY (id);


--
-- Name: auth_tokens pk_auth_tokens; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_tokens
    ADD CONSTRAINT pk_auth_tokens PRIMARY KEY (id);


--
-- Name: migrations pk_migrations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT pk_migrations PRIMARY KEY (id);


--
-- Name: users pk_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- Name: users users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email UNIQUE (email);


--
-- Name: users users_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username UNIQUE (username);


--
-- Name: auth_groups_permissions_group_id_permission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_groups_permissions_group_id_permission_id ON public.auth_groups_permissions USING btree (group_id, permission_id);


--
-- Name: auth_groups_users_group_id_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_groups_users_group_id_user_id ON public.auth_groups_users USING btree (group_id, user_id);


--
-- Name: auth_logins_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_logins_email ON public.auth_logins USING btree (email);


--
-- Name: auth_logins_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_logins_user_id ON public.auth_logins USING btree (user_id);


--
-- Name: auth_tokens_selector; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_tokens_selector ON public.auth_tokens USING btree (selector);


--
-- Name: auth_users_permissions_user_id_permission_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_users_permissions_user_id_permission_id ON public.auth_users_permissions USING btree (user_id, permission_id);


--
-- Name: ci_sessions_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ci_sessions_timestamp ON public.ci_sessions USING btree ("timestamp");


--
-- Name: auth_groups_permissions auth_groups_permissions_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_groups_permissions
    ADD CONSTRAINT auth_groups_permissions_group_id_foreign FOREIGN KEY (group_id) REFERENCES public.auth_groups(id) ON DELETE CASCADE;


--
-- Name: auth_groups_permissions auth_groups_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_groups_permissions
    ADD CONSTRAINT auth_groups_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.auth_permissions(id) ON DELETE CASCADE;


--
-- Name: auth_groups_users auth_groups_users_group_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_groups_users
    ADD CONSTRAINT auth_groups_users_group_id_foreign FOREIGN KEY (group_id) REFERENCES public.auth_groups(id) ON DELETE CASCADE;


--
-- Name: auth_groups_users auth_groups_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_groups_users
    ADD CONSTRAINT auth_groups_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: auth_tokens auth_tokens_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_tokens
    ADD CONSTRAINT auth_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: auth_users_permissions auth_users_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users_permissions
    ADD CONSTRAINT auth_users_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.auth_permissions(id) ON DELETE CASCADE;


--
-- Name: auth_users_permissions auth_users_permissions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_users_permissions
    ADD CONSTRAINT auth_users_permissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

