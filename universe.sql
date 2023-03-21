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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(10) NOT NULL,
    weight integer NOT NULL,
    diameter integer,
    color character varying(10),
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    galaxy_type_id integer
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_your_planet numeric(4,1),
    planet_id integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth integer,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth integer,
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'A', 10, 20, 'Blue', 1);
INSERT INTO public.comet VALUES (2, 'B', 10, 20, 'Red', 1);
INSERT INTO public.comet VALUES (3, 'C', 10, 20, 'Green', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The MIlky Way is a huge collection of stars', false, false, 13.6, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda, also known as Messier is a spiral galaxy', false, false, 10.0, 1);
INSERT INTO public.galaxy VALUES (3, 'Cygnus', 'Cygnus is another type of galaxy', false, false, 100.0, 2);
INSERT INTO public.galaxy VALUES (4, 'ESO 162-17', '', false, false, 50.0, 3);
INSERT INTO public.galaxy VALUES (5, 'UGCA 92', 'That is an irregular galaxy', false, false, 56.0, 4);
INSERT INTO public.galaxy VALUES (6, 'M49', 'It  is a huge collection of stars', false, false, 13.6, 2);
INSERT INTO public.galaxy VALUES (7, 'M60', 'It is a spiral elliptical', true, true, 10.0, 1);
INSERT INTO public.galaxy VALUES (8, 'P12', 'P12 is another type of galaxy', false, true, 100.0, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'S10', 'X', false, true, 100, 0.6, 1);
INSERT INTO public.moon VALUES (2, 'X10', 'Other planet', true, true, 506, 0.8, 2);
INSERT INTO public.moon VALUES (3, 'X02', 'Other', true, false, 345, 0.3, 3);
INSERT INTO public.moon VALUES (4, 'X34', 'Nothing', true, false, 100, 0.3, 4);
INSERT INTO public.moon VALUES (5, 'Y10', 'X', false, true, 100, 0.6, 5);
INSERT INTO public.moon VALUES (7, 'Y02', 'Other', true, false, 345, 0.3, 7);
INSERT INTO public.moon VALUES (8, 'Y34', 'Nothing', true, false, 100, 0.3, 8);
INSERT INTO public.moon VALUES (9, 'Z10', 'X', false, true, 100, 0.6, 1);
INSERT INTO public.moon VALUES (11, 'Z02', 'Other', true, false, 345, 0.3, 3);
INSERT INTO public.moon VALUES (12, 'Z34', 'Nothing', true, false, 100, 0.3, 4);
INSERT INTO public.moon VALUES (13, 'Z110', 'X', false, true, 100, 0.6, 1);
INSERT INTO public.moon VALUES (15, 'Z102', 'Other', true, false, 345, 0.3, 3);
INSERT INTO public.moon VALUES (16, 'Z134', 'Nothing', true, false, 100, 0.3, 4);
INSERT INTO public.moon VALUES (17, 'Z120', 'X', false, true, 100, 0.6, 1);
INSERT INTO public.moon VALUES (18, 'Z11', 'Other planet', true, true, 506, 0.8, 2);
INSERT INTO public.moon VALUES (20, 'Z14', 'Nothing', true, false, 100, 0.3, 4);
INSERT INTO public.moon VALUES (6, 'Y11', 'Other planet', true, true, 506, 0.8, 6);
INSERT INTO public.moon VALUES (10, 'Z09', 'Other planet', true, true, 506, 0.8, 2);
INSERT INTO public.moon VALUES (19, 'Z08', 'Other', true, false, 345, 0.3, 3);
INSERT INTO public.moon VALUES (14, 'Z111', 'Other planet', true, true, 506, 0.8, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'First planet', false, true, 20.0, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Second planet', false, true, 24.0, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Third planet', true, true, 30.0, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Fourth planet', false, true, 20.0, 2, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Fifth planet', false, true, 20.0, 1, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Sixth planet', false, false, 23.0, 1, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Seventh planet', true, true, 36.0, 1, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Eigth planet', false, true, 20.0, 2, 1);
INSERT INTO public.planet VALUES (9, 'P01', 'Other planet', true, true, 56.0, 8, 2);
INSERT INTO public.planet VALUES (10, 'P02', 'Other', true, false, 45.0, 50, 3);
INSERT INTO public.planet VALUES (11, 'P34', 'Nothing', true, false, 78.0, 65, 4);
INSERT INTO public.planet VALUES (12, 'X48', 'Large planet', false, true, 58.0, 45, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'Medium star', true, 3.6, 1, 1);
INSERT INTO public.star VALUES (2, 'S01', 'White dwarf', true, 5.0, 10, 2);
INSERT INTO public.star VALUES (3, 'C4', 'Big red', false, 100.0, 2, 3);
INSERT INTO public.star VALUES (4, 'ES1', 'Blue cold', false, 50.0, 30, 3);
INSERT INTO public.star VALUES (5, 'GCA', 'Not information', true, 56.0, 48, 4);
INSERT INTO public.star VALUES (6, 'S14', 'Medium star', true, 3.6, 1, 1);
INSERT INTO public.star VALUES (7, 'S061', 'White dwarf', true, 5.0, 10, 2);
INSERT INTO public.star VALUES (8, 'C34', 'Big red', false, 100.0, 2, 3);
INSERT INTO public.star VALUES (9, 'ES190', 'Blue cold', true, 50.0, 30, 3);
INSERT INTO public.star VALUES (10, 'GATO', 'Not information', true, 56.0, 48, 4);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

