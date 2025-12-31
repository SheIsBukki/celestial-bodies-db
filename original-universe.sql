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
-- Name: exploration_institution; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exploration_institution (
    exploration_institution_id integer NOT NULL,
    name character varying(255) NOT NULL,
    ongoing_exploration text,
    first_exploration text,
    prominent_project text
);


ALTER TABLE public.exploration_institution OWNER TO freecodecamp;

--
-- Name: exploration_institution_exploration_institution_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exploration_institution_exploration_institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploration_institution_exploration_institution_id_seq OWNER TO freecodecamp;

--
-- Name: exploration_institution_exploration_institution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exploration_institution_exploration_institution_id_seq OWNED BY public.exploration_institution.exploration_institution_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    morphological_type character varying(100),
    is_merging boolean,
    has_agn boolean,
    distance_from_earth character varying(100),
    apparent_magnitude numeric(4,1)
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
    planet_id integer NOT NULL,
    surface_gravity character varying(100),
    orbital_period_days numeric(7,3),
    rotation_period_days numeric(7,3),
    geological_activity text,
    temperature_range text,
    mean_radius numeric(7,3),
    discovery_year character varying(50)
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    planet_type text,
    moon_count integer,
    ring_count integer,
    discovery_year character varying(100)
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
    spectral_type text,
    apparent_magnitude numeric(4,1),
    stellar_colour character varying(50),
    system_type character varying(50)
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
-- Name: exploration_institution exploration_institution_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration_institution ALTER COLUMN exploration_institution_id SET DEFAULT nextval('public.exploration_institution_exploration_institution_id_seq'::regclass);


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
-- Data for Name: exploration_institution; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exploration_institution VALUES (1, 'ALMA', 'ALMA Observatory operations', 'N/A', 'ALMA Observatory operations');
INSERT INTO public.exploration_institution VALUES (2, 'VLT', 'Extremely Large Telescope (ELT) preparatory science (with VLT complementary programs)', 'N/A', 'VLT science program');
INSERT INTO public.exploration_institution VALUES (3, 'Kect Observatory', 'Keck Observatory science operations', 'N/A', 'Keck science program');
INSERT INTO public.exploration_institution VALUES (4, 'Hubble Space Telescope', 'HST observing program', 'Servicing Mission 1 (SM1) — 1993 (first major servicing mission)', 'Hubble Deep Field');
INSERT INTO public.exploration_institution VALUES (5, 'Chandra X-ray Observatory', 'Chandra observing program', 'Chandra Launch/First Light — 1999', 'Chandra Deep Field');
INSERT INTO public.exploration_institution VALUES (6, 'NASA', 'Artemis program', 'Explorer program — first mission: Explorer 1 (1958)', 'Apollp program');
INSERT INTO public.exploration_institution VALUES (7, 'Roscosmos', 'Luna-25 / lunar program activities', 'Sputnik 1 (as USSR / 1957)', 'Vostok program');
INSERT INTO public.exploration_institution VALUES (8, 'CNSA', 'Chang`e lunar program (ongoing follow-ups)', 'Dong Fang Hong I (PRC satellite, 1970)', 'Chang`e program');
INSERT INTO public.exploration_institution VALUES (9, 'ESA', 'Hera / Earth & planetary science missions e.g. Juice mission operational phases', 'ESRO/ELDO predecessors — first ESA satellite: ESRO-1 (1968)', 'Rosetta');
INSERT INTO public.exploration_institution VALUES (10, 'ISRO', 'Chandrayaan-3 follow-up science operations', 'Aryabhata (satellite, 1975)', 'Chandrayaan-1');
INSERT INTO public.exploration_institution VALUES (11, 'JAXA', 'Hayabusa2 extended operations / DESTINY+ preparations', 'N/A', 'Hayabusa');
INSERT INTO public.exploration_institution VALUES (12, 'CNES', 'Participation in JUICE / space science collaborations', 'A-1 rocket test / Véronique launches (early French space activities) — treat as first: Véronique rocket launches (1950s)', 'Arianae program');
INSERT INTO public.exploration_institution VALUES (13, 'Sloan Digital Sky Survey (SDSS)', 'SDSS-V operations', 'SDSS first light / commissioning (2000)', 'SDSS Survey');
INSERT INTO public.exploration_institution VALUES (14, 'Subaru Telescope', 'Subaru Strategic Program', 'Subaru first light (1999)', 'Subari Strategic Program');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', true, false, '2.54 million light years', 3.4);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', true, true, '0', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', true, false, '2.73 million light years', 5.7);
INSERT INTO public.galaxy VALUES (4, 'Whirpool', 'Spiral', true, true, '23 million light years', 8.4);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', false, true, '20.3 million light years', 9.0);
INSERT INTO public.galaxy VALUES (6, 'Pinewheel', 'Spiral', false, false, '21 million light years', 7.9);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical', false, true, '53.5 million light years', 9.6);
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic Cloud', 'Irregular', true, false, '163 thousand light years', 0.9);
INSERT INTO public.galaxy VALUES (9, 'Small Magellanic Cloud', 'Irregular', true, false, '200 thousands light years', 2.7);
INSERT INTO public.galaxy VALUES (10, 'NGC 1300', 'Spiral', false, false, '61 million light years', 11.4);
INSERT INTO public.galaxy VALUES (11, 'Spindle', 'Lenticular', false, false, '44 million light years', 10.7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, '1.62 m/s squared', 27.322, 27.322, 'tectonic, volcanism (past), active regolith gardening', '60 K (night) to 390 K (day)', 1737.400, 'antiquity');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, '0.0057 m/s squared', 0.319, 0.319, 'geologically inactive (surface regolith movement; possible grooves)', '~140–280 K', 11.270, '1877');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, '0.0030 m/s squared', 1.263, 1.263, 'geologically inactive (heavily cratered)', '~130–270 K', 6.200, '1877');
INSERT INTO public.moon VALUES (4, 'Io', 5, '1.796 m/s squared', 1.769, 1.769, 'active (intense sulfur/mafi c volcanism)', '~90–130 K (hot spots up to >1200 K at volcanoes)', 1821.600, '1610');
INSERT INTO public.moon VALUES (5, 'Europea', 5, '1.314 m/s squared', 3.551, 3.551, 'ctive (subsurface ocean, likely cryovolcanism, tectonics)', '~50–125 K', 1560.800, '1610');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, '1.428 m/s squared', 7.155, 7.155, 'geologically active (past tectonism; possible present cryovolcanism)', '~70–170 K', 2634.100, '1610');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, '1.235 m/s squared', 16.689, 16.689, 'geologically inactive/ancient surface (limited resurfacing)', '~70–165 K', 2410.300, '1610');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, '0.020 m/s squared', 0.498, 0.498, 'geologically inactive (rubble/porous, surface^cratering)', '~70–170 K', 83.500, '1892');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, '0.113 m/s squared', 1.370, 1.370, 'active (cryovolcanic plumes, geysers)', '~30–90 K (surface)', 252.100, '1789');
INSERT INTO public.moon VALUES (10, 'Titan', 6, '1.352 m/s squared', 15.945, 15.945, 'active (atmosphere-driven weather, methane cycle, cryovolcanism possible)', '~70–95 K (surface ~94 K)', 2576.800, '1655');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, '0.264 m/s squared', 4.516, 4.518, 'geologically inactive (some tectonic features; largely ancient)', '~50–120 K', 763.800, '1672');
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, '0.223 m/s squared', 79.321, 79.321, 'geologically inactive (ancient surface; equatorial ridge origin debated)', '~25–180 K (dark leading ~120–180 K; bright trailing ~25–100 K)', 734.500, '1671');
INSERT INTO public.moon VALUES (13, 'Mimas', 6, '0.064 m/s squared', 0.942, 0.942, 'geologically mostly inactive (possivle past activity; Herschel crater prominent)', '~50-120 k', 198.200, '1789');
INSERT INTO public.moon VALUES (14, 'Tethys', 6, '0.127 m/s squared', 1.888, 1.888, 'geologically mostly inactive (tectonic fractures, limited resurfacing)', '~50–120 K', 531.100, '1684');
INSERT INTO public.moon VALUES (15, 'Dione', 6, '0.232 m/s squared', 2.737, 2.737, 'geological low activity (fractures, wispy terrain; possible cryovolcanism past)', '~50–120 K', 561.400, '1684');
INSERT INTO public.moon VALUES (16, 'Miranda', 7, '0.079 m/s squared', 1.413, 1.413, 'geologically active in past (extreme tectonics, resurfaced regions)', '~60–100 K', 235.800, '1948');
INSERT INTO public.moon VALUES (17, 'Ariel', 7, '0.271 m/s squared', 2.520, 2.520, 'past geologic activity (extensive resurfacing; cryovolcanism evidence)', '~60–110 K', 578.900, '1851');
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, '0.210 m/s squared', 4.144, 4.144, 'geologically inactive (ancient, heavily cratered)', '~50–100 K', 584.700, '1851');
INSERT INTO public.moon VALUES (19, 'Titania', 7, '0.379 m/s squared', 8.706, 8.706, 'past geologic activity (tectonic features; limited current activity)', '~60–100 K', 788.900, '1787');
INSERT INTO public.moon VALUES (20, 'Oberon', 7, '0.347 m/s squared', 13.463, 13.463, 'geologically inactive (ancient, cratered)', '~50–100 K', 761.400, '1787');
INSERT INTO public.moon VALUES (21, 'Triton', 8, '0.779 m/s squared', 5.877, 5.877, 'active (cryovolcanism, plumes, seasonal resurfacing)', '~30–38 K (surface ~38 K)', 1353.400, '1846');
INSERT INTO public.moon VALUES (22, 'Nereid', 8, '0.017 m/s squared', 360.130, 360.130, 'geologically inactive (unknown interior; heavily cratered)', '~30–70 K (approx.)', 170.000, '1949');
INSERT INTO public.moon VALUES (23, 'Proteus', 8, '0.055 m/s squared', 1.122, 1.122, 'geologically inactive (heavily cratered)', '~40–80 K', 210.000, '1989');
INSERT INTO public.moon VALUES (24, 'Himalia', 5, '0.062 m/s squared', 250.560, 250.560, 'geologically inactive (small, heavily cratered)', '~80–130 K (approx.)', 85.000, '1904');
INSERT INTO public.moon VALUES (25, 'Phoebe', 6, '0.036 m/s squared', 1092.000, 0.387, 'geologically inactive (primitive, heavily cratered; possible past activity at formation)', '~50–100 K (approx.)', 106.500, '1899');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Neptune', 19, false, 'ice giant (neptune-like)', 14, 5, '1846');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 20, false, 'super-earth (candidate)', NULL, NULL, '2016');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 21, false, 'terrestial (earth size)', NULL, NULL, '2017');
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 22, false, 'terrestial/super-earth (uncertain)', NULL, NULL, '2014');
INSERT INTO public.planet VALUES (12, 'HD 209458 b Osiris', 23, false, 'hot jupiter', NULL, NULL, '1999');
INSERT INTO public.planet VALUES (13, '51 Pegasi b Bellerophon', 24, false, 'hot jupiter', NULL, NULL, '1995');
INSERT INTO public.planet VALUES (14, 'WASP-12b', 25, false, 'hot jupiter', NULL, NULL, '2008');
INSERT INTO public.planet VALUES (15, 'GJ 1214 b', 26, false, 'mini-nepture/sub-neptune', NULL, NULL, '2009');
INSERT INTO public.planet VALUES (1, 'Mercury', 19, false, 'terrestial', 0, 0, 'antiquity');
INSERT INTO public.planet VALUES (2, 'Venus', 19, false, 'terrestial', 0, 0, 'antiquity');
INSERT INTO public.planet VALUES (3, 'Earth', 19, true, 'terrestial', 1, 0, 'N/A');
INSERT INTO public.planet VALUES (4, 'Mars', 19, false, 'terrestial', 2, 0, 'antiquity');
INSERT INTO public.planet VALUES (5, 'Jupiter', 19, false, 'gas giant', 95, 4, 'antiquity');
INSERT INTO public.planet VALUES (6, 'Saturn', 19, false, 'gas giant', 145, 7, 'antiquity');
INSERT INTO public.planet VALUES (7, 'Uranus', 19, false, 'ice giant (neptune-like)', 27, 13, '1781');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'M31-RV', 1, 'M (late‑type / red)', 17.0, 'red', 'single');
INSERT INTO public.star VALUES (2, 'M31-V0958', 1, 'F–G (Cepheid; yellow supergiant)', NULL, 'yellow', 'single');
INSERT INTO public.star VALUES (3, 'Sirius', 2, 'A1V', 1.5, 'white/blue-white', 'binary');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'M2–M3 I (red supergiant)', 0.3, 'red', 'single');
INSERT INTO public.star VALUES (5, 'S2', 2, 'B0–B2 V (B‑type)', 14.0, 'blue', 'single');
INSERT INTO public.star VALUES (6, 'Eta Carinae', 2, 'LBV (hot, very luminous; spectrum dominated by emission; no single MK type)', 4.5, 'blue', 'binary');
INSERT INTO public.star VALUES (7, 'WR 102ka Peony star', 2, 'WN (Wolf–Rayet, nitrogen sequence)', 11.6, 'blue-white', 'single');
INSERT INTO public.star VALUES (8, 'M33 Var A', 3, 'K–M / F–G (variable supergiant; spectral type varies)', 16.3, 'yellow/orange/red', 'single');
INSERT INTO public.star VALUES (9, 'VIV-CTE-1', 3, 'F–G (Cepheid; yellow supergiant)', NULL, 'yellow', 'single');
INSERT INTO public.star VALUES (10, 'B416', 3, 'B (early B‑type supergiant)', NULL, 'blue', 'single');
INSERT INTO public.star VALUES (11, 'R136a1', 8, 'WN5‑6 (hydrogen‑rich WN type / Of/WN)', 12.8, 'blue-white', 'multiple');
INSERT INTO public.star VALUES (12, 'HDE 269929', 8, 'B (blue supergiant)', 9.7, 'blue', 'single');
INSERT INTO public.star VALUES (13, 'BAT99-98', 8, 'WN (Wolf–Rayet, nitrogen sequence)', 12.7, 'blue-white', 'single');
INSERT INTO public.star VALUES (14, 'HV 2112', 9, 'M / spectral type uncertain (luminous variable; late‑type)', 13.7, 'red', 'single');
INSERT INTO public.star VALUES (15, 'HV 11423', 9, 'M (red supergiant)', 12.3, 'red', 'single');
INSERT INTO public.star VALUES (16, 'AzV 456', 9, 'O/B (early O or B‑type)', 12.8, 'blue', 'single');
INSERT INTO public.star VALUES (17, 'M51-ULS-1', 4, 'companion: O/B (massive star; exact subtype uncertain)', NULL, 'blue', 'binary');
INSERT INTO public.star VALUES (18, 'V1 (M101)', 6, 'F–G (Cepheid; yellow supergiant)', 23.9, 'yellow', 'single');
INSERT INTO public.star VALUES (19, 'Sun', 2, 'G2V', 26.7, 'yellow-white', 'single');
INSERT INTO public.star VALUES (20, 'Proxima Centauri', 2, 'M5.5V', 11.1, 'red', 'single');
INSERT INTO public.star VALUES (21, 'TRAPPIST-1', 2, 'M8V', 18.8, 'red', 'single');
INSERT INTO public.star VALUES (22, 'Kepler-186', 2, 'M1V (approax.)', 15.0, 'red-orange', 'single');
INSERT INTO public.star VALUES (23, 'HD 209458', 2, 'GOV', 7.7, 'yellow-white', 'single');
INSERT INTO public.star VALUES (24, '51 Pegasi', 2, 'G2IV-V (often G2V)', 5.5, 'yellow-white', 'single');
INSERT INTO public.star VALUES (25, 'WASP-12', 2, 'GOV', 11.7, 'yellow-white', 'single');
INSERT INTO public.star VALUES (26, 'GJ 1214', 2, 'M4.5V', 14.7, 'red', 'single');


--
-- Name: exploration_institution_exploration_institution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exploration_institution_exploration_institution_id_seq', 14, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 26, true);


--
-- Name: exploration_institution exploration_institution_exploration_institution_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration_institution
    ADD CONSTRAINT exploration_institution_exploration_institution_id_key UNIQUE (exploration_institution_id);


--
-- Name: exploration_institution exploration_institution_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration_institution
    ADD CONSTRAINT exploration_institution_pkey PRIMARY KEY (exploration_institution_id);


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

