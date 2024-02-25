--
-- PostgreSQL database dum
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    weight numeric,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    weight numeric,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    weight numeric,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer,
    weight numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: star_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_planet (
    star_id integer NOT NULL,
    planet_id integer,
    name character varying,
    star_planet_id integer NOT NULL
);


ALTER TABLE public.star_planet OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_star_planet_id_seq OWNED BY public.star_planet.star_planet_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star_planet star_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet ALTER COLUMN star_planet_id SET DEFAULT nextval('public.star_planet_star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 13000, 1.5, 'The Milky Way is our home galaxy...');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 22000, 2.0, 'Andromeda is the nearest spiral galaxy...');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 16000, 1.2, 'Triangulum Galaxy is a small spiral galaxy...');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', false, 23000, 1.8, 'The Whirlpool Galaxy is an interacting...');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', false, 21000, 1.6, 'The Pinwheel Galaxy is a face-on spiral...');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', false, 28000, 2.5, 'The Sombrero Galaxy is an unbarred spiral...');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 4500, 0.0123, 'Luna is the only natural satellite of the Earth.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 4500, 0.0000000151, 'Phobos is the innermost and larger of the two natural satellites of Mars.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4500, 0.0000000024, 'Deimos is the smaller and outer of the two natural satellites of Mars.', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 4500, 0.025, 'Ganymede is the largest moon of Jupiter and in the Solar System.', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 4500, 0.018, 'Callisto is the second-largest moon of Jupiter, after Ganymede.', 5);
INSERT INTO public.moon VALUES (6, 'Io', false, 4500, 0.015, 'Io is the innermost and third-largest of the four Galilean moons of Jupiter.', 5);
INSERT INTO public.moon VALUES (7, 'Europa', false, 4500, 0.008, 'Europa is the smallest of the four Galilean moons orbiting Jupiter.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', false, 4500, 0.0225, 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, 4500, 0.0000035, 'Enceladus is the sixth-largest moon of Saturn.', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 4500, 0.0001875, 'Mimas is a moon of Saturn which was discovered in 1789 by William Herschel.', 6);
INSERT INTO public.moon VALUES (11, 'Miranda', false, 4500, 0.000067, 'Miranda, also designated Uranus V, is the smallest and innermost of Uranus'' five round satellites.', 7);
INSERT INTO public.moon VALUES (12, 'Ariel', false, 4500, 0.0000287, 'Ariel is the fourth-largest of the 27 known moons of Uranus.', 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 4500, 0.0000258, 'Umbriel is a moon of Uranus discovered on October 24, 1851, by William Lassell.', 7);
INSERT INTO public.moon VALUES (14, 'Triton', false, 4500, 0.0036, 'Triton is the largest natural satellite of the planet Neptune.', 8);
INSERT INTO public.moon VALUES (15, 'Nereid', false, 4500, 0.00003, 'Nereid is the third-largest moon of Neptune.', 8);
INSERT INTO public.moon VALUES (16, 'Charon', false, 4500, 0.00052, 'Charon, also known as (134340) Pluto I, is the largest of the five known natural satellites of the dwarf planet Pluto.', 9);
INSERT INTO public.moon VALUES (17, 'Styx', false, 4500, 0.0000005, 'Styx, full designation (134340) Pluto V Styx, is the second discovered moon of Pluto.', 9);
INSERT INTO public.moon VALUES (18, 'Nix', false, 4500, 0.000007, 'Nix is a natural satellite of Pluto.', 9);
INSERT INTO public.moon VALUES (19, 'Kerberos', false, 4500, 0.000003, 'Kerberos, originally known as S/2011 (134340) 1, is a small natural satellite of Pluto, about 12 km (7.5 mi) in its longest dimension.', 9);
INSERT INTO public.moon VALUES (20, 'Hydra', false, 4500, 0.000005, 'Hydra, full designation (134340) Pluto III Hydra, is the outermost known moon of the dwarf planet Pluto.', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 4500, 0.055, 'Mercury is the smallest and innermost planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 4600, 0.815, 'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 4500, 1.0, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 4500, 0.107, 'Mars is the fourth planet from the Sun and the second smallest planet in the Solar System.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 4500, 317.8, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System.', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 4600, 95.2, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.', 2);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 4700, 14.5, 'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System.', 3);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4800, 17.1, 'Neptune is the eighth and farthest-known Solar planet from the Sun. ', 3);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 4500, 0.00218, 'Pluto is a dwarf planet in the Kuiper belt, a ring of bodies beyond Neptune. It was the first and the largest Kuiper belt object to be discovered.', 4);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', true, 6000, 1.0, 'Kepler-186f is an exoplanet orbiting the red dwarf Kepler-186, about 582 light-years (178 parsecs) from the Earth in the constellation Cygnus.', 5);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', false, 4000, 0.69, 'HD 209458 b, also given the nickname Osiris, is an exoplanet that orbits the solar analogue HD 209458 in the constellation Pegasus, some 159 light-years from the Solar System.', 6);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', false, 6000, 3.93, 'Tau Ceti e is an exoplanet orbiting Tau Ceti that was detected by statistical analyses of data from the Kepler spacecraft. ', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 5000, 1.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', false, 250, 2.0, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', false, 6000, 1.1, 1);
INSERT INTO public.star VALUES (4, 'Vega', false, 450, 2.135, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', false, 100000, 11.6, 3);
INSERT INTO public.star VALUES (6, 'Rigel', false, 100000, 23, 3);


--
-- Data for Name: star_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_planet VALUES (1, 1, 'Mercury', 1);
INSERT INTO public.star_planet VALUES (1, 2, 'Venus', 2);
INSERT INTO public.star_planet VALUES (1, 3, 'Earth', 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: star_planet_star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_star_planet_id_seq', 3, true);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_planet star_planet_fkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_fkey UNIQUE (star_id, planet_id);


--
-- Name: star_planet star_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_pkey PRIMARY KEY (star_planet_id);


--
-- Name: star_planet star_planet_star_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_planet
    ADD CONSTRAINT star_planet_star_planet_id_key UNIQUE (star_planet_id);


--
-- Name: moon moon_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

