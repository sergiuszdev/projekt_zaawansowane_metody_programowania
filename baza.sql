--
-- PostgreSQL database dump
--

\restrict t9d1eWDSBbNRdlV99Q4sXMLF2Sf0DM9Dj8ekqE9SG5LKszmLeTnNEB0CW332FFg

-- Dumped from database version 16.0
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: psiim-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "psiim-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "psiim-db" OWNER TO postgres;

\unrestrict t9d1eWDSBbNRdlV99Q4sXMLF2Sf0DM9Dj8ekqE9SG5LKszmLeTnNEB0CW332FFg
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='psiim-db'"
\restrict t9d1eWDSBbNRdlV99Q4sXMLF2Sf0DM9Dj8ekqE9SG5LKszmLeTnNEB0CW332FFg

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievements (
    achievement_id uuid NOT NULL,
    name character varying(256) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.achievements OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    comment_id uuid NOT NULL,
    user_id uuid NOT NULL,
    mountain_id uuid NOT NULL,
    root_comment_id uuid,
    content text NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: mountains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mountains (
    mountain_id uuid NOT NULL,
    mountain_name character varying(256) NOT NULL,
    description text NOT NULL,
    image_path character varying(256) NOT NULL,
    image_source character varying(256) NOT NULL
);


ALTER TABLE public.mountains OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id uuid NOT NULL,
    username character varying(256) NOT NULL,
    email character varying(256) NOT NULL,
    password character varying(512) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_achievements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_achievements (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    achievement_id uuid NOT NULL
);


ALTER TABLE public.users_achievements OWNER TO postgres;

--
-- Name: users_mountains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_mountains (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    mountain_id uuid NOT NULL
);


ALTER TABLE public.users_mountains OWNER TO postgres;

--
-- Data for Name: achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievements (achievement_id, name, description) FROM stdin;
5da013f0-cf1a-4f61-a4a5-7106365c57af	Zdobywca	Zdobądź Koronę Gór Polski
bbd0a19c-83a9-4022-9504-234d0815a2b6	Miłośnik Sudetów	Zdobądź wszystkie szczyty w Sudetach
8f6ac1f2-a88f-466e-97b6-ba458dcc0bbe	Miłośnik Karpat	Zdobądź wszystkie szczyty w Karpatach
16fa5a46-b2a8-4bae-afe8-c69a2e1d6181	Fan wysokich wrażeń	Zdobądź wszystkie szczyty powyżej 1000 m. n. p. m.
09ce47e9-5bf9-4255-9403-82c692a1bc0d	Wielbiciel nizin	Zdobądź wszystkie szczyty poniżej 1000 m. n. p. m.
4f9c2ca0-ee9f-4a8a-871a-4c504d7d3a9b	Wyżej już się nie da	Zdobądź najwyższy szczyt (Rysy)
488fb442-a713-4640-ac6d-0c0c6292377a	Najłatwiejsze już za tobą	Zdobądź najniższy szczyt (Łysica)
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (comment_id, user_id, mountain_id, root_comment_id, content, created_at) FROM stdin;
44ddadaf-a804-43d7-8be8-5a4412728660	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3	\N	Wspaniała góra wspaniali ludzie	2024-06-17 20:13:28
d70f475a-aa4c-4256-a1e3-3e222232414b	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3	44ddadaf-a804-43d7-8be8-5a4412728660	to prawda	2024-06-17 23:40:28.347598
9215604b-218c-41df-a968-76273bed21b0	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3	44ddadaf-a804-43d7-8be8-5a4412728660	tylko trochę niska małe wyzwanie na taką hehe	2024-06-17 23:41:04.685737
d6b05260-b197-4f9e-8c1f-c2f7868f42e0	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	0272834d-2a43-411a-bfb1-b90239513491	\N	Pozdrawiam	2026-01-18 11:50:07.207256
12dc2685-d365-4254-bc24-757ed457fddc	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	0272834d-2a43-411a-bfb1-b90239513491	d6b05260-b197-4f9e-8c1f-c2f7868f42e0	z łysiny	2026-01-18 11:50:17.563219
a48dba98-53b8-4dbf-94ca-933d4130527a	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3	\N	123	2026-01-21 12:17:42.564291
4e87cf1d-e36d-4a8f-bdc9-0078c73506de	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	cfe4d9bc-6790-4268-802a-47f48a3904cc	\N	123	2026-01-21 12:23:12.631193
edd0b2fc-de7b-427e-b7e0-8878b46c322e	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	cfe4d9bc-6790-4268-802a-47f48a3904cc	4e87cf1d-e36d-4a8f-bdc9-0078c73506de	321	2026-01-21 12:23:17.521024
\.


--
-- Data for Name: mountains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mountains (mountain_id, mountain_name, description, image_path, image_source) FROM stdin;
0272834d-2a43-411a-bfb1-b90239513491	Łysica	Góry Świętokrzyskie (612 m. n. p. m.)	mountains_img/Lysica.jpg	https://pl.wikipedia.org/wiki/%C5%81ysica_(G%C3%B3ry_%C5%9Awi%C4%99tokrzyskie)#/media/Plik:%C5%81ysica_krzy%C5%BC_IMG_20230716.jpg
cfe4d9bc-6790-4268-802a-47f48a3904cc	Ślęża	Masyw Ślęży (718 m. n. p. m.)	mountains_img/Sleza.jpg	https://pl.wikipedia.org/wiki/%C5%9Al%C4%99%C5%BCa#/media/Plik:%C5%9Al%C4%99%C5%BCa_-_widok_z_Wie%C5%BCycy.jpg
3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3	Skopiec	Góry Kaczawskie (724 m. n. p. m.)	mountains_img/Skopiec.jpg	https://pl.wikipedia.org/wiki/Skopiec#/media/Plik:Skopiec_mit2.JPG
685d2ab6-221c-4659-b146-5e240fa22a8e	Kłodzka Góra	Góry Bardzkie (765 m. n. p. m.)	mountains_img/Klodzka_Gora.jpg	https://pl.wikipedia.org/wiki/K%C5%82odzka_G%C3%B3ra#/media/Plik:KB_Wie%C5%BCa_widokowa_na_K%C5%82odzkiej_G%C3%B3rze_2.jpg
c97af7f6-8d36-4674-8d6e-18a7023cfef8	Chełmiec	Góry Wałbrzyskie (869 m. n. p. m.)	mountains_img/Chelmiec.jpg	https://pl.wikipedia.org/wiki/Che%C5%82miec_(szczyt)#/media/Plik:Che%C5%82miec_(szczyt)-widok.jpg
2bb31a0b-2332-48ec-8676-2331e2f9cad0	Biskupia Kopa	Góry Opawskie (889 m. n. p. m.)	mountains_img/Biskupia_Kopa.jpg	https://pl.wikipedia.org/wiki/Biskupia_Kopa#/media/Plik:Franz_josef_warte.JPG
443fde7d-5958-45c1-9d97-70368e5769e4	Lubomir	Beskid Makowski (912 m. n. p. m.)	mountains_img/Lubomir.jpg	https://pl.wikipedia.org/wiki/Lubomir_(szczyt)#/media/Plik:Lubomir_a1.jpg
b939a070-af06-4831-9727-14421c269a10	Szczeliniec Wielki	Góry Stołowe (919 m. n. p. m.)	mountains_img/Szczeliniec_Wielki.jpg	https://pl.wikipedia.org/wiki/Szczeliniec_Wielki#/media/Plik:Rocks_-_Gro%C3%9Fe_Heuscheuer..jpg
fbc30a1e-4a39-436c-bc94-44fd2452d54e	Czupel	Beskid Mały (934 m. n. p. m.)	mountains_img/Czupel.jpg	https://pl.wikipedia.org/wiki/Czupel_(931_m)#/media/Plik:POLAND_BeskidMaly_Czupel_933m.jpg
990b80e3-1e90-48f0-a78f-8871580f7a09	Waligóra	Góry Kamienne (936 m. n. p. m.)	mountains_img/Waligora.jpg	https://pl.wikipedia.org/wiki/Walig%C3%B3ra#/media/Plik:Waligora_walbrzyskie_01.jpg
e5dc6302-5f16-4c71-a282-ecf93393efaa	Skalnik	Rudawy Janowickie (945 m. n. p. m.)	mountains_img/Skalnik.jpg	https://pl.wikipedia.org/wiki/Skalnik_(Rudawy_Janowickie)#/media/Plik:Skalnik_mit.JPG
f54d011e-7d27-4b9d-9b83-211d532d84e3	Jagodna	Góry Bystrzyckie (977 m. n. p. m.)	mountains_img/Jagodna.jpg	https://pl.wikipedia.org/wiki/Jagodna_(G%C3%B3ry_Bystrzyckie)#/media/Plik:KB_Wie%C5%BCa_widokowa_na_Jagodnej.jpg
9a849d45-5b6e-417f-8e49-08ea9d4e75b9	Kowadło	Góry Złote (989 m. n. p. m.)	mountains_img/Kowadlo.jpg	https://pl.wikipedia.org/wiki/Kowad%C5%82o_(szczyt)#/media/Plik:2016_Kowad%C5%82o,_G%C3%B3ry_Z%C5%82ote.jpg
0203d577-a491-4e55-8f0f-8ffeffe20d82	Lackowa	Beskid Niski (997 m. n. p. m.)	mountains_img/Lackowa.jpg	https://pl.wikipedia.org/wiki/Lackowa#/media/Plik:Krynica-Zdr%C3%B3j,_wie%C5%BCa_widokowa_(HB12).jpg
e7beaeea-a4d4-403f-bed9-e7b02f1abc51	Wielka Sowa	Góry Sowie (1015 m. n. p. m.)	mountains_img/Wielka_Sowa.jpg	https://pl.wikipedia.org/wiki/Wielka_Sowa#/media/Plik:2016_Wie%C5%BCa_widokowa_na_Wielkiej_Sowie_1.jpg
108b5e52-2f46-40d9-894e-21b8d608fd0d	Wysoka	Pieniny (1050 m. n. p. m.)	mountains_img/Wysoka.jpg	https://pl.wikipedia.org/wiki/Wysokie_Ska%C5%82ki#/media/Plik:Wysoka_(Pieniny)_a3.jpg
2c2897d4-4710-4435-9d7f-c5355f6e1819	Orlica	Góry Orlickie (1084 m. n. p. m.)	mountains_img/Orlica.jpg	https://pl.wikipedia.org/wiki/Orlica_(szczyt)#/media/Plik:Wie%C5%BCa_widokowa_Orlica.jpg
892ae3fe-e9e3-434b-be46-3ee795f0619c	Rudawiec	Góry Bialskie (1112 m. n. p. m.)	mountains_img/Rudawiec.jpg	https://pl.wikipedia.org/wiki/Rudawiec_(szczyt)#/media/Plik:Gory_Bialskie.jpg
7acd24a7-348b-41a3-9d79-8b159e45b9cd	Wysoka Kopa	Góry Izerskie (1126 m. n. p. m.)	mountains_img/Wysoka_Kopa.jpg	https://pl.wikipedia.org/wiki/Wysoka_Kopa#/media/Plik:Wysoka_Kopa_mit.JPG
d94917c4-c41a-4ee6-ae3e-a376810b050b	Mogielica	Beskid Wyspowy (1170 m. n. p. m.)	mountains_img/Mogielica.jpg	https://pl.wikipedia.org/wiki/Mogielica#/media/Plik:Mogielica_a12.jpg
1fa02214-527e-4f4c-b233-754e38559f43	Skrzyczne	Beskid Śląski (1257 m. n. p. m.)	mountains_img/Skrzyczne.jpg	https://pl.wikipedia.org/wiki/Skrzyczne#/media/Plik:Skrzyczne_B%C5%9A1_(2).jpg
f81d3727-9e2f-4e0a-a9af-28bfaf89784f	Radziejowa	Beskid Sądecki (1262 m. n. p. m.)	mountains_img/Radziejowa.jpg	https://pl.wikipedia.org/wiki/Radziejowa#/media/Plik:Masyw_Radziejowej_a1.jpg
4d1e48c9-3ac7-4358-ba09-458e67e6b1f5	Turbacz	Gorce (1310 m. n. p. m.)	mountains_img/Turbacz.jpg	https://pl.wikipedia.org/wiki/Turbacz#/media/Plik:Turbacz_(5).jpg
4d74444a-530c-495b-bdb2-ffce3348c0a1	Tarnica	Bieszczady (1346 m. n. p. m.)	mountains_img/Tarnica.jpg	https://pl.wikipedia.org/wiki/Tarnica#/media/Plik:Tarnica,_ze_szlaku_na_Prze%C5%82%C4%99cz_Goprowc%C3%B3w_(HB3)_01.jpg
b5b750db-9036-49b4-a851-84d375a16b40	Śnieżka	Karkonosze (1602 m. n. p. m.)	mountains_img/Sniezka.jpg	https://pl.wikipedia.org/wiki/%C5%9Anie%C5%BCka#/media/Plik:Sniezka_from_krucze_skaly.jpg
888fdb22-d598-47f4-9bb9-a40bc893b75d	Babia Góra	Beskid Żywiecki (1725 m. n. p. m.)	mountains_img/Babia_Gora.jpg	https://pl.wikipedia.org/wiki/Diablak#/media/Plik:Babia_G%C3%B3ra_BG2.3.jpg
cef62e48-bbd1-4128-8aa5-139845070dfc	Rysy	Tatry (2499 m. n. p. m.)	mountains_img/Rysy.jpg	https://pl.wikipedia.org/wiki/Rysy#/media/Plik:WysokaRysy_R+NR2018.jpg
bf2dad52-59d0-4638-9625-0e2ab0d9289d	Śnieżnik	Masyw Śnieżnika (1425 m. n. p. m.)	mountains_img/Snieznik.jpg	https://pl.wikipedia.org/wiki/%C5%9Anie%C5%BCnik_(g%C3%B3ra)#/media/Plik:Snieznik_Klodzki_mountain_(southern_side).jpeg
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password) FROM stdin;
443badaf-a804-43d7-8be8-5a44b9728660	admin	admin@admin.pl	$2b$12$VI4kAOeUk0Kn1fu3v7P/P.APLzMeZoOFq9gaxZt.6QAh/aYXHvUay
81267a3b-eafd-4869-9767-2ffb4b54d829	szymon	s@s.pl	$2b$12$FWpNEjpmyg.dRp6jr1lqN.fORoWeaf0oh/sdYz8dnk63efuDOsvmq
e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	admin2026	admin2026@admin.pl	$2b$12$hr5MZj4Rkh6uhJ5um9cYkuW64UzShEJeuyfKSVHWbkIGXtm8kkQTW
\.


