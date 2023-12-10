--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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

--
-- Name: contoh; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA contoh;


ALTER SCHEMA contoh OWNER TO postgres;

--
-- Name: product_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.product_category AS ENUM (
    'Makanan',
    'Minuman',
    'Lain-Lain'
);


ALTER TYPE public.product_category OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: products; Type: TABLE; Schema: contoh; Owner: postgres
--

CREATE TABLE contoh.products (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE contoh.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: contoh; Owner: postgres
--

CREATE SEQUENCE contoh.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE contoh.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: contoh; Owner: postgres
--

ALTER SEQUENCE contoh.products_id_seq OWNED BY contoh.products.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id character varying(10) NOT NULL,
    negara character varying(50) NOT NULL,
    provinsi character varying(50) NOT NULL,
    kabupaten character varying(50) NOT NULL,
    kecamatan character varying(50) NOT NULL,
    desa character varying(50) NOT NULL,
    jalan character varying(50) NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_akun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_akun (
    id integer NOT NULL,
    id_pembeli_akun integer NOT NULL,
    id_penjual_akun integer NOT NULL
);


ALTER TABLE public.admin_akun OWNER TO postgres;

--
-- Name: admin_akun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_akun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_akun_id_seq OWNER TO postgres;

--
-- Name: admin_akun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_akun_id_seq OWNED BY public.admin_akun.id;


--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_seq OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: akun_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.akun_game (
    id character varying(10) NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(30) NOT NULL
);


ALTER TABLE public.akun_game OWNER TO postgres;

--
-- Name: barang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barang (
    kode integer NOT NULL,
    name character varying(100) NOT NULL,
    harga integer DEFAULT 1000 NOT NULL,
    jumlah integer DEFAULT 0 NOT NULL,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.barang OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id character varying(100) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: dompets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dompets (
    id character varying(10) NOT NULL,
    saldo integer NOT NULL
);


ALTER TABLE public.dompets OWNER TO postgres;

--
-- Name: gusetbooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gusetbooks (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    title character varying(1000) NOT NULL,
    content text
);


ALTER TABLE public.gusetbooks OWNER TO postgres;

--
-- Name: gusetbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gusetbooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gusetbooks_id_seq OWNER TO postgres;

--
-- Name: gusetbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gusetbooks_id_seq OWNED BY public.gusetbooks.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    total integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_detail (
    id_product character varying(10) NOT NULL,
    id_order integer NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.orders_detail OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: pembeli_akun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembeli_akun (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    saldo integer NOT NULL
);


ALTER TABLE public.pembeli_akun OWNER TO postgres;

--
-- Name: pembeli_akun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pembeli_akun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pembeli_akun_id_seq OWNER TO postgres;

--
-- Name: pembeli_akun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pembeli_akun_id_seq OWNED BY public.pembeli_akun.id;


--
-- Name: penjual_akun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penjual_akun (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    id_akun character varying(10)
);


ALTER TABLE public.penjual_akun OWNER TO postgres;

--
-- Name: penjual_akun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penjual_akun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.penjual_akun_id_seq OWNER TO postgres;

--
-- Name: penjual_akun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.penjual_akun_id_seq OWNED BY public.penjual_akun.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    price integer NOT NULL,
    quantity integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id_category character varying(10),
    CONSTRAINT price_check CHECK ((price >= 10000)),
    CONSTRAINT quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- Name: sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sellers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sellers_id_seq OWNER TO postgres;

--
-- Name: sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sellers_id_seq OWNED BY public.sellers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    id_dompet character varying(10),
    id_address character varying(10)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallet (
    id integer NOT NULL,
    id_customer integer NOT NULL,
    balance integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.wallet OWNER TO postgres;

--
-- Name: wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wallet_id_seq OWNER TO postgres;

--
-- Name: wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallet_id_seq OWNED BY public.wallet.id;


--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id integer NOT NULL,
    id_product character varying(10) NOT NULL,
    description text,
    id_customer integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlist_id_seq OWNER TO postgres;

--
-- Name: wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;


--
-- Name: products id; Type: DEFAULT; Schema: contoh; Owner: postgres
--

ALTER TABLE ONLY contoh.products ALTER COLUMN id SET DEFAULT nextval('contoh.products_id_seq'::regclass);


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: admin_akun id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_akun ALTER COLUMN id SET DEFAULT nextval('public.admin_akun_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: gusetbooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gusetbooks ALTER COLUMN id SET DEFAULT nextval('public.gusetbooks_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: pembeli_akun id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembeli_akun ALTER COLUMN id SET DEFAULT nextval('public.pembeli_akun_id_seq'::regclass);


--
-- Name: penjual_akun id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penjual_akun ALTER COLUMN id SET DEFAULT nextval('public.penjual_akun_id_seq'::regclass);


--
-- Name: sellers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers ALTER COLUMN id SET DEFAULT nextval('public.sellers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wallet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet ALTER COLUMN id SET DEFAULT nextval('public.wallet_id_seq'::regclass);


--
-- Name: wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: contoh; Owner: postgres
--

COPY contoh.products (id, name) FROM stdin;
1	Ipon
2	boboa
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, negara, provinsi, kabupaten, kecamatan, desa, jalan) FROM stdin;
A0001	indonesia	ntb	lobar	gunungsari	sesela	sudirman
A0002	indonesia	ntb	lobar	gunungsari	ransel	yahni
A0003	indonesia	ntb	lobar	gunungsari	sesela	soekarno
A0004	indonesia	ntb	lobar	gunungsari	sesela	palapa
\.


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, first_name, last_name) FROM stdin;
1	farid	anangs
2	wagas	tri
3	raika	aisyah
\.


--
-- Data for Name: admin_akun; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_akun (id, id_pembeli_akun, id_penjual_akun) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	3
6	1	2
7	2	2
8	3	2
\.


--
-- Data for Name: akun_game; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.akun_game (id, name, email, password) FROM stdin;
AG0001	ff	frefi@gmail.com	frefire123
AG0002	ml	molej@gmail.com	molej123
AG0003	pubg	pubg@gmail.com	pubg1234
\.


--
-- Data for Name: barang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.barang (kode, name, harga, jumlah, waktu_dibuat) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
C0001	Makanan
C0002	Minuman
C0003	Gejet
C0004	Laptop
C0005	Sayur
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name) FROM stdin;
C0001	Makanan
C0002	Minuman
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, email, first_name, last_name) FROM stdin;
1	farid@gmail.com	farid	anangs
3	diana@gmail.com	diana	milda
4	wagas@gmail.com	wagas	try
\.


--
-- Data for Name: dompets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dompets (id, saldo) FROM stdin;
D0001	100000
D0002	10000000
D0003	200000
D0004	9000000
\.


--
-- Data for Name: gusetbooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gusetbooks (id, email, title, content) FROM stdin;
1	farid@gmail.com	feddback farid	ini feddback farid
2	farid@gmail.com	feddback farid	ini feddback farid
3	diana@gmail.com	feddback diana	ini feddback diana
4	wagas@gmail.com	feddback wagas	ini feddback wagas
5	usman@gmail.com	feddback usman	ini feddback usman
6	usman@gmail.com	feddback usman	ini feddback usman
7	transaction1@gmail.com	feddback transaction1	ini feddback transaction1
8	transaction2@gmail.com	feddback transaction2	ini feddback transaction2
9	transaction3@gmail.com	feddback transaction3	ini feddback transaction3
10	transaction4@gmail.com	feddback transaction4	ini feddback transaction4
11	transaction5@gmail.com	feddback transaction5	ini feddback transaction5
12	transaction6@gmail.com	feddback transaction6	ini feddback transaction6
19	anangs123@gmail.com	contoh	contoh
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, total, order_date) FROM stdin;
1	1	2023-12-05 22:30:08.568095
2	1	2023-12-05 22:30:08.568095
3	1	2023-12-05 22:30:08.568095
\.


--
-- Data for Name: orders_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_detail (id_product, id_order, price, quantity) FROM stdin;
P0001	1	10000	3
P0002	1	60000	4
P0003	1	20000	5
P0004	2	10000	23
P0005	2	60000	1
P0006	2	20000	6
P0007	3	10000	13
P0002	3	60000	45
P0005	3	20000	2
\.


--
-- Data for Name: pembeli_akun; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembeli_akun (id, name, saldo) FROM stdin;
1	farid	20000
2	diana	50000
3	wagas	10000
\.


--
-- Data for Name: penjual_akun; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penjual_akun (id, name, id_akun) FROM stdin;
1	usman	AG0001
2	amar	AG0002
3	luki	AG0003
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, quantity, created_at, id_category) FROM stdin;
P0005	Mi Ayam Yamin	Mie Ayam + Ceker	20000	100	2023-12-03 10:36:18.605711	C0001
P0002	Mi Ayam Bakso Tahu	Mie Ayam Original	20000	100	2023-12-03 10:29:46.96936	C0001
P0003	Mi Ayam Ceker	\N	20000	100	2023-12-03 10:36:18.605711	C0001
P0004	Mi Ayam Spesial	\N	25000	100	2023-12-03 10:36:18.605711	C0001
P0007	Es campur	\N	20000	100	2023-12-03 11:45:07.453781	C0002
P0008	Es jeruk	\N	15000	100	2023-12-03 11:45:07.453781	C0002
P0006	Es teh tawar	\N	15000	100	2023-12-03 11:45:07.453781	C0002
X0001	bakso 1	\N	19999	10	2023-12-06 20:51:59.989292	\N
X0002	bakso 2	\N	19999	10	2023-12-06 20:51:59.989292	\N
P0001	Mi Ayam Original	Mie Ayama Original	30000	100	2023-12-03 10:28:12.171989	C0001
\.


