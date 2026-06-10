--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

--
-- Name: gamedata; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gamedata (
    gamedata_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.gamedata OWNER TO freecodecamp;

--
-- Name: gamedata_gamedata_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gamedata_gamedata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gamedata_gamedata_id_seq OWNER TO freecodecamp;

--
-- Name: gamedata_gamedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gamedata_gamedata_id_seq OWNED BY public.gamedata.gamedata_id;


--
-- Name: gamedata gamedata_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamedata ALTER COLUMN gamedata_id SET DEFAULT nextval('public.gamedata_gamedata_id_seq'::regclass);


--
-- Data for Name: gamedata; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gamedata VALUES (1, 'test', 0, NULL);
INSERT INTO public.gamedata VALUES (2, 'user_1781054015032', 0, NULL);
INSERT INTO public.gamedata VALUES (3, 'user_1781054015031', 0, NULL);
INSERT INTO public.gamedata VALUES (4, 'user_1781054090262', 0, NULL);
INSERT INTO public.gamedata VALUES (5, 'user_1781054090261', 0, NULL);
INSERT INTO public.gamedata VALUES (6, 'user_1781054165464', 0, NULL);
INSERT INTO public.gamedata VALUES (7, 'user_1781054165463', 0, NULL);
INSERT INTO public.gamedata VALUES (9, 'user_1781054203226', 2, 4);
INSERT INTO public.gamedata VALUES (8, 'user_1781054203227', 5, 339);
INSERT INTO public.gamedata VALUES (11, 'user_1781054519033', 2, 889);
INSERT INTO public.gamedata VALUES (10, 'user_1781054519034', 5, 583);
INSERT INTO public.gamedata VALUES (13, 'user_1781054563867', 2, 184);
INSERT INTO public.gamedata VALUES (12, 'user_1781054563868', 5, 55);


--
-- Name: gamedata_gamedata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gamedata_gamedata_id_seq', 13, true);


--
-- Name: gamedata gamedata_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamedata
    ADD CONSTRAINT gamedata_pkey PRIMARY KEY (gamedata_id);


--
-- Name: gamedata gamedata_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gamedata
    ADD CONSTRAINT gamedata_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

