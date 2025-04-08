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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_to_other_galaxy numeric,
    age_in_millions_of_years integer,
    description text,
    size integer,
    in_the_milky_way boolean,
    has_black_holes boolean
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
    name character varying(30),
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text,
    size_in_km integer,
    has_craters boolean,
    near_a_planet boolean,
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
-- Name: my_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.my_universe (
    my_universe_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    humans_live_here boolean
);


ALTER TABLE public.my_universe OWNER TO freecodecamp;

--
-- Name: my_universe_my_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_universe_my_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_universe_my_universe_id_seq OWNER TO freecodecamp;

--
-- Name: my_universe_my_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_universe_my_universe_id_seq OWNED BY public.my_universe.my_universe_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text,
    size_in_km integer,
    has_moon boolean,
    has_life boolean,
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
    name character varying(30),
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text,
    size_in_km integer,
    hot_star boolean,
    cool_star boolean,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: my_universe my_universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_universe ALTER COLUMN my_universe_id SET DEFAULT nextval('public.my_universe_my_universe_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 2345.9, 1289, 'we live here', 324, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2310.9, 12333, 'wow!', 220000, false, false);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 213321, 89809, 'i do not know it', 328190238, false, true);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw Galaxy', 2345.9, 1289, 'has it a bear?', 324, false, true);
INSERT INTO public.galaxy VALUES (5, 'Dusty Hand Galaxy', 23210.9, 1333, 'wow!', 212300, false, false);
INSERT INTO public.galaxy VALUES (6, 'Fireworks Galaxy', 213321321, 89809, 'i do not know it', 32838, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 213124.23, 24189, 'the moon of the Earth', 23189032, true, true, 8);
INSERT INTO public.moon VALUES (2, 'Deimos', 1239821.42, 93120, 'near to Mars', 230921, false, true, 9);
INSERT INTO public.moon VALUES (3, 'Amalthea', 231789237189231, 90903, 'the mone of Jupiter', 2329000, false, true, 10);
INSERT INTO public.moon VALUES (4, 'Hi_iaka', 12213, 121, 'wow', 213, true, true, 15);
INSERT INTO public.moon VALUES (5, 'Namaka', 32123.23, 213, 'wow too', 231, false, true, 15);
INSERT INTO public.moon VALUES (6, 'Dysnomia', 123.23, 534, 'the only one', 324, true, true, 14);
INSERT INTO public.moon VALUES (7, 'Triton', 12390.90, 324, 'first', 435, false, true, 13);
INSERT INTO public.moon VALUES (8, 'Nereid', 123231.56, 798, 'second', 890, false, true, 13);
INSERT INTO public.moon VALUES (9, 'Larisa', 413897.98, 321, 'third', 21332, true, false, 13);
INSERT INTO public.moon VALUES (10, 'Proteus', 231223.43, 890, 'Neptunes second largest moon', 12323, false, true, 13);
INSERT INTO public.moon VALUES (11, 'Miranda', 432432.54, 80989, 'one', 80989, false, true, 12);
INSERT INTO public.moon VALUES (12, 'Ariel', 321321.56, 21313, 'two', 8909, false, true, 12);
INSERT INTO public.moon VALUES (13, 'Umbriel', 3210.42, 909, 'three', 2345, true, true, 12);
INSERT INTO public.moon VALUES (14, 'Mimas', 321890.42, 789, '1/274', 234879, false, true, 11);
INSERT INTO public.moon VALUES (15, 'Enceladus', 321231.23, 7889, '2/272', 23321, false, true, 11);
INSERT INTO public.moon VALUES (16, 'Tethys', 21390281.23, 321, '3/274', 5456, true, true, 11);
INSERT INTO public.moon VALUES (17, 'Io', 45621.45, 789, '1/95', 7895, false, true, 10);
INSERT INTO public.moon VALUES (18, 'Europa', 78978.45, 456, '2/95', 12354, false, true, 10);
INSERT INTO public.moon VALUES (19, 'Ganymede', 45412.45, 123, '3/95', 5456, true, true, 10);
INSERT INTO public.moon VALUES (20, 'Phobos', 12315.78, 5625, 'second', 2358, false, true, 9);
INSERT INTO public.moon VALUES (21, 'No moons', 0, 0, 'not found', 0, false, false, 7);


--
-- Data for Name: my_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.my_universe VALUES (1, 'my universe 1', 'my first universe documented', true);
INSERT INTO public.my_universe VALUES (2, 'mySecond', 'second universe documented', false);
INSERT INTO public.my_universe VALUES (3, 'thirth universe', 'newest documented', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (6, 'Mercury', 2133.2, 89798, 'the smallest planet', 1321, false, false, 3);
INSERT INTO public.planet VALUES (7, 'Venus', 123.2, 321, 'the second planet', 122, false, false, 2);
INSERT INTO public.planet VALUES (8, 'Earth', 3122.3, 3212, 'we live here', 421, true, true, 1);
INSERT INTO public.planet VALUES (9, 'Mars', 312, 132, 'the red planet', 321, true, false, 6);
INSERT INTO public.planet VALUES (10, 'Jupiter', 534.5, 2334, 'the biggest planet', 243, true, false, 2);
INSERT INTO public.planet VALUES (11, 'Saturn', 4132.45, 2311, 'uchulele', 321, true, false, 5);
INSERT INTO public.planet VALUES (12, 'Uranus', 21323.56, 989, 'gira de otro lado', 4543, true, false, 6);
INSERT INTO public.planet VALUES (13, 'Neptune', 1423123.45, 8797, 'the last planet from our solar system', 14233, true, false, 5);
INSERT INTO public.planet VALUES (14, 'Eris', 231.23, 23, 'dwarf planet', 234, true, false, 3);
INSERT INTO public.planet VALUES (15, 'Haumea', 123.23, 8989, 'dwarf planet', 231, true, false, 1);
INSERT INTO public.planet VALUES (16, 'No planets', 0, 0, 'no planets found', 0, false, false, 4);
INSERT INTO public.planet VALUES (17, 'Unknown', 0, 0, 'unkown', 0, false, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2380912, 2123, 'the brightest star', 32171, true, false, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2231912.12, 122123, 'the brightest star in Andromeda', 3222171, false, true, 2);
INSERT INTO public.star VALUES (3, 'No specific stars', 0, 0, 'galaxy is undergoing a massive starburst', 0, false, false, 3);
INSERT INTO public.star VALUES (4, 'Alpha Lyncis', 21323, 453, 'a bright star', 321, true, false, 4);
INSERT INTO public.star VALUES (5, 'Unknown', 0, 0, 'No infoemartion found', 0, false, false, 5);
INSERT INTO public.star VALUES (6, 'Massive blue stars', 21332.45, 8900, 'many blue stars', 132, false, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: my_universe_my_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_universe_my_universe_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


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
-- Name: my_universe my_universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_universe
    ADD CONSTRAINT my_universe_name_key UNIQUE (name);


--
-- Name: my_universe my_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.my_universe
    ADD CONSTRAINT my_universe_pkey PRIMARY KEY (my_universe_id);


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
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