--
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sellers (id, name, email) FROM stdin;
1	Glery Bakso	galery@gmail.com
2	Toko tono	tono@gmail.com
3	Glery budi	budi@gmail.com
4	Glery agus	agus@gmail.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_name, email, id_dompet, id_address) FROM stdin;
4	raika	raika@gmail.com	D0004	A0004
3	diana	diana@gmail.com	D0003	A0003
2	wagas	wagas@gmail.com	D0002	A0002
1	farid	farid1@gmail.com	D0001	A0001
\.


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallet (id, id_customer, balance) FROM stdin;
1	1	100000
2	3	300000
3	4	400000
\.


--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, id_product, description, id_customer) FROM stdin;
28	P0002	Mi ayam kuah	\N
27	P0001	Mi ayam kangkung	1
29	P0003	Mi ayam sampi	3
30	P0004	Mi ayam lepang	4
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: contoh; Owner: postgres
--

SELECT pg_catalog.setval('contoh.products_id_seq', 2, true);


--
-- Name: admin_akun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_akun_id_seq', 8, true);


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 3, true);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 6, true);


--
-- Name: gusetbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gusetbooks_id_seq', 19, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 3, true);


--
-- Name: pembeli_akun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembeli_akun_id_seq', 3, true);


--
-- Name: penjual_akun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penjual_akun_id_seq', 3, true);


