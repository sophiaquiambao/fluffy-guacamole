--
-- PostgreSQL database dump
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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbit_duration numeric(6,2) NOT NULL,
    discovered boolean DEFAULT true NOT NULL
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
    name character varying NOT NULL,
    size integer NOT NULL,
    age numeric,
    discovered boolean
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
    name character varying NOT NULL,
    type character varying,
    diameter numeric,
    distance_from_planet numeric,
    planet_id integer
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
    name character varying NOT NULL,
    type character varying NOT NULL,
    distance_from_star numeric,
    radius numeric,
    star_id integer,
    description text
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
    name character varying NOT NULL,
    type character varying NOT NULL,
    mass integer,
    distance_from_galaxy numeric,
    galaxy_id integer
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

INSERT INTO public.comet VALUES (1, 'Halley', 76.00, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2530.00, true);
INSERT INTO public.comet VALUES (3, 'Lovejoy', 8000.00, false);
INSERT INTO public.comet VALUES (4, 'Neowise', 6800.00, true);
INSERT INTO public.comet VALUES (5, 'Siding Spring', 1700.00, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13.6, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 12.5, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 11.2, false);
INSERT INTO public.galaxy VALUES (4, 'Sculptor', 10000, 13.1, true);
INSERT INTO public.galaxy VALUES (5, 'NGC 6819', 15000, 10.8, false);
INSERT INTO public.galaxy VALUES (6, 'Laniakea', 160000, 14.0, true);
INSERT INTO public.galaxy VALUES (9, 'NGC 7293', 90000, 9.8, true);
INSERT INTO public.galaxy VALUES (10, 'M87', 98000, 13.5, false);
INSERT INTO public.galaxy VALUES (11, 'NGC 3384', 70000, 11.0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 'Natural', 3474.8, 384400, 1);
INSERT INTO public.moon VALUES (22, 'Phobos', 'Natural', 22.4, 9376, 4);
INSERT INTO public.moon VALUES (23, 'Deimos', 'Natural', 12.4, 23460, 4);
INSERT INTO public.moon VALUES (24, 'Io', 'Natural', 3632.0, 421700, 7);
INSERT INTO public.moon VALUES (25, 'Europa', 'Natural', 3121.6, 670900, 7);
INSERT INTO public.moon VALUES (26, 'Ganymede', 'Natural', 5262.0, 1070000, 7);
INSERT INTO public.moon VALUES (27, 'Callisto', 'Natural', 4820.0, 1882700, 7);
INSERT INTO public.moon VALUES (28, 'Titan', 'Natural', 5150.0, 1222030, 8);
INSERT INTO public.moon VALUES (29, 'Enceladus', 'Natural', 505.0, 238040, 8);
INSERT INTO public.moon VALUES (30, 'Mimas', 'Natural', 396.0, 185520, 8);
INSERT INTO public.moon VALUES (31, 'Triton', 'Natural', 2706.0, 354760, 9);
INSERT INTO public.moon VALUES (32, 'Charon', 'Natural', 1216.0, 195939, 9);
INSERT INTO public.moon VALUES (33, 'Titania', 'Natural', 1578.0, 436300, 10);
INSERT INTO public.moon VALUES (34, 'Oberon', 'Natural', 1522.0, 583520, 10);
INSERT INTO public.moon VALUES (35, 'Iapetus', 'Natural', 1471.0, 1079520, 10);
INSERT INTO public.moon VALUES (36, 'Rhea', 'Natural', 1529.0, 527040, 11);
INSERT INTO public.moon VALUES (37, 'Dione', 'Natural', 1124.0, 377400, 11);
INSERT INTO public.moon VALUES (38, 'Hyperion', 'Natural', 346.0, 150200, 11);
INSERT INTO public.moon VALUES (39, 'Tethys', 'Natural', 1062.0, 294600, 11);
INSERT INTO public.moon VALUES (40, 'Miranda', 'Natural', 471.6, 129900, 10);
INSERT INTO public.moon VALUES (41, 'Phobos 2', 'Natural', 25.0, 9500, 4);
INSERT INTO public.moon VALUES (42, 'Io 2', 'Natural', 3700.0, 426000, 7);
INSERT INTO public.moon VALUES (43, 'Enceladus 2', 'Natural', 520.0, 241000, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 93.0, 6371, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 142.0, 3389, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 108.0, 6051, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 483.0, 69911, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 886.0, 58232, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice Giant', 1784.0, 25362, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', 2790.0, 24622, 2, NULL);
INSERT INTO public.planet VALUES (8, 'Proxima b', 'Exoplanet', 0.048, 1188, 3, NULL);
INSERT INTO public.planet VALUES (9, 'GJ 1214 b', 'Exoplanet', 0.065, 2434, 3, NULL);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 'Terrestrial', 0.021, 970, 4, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-442b', 'Terrestrial', 0.725, 13888, 5, NULL);
INSERT INTO public.planet VALUES (12, 'HD 40307 g', 'Terrestrial', 0.275, 15068, 6, NULL);
INSERT INTO public.planet VALUES (13, 'Proxima c', 'Exoplanet', 0.050, 1319, 3, NULL);
INSERT INTO public.planet VALUES (14, 'Tau Ceti f', 'Terrestrial', 0.42, 10815, 3, NULL);
INSERT INTO public.planet VALUES (15, 'GJ 3323 b', 'Terrestrial', 0.087, 11760, 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1, 25.0, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 18, 643.0, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Binary Star', 2, 8.6, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Red Dwarf', 0, 4.25, 1);
INSERT INTO public.star VALUES (5, 'Aldebaran', 'Red Giant', 2, 65.0, 2);
INSERT INTO public.star VALUES (6, 'Altair', 'A-type', 1, 15.0, 2);
INSERT INTO public.star VALUES (7, 'Rigel', 'Blue Supergiant', 15, 773.0, 2);
INSERT INTO public.star VALUES (8, 'Shedar', 'Yellow-Orange Giant', 3, 229.0, 2);
INSERT INTO public.star VALUES (9, 'Vega', 'A-type', 2, 25.0, 3);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 43, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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


