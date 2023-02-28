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
    name character varying(40) NOT NULL,
    size character varying(30),
    colour character varying(20),
    magnitude integer,
    mass character varying(30),
    constellation character varying(50) NOT NULL,
    number_of_stars bigint,
    description text,
    is_deleted boolean
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
    name character varying(40) NOT NULL,
    diameter integer,
    mass double precision,
    distance_from_planet double precision,
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
    name character varying(40) NOT NULL,
    diameter integer,
    distance_from_star double precision,
    orbital_period double precision,
    star_id integer
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
    name character varying(40) NOT NULL,
    spectral_type character varying(20),
    apparent_magnitude double precision,
    absolute_magnitude double precision,
    distance numeric,
    is_deleted boolean
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    name character varying(30) NOT NULL,
    email text NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.users_id;


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
-- Name: users users_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN users_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', '220,000 LY', 'blue', -22, '1.5 trillion M', 'Andromeda', 1000000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', '100,000 LY', 'white', -21, '1 trillion M', 'Sagittarius', 100000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', '60,000 LY', 'blue', -18, '40 billion M', 'Triangulum', 40000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', '14,000 LY', 'pink', -18, '10 billion M', 'Dorado', 10000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', '7,000 LY', 'pink', -16, '7 billion M', 'Tucana', 7000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf', '7,000 LY', 'yellow', -15, '1 billion M', 'Canis Major', 1000000, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 0.0123, 0.00257, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 1.08e-08, 9.378, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 2.4e-09, 23.46, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5262, 0.025, 1070000, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821, 0.018, 1880000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 3642, 0.015, 422000, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3122, 0.008, 671000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 0.0225, 1200000, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252, 0.000117, 238000, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 3.7e-06, 186000, 6);
INSERT INTO public.moon VALUES (11, 'Miranda', 472, 6.5e-06, 129000, 7);
INSERT INTO public.moon VALUES (12, 'Triton', 2705, 0.00214, 354700, 8);
INSERT INTO public.moon VALUES (13, 'Rhea', 1527, 0.00023, 527000, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 1062, 6.17e-05, 295000, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 1122, 0.00011, 377000, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 270, 5.6e-06, 1500000, 6);
INSERT INTO public.moon VALUES (17, 'Phoebe', 221, 5.5e-07, 13850000, 6);
INSERT INTO public.moon VALUES (18, 'Nereid', 340, 3.2e-06, 5513000, 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 420, 5e-06, 118000, 8);
INSERT INTO public.moon VALUES (20, 'Janus', 178, 1.93e-07, 151000, 6);
INSERT INTO public.moon VALUES (21, 'Epimetheus', 116, 4.4e-08, 150000, 6);
INSERT INTO public.moon VALUES (22, 'Helene', 36, 3.3e-11, 397000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 0.39, 88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.72, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, 1, 365.24, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6792, 1.52, 687, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 5.2, 4332.59, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 120536, 9.58, 10759.22, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, 19.18, 30688.5, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 30.07, 60182, 2);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 24000, 1.05, 384.843, 3);
INSERT INTO public.planet VALUES (10, 'HD 219134 b', 86000, 0.038, 3.93, 4);
INSERT INTO public.planet VALUES (11, 'GJ 1214 b', 22000, 0.014, 1.58, 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1 b', 7870, 0.011, 1.51, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'A1V', -1.46, 1.42, 2.64, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'G2V', 0.01, 4.38, 4.37, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 'K1V', 1.34, 5.71, 4.37, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'M1-M2Ia-Iab', 0.42, -5.85, 197.5, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 'B8Ia', 0.12, -6.7, 860, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 'A0Va', 0.03, 0.58, 7.7, NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'John Smith', 'john.smith@example.com', 'password123');
INSERT INTO public.users VALUES (2, 'Jane Doe', 'jane.doe@example.com', 'secret123');
INSERT INTO public.users VALUES (3, 'Bob Johnson', 'bob.johnson@example.com', 'mypassword');
INSERT INTO public.users VALUES (4, 'Emily Jones', 'emily.jones@example.com', '123456');
INSERT INTO public.users VALUES (5, 'Tom Brown', 'tom.brown@example.com', 'password');
INSERT INTO public.users VALUES (6, 'Samantha Lee', 'samantha.lee@example.com', 'letmein');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: users user_email_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


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
-- PostgreSQL database dump complete
--