--
-- Data for Name: users_achievements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_achievements (id, user_id, achievement_id) FROM stdin;
980a09c6-3885-4b09-b730-4ab718415dfc	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	488fb442-a713-4640-ac6d-0c0c6292377a
\.


--
-- Data for Name: users_mountains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_mountains (id, user_id, mountain_id) FROM stdin;
c4d91389-f181-431c-b0d8-7371a057ed5a	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
7db64888-b988-46a7-b9b1-2da9e8d361ed	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
da8f28ff-8d0a-44c3-8bf6-23bb0edf8a75	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
680fd6db-56cc-4767-9660-15974b5c04b2	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
ae851f0d-75c3-4343-9a22-b0c68bfda662	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
262dcbb6-865f-4dd6-ae51-b9c002f668f1	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
742a96c4-3f86-4e67-ab24-54fbdcfb4245	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
4259b45c-7668-429b-a730-a8cf50ad2829	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
8889d339-199a-4532-a811-02561de0b1ff	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
08d69c98-9e5a-4ef9-ba51-56c49ba06623	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
a1e52eec-6740-4136-83ba-3537d435e1d6	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
90093ac2-d95d-4cc2-a11f-c9ee48f4a240	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
15b2286c-c1dc-4331-a2d3-f37e06b512e9	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
cf140b27-e77f-4705-9678-35217111b826	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
3c8dc841-15cc-41f6-9119-0354ab75af43	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
653b8c9d-862a-48c1-899c-e4505dbc69ea	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
e7b91723-9cfb-45ad-86d3-a4d056de67d8	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
e90ea081-13e5-4f3b-ab60-9b57625b89c8	443badaf-a804-43d7-8be8-5a44b9728660	3bd597dd-95ec-4b6a-b7f1-7b2370c65ca3
98cce637-9511-4d5c-9148-927c981fdfe7	443badaf-a804-43d7-8be8-5a44b9728660	0272834d-2a43-411a-bfb1-b90239513491
f55a9055-a41a-4da1-98dd-876cf7c015a9	81267a3b-eafd-4869-9767-2ffb4b54d829	cfe4d9bc-6790-4268-802a-47f48a3904cc
d8cb9ac6-c8d6-4464-af8a-9c9ce6323332	81267a3b-eafd-4869-9767-2ffb4b54d829	cfe4d9bc-6790-4268-802a-47f48a3904cc
e1cbaf6c-e57a-4d50-b3c0-c26336533876	81267a3b-eafd-4869-9767-2ffb4b54d829	685d2ab6-221c-4659-b146-5e240fa22a8e
d3bb0a3c-b046-499a-839e-44ec28b2dc63	81267a3b-eafd-4869-9767-2ffb4b54d829	0272834d-2a43-411a-bfb1-b90239513491
a3a3b7e9-dc96-473d-b61c-0983dc67d015	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	0272834d-2a43-411a-bfb1-b90239513491
253c63ee-f7d0-4ae2-959c-24184c9bc94b	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	0272834d-2a43-411a-bfb1-b90239513491
ba1298f4-b1b0-4a3a-9da6-383706110d8d	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	685d2ab6-221c-4659-b146-5e240fa22a8e
99124976-9b2b-47ad-bd79-7d477a656f15	e0af24b5-e6e9-4cfa-94a6-9a75e5b29666	2bb31a0b-2332-48ec-8676-2331e2f9cad0
\.


