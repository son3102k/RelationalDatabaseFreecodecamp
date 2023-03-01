--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    founded_in integer,
    description text,
    diameter_in_parsec numeric(5,2),
    number_of_neighbors integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    have_liqid_water boolean,
    diameter numeric(20,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info_planet (
    more_info_planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.more_info_planet OWNER TO freecodecamp;

--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_planet_more_info_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_planet_more_info_planet_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_planet_more_info_planet_id_seq OWNED BY public.more_info_planet.more_info_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    have_liqid_water boolean,
    diameter numeric(20,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(20,2),
    diameter numeric(20,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info_planet more_info_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet ALTER COLUMN more_info_planet_id SET DEFAULT nextval('public.more_info_planet_more_info_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 1610, 'the name describing the galaxy s apperance from Earth', 26.80, 3);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1899, 'Also known as Messsier 31, M31, or NGC 224', 46.56, 3);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 1785, 'Also known as NGC 4038/ NGC 4039, or Caldwell6/Caldwell61', 150.00, 3);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 1856, 'NGC 4622', 15.40, 3);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 1886, 'NGC 4826', 24.57, 3);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxy', 1916, 'NGC 4568', 244.77, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, 3474.80);
INSERT INTO public.moon VALUES (2, 'a', 2, false, 23234.80);
INSERT INTO public.moon VALUES (3, 'c', 2, false, 13234.80);
INSERT INTO public.moon VALUES (4, 'd', 3, false, 13234.80);
INSERT INTO public.moon VALUES (5, 'e', 4, false, 13234.80);
INSERT INTO public.moon VALUES (6, 'f', 5, false, 13234.80);
INSERT INTO public.moon VALUES (7, 'g', 6, false, 13234.80);
INSERT INTO public.moon VALUES (8, 'h', 7, false, 13234.80);
INSERT INTO public.moon VALUES (9, 'i', 8, false, 13234.80);
INSERT INTO public.moon VALUES (10, 'j', 9, false, 13234.80);
INSERT INTO public.moon VALUES (11, 'k', 10, false, 13234.80);
INSERT INTO public.moon VALUES (12, 'l', 11, false, 13234.80);
INSERT INTO public.moon VALUES (13, 'm', 11, false, 13234.80);
INSERT INTO public.moon VALUES (14, 'o', 12, false, 13234.80);
INSERT INTO public.moon VALUES (15, 'p', 6, false, 13234.80);
INSERT INTO public.moon VALUES (16, 'q', 9, false, 13234.80);
INSERT INTO public.moon VALUES (17, 'r', 9, false, 13234.80);
INSERT INTO public.moon VALUES (18, 's', 9, false, 13234.80);
INSERT INTO public.moon VALUES (19, 'z', 12, false, 13234.80);
INSERT INTO public.moon VALUES (20, 'x', 3, false, 13234.80);


--
-- Data for Name: more_info_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info_planet VALUES (1, 'population', '8 Billions');
INSERT INTO public.more_info_planet VALUES (2, 'How many countries in the world', '195 Countries');
INSERT INTO public.more_info_planet VALUES (3, 'How many languages in the world', 'There are 7106 living languages');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 12724.00);
INSERT INTO public.planet VALUES (2, 'Mar', 1, false, 12724.00);
INSERT INTO public.planet VALUES (3, 'a', 1, false, 12724.00);
INSERT INTO public.planet VALUES (4, 'b', 1, false, 12724.00);
INSERT INTO public.planet VALUES (5, 'c', 1, false, 12724.00);
INSERT INTO public.planet VALUES (6, 'd', 1, false, 12724.00);
INSERT INTO public.planet VALUES (7, 'e', 1, false, 12724.00);
INSERT INTO public.planet VALUES (8, 'f', 1, false, 12724.00);
INSERT INTO public.planet VALUES (9, 'g', 1, false, 12724.00);
INSERT INTO public.planet VALUES (10, 'h', 1, false, 12724.00);
INSERT INTO public.planet VALUES (11, 'i', 1, false, 12724.00);
INSERT INTO public.planet VALUES (12, 'j', 1, false, 12724.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 19885.00, 1392700.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 158463.00, 1500000.00);
INSERT INTO public.star VALUES (3, 'Arcturus', 1, 45463.00, 849723.00);
INSERT INTO public.star VALUES (4, 'Vega', 1, 89863.00, 119723.00);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 189863.00, 915597.00);
INSERT INTO public.star VALUES (6, 'Procyon', 1, 44863.00, 391544.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_info_planet_more_info_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_planet_more_info_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info_planet more_info_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_name_key UNIQUE (name);


--
-- Name: more_info_planet more_info_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info_planet
    ADD CONSTRAINT more_info_planet_pkey PRIMARY KEY (more_info_planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

