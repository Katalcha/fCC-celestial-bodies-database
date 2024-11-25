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
    description text,
    age_in_millions_of_years integer NOT NULL,
    galaxy_types_id integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
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
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy is called the Milky Way. It''s a spiral galaxy with a disk of stars spanning more than 100000 light-years. Earth is located along one of the galaxy''s spiral arms, about halfway from the center. Our solar system takes about 240 million years to orbit the Milky Way just once.', 13000, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The Andromeda Galaxy is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', 10000, 1);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'This giant elliptical galaxy in the Virgo Cluster is famous for its active nucleus and an enormous jet emanating from its central black hole. It contains more stars than the Milky Way but significantly less interstellar gas.', 13000, 2);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'The Large Magellanic Cloud is a small, irregular galaxy that orbits the Milky Way. Rich in gas, it features regions of intense star formation, such as the Tarantula Nebula.', 13000, 4);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'This galaxy has a striking appearance with a bright central bulge and a surrounding dust ring, giving it the look of a sombrero. Its core contains a massive black hole. It is considered a transition between elliptical and spiral galaxies.', 13000, 3);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 'IC 1101 is one of the largest known galaxies in the universe, located at the center of the Abell 2029 cluster. It is extremely massive and appears diffuse and yellowish, with almost no star formation activity.', 12000, 2);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral Galaxy', 'Spiral Galaxies resemble giant rotating pinwheels with a pancake-like disk of stars and a central bulge or tight concentration of stars.');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical Galaxy', 'Elliptical Galaxies have shapes that range from completely round to oval. They are less common than spiral galaxies.');
INSERT INTO public.galaxy_types VALUES (3, 'Lenticular Galaxy', 'Lenticular Galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms.');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular Galaxy', 'Irregular Galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. They range from dwarf irregular galaxies with 100 million times the Sun''s mass to large ones weighing 10 billion solar masses.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 'Io is one of Jupiter''s moons and is the most volcanically active body in the Solar System.', false, 4600, 0.000182, 4);
INSERT INTO public.moon VALUES (2, 'Europa', 'Europa is a moon of Jupiter with an icy surface, beneath which a subsurface acean may exist.', true, 4600, 0.000182, 4);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Ganymede is the largest moon in the Solar System and has its own magnetic field.', true, 4600, 0.000182, 4);
INSERT INTO public.moon VALUES (4, 'Callisto', 'Callisto is a large, heavily cratered moon of Jupiter, with an ancient surface.', true, 4600, 0.000182, 4);
INSERT INTO public.moon VALUES (5, 'Titan', 'Titan, Saturn''s largest moon, has a dense atmosphere and liquid methane lakes on its surface.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (6, 'Rhea', 'Rea is a moon of Saturn, composed mainly of water ice with a rocky core.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Enceladus is a moon of Saturn known for its geysers that eject water vapor and ice particles.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Mimas is a small, icy moon of Saturn, known for the large impact crater, Herschel.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (9, 'Triton', 'Triton is Neptune''s largest moon, with a retrograde orbit and geysers of nitrogen gas.', true, 4600, 0.000440, 12);
INSERT INTO public.moon VALUES (10, 'Phobos', 'Phobos is one of Mars'' two moons, known for its irregular shape and rapid orbit around the planet.', false, 4600, 0.000029, 2);
INSERT INTO public.moon VALUES (11, 'Deimos', 'Deimos is the smaller and outer of Mars'' two moons, with a smooth, cratered surface.', false, 4600, 0.000029, 2);
INSERT INTO public.moon VALUES (12, 'Moon', 'The Moon or Lua is Earth''s only natural satellite and the fifth-largest moon in the Solar System.', false, 4600, 0.000002, 1);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'Iapetus is a moon of Saturn, notable for its two-tone coloration and equatorial ridge.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Miranda is a moon of Uranus, with a highly irregular surface and giant cliffs.', true, 4600, 0.000219, 11);
INSERT INTO public.moon VALUES (15, 'Titania', 'Titania is the largest moon of Uranus and features a surface of canyons, ice, and craters.', true, 4600, 0.000219, 11);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Oberon is another large moon of Uranus, marked by craters and ancient terrain', true, 4600, 0.000219, 11);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Umbriel is a dark moon of Uranus, with a heavily createred surface.', true, 4600, 0.000219, 11);
INSERT INTO public.moon VALUES (18, 'Dione', 'Dione is a moon of Saturn, composed mostly of water ice and featuring bright, icy cliffs.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Tethys is another icy moon of Saturn, known for its massive canyon system, Ithaca Chasma.', true, 4500, 0.000134, 5);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Hyperion, a moon of Saturn, has an irregular shape and a sponge-like surface due to numerous craters.', false, 4500, 0.000134, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Earth is the third planet from our Sun and the only known planet to support life, including complex life forms. It has a diverse ecosystem with oceans, forests, and deserts.', true, 4500, 0, 7);
INSERT INTO public.planet VALUES (2, 'Mars', 'Mars is the fourth planet from our Sun and is known fpr its red appearance, caused by iron oxide on its surface. It has the largest volcano and canyon in the solar system.', false, 4500, 0.00015, 7);
INSERT INTO public.planet VALUES (3, 'Venus', 'Venus is the second planet from the Sun and is often called Earth''s "sister planet" because of its similar size. Its thick atmosphere is mostly carbon dioxide, with clouds of sulfuric acid.', false, 4500, 0.000025, 7);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Jupiter is the largest planet in the solar system and is a gas giant. It has a strong magnetic field and dozens of moons, including the largest moon, Ganymede.', false, 4500, 0.00043, 7);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Saturn is the second-largest planet in the solar system, recognized for its stunning ring system. It is a gas giant with over 80 moons, including Titan, which has a thick atmosphere.', false, 4500, 0.00074, 7);
INSERT INTO public.planet VALUES (6, 'Sirius b', 'Sirius b is a white dwarf planet orbiting the star Sirius A. It is the remnant of a star that has gone through a supernova-like event.', false, 120, 8.6, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 'Proxima Centauri b is an exoplanet orbiting the red dwarf star Proxima Centauri in the Alpha Centauri system. It is located within the habitable zone, where liquid water could exist.', false, 4, 4.25, 5);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri A b', 'Alpha Centauri A b is an exoplanet orbiting Alpha Centauri A, one of the stars in the Alpha Centauri system. It lies in the habitable zone of its star.', true, 4, 4.37, 2);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 'Betelgeuse b is an exoplanet orbiting the red supergiant star Betelgeuse. Its exact nature is not fully understood, but it is far from Earth and likely to have hostile conditions for life.', false, 10, 642.5, 3);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Proxima Centauri c ist ein erdgroßer Planet im Alpha Centauri System, der Proxima Centauri umkreist. Er liegt in einer Entfernung, die ihn zu einem Kandidaten für Leben macht, jedoch in einer Region, die sehr kalte Temperaturen mit sich bringen könnte.', false, 4, 4.25, 5);
INSERT INTO public.planet VALUES (11, 'Uranus', 'Uranus is the seventh planet from the Sun and is an ice giant with a blue-green color due to methane in its atmosphere. It has a tilted axis, causing extreme seasonal variations. Uranus has a faint ring system and 27 known moons.', false, 4500, 0.0027, 7);
INSERT INTO public.planet VALUES (12, 'Neptune', 'Neptune is the eighth planet from the Sun and is known for its deep blue color, also caused by methane in its atmosphere. It is a large ice giant with strong winds and storms, including the Great Dark Spot, a massive storm similar to Jupiter’s Great Red Spot.', false, 4500, 0.0043, 7);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Chthonian Planet', 'An extrasolar planet that orbits close to its parent star. Most Chthonian planets are expected to be gas giants that had their atmosphere stripped away, leaving their cores.');
INSERT INTO public.planet_types VALUES (2, 'Carbon Planet', 'A theoretical terristrial planet that could form if protoplanetary discs are carbon-rich and oxygen-poor.');
INSERT INTO public.planet_types VALUES (3, 'Coreless Planet', 'A theoretical planet that has undergone planetary differentiation but has no metallic core. Not to be confused with the Hollow Earth concept.');
INSERT INTO public.planet_types VALUES (4, 'Desert Planet', 'A terrestrial planet with an arid surface consistency similar to Earth''s deserts. Mars is arguably an example of a desert planet.');
INSERT INTO public.planet_types VALUES (5, 'Gas Dwarf', 'A low-mass planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_types VALUES (6, 'Gas Giant', 'A massive planet composed primarily of hydrogen and helium.');
INSERT INTO public.planet_types VALUES (7, 'Helium Planet', 'A theoretical planet that may form via mass loss from a low-mass white dwarf. Helium planets are predicted to have roughly the same diameter as hydrogen-helium planets of the same mass.');
INSERT INTO public.planet_types VALUES (8, 'Hycean Planet', 'A hypothetical type of habitable planet described as a hot, water-covered planet with a hydrogen-rich atmosphere.');
INSERT INTO public.planet_types VALUES (9, 'Ice Giant', 'A giant planet composed mainly of "ices" ((volatile substances heavier than hydrogen and helium, such as water, methane, and ammonia)) as apposed to "gas" ((hydrogen and helium))');
INSERT INTO public.planet_types VALUES (10, 'Ice Planet', 'A theoretical planet with an icy surface and consists of a global cryosphere.');
INSERT INTO public.planet_types VALUES (11, 'Iron Planet', 'A theoretical planet that consists primarily of an iron-rich core with little or no mantle.');
INSERT INTO public.planet_types VALUES (12, 'Lava Planet', 'A theoretical planet terrestrial planet with a surface mostly or entirely covered by molten lava.');
INSERT INTO public.planet_types VALUES (13, 'Ocean Planet', 'A theoretical planet which has a substantial fraction of its mass made of water.');
INSERT INTO public.planet_types VALUES (14, 'Protoplanet', 'A large planetary embryo that originates within protoplanetary discs and has undergone internal melting to produce differentianted interiors. Protoplanets are believed to form out of kilometer-sized planetesimals that attract each other gravitationally and collide.');
INSERT INTO public.planet_types VALUES (15, 'Puffy Planet', 'A gas giant with a large radius and very low density which is similar to or lower than Saturn''s.');
INSERT INTO public.planet_types VALUES (16, 'Super-puff', 'A type of exoplanet with a mass only a few times larger than Earth''s but with a radius larger than that of Neptune, giving it a very low mean density.');
INSERT INTO public.planet_types VALUES (18, 'Terrestrial Planet', 'Also known as a telluric planet or rocky planet. A planet that is composed primarily of carbonaceous or silicate rocks or metals.');
INSERT INTO public.planet_types VALUES (17, 'Silicate Planet', 'A terrestrial planet that is composed primarily of silicate rocks. All four inner planets in the Solar System are silicon-based.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Sirius is the brightest star in the night Sky. It is a binary star system consisting of Sirius A, a main-sequence star, and Sirius B, a white dwarf. It is well-known for its prominence in both ancient cultures and modern astronomy.', 120, 8.6, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 'Alpha Centauri A is a bright, sun-like star in the Alpha Centauri star system. It is part of a triple star system with Alpha Centauri B and Proxima Centauri. It is the closest star to Earth, after the Sun.', 5300, 4.37, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Betelgeuse is a red supergiant star located in the constellation Orion. It is one of the largest stars visible to the naked eye and has a distinct red hue. This star is nearing the end of its life and is expected to explode as a supernova.', 10, 642.5, 1);
INSERT INTO public.star VALUES (4, 'Andromeda I ((M31 Star))', 'Andromeda I is a star located in the Andromeda Galaxy, which is the closest spiral galaxy to the Milky Way. It is part of the large star population in the Andromeda Galaxy. The star is an example of the thousands of bright stars observable in this galaxy.', 1000, 2500000, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Proxima Centauri is the closest known star to the Sun. It is a red dwarf star and part of the Alpha Centauri system, located just slightly closer than Alpha Centauri A and B. Despite its proximity, it is not visible to the naked eye.', 4850, 4.24, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 'Polaris, also known as the North Star, is a yellow supergiant star located near the celestial north pole. It has been a crucial point of navigation for centuries due to its fixed position in the sky. Polaris is actually a multiple star system.', 70, 433, 1);
INSERT INTO public.star VALUES (7, 'Sol', 'Sol is the Sun at the center of your solar system, providing light and energy necessary for life on Earth. It is a G-type main-sequence star ((G2V)) and has a stable energy output. The Sun is a middle-aged star and will eventually evolve inta a red giant before shedding its outer layers and becoming a white dwarf.', 4600, 0, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 4, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 18, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


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
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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