--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (achievement_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);


--
-- Name: mountains mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mountains
    ADD CONSTRAINT mountains_pkey PRIMARY KEY (mountain_id);


--
-- Name: users_achievements users_achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_achievements
    ADD CONSTRAINT users_achievements_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_mountains users_mountains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_mountains
    ADD CONSTRAINT users_mountains_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_mountain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_mountain_id_fkey FOREIGN KEY (mountain_id) REFERENCES public.mountains(mountain_id);


--
-- Name: comments comments_root_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_root_comment_id_fkey FOREIGN KEY (root_comment_id) REFERENCES public.comments(comment_id);


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_achievements users_achievements_achievement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_achievements
    ADD CONSTRAINT users_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(achievement_id);


--
-- Name: users_achievements users_achievements_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_achievements
    ADD CONSTRAINT users_achievements_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_mountains users_mountains_mountain_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_mountains
    ADD CONSTRAINT users_mountains_mountain_id_fkey FOREIGN KEY (mountain_id) REFERENCES public.mountains(mountain_id);


--
-- Name: users_mountains users_mountains_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_mountains
    ADD CONSTRAINT users_mountains_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict t9d1eWDSBbNRdlV99Q4sXMLF2Sf0DM9Dj8ekqE9SG5LKszmLeTnNEB0CW332FFg