--
-- Name: sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sellers_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallet_id_seq', 3, true);


--
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 34, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: contoh; Owner: postgres
--

ALTER TABLE ONLY contoh.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admin_akun admin_akun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_akun
    ADD CONSTRAINT admin_akun_pkey PRIMARY KEY (id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: akun_game akun_game_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akun_game
    ADD CONSTRAINT akun_game_email_unique UNIQUE (email);


--
-- Name: akun_game akun_game_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.akun_game
    ADD CONSTRAINT akun_game_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: dompets dompets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dompets
    ADD CONSTRAINT dompets_pkey PRIMARY KEY (id);


--
-- Name: sellers email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- Name: gusetbooks gusetbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gusetbooks
    ADD CONSTRAINT gusetbooks_pkey PRIMARY KEY (id);


--
-- Name: orders_detail orders_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_detail
    ADD CONSTRAINT orders_detail_pkey PRIMARY KEY (id_product, id_order);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pembeli_akun pembeli_akun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembeli_akun
    ADD CONSTRAINT pembeli_akun_pkey PRIMARY KEY (id);


--
-- Name: penjual_akun penjual_akun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penjual_akun
    ADD CONSTRAINT penjual_akun_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sellers sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (id);


--
-- Name: customer unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wallet wallet_customer_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_customer_unique UNIQUE (id_customer);


--
-- Name: wallet wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_pkey PRIMARY KEY (id);


--
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


--
-- Name: products_name_search; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_name_search ON public.products USING gin (to_tsvector('english'::regconfig, (name)::text));


--
-- Name: sellers_name_and_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sellers_name_and_id_index ON public.sellers USING btree (name, id);


--
-- Name: admin_akun fk_admin_akun_pembeli_akun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_akun
    ADD CONSTRAINT fk_admin_akun_pembeli_akun FOREIGN KEY (id_pembeli_akun) REFERENCES public.pembeli_akun(id);


--
-- Name: admin_akun fk_admin_akun_penjual_akun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_akun
    ADD CONSTRAINT fk_admin_akun_penjual_akun FOREIGN KEY (id_penjual_akun) REFERENCES public.penjual_akun(id);


--
-- Name: orders_detail fk_orders_detail_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_detail
    ADD CONSTRAINT fk_orders_detail_order FOREIGN KEY (id_order) REFERENCES public.orders(id);


--
-- Name: orders_detail fk_orders_detail_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_detail
    ADD CONSTRAINT fk_orders_detail_products FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: penjual_akun fk_penjual_akun_akun_game; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penjual_akun
    ADD CONSTRAINT fk_penjual_akun_akun_game FOREIGN KEY (id_akun) REFERENCES public.akun_game(id);


--
-- Name: users fk_users_address; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_address FOREIGN KEY (id_address) REFERENCES public.addresses(id);


--
-- Name: users fk_users_dompet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_dompet FOREIGN KEY (id_dompet) REFERENCES public.dompets(id);


--
-- Name: wallet fk_wallet_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT fk_wallet_customer FOREIGN KEY (id_customer) REFERENCES public.customer(id);


--
-- Name: wishlist fk_wishlist_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES public.customer(id);


--
-- Name: wishlist fk_wishlist_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES public.products(id);


--
-- Name: TABLE addresses; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.addresses TO anangs;


--
-- Name: TABLE admin; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.admin TO anangs;


--
-- Name: TABLE admin_akun; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.admin_akun TO anangs;


--
-- Name: TABLE akun_game; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.akun_game TO anangs;


--
-- Name: TABLE barang; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.barang TO anangs;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.categories TO anangs;


--
-- Name: TABLE category; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.category TO anangs;


--
-- Name: TABLE customer; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.customer TO anangs;
GRANT SELECT,INSERT,UPDATE ON TABLE public.customer TO usman;


--
-- Name: TABLE dompets; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.dompets TO anangs;


--
-- Name: TABLE gusetbooks; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.gusetbooks TO anangs;


--
-- Name: SEQUENCE gusetbooks_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.gusetbooks_id_seq TO anangs;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.orders TO anangs;


--
-- Name: TABLE orders_detail; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.orders_detail TO anangs;


--
-- Name: TABLE pembeli_akun; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.pembeli_akun TO anangs;


--
-- Name: TABLE penjual_akun; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.penjual_akun TO anangs;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.products TO anangs;


--
-- Name: TABLE sellers; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.sellers TO anangs;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.users TO anangs;


--
-- Name: TABLE wallet; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.wallet TO anangs;


--
-- Name: TABLE wishlist; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.wishlist TO anangs;


--
-- PostgreSQL database dump complete
--

