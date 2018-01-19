--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tbllab; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbllab (
    lookup integer NOT NULL,
    cost numeric(11,0),
    id integer NOT NULL
);


ALTER TABLE tbllab OWNER TO postgres;

--
-- Name: tbllab_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbllab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbllab_id_seq OWNER TO postgres;

--
-- Name: tbllab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbllab_id_seq OWNED BY tbllab.id;


--
-- Name: tbllablookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbllablookup (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE tbllablookup OWNER TO postgres;

--
-- Name: tbllablookup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbllablookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbllablookup_id_seq OWNER TO postgres;

--
-- Name: tbllablookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tbllablookup_id_seq OWNED BY tbllablookup.id;


--
-- Name: tblmenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblmenu (
    parent integer,
    siblings integer,
    name character varying(45),
    icon character varying(45),
    id integer NOT NULL,
    url character varying(255),
    role character varying(2)
);


ALTER TABLE tblmenu OWNER TO postgres;

--
-- Name: tblmenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblmenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblmenu_id_seq OWNER TO postgres;

--
-- Name: tblmenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblmenu_id_seq OWNED BY tblmenu.id;


--
-- Name: tblpatient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblpatient (
    dob date,
    name character varying(255),
    id integer NOT NULL
);


ALTER TABLE tblpatient OWNER TO postgres;

--
-- Name: tblpatient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblpatient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblpatient_id_seq OWNER TO postgres;

--
-- Name: tblpatient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblpatient_id_seq OWNED BY tblpatient.id;


--
-- Name: tblprocedure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblprocedure (
    lookup integer NOT NULL,
    cost numeric(11,0),
    id integer NOT NULL
);


ALTER TABLE tblprocedure OWNER TO postgres;

--
-- Name: tblprocedure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblprocedure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblprocedure_id_seq OWNER TO postgres;

--
-- Name: tblprocedure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblprocedure_id_seq OWNED BY tblprocedure.id;


--
-- Name: tblprocedurelookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblprocedurelookup (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE tblprocedurelookup OWNER TO postgres;

--
-- Name: tblprocedurelookup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblprocedurelookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblprocedurelookup_id_seq OWNER TO postgres;

--
-- Name: tblprocedurelookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblprocedurelookup_id_seq OWNED BY tblprocedurelookup.id;


--
-- Name: tblservicereq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblservicereq (
    id integer NOT NULL,
    serial_num character varying(50),
    status boolean,
    type character varying(50),
    patient integer,
    remarks character varying(255),
    date_done bigint,
    date_req bigint,
    service integer
);


ALTER TABLE tblservicereq OWNER TO postgres;

--
-- Name: tblservicereq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblservicereq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblservicereq_id_seq OWNER TO postgres;

--
-- Name: tblservicereq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblservicereq_id_seq OWNED BY tblservicereq.id;


--
-- Name: tblusers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblusers (
    password character varying(255),
    role character varying(50),
    name character varying(50),
    id integer NOT NULL,
    username character varying(50),
    ban boolean DEFAULT false
);


ALTER TABLE tblusers OWNER TO postgres;

--
-- Name: tblusers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblusers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblusers_id_seq OWNER TO postgres;

--
-- Name: tblusers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblusers_id_seq OWNED BY tblusers.id;


--
-- Name: tblxray; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblxray (
    lookup integer NOT NULL,
    cost numeric(11,0),
    id integer NOT NULL
);


ALTER TABLE tblxray OWNER TO postgres;

--
-- Name: tblxray_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblxray_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblxray_id_seq OWNER TO postgres;

--
-- Name: tblxray_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblxray_id_seq OWNED BY tblxray.id;


--
-- Name: tblxraylookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tblxraylookup (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE tblxraylookup OWNER TO postgres;

--
-- Name: tblxraylookup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tblxraylookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tblxraylookup_id_seq OWNER TO postgres;

--
-- Name: tblxraylookup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tblxraylookup_id_seq OWNED BY tblxraylookup.id;


--
-- Name: tbllab id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbllab ALTER COLUMN id SET DEFAULT nextval('tbllab_id_seq'::regclass);


--
-- Name: tbllablookup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbllablookup ALTER COLUMN id SET DEFAULT nextval('tbllablookup_id_seq'::regclass);


--
-- Name: tblmenu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblmenu ALTER COLUMN id SET DEFAULT nextval('tblmenu_id_seq'::regclass);


--
-- Name: tblpatient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblpatient ALTER COLUMN id SET DEFAULT nextval('tblpatient_id_seq'::regclass);


--
-- Name: tblprocedure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblprocedure ALTER COLUMN id SET DEFAULT nextval('tblprocedure_id_seq'::regclass);


--
-- Name: tblprocedurelookup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblprocedurelookup ALTER COLUMN id SET DEFAULT nextval('tblprocedurelookup_id_seq'::regclass);


--
-- Name: tblservicereq id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblservicereq ALTER COLUMN id SET DEFAULT nextval('tblservicereq_id_seq'::regclass);


--
-- Name: tblusers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblusers ALTER COLUMN id SET DEFAULT nextval('tblusers_id_seq'::regclass);


--
-- Name: tblxray id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblxray ALTER COLUMN id SET DEFAULT nextval('tblxray_id_seq'::regclass);


--
-- Name: tblxraylookup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblxraylookup ALTER COLUMN id SET DEFAULT nextval('tblxraylookup_id_seq'::regclass);


--
-- Data for Name: tbllab; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbllab (lookup, cost, id) FROM stdin;
33	12	34
2	5	35
4	33	36
\.


--
-- Name: tbllab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbllab_id_seq', 36, true);


--
-- Data for Name: tbllablookup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tbllablookup (id, name) FROM stdin;
1	24hr Urine for Protein
2	2 Hour Post Prandial Blood Glucose
3	24hr Urine for Protein
4	Alanine Aminotransferase (ALT)
5	Alpha Amylase (Serum / Urine)
6	Alpha-Fetoprotein (AFP)
7	Ap-Prothrombin Time
8	Arterial Blood Gas (ABG )
9	Aspartate Aminotransferase (AST)
10	B/F For Malaria Parasites
11	Barium Enema
12	Barium Meal
13	Barium Meal & Follow Through
14	Barium Swallow
15	Bilirubin
16	Bleeding And Clotting Time
17	Blood For C/S
18	Blood Grouping
19	Blood Grouping & Antibody Screen
20	Blood Parasites
21	Blood Urea
22	Blood Urea & Electrolytes
23	Bone Marrow - Trephine Biopsy
24	Bone Marrow Aspirate
25	Bue & Creatinine
26	Carcino Embryonic Antigen (CEA)
27	Cerebrospinal Fluid For C/S
28	Clusters Of Differentiation Cells (CD4)
29	Coombs Test (Direct)
30	Creatine Kinase - Mb (CK - Mb)
31	Creatine Kinase (CK)
32	CSF Latex Agglutination
33	CT Scan - 1 Region + 2 Contrast
34	CT Scan - 1 Region + 1IV Contrast
35	CT Scan - 1 Region + No Contrast
36	Cystogram
37	Cytology
38	Digoxin Level
39	Dihydroxy Epiandesterone Sulphate ( Dhea-S)
40	Doppler Scan
41	Ductologram/Galactographyy
42	ECG
43	Erythrocyte Sedimentation Rate (ESR)
44	Estrogen
45	Factor IX
46	Factor VIII
47	Fasting Blood Sugar / Random Blood Sugar
48	Fistulogram
49	Follicle Stimulating Hormone (FSH)
50	FT3
51	FT4
52	Full Blood Count FBC (Auto) & Film Comment
53	Full Blood Count FBC (Automation)
54	Full Blood Count With Film Comment (Manual)
55	Fungal Cultures
56	Gamma Glutamyl Transferase (GGT)
57	Glucose-6-Phosphate Dehydrogenase (G6PD)
58	Glycosylated Haemoglobin (HBA 1C)
59	Haemoglobin A2 & F Estimation
60	Haemoglobin Electrophoresis
61	Haemoglobin Estimation (HB)
62	HDL - Cholesterol
63	Helicobacter Pylori Test
64	Hepatitis B Surface Antigen ( HBSAG) HBV
65	Hepatitis B Virus Profile (HBV Profile)
66	High Vaginal Swab For C/S
67	High Vaginal Swab Routine Examination
68	Histopathology
69	Human Immunodeficiency Virus (HIV) Confirmation
70	Human Immunodeficiency Virus (HIV) Screening
71	Hysterosalpingogram
72	Immunostaining
73	Intravenous Urography
74	LDL - Cholesterol
75	LFT
76	Lipid Profile
77	Lupus Erythematosus Cell (Le Cell)
78	Luteinizing Hormone ( LH)
79	Mammogram
80	Miscelllaneous Cultures (Fluids, Aspirates & Exudates)
81	MRI - 1 Region + Contrast
82	MRI - 1 Region + No Contrast
83	Myelogram - 1 Region
84	Oral Glucose Tolerance Test (OGTT)
85	Orthopanthomograph (OPT)
86	Pancreatic Amylase
87	Pap Smear/Fine Needle Aspiration
88	Percutaneous Biopsy - CT Scan Guide
89	Percutaneous Biopsy - Flouroscopic Guide
90	Plain X-ray Musculoskeletal-  any one region
91	Plain X-ray Musculoskeletal-  Two region
92	Plasma Cortisol
93	Pregnancy Test
94	Progesterone ( Prog )
95	Prostate Specific Antigen ( PSA )
96	Prothrombin Time
97	Reticulocyte Count (Retics)
98	Rheumatoid Factor
99	Routine Stool Examination
100	Routine Urine Examination
101	Serum Adrenocorticotropic Hormone ( ACTH)
102	Serum Albumin
103	Serum Alkalne Phosphatase (ALP)
104	Serum Beta-Human Chorionic Gonadotropin ( HCG)
105	Serum Calcium
106	Serum Creatinine
107	Serum Electrolyte (Na+, K+)
108	Serum Ferritin
109	Serum Iron (Fe)
110	Serum Lactate Dehydrogenase (LDH)
111	Serum Prolactin ( PRL)
112	Serum Total Protein
113	Serum Triglyceride
114	Serum Uric Acid
115	Sialogram
116	Sickling Test
117	Skin Scrapping For Fungal Elements
118	Skin Snip
119	Stool C/S
120	Stool For Occult Blood
121	T3
122	T4
123	Testosterone
124	Thyroid Function Test (TSH)
125	Thyroid Profile
126	Total Iron Binding Capacity (TIBC)
127	Total Serum Cholesterol
128	Trophozoite Count
129	Troponin
130	Ultrasound
131	Ultrasound - 2 Regions
132	Ultrasound Guided Incision & Drainage
133	Urethrogram
134	Urine C/S
135	Urine For Bence Jones Protein
136	Veneral Disease Research Laboratory (VDRL)
137	Venogram - 1 Region
138	Widal Test
139	Acid Phosphate
140	Chloride
141	Direct Bilirubin/Total Bilirubin
142	Donor Screening For Hepatitis B Virus and Surface Antigen
143	Grouping/X' Matching/Unit
144	Hepatitis C screening
145	Intra Oral Periapical Xray (IOPA)
146	Magnesium
147	Sodium (NA+)
148	Phosphorus
149	Platelet Count
150	Potassium
151	Renal Function Test
152	Semen Analysis
153	Total leucocyte count
154	Total Proteins Blood
155	Urine Sugar
156	Vinyl composite tile (VCT)
157	Vitality Test
158	Very low density lipoproteins (VLDL)
159	White Blood Count +Differential Leucocyte count
160	Malaria Card Test (Dipstik assay/rapid card)
161	RH Typing
162	Keratometry
163	Amplitude modulation scan (A-scan)
164	Serum vitamin B12, and folate levels
165	Ultrasound biomicroscopy
166	Demonstration of Heinz bodies
167	Anti-streptolysin test
168	Viral serology
169	Calcium Infusion test
170	Pulmonary Function test
171	Pleural fluid analysis
172	Cancer antigen 19-9
173	Transhepatic cholangiography (PTC) 
174	Bone Scan
175	Breast tissue Biopsy
176	C Reactive Protein
177	EEG(Electroencephalogram)
178	Holter
179	Angiography
180	Myocardial perfusion imaging
181	Guthrie test
182	Typhi Dot
183	Absolute Eosinophil Count
184	Blood Sugar Post Prandial
185	Biopsy L/A
186	Anti Streptolysin O-titre
187	Gonioscopy
188	Hematocrit
189	CT Scan - 2 Region with No Contrast
190	CT Scan - 2 Region + 1Contrast
191	CT Scan - 2 region + 2 contrast
192	MRI 2 region with no contrast
193	MRI 2 region with + contrast
\.


--
-- Name: tbllablookup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbllablookup_id_seq', 193, true);


--
-- Data for Name: tblmenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblmenu (parent, siblings, name, icon, id, url, role) FROM stdin;
0	\N	Users	icon-people	2	/users	a
0	\N	Settings	icon-speedometer	1	/settings	a
0	\N	Reports	icon-speedometer	3	/report	a
0	\N	Service	icon-speedometer	4	/service	d
\.


--
-- Name: tblmenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblmenu_id_seq', 4, true);


--
-- Data for Name: tblpatient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblpatient (dob, name, id) FROM stdin;
2003-11-18	Jone Manti	1
1990-10-01	Maku Amin	2
2000-09-12	Kwei Manu	3
1987-09-03	Kwajo Kofi	4
2000-04-04	Nana Amneu	5
\.


--
-- Name: tblpatient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblpatient_id_seq', 5, true);


--
-- Data for Name: tblprocedure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblprocedure (lookup, cost, id) FROM stdin;
80	12	86
81	45	87
82	67	88
1	67	89
\.


--
-- Name: tblprocedure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblprocedure_id_seq', 89, true);


--
-- Data for Name: tblprocedurelookup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblprocedurelookup (id, name) FROM stdin;
1	Vaginal CS
2	Wound on Left Ear
3	Laparotomy for peritonitis >=12 Yrs
4	Endoscopic surgery for bleeding oesophageal varice
5	Laparotomy for biliary surgery >=12 Yrs
6	Genitourinary surgery >=12 Yrs
7	Scaling & Polishing >=12 Yrs
8	Root Canal Therapy - Single Root (RCT) <12 Yrs
9	Surgery for lung and bronchus lesions >=12 Yrs
10	Thoracostomy and chest tube insertion >=12 Yrs
11	Operations on the oesophagus and diaphragm >=12 Yr
12	Excision of Neck Swellings >=12 Yrs
13	Laparotomy for solid organ Surgery >=12 Yrs
14	Laparotomy and Small Bowel Resection >=12 Yrs
15	Laparotomy and colon resection >=12 Yrs
16	Laparotomy for Colostomy or Ileostomy >=12 Yrs
17	Laparotomy and AP Resection >=12 Yrs
18	Laparotomy and drainage of liver >=12 Yrs
19	Operations on Anus >=12 Yrs
20	Percutaneous Ultrasound Guided Drainage of lesions
21	Laparotomy and Pancreatic Surgery >=12 Yrs
22	Internal Hernia Repair >=12 Yrs
23	External Hernia Repair >=12 Yrs
24	Surgery on scrotum & tunica vaginalis >=12 Yrs
25	Mastectomy >=12 Yrs
26	General Surgery Excision Biopsy >=12 Yrs
27	Stripping and Ligation of veins >=12 Yrs
28	Emergency circumcision >=12 Yrs
29	Vascular surgery operations >=12 Yrs
30	Incision, Drainage and Debridement - General Surge
31	Closure of colostomy and ileostomy >=12 Yrs
32	Laparotomy and Porto-caval Shunt >=12 Yrs
33	Conservative management of surgery
34	Surgery for removal of finger/toe >= 12 Yrs
35	Surgery for removal of hand or foot >=12 Yrs
36	Amputation below or through elbow or knee, through
37	Forceps Extraction of Tooth >=12 Yrs
38	Forceps Extraction of Tooth <12 Yrs
39	Surgical Removal of Tooth >=12 Yrs
40	Temporary Filling >=12 Yrs
41	Temporary Filling <12 Yrs
42	Amalgam Filling >=12 Yrs
43	Amalgam Filling <12 Yrs
44	Composite/GI Filling >=12 Yrs
45	Composite/GI Filling <12 Yrs
46	Gingivectomy >=12 Yrs
47	Scaling & Polishing <12 Yrs
48	Gingivectomy <12 Yrs
49	Root Canal Therapy - Single Root (RCT) >=12 Yrs
50	Excision and biopsy of swellings of ear, nose and 
51	Apicectomy <12 Yrs
52	Incision and Drainage (I & D) of Oro-Facial Absces
53	Surgical Excision of Intraoral Lesions >=12 Yrs
54	Culdocentesis/Culdotomy
55	Surgical Excision of Intraoral Lesions <12 Yrs
56	Curetage/Sequestrectomy of Facial Bone >=12 Yrs
57	Curetage/Sequestrectomy of Facial Bone <12 Yrs
58	Removal of Stone from Salivary Duct >=12 Yrs
59	Removal of Stone From Salivary  Duct <12 Yrs
60	Sialoadenectomy >=12 Yrs
61	Sialoadenectomy <12 Yrs
62	Suturing of Lacerations of Facial Region >=12 Yrs
63	Suturing of Lacerations of Facial Region <12 Yrs
64	Dressing of Open Facial Wounds >=12 Yrs
65	Dressing of Open Facial Wounds <12 Yrs
66	Frenectomy/Frenotomy >=12 Yrs
67	Frenectomy/Frenotomy <12 Yrs
68	Partial Resection of Facial Bones or Soft Tissues 
69	Partial Resection of Facial Bones or Soft Tissues 
70	Total Resection of Facial Bones And Soft Tissues >
71	Total Resection of Facial Bones and Soft Tissues <
72	Closed Reduction of Fractures of Facial Bones (IMF
73	Closed Reduction of Fractures of Facial Bones (IMF
74	Open Reduction of Facial Fractures >=12 Yrs
75	Open Reduction of Facial Fractures <12 Yrs
76	Removal of Dental Wiring >=12 Yrs
77	Removal of Dental Wiring <12 Yrs
78	Manual Reduction of TMJ Dislocation >=12 Yrs
79	Manual Reduction of TMJ Dislocation <12 Yrs
80	Dental Examination (Medical Management) >=12 Yrs
81	Dental Examination (Medical Management) <12 Yrs
82	Excision and biopsy of swellings of ear, nose and 
83	Surgery for external ear lesions >=12 Yrs
84	Surgery for external ear lesions <12 Yrs
85	Surgery for internal ear lesions >=12 Yrs
86	Surgery for internal ear lesions <12 Yrs
87	Reconstructive Surgery of ear >=12 Yrs
88	Reconstructive Surgery of ear <12 Yrs
89	Sinus Surgery >=12 Yrs
90	Sinus Surgery <12 Yrs
91	Surgery of tonsils and adenoids >=12 Yrs
92	Surgery of tonsils and adenoids <12 Yrs
93	Surgery of Salivary Glands >=12 Yrs
94	Surgery of Salivary Glands <12 Yrs
95	Laryngectomy >=12 Yrs
96	Laryngectomy <12 Yrs
97	Excision and Reconstruction of Oro- and Naso-phary
98	Bone Marrow Hypoplasia >=12 Yrs
99	Sickle Cell Disease with Complication/Crisis >=12 
100	Clotting/Bleeding Disorders >=12 Yrs
101	Examination under anaesthesia and removal of forei
102	Examination under anaesthesia and removal of forei
103	Incision and Drainage of Abscess of ear, nose and 
104	Incision and Drainage of Abscess of ear, nose and 
105	Manipulation and reduction of fractured nasal bone
106	Cauterization
107	Manipulation and reduction of fractured nasal bone
108	Specific nasal surgery >=12 Yrs
109	Specific nasal surgery <12 Yrs
110	Arterial Ligation for Epistaxis >=12 Yrs
111	Arterial Ligation for Epistaxis <12 Yrs
112	Surgery for trauma to ear, nose, throat >=12 Yrs
113	Surgery for trauma to ear, nose, throat <12 Yrs
114	Excision biopsy of swellings of neck >=12 Yrs
115	Excision biopsy of swellings of neck <12 Yrs
116	ENT OPD Procedures >=12 Yrs
117	ENT OPD Procedures <12 Yrs
118	Vestibulometry >=12 Yrs
119	Vestibulometry <12 Yrs
120	Evoked response audiometry >=12 Yrs
121	Evoked response audiometry <12 Yrs
122	Antral Lavage under Local Anaesthesia >=12 Yrs
123	Antral Lavage under Local Anaesthesia <12 Yrs
124	Endoscopic ENT Surgery >=12 Yrs
125	Endoscopic ENT Surgery <12 Yrs
126	Thyroid Diseases >=12 Yrs
127	Diabetes – Simple >=12 Yrs
128	Diabetes – Complicated >=12 Yrs
129	Other Endocrine Diseases >=12 Yrs
130	Malnutrition >=12 Yrs
131	Anaemia >=12 Yrs
132	Heart Disease >=12 Yrs
133	Poisoning >=12 Yrs
134	Non-Traumatic Coma >=12 Yrs
135	Paralytic Conditions >=12 Yrs
136	Seizure Disorders >=12 Yrs
137	Transient Loss of Consciousness >=12 Yrs
138	Cerebro Vascular Accident/Stroke >=12 Yrs
139	Diseases of Skin/Subcutaneous Tissues >=12 Yrs
140	Kidney Disease without Renal Failure >=12 Yrs
141	Renal Failure without Dialysis >=12 Yrs
142	Acute Renal Failure with Dialysis >=12 Yrs
143	Obstructive Airway Disease >=12 Yrs
144	Diarrhoea and Vomiting >=12 Yrs
145	Liver Diseases >=12 Yrs
146	Gastro Intestinal Tract Bleeding >=12 Yrs
147	Potassium
148	Malaria >=12 Yrs
149	Black Water Fever >=12 Yrs
150	Severe Infections >=12 Yrs
151	Localised Infections >=12 Yrs
152	Hypertension >=12 Yrs
153	Ischaemic Heart Disease >=12 Yrs
154	Pulmonary Embolism >=12 Yrs
155	Ulcer of Skin >=12 Yrs
156	Alcoholism >=12 Yrs
157	Animal Bites >=12 Yrs
158	Retroviral Infection/Immuno Suppression >=12 Yrs
159	Cerebral Malaria
160	Gynaecological Laparotomy
161	Diagnostic  Laparascopy
162	Operative Laparascopy
163	MVA/EOU
164	Suction Curettage
165	Manual Removal of Placenta
166	Expectant management/Medical Treatment in Obstetri
167	Marsupialization of Batholin's gland
168	Excision of genital lesions
169	Incision and drainage in Gynaecology Cases
170	Pelvic Floor Repair - Simple
171	Vaginal Hysterectomy
172	Repair of Enterocele
173	Vaginal Pessary Insertion
174	Colpocleisis
175	Fistula Repair - Simple
176	Fistula Repair - Complex
177	Abdominal Hysterectomy
178	Perineal repair - Complex
179	Pelvic Floor Repair - Complex
180	Colposcopy and Biopsy
181	Partial Vaginectomy
182	Polypectomy (Avulsion)
183	Hysteroscopy
184	Correction of Malposition of Uterus
185	Vulvectomy
186	Instrumental delivery
187	Internal Podalic Version with Breech Extraction
188	Destructive Delivery
189	Caesarean Section
190	Spontaneous Vaginal Delivery with or without Episi
191	Cervical Cerclage suture
192	Myomectomy
193	Post Partum Haemorrhage
194	Wertheim's Operation
195	Eclampsia
196	Enucleation >=12 Yrs
197	Enucleation <12 Yrs
198	Evisceration >=12 Yrs
199	Removal of superficial foreign body >=12 Yrs
200	Removal of superficial foreign body <12 Yrs
201	Removal of intraocular foreign body >=12 Yrs
202	Removal of intraocular foreign body <12 Yrs
203	Removal of intraorbital foreign body >=12 Yrs
204	Removal of intraorbital foreign body <12 Yrs
205	Eyelid surgery >=12 Yrs
206	Eyelid surgery <12 Yrs
207	Scleral and Corneal surgery >=12 Yrs
208	Scleral and Corneal surgery <12 Yrs
209	Anterior chamber washout >=12 Yrs
210	Anterior chamber washout <12 Yrs
211	Glaucoma surgery >=12 Yrs
212	Glaucoma surgery <12 Yrs
213	Cataract surgery >=12 Yrs
214	Cataract surgery <12 Yrs
215	Strabismus surgery >=12 Yrs
216	Strabismus surgery <12 Yrs
217	Incision and curettage of eyelid >=12 Yrs
218	Incision and curettage of eyelid <12 Yrs
219	Reconstructive surgery of eyelid >=12 Yrs
220	Reconstructive surgery of eyelid <12 Yrs
221	Nasolacrimal drainage system surgery >=12 Yrs
222	Nasolacrimal drainage system surgery <12 Yrs
223	Incision and drainage of abscesses >=12 Yrs
224	Incision and drainage of abscesses <12 Yrs
225	Examination under anaesthesia >=12 Yrs
226	Examination under anaesthesia <12 Yrs
227	Uveitis Management
228	Cataract Surgery with Implants >=12 Yrs
229	Bandaging/Cast (POP Application) >=12 Yrs
230	Bandaging/Cast (POP Application) <12 Yrs
231	Bone Biopsy >=12 Yrs
232	Bone Biopsy <12 Yrs
233	Bone Graft >=12 Yrs
234	Bone Graft <12 Yrs
235	Closed Reduction and Splintage of Fractures and Jo
236	Closed Reduction and Splintage of Fractures and Jo
237	Debridement and Suturing >=12 Yrs
238	Debridement and Suturing <12 Yrs
239	Dressing and Minor Suturing <12 Yrs
240	Excision of Soft Tissue Lumps >=12 Yrs
241	Excision of Soft Tissue Lumps <12 Yrs
242	External Fixation>=12 Yrs
243	External Fixation<12 Yrs
244	Fasciotomy >=12 Yrs
245	Fasciotomy <12 Yrs
246	Hemi-Arthroplasty >=12 Yrs
247	Hemi-Arthroplasty <12 Yrs
248	Dressing and Minor Suturing >=12 Yrs
249	Surgery for amputation of hand/foot (through or be
250	Surgery for amputation of hand/foot (through or be
251	Amputation below or through elbow or knee, through
252	Amputation below or through elbow or knee, through
253	Thyroid Diseases <12 Yrs
254	Diabetes - Simple <12 Yrs
255	Diabetes with Complications <12 Yrs
256	Other Endocrine Diseases <12 Yrs
257	Malnutrition <12 Yrs
258	Anaemia <12 Yrs
259	Other Neonatal Diseases
260	Neonatal Jaundice - Severe
261	Neonatal Jaundice - Simple
262	Birth Weight Abnormalities
263	Birth Trauma
264	Neonatal Respiratory Disorders without Ventilation
265	Neonatal Respiratory Disorders with Ventilation
266	Neonatal Septicaemia
267	Heart Disease <12 Yrs
268	Poisoning <12 Yrs
269	Non-Traumatic Coma <12 Yrs
270	Paralytic Conditions <12 Yrs
271	Seizure Disorders <12 Yrs
272	Incision and Drainage of Abscesses < 12 Yrs
273	ENT Adult (without procedure)
274	Internal Fixation of Fractures >=12 Yrs
275	Internal Fixation of Fractures <12 Yrs
276	Major Surgery of Joints >=12 Yrs
277	Major Surgery of Joints <12 Yrs
278	Minor Surgery of Joints >=12 Yrs
279	Minor Surgery of Joints <12 Yrs
280	Nail Avulsion >=12 Yrs
281	Nail Avulsion <12 Yrs
282	Open Reduction and Internal Fixation >=12 Yrs
283	Open Reduction and Internal Fixation <12 Yrs
284	Osteotomy >=12 Yrs
285	Osteotomy <12 Yrs
286	Skin traction >=12 Yrs
287	Skin traction <12 Yrs
288	Surgery for Infected Bone >=12 Yrs
289	Surgery for Infected Bone <12 Yrs
290	Synovectomy >=12 Yrs
291	Synovectomy <12 Yrs
292	Tendon Surgery >=12 Yrs
293	Tendon Surgery <12 Yrs
294	Head injury/spinal injury >=12 Yrs
295	Head injury/spinal injury >=12 Yrs
296	Surgery for removal of finger/toe >=12 Yrs
297	Surgery for removal of finger/toe <12 Yrs
298	Transient Loss of Consciousness <12 Yrs
299	Cerebro Vascular Accident/Stroke <12 Yrs
300	Bone Marrow Hypoplasia <12 Yrs
301	Sickle Cell Disease with Complication/Crisis <12 Y
302	Clotting/Bleeding Disorders <12 Yrs
303	Diseases of Skin/Subcutaneous Tissues <12 Yrs
304	Kidney Disease without Renal Failure <12 Yrs
305	Renal Failure without Dialysis <12 Yrs
306	Acute Renal Failure with Dialysis <12 Yrs
307	Obstructive Airway Disease <12 Yrs
308	Diarrhoea and Vomiting <12 Yrs
309	Liver Diseases <12 Yrs
310	Gastro Intestinal Tract Bleeding <12 Yrs
311	Non-Specific Abdominal Conditions <12 Yrs
312	Shock <12 Yrs
313	Malaria <12 Yrs
314	Black Water Fever <12 Yrs
315	Severe Infections <12 Yrs
316	Localised Infections <12 Yrs
317	Hypertension <12 Yrs
318	Ischaemic Heart Disease <12 Yrs
319	Pulmonary Embolism <12 Yrs
320	Ulcer of Skin <12 Yrs
321	Animal Bites <12 Yrs
322	Retroviral Infection/Immuno Suppression <12 Yrs
323	Cerebral Malaria
324	Laparotomy and Resection <12 Yrs
325	Laparotomy and Excision Biopsy <12 Yrs
326	Laparotomy and surgery for upper renal anomalies <
327	Excision Biopsy deep masses <12 Yrs
328	Excision Biopsy Superficial masses <12 Yrs
329	Incision and Drainage GA <12 Yrs
330	Repair of Minor Abdominal Wall Defects <12 Yrs
331	Repair of Major Abdominal Wall Defects <12 Yrs
332	Exploratory Laparotomy <12 Yrs
333	Gastrostomy <12 Yrs
334	Laparotomy with Repair <12 Yrs
335	Laparotomy with Appendicectomy <12 Yrs
336	Surgical Expectant Management <12 Yrs
337	Thoracotomy and oesophageal surgery <12 Yrs
338	Repair of Lower Urinary Tract Malformation <12 Yrs
339	Repair of Congenital Genito-Urinary Malformations 
340	Surgery for anal conditions <12 Yrs
341	Primary Closure and Repair <12 Yrs
342	Laparatomy for biliary surgery <12 Yrs
343	Laparotomy with Separation <12 Yrs
344	Surgery of Scrotal contents and testes <12 Yrs
345	Change of Dressing <12 Yrs
346	Laparotomy for Haemoperitoneum <12 Yrs
347	Laparotomy with Enterostomy Formation and closure 
348	Posterior Sagittal Anorectoplasty (PSARP) <12 Yrs
349	Burns - OPD Wound Dressing <12 Yrs
350	Burns - Non operative Management - Inpatient <12 Y
351	Surgery for Burns <12 Yrs
352	Minor Surgery for Sexual Assault <12 Yrs
353	Major Surgery for Sexual Assault <12 Yrs
354	Laparotomy with anastomosis <12 Yrs
355	Endoscopic surgery for bleeding oesophageal varice
356	Thoracostomy and chest tube insertion <12 Yrs
357	Vascular Surgery Operations <12 Yrs
358	Conservative management of surgery
359	Surgery for removal of finger/toe <12 Yrs
360	Surgery for amputation of hand/foot (through or be
361	Amputation below or through elbow or knee, through
362	Reconstructive repair >=12 Yrs
363	Reconstructive repair <12 Yrs
364	Shaving and Skin Grafting >=12 Yrs
365	Shaving and Skin Grafting <12 Yrs
366	Excisional Debridement and Dressing >=12 Yrs
367	Excisional Debridement and Dressing <12 Yrs
368	Excisional Debridement with Suturing >=12 Yrs
369	Excisional Debridement with Suturing <12 Yrs
370	Excisional Debridement with Skin Grafting >=12 Yrs
371	Excisional Debridement with Skin Grafting <12 Yrs
372	Excisional Debridement with Flap Reconstruction >=
373	Excisional Debridement with Flap Reconstruction <1
374	Excision Biopsy >=12 Yrs
375	Excision Biopsy <12 Yrs
376	Escharotomy >=12 Yrs
377	Escharotomy <12 Yrs
378	Z-plasty >=12 Yrs
379	Z-plasty <12 Yrs
380	Corrective Osteotomy >=12 Yrs
381	Corrective Osteotomy <12 Yrs
382	Reconstruction >=12 Yrs
383	Reconstruction <12 Yrs
384	Release/Excision and Split Skin Grafting >=12 Yrs
385	Release/Excision and Split Skin Grafting <12 Yrs
386	Release/Excision and Full thickness skin graft >=1
387	Release/Excision and Full thickness skin graft <12
388	Debaulking >=12 Yrs
389	Debaulking <12 Yrs
390	Primary Suturing >=12 Yrs
391	Primary Suturing <12 Yrs
392	Endoscopy (Rigid & Flexible) >=12 Yrs
393	Endoscopy (Rigid & Flexible) <12 Yrs
394	Detention for Observation and Treatment - Adult
395	Detention for Observation and Treatment - Child
396	Inpatient transfer out/Referral- Adult
397	Inpatient transfer out/Referral- Child
398	Change of Catheter >= 12 Yrs
399	Change of Catheter <12 Yrs
400	Change of Dressing >= 12 Yrs
401	Change of Dressing < 12 Yrs
402	Male Circumcision >=12 Yrs
403	Male Circumcision <12 Yrs
404	Antenatal/Postnatal
405	Dental Adult (without procedure)
406	Dental Child (without procedure)
407	Eye Child (without procedure)
408	Unbundled Consultation - Adult
409	Unbundled Consultation - Child
410	Physiotheraphy - Adult
411	Physiotheraphy - Child
412	2 Hour Post Prandial Blood Glucose
413	24hr Urine for Protein
414	Alanine Aminotransferase (ALT)
415	Alpha Amylase (Serum/Urine)
416	Alpha-Fetoprotein (AFP)
417	Ap-Prothrombin Time
418	Arterial Blood Gas (ABG)
419	Aspartate Aminotransferase (AST)
420	B/F for Malaria Parasites
421	Barium Enema
422	Barium Meal
423	Barium Meal & Follow Through
424	Barium Swallow
425	Bilirubin
426	Bleeding and Clotting Time
427	Blood for C/S
428	Blood Grouping
429	Blood Grouping & Antibody Screen
430	Blood Parasites
431	Blood Urea
432	Blood Urea & Electrolytes
433	Bone Marrow - Trephine Biopsy
434	Bone Marrow Aspirate
435	Bue & Creatinine
436	Carcino Embryonic Antigen (CEA)
437	General OPD - Child
438	Cerebrospinal Fluid for C/S
439	Clusters Of Differentiation Cells (CD4)
440	Coombs Test (Direct)
441	Creatine Kinase - Mb (CK - Mb)
442	Creatine Kinase (CK)
443	CSF Latex Agglutination
444	CT Scan - 1 Region + 2 Contrast
445	CT Scan - 1 Region + 1IV Contrast
446	CT Scan - 1 Region + No Contrast
447	Cystogram
448	Cytology
449	Digoxin Level
450	Dihydroxy Epiandesterone Sulphate (Dhea-S)
451	Doppler Scan
452	Ductologram/Galactographyy
453	ECG
454	Erythrocyte Sedimentation Rate (ESR)
455	Estrogen
456	Factor IX
457	Factor VIII
458	Fasting Blood Sugar/Random Blood Sugar
459	Fistulogram
460	Follicle Stimulating Hormone (FSH)
461	FT3
462	FT4
463	Full Blood Count FBC (Auto) & Film Comment
464	Full Blood Count FBC (Automation)
465	Full Blood Count With Film Comment (Manual)
466	Fungal Cultures
467	Gamma Glutamyl Transferase (GGT)
468	Glucose-6-Phosphate Dehydrogenase (G6PD)
469	Glycosylated Haemoglobin (HBA 1C)
470	Haemoglobin A2 & F Estimation
471	Haemoglobin Electrophoresis
472	Haemoglobin Estimation (HB)
473	HDL - Cholesterol
474	Helicobacter Pylori Test
475	Hepatitis B Surface Antigen (HBSAG) HBV
476	Hepatitis B Virus Profile (HBV Profile)
477	High Vaginal Swab for C/S
478	High Vaginal Swab Routine Examination
479	Histopathology
480	Human Immunodeficiency Virus (HIV) Confirmation
481	Human Immunodeficiency Virus (HIV) Screening
482	Hysterosalpingogram
483	Immunostaining
484	Intravenous Urography
485	LDL - Cholesterol
486	LFT
487	Lipid Profile
488	Lupus Erythematosus Cell (Le Cell)
489	Luteinizing Hormone (LH)
490	Mammogram
491	Miscelllaneous Cultures (Fluids, Aspirates & Exuda
492	MRI - 1 Region + Contrast
493	MRI - 1 Region + No Contrast
494	Myelogram - 1 Region
495	Oral Glucose Tolerance Test (OGTT)
496	Orthopanthomograph (OPT)
497	Pancreatic Amylase
498	Pap Smear/Fine Needle Aspiration
499	Percutaneous Biopsy - CT Scan Guide
500	Percutaneous Biopsy - Flouroscopic Guide
501	X-ray one region
502	X-ray two region
503	Plasma Cortisol
504	Pregnancy Test
505	Progesterone (Prog)
506	Prostate Specific Antigen (PSA)
507	Prothrombin Time
508	Reticulocyte Count (Retics)
509	Rheumatoid Factor
510	Routine Stool Examination
511	Routine Urine Examination
512	Serum Adrenocorticotropic Hormone (ACTH)
513	Serum Albumin
514	Serum Alkalne Phosphatase (ALP)
515	Serum Beta-Human Chorionic Gonadotropin (HCG)
516	Serum Calcium
517	Serum Creatinine
518	Serum Electrolyte (Na+, K+)
519	Serum Ferritin
520	Serum Iron (Fe)
521	Serum Lactate Dehydrogenase (LDH)
522	Serum Prolactin (PRL)
523	Serum Total Protein
524	Serum Triglyceride
525	Serum Uric Acid
526	Sialogram
527	Sickling Test
528	Skin Scrapping for Fungal Elements
529	Skin Snip
530	Stool C/S
531	Stool For Occult Blood
532	T3
533	T4
534	Testosterone
535	Thyroid Function Test (TSH)
536	Thyroid Profile
537	Total Iron Binding Capacity (TIBC)
538	Total Serum Cholesterol
539	Trophozoite Count
540	Troponin
541	Ultrasound
542	Ultrasound - 2 Regions
543	Ultrasound Guided Incision & Drainage
544	Urethrogram
545	Urine C/S
546	Urine For Bence Jones Protein
547	Veneral Disease Research Laboratory (VDRL)
548	Venogram - 1 Region
549	Widal Test
550	Acid Phosphate
551	Chloride
552	Direct Bilirubin/Total Bilirubin
553	Donor Screening for HB & AG
554	Grouping/X' Matching/Unit
555	Hepatitis C screening
556	IOPA Xray
557	Magnesium
558	NA+
559	Phosphorus
560	Platelet Count
561	Renal Function Test
562	Semen Analysis
563	Total leucocyte count
564	Total Proteins Blood
565	Urine Sugar
566	VCT
567	Vitality Test
568	VLDL
569	WBC+Differential
570	Malaria Card Test (Dipstik assay/rapid card)
571	RH Typing
572	Keratometry
573	A-scan
574	Serum vitamin B12, and folate levels
575	Ultrasound biomicroscopy
576	Demonstration of Heinz bodies
577	Anti-streptolysin test
578	Viral serology
579	Calcium Infusion test
580	Pulmonary Function test
581	Pleural fluid analysis
582	Cancer antigen 19-9
583	Transhepatic cholangiography (PTC) 
584	Bone Scan
585	Breast tissue Biopsy
586	C Reactive Protein
587	EEG (Electroencephalogram)
588	Myocardial perfusion imaging
589	Guthrie test
590	Typhi Dot
591	AEC
592	Blood Sugar PP
593	Biopsy L/A
594	ASO titre
595	Gonioscopy
596	Hematocrit
597	CT Scan - 2 Region with No Contrast
598	CT Scan - 2 Region + 1 Contrast
599	CT Scan - 2 region + 2 Contrast
600	MRI 2 region with no contrast
601	MRI 2 region with + contrast
602	Operations of thyroid and parathyroid glands >=12 
603	Surgery for lung and bronchus lesions >=12 Yrs
604	Thoracostomy and chest tube insertion >=12 Yrs
605	Operations on the oesophagus and diaphragm >=12 Yr
606	Excision of Neck Swellings >=12 Yrs
607	Laparotomy for solid organ Surgery >=12 Yrs
608	Laparotomy for Gastric Surgery >=12 Yrs
609	Laparotomy and Small Bowel Resection >=12 Yrs
610	Laparotomy and colon resection >=12 Yrs
611	Laparotomy for Colostomy or Ileostomy >=12 Yrs
612	Laparotomy and AP Resection >=12 Yrs
613	Endoscopic surgery for bleeding oesophageal varice
614	Percutaneous Ultrasound Guided Drainage of lesions
615	Operations on Anus >=12 Yrs
616	Laparotomy and drainage of liver >=12 Yrs
727	Diabetes – Complicated >=12 Yrs
617	Laparotomy for biliary surgery >=12 Yrs
618	Laparotomy and Pancreatic Surgery >=12 Yrs
619	Internal Hernia Repair >=12 Yrs
620	External Hernia Repair >=12 Yrs
621	Operations on the urethra >=12 Yrs
622	Surgery on scrotum & tunica vaginalis >=12 Yrs
623	Mastectomy >=12 Yrs
624	Vascular surgery operations >=12 Yrs
625	Stripping and Ligation of veins >=12 Yrs
626	Emergency circumcision >=12 Yrs
627	Genitourinary surgery >=12 Yrs
628	General Surgery Excision Biopsy >=12 Yrs
629	Incision, Drainage and Debridement - General Surge
630	Closure of colostomy and ileostomy >=12 Yrs
631	Laparotomy and Porto-caval Shunt >=12 Yrs
632	Conservative management of surgery
633	Surgery for removal of finger/toe>=12 Yrs
634	Surgery for removal of hand or foot >=12 Yrs
635	Amputation below or through elbow or knee, through
636	Forceps Extraction of Tooth >=12 Yrs
637	Forceps Extraction of Tooth <12 Yrs
638	Surgical Removal of Tooth >=12 Yrs
639	Temporary Filling >=12 Yrs
640	Temporary Filling <12 Yrs
641	Amalgam Filling >=12 Yrs
642	Amalgam Filling <12 Yrs
643	Composite/GI Filling >=12 Yrs
644	Composite/GI Filling <12 Yrs
645	Scaling & Polishing >=12 Yrs
646	Scaling & Polishing <12 Yrs
647	Gingivectomy >=12 Yrs
648	Gingivectomy <12 Yrs
649	Root Canal Therapy - Single Root (RCT) >=12 Yrs
650	Root Canal Therapy - Single Root (RCT) <12 Yrs
651	Apicectomy >=12 Yrs
652	Apicectomy <12 Yrs
653	Incision and Drainage (I & D) of Oro-Facial Absces
654	Incision and Drainage (I & D) of Oro-Facial Absces
655	Surgical Excision of Intraoral Lesions >=12 Yrs
656	Surgical Excision of Intraoral Lesions <12 Yrs
657	Curetage/Sequestrectomy of Facial Bone >=12 Yrs
658	Curetage/Sequestrectomy of Facial Bone <12 Yrs
659	Removal of Stone from Salivary Duct >=12 Yrs
660	Removal of Stone from Salivary  Duct <12 Yrs
661	Sialoadenectomy >=12 Yrs
662	Sialoadenectomy <12 Yrs
663	Suturing of Lacerations of Facial Region >=12 Yrs
664	Suturing of Lacerations of Facial Region <12 Yrs
665	Dressing of Open Facial Wounds >=12 Yrs
666	Dressing of Open Facial Wounds <12 Yrs
667	Frenectomy/Frenotomy >=12 Yrs
668	Frenectomy/Frenotomy <12 Yrs
669	Partial Resection of Facial Bones or Soft Tissues 
670	Partial Resection of Facial Bones or Soft Tissues 
671	Total Resection of Facial Bones and Soft Tissues >
672	Total Resection of Facial Bones and Soft Tissues <
673	Closed Reduction of Fractures of Facial Bones (IMF
674	Closed Reduction of Fractures of Facial Bones (IMF
675	Open Reduction of Facial Fractures >=12 Yrs
676	Open Reduction of Facial Fractures <12 Yrs
677	Removal of Dental Wiring >=12 Yrs
678	Removal of Dental Wiring <12 Yrs
679	Manual Reduction of TMJ Dislocation >=12 Yrs
680	Manual Reduction of TMJ Dislocation <12 Yrs
681	Dental Examination (Medical Management) >=12 Yrs
682	Dental Examination (Medical Management) <12 Yrs
683	Excision and biopsy of swellings of ear, nose and 
684	Excision and biopsy of swellings of ear, nose and 
685	Surgery for external ear lesions >=12 Yrs
686	Surgery for external ear lesions <12 Yrs
687	Surgery for internal ear lesions >=12 Yrs
688	Surgery for internal ear lesions <12 Yrs
689	Reconstructive Surgery of ear >=12 Yrs
690	Reconstructive Surgery of ear <12 Yrs
691	Sinus Surgery >=12 Yrs
692	Sinus Surgery <12 Yrs
693	Surgery of tonsils and adenoids >=12 Yrs
694	Surgery of tonsils and adenoids <12 Yrs
695	Surgery of Salivary Glands >=12 Yrs
696	Surgery of Salivary Glands <12 Yrs
697	Laryngectomy >=12 Yrs
698	Laryngectomy <12 Yrs
699	Excision and Reconstruction of Oro- and Naso-phary
700	Excision and Reconstruction of Oro- and Naso-phary
701	Examination under anaesthesia and removal of forei
702	Examination under anaesthesia and removal of forei
703	Incision and Drainage of Abscess of ear, nose and 
704	Incision and Drainage of Abscess of ear, nose and 
705	Manipulation and reduction of fractured nasal bone
706	Manipulation and reduction of fractured nasal bone
707	Specific nasal surgery  >=12 Yrs
708	Specific nasal surgery  <12 Yrs
709	Arterial Ligation for Epistaxis >=12 Yrs
710	Arterial Ligation for Epistaxis <12 Yrs
711	Surgery for trauma to ear, nose, throat >=12 Yrs
712	Surgery for trauma to ear, nose, throat <12 Yrs
713	Excision biopsy of swellings of neck >=12 Yrs
714	Excision biopsy of swellings of neck <12 Yrs
715	ENT OPD Procedures >=12 Yrs
716	ENT OPD Procedures <12 Yrs
717	Vestibulometry  >=12 Yrs
718	Vestibulometry  <12 Yrs
719	Evoked response audiometry >=12 Yrs
720	Evoked response audiometry <12 Yrs
721	Antral Lavage under Local Anaesthesia >=12 Yrs
722	Antral Lavage under Local Anaesthesia <12 Yrs
723	Endoscopic ENT Surgery >=12 Yrs
724	Endoscopic ENT Surgery <12 Yrs
725	Thyroid Diseases >=12 Yrs
726	Diabetes – Simple >=12 Yrs
728	Other Endocrine Diseases >=12 Yrs
729	Malnutrition >=12 Yrs
730	Anaemia >=12 Yrs
731	Heart Disease >=12 Yrs
732	Poisoning >=12 Yrs
733	Non-Traumatic Coma >=12 Yrs
734	Paralytic Conditions >=12 Yrs
735	Seizure Disorders >=12 Yrs
736	Cataract surgery <12 Yrs
737	Transient Loss of Consciousness >=12 Yrs
738	Cerebro Vascular Accident/Stroke >=12 Yrs
739	Bone Marrow Hypoplasia >=12 Yrs
740	Sickle Cell Disease with Complication/Crisis >=12 
741	Clotting/Bleeding Disorders >=12 Yrs
742	Diseases of Skin/Subcutaneous Tissues >=12 Yrs
743	Kidney Disease without Renal Failure >=12 Yrs
744	Renal Failure without Dialysis >=12 Yrs
745	Acute Renal Failure with Dialysis >=12 Yrs
746	Obstructive Airway Disease >=12 Yrs
747	Diarrhoea and Vomiting >=12 Yrs
748	Liver Diseases >=12 Yrs
749	Gastro Intestinal Tract Bleeding >=12 Yrs
750	Non-Specific Abdominal Conditions >=12 Yrs
751	Shock >=12 Yrs
752	Malaria >=12 Yrs
753	Black Water Fever >=12 Yrs
754	Severe Infections >=12 Yrs
755	Localised Infections >=12 Yrs
756	Hypertension >=12 Yrs
757	Ischaemic Heart Disease >=12 Yrs
758	Pulmonary Embolism >=12 Yrs
759	Ulcer of Skin >=12 Yrs
760	Alcoholism >=12 Yrs
761	Animal Bites >=12 Yrs
762	Retroviral Infection/Immuno Suppression >=12 Yrs
763	Cerebral Malaria
764	Gynaecological Laparotomy
765	Diagnostic  Laparascopy
766	Operative Laparascopy
767	Culdocentesis/Culdotomy
768	Cauterization
769	MVA/EOU
770	Suction Curettage
771	Manual Removal of Placenta
772	Expectant management/Medical Treatment in Obstetri
773	Marsupialization of Batholin's gland
774	Excision of genital lesions
775	Incision and drainage in Gynaecology Cases
776	Pelvic Floor Repair - Simple
777	Vaginal Hysterectomy
778	Repair of Enterocele
779	Vaginal Pessary Insertion
780	Colpocleisis
781	Fistula Repair - Simple
782	Fistula Repair - Complex
783	Abdominal Hysterectomy
784	Perineal repair - Complex
785	Pelvic Floor Repair - Complex
786	Colposcopy and Biopsy
787	Partial Vaginectomy
788	Polypectomy (Avulsion)
789	Hysteroscopy
790	Correction of Malposition of Uterus
791	Vulvectomy
792	Instrumental delivery
793	Internal Podalic Version with Breech Extraction
794	Destructive Delivery
795	Caesarean Section
796	Spontaneous Vaginal Delivery with or without Episi
797	Cervical Cerclage suture
798	Myomectomy
799	Post Partum Haemorrhage
800	Wertheim's Operation
801	Eclampsia
802	Enucleation >=12 Yrs
803	Enucleation <12 Yrs
804	Evisceration >=12 Yrs
805	Evisceration <12 Yrs
806	Removal of superficial foreign body >=12 Yrs
807	Removal of superficial foreign body <12 Yrs
808	Removal of intraocular foreign body >=12 Yrs
809	Removal of intraocular foreign body <12 Yrs
810	Removal of intraorbital foreign body >=12 Yrs
811	Removal of intraorbital foreign body <12 Yrs
812	Eyelid surgery >=12 Yrs
813	Eyelid surgery <12 Yrs
814	Scleral and Corneal surgery >=12 Yrs
815	Scleral and Corneal surgery <12 Yrs
816	Anterior chamber washout >=12 Yrs
817	Anterior chamber washout <12 Yrs
818	Glaucoma surgery >=12 Yrs
819	Glaucoma surgery <12 Yrs
820	Cataract surgery >=12 Yrs
821	Strabismus surgery >=12 Yrs
822	Strabismus surgery <12 Yrs
823	Incision and curettage of eyelid >=12 Yrs
824	Incision and curettage of eyelid <12 Yrs
825	Reconstructive surgery of eyelid >=12 Yrs
826	Reconstructive surgery of eyelid <12 Yrs
827	Nasolacrimal drainage system surgery >=12 Yrs
828	Nasolacrimal drainage system surgery <12 Yrs
829	Incision and drainage of abscesses >=12 Yrs
830	Incision and drainage of abscesses <12 Yrs
831	Examination under anaesthesia >=12 Yrs
832	Examination under anaesthesia <12 Yrs
833	Uveitis Management
834	Cataract Surgery with Implants >=12 Yrs
835	Bandaging/Cast (POP Application) >=12 Yrs
836	Bandaging/Cast (POP Application) <12 Yrs
837	Bone Biopsy >=12 Yrs
838	Bone Biopsy <12 Yrs
839	Bone Graft >=12 Yrs
840	Bone Graft <12 Yrs
841	Closed Reduction and Splintage of Fractures and Jo
842	Closed Reduction and Splintage of Fractures and Jo
843	Debridement and Suturing >=12 Yrs
844	Debridement and Suturing <12 Yrs
845	Dressing and Minor Suturing >=12 Yrs
846	Dressing and Minor Suturing <12 Yrs
847	Excision of Soft Tissue Lumps >=12 Yrs
848	Excision of Soft Tissue Lumps <12 Yrs
849	External Fixation >=12 Yrs
850	External Fixation <12 Yrs
851	Fasciotomy  >=12 Yrs
852	Fasciotomy  <12 Yrs
853	Hemi-Arthroplasty  >=12 Yrs
854	Hemi-Arthroplasty  <12 Yrs
855	Incision and Drainage of Abscesses >=12 Yrs
856	Incision and Drainage of Abscesses < 12 Yrs
857	Internal Fixation of Fractures >=12 Yrs
858	Internal Fixation of Fractures <12 Yrs
859	Major Surgery of Joints >=12 Yrs
860	Major Surgery of Joints <12 Yrs
861	Minor Surgery of Joints >=12 Yrs
862	Minor Surgery of Joints <12 Yrs
863	Nail Avulsion  >=12 Yrs
864	Nail Avulsion  <12 Yrs
865	Open Reduction and Internal Fixation  >=12 Yrs
866	Open Reduction and Internal Fixation  <12 Yrs
867	Osteotomy >=12 Yrs
868	Osteotomy <12 Yrs
869	Skin Traction >=12 Yrs
870	Skin Traction  < 12 Yrs
871	Surgery for Infected Bone >=12 Yrs
872	Surgery for Infected Bone <12 Yrs
873	Synovectomy >=12 Yrs
874	Synovectomy <12 Yrs
875	Tendon Surgery >=12 Yrs
876	Tendon Surgery <12 Yrs
877	Head injury/spinal injury >=12 Yrs
878	Head injury/spinal injury <12 Yrs
879	Surgery for removal of finger/toe  >=12 Yrs
880	Surgery for removal of finger/toe  <12 Yrs
881	Surgery for amputation of hand/foot (through or be
882	Surgery for amputation of hand/foot (through or be
883	Amputation below or through elbow or knee, through
884	Amputation below or through elbow or knee, through
885	Thyroid Diseases <12 Yrs
886	Diabetes - Simple <12 Yrs
887	Diabetes with Complications <12 Yrs
888	Other Endocrine Diseases <12 Yrs
889	Malnutrition  <12 Yrs
890	Anaemia <12 Yrs
891	Other Neonatal Diseases
892	Neonatal Jaundice - Severe
893	Neonatal Jaundice - Simple
894	Birth Weight Abnormalities
895	Birth Trauma
896	Neonatal Respiratory Disorders without Ventilation
897	Neonatal Respiratory Disorders with Ventilation
898	Neonatal Septicaemia
899	Heart Disease <12 Yrs
900	Poisoning <12 Yrs
901	Non-Traumatic Coma <12 Yrs
902	Paralytic Conditions <12 Yrs
903	Seizure Disorders <12 Yrs
904	Transient Loss of Consciousness <12 Yrs
905	Cerebro Vascular Accident/Stroke <12 Yrs
906	Bone Marrow Hypoplasia <12 Yrs
907	Sickle Cell Disease with Complication/Crisis <12 Y
908	Clotting/Bleeding Disorders <12 Yrs
909	Diseases of Skin/Subcutaneous Tissues <12 Yrs
910	Kidney Disease without Renal Failure <12 Yrs
911	Renal Failure without Dialysis <12 Yrs
912	Acute Renal Failure with Dialysis <12 Yrs
913	Obstructive Airway Disease <12 Yrs
914	Diarrhoea and Vomiting <12 Yrs
915	Liver Diseases <12 Yrs
916	Gastro Intestinal Tract Bleeding <12 Yrs
917	Non-Specific Abdominal Conditions <12 Yrs
918	Shock <12 Yrs
919	Malaria <12 Yrs
920	Black Water Fever  <12 Yrs
921	Severe Infections <12 Yrs
922	Localised Infections <12 Yrs
923	Hypertension  <12 Yrs
924	Ischaemic Heart Disease <12 Yrs
925	Pulmonary Embolism <12 Yrs
926	Ulcer of Skin <12 Yrs
927	Animal Bites <12 Yrs
928	Retroviral Infection/Immuno Suppression <12 Yrs
929	Cerebral Malaria
930	Laparotomy and Resection <12 Yrs
931	Laparotomy and Excision Biopsy <12 Yrs
932	Laparotomy and surgery for upper renal anomalies <
933	Excision Biopsy deep masses <12 Yrs
934	Excision Biopsy Superficial masses <12 Yrs
935	Incision and Drainage GA <12 Yrs
936	Repair of Minor Abdominal Wall Defects <12 Yrs
937	Repair of Major Abdominal Wall Defects <12 Yrs
938	Exploratory Laparotomy <12 Yrs
939	Gastrostomy <12 Yrs
940	Laparotomy with Repair <12 Yrs
941	Laparotomy with Appendicectomy <12 Yrs
942	Surgical Expectant Management <12 Yrs
943	Thoracotomy and oesophageal surgery <12 Yrs
944	Repair of Lower Urinary Tract Malformation <12 Yrs
945	Repair of Congenital Genito-Urinary Malformations 
946	Surgery for anal conditions <12 Yrs
947	Primary Closure and Repair <12 Yrs
948	Laparatomy for biliary surgery <12 Yrs
949	Laparotomy with Separation <12 Yrs
950	Surgery of Scrotal contents and testes <12 Yrs
951	Change of Dressing <12 Yrs
952	Laparotomy for Haemoperitoneum <12 Yrs
953	Laparotomy with Enterostomy Formation and closure 
954	Posterior Sagittal Anorectoplasty (PSARP) <12 Yrs
955	Burns - OPD Wound Dressing <12 Yrs
956	Burns - Non operative Management - Inpatient <12 Y
957	Surgery for Burns <12 Yrs
958	Minor Surgery for Sexual Assault <12 Yrs
959	Major Surgery for Sexual Assault <12 Yrs
960	Laparotomy with anastomosis <12 Yrs
961	Endoscopic surgery for bleeding oesophageal varice
962	Thoracostomy and chest tube insertion <12 Yrs
963	Vascular Surgery Operations <12 Yrs
964	Conservative management of surgery <12 Yrs
965	Surgery for removal of finger/toe <12 Yrs
966	Surgery for amputation of hand/foot (through or be
967	Amputation below or through elbow or knee, through
968	Reconstructive repair >=12 Yrs
969	Reconstructive repair <12 Yrs
970	Shaving and Skin Grafting >=12 Yrs
971	Shaving and Skin Grafting <12 Yrs
972	Excisional Debridement and Dressing >=12 Yrs
973	Excisional Debridement and Dressing <12 Yrs
974	Excisional Debridement with Suturing >=12 Yrs
975	Excisional Debridement with Suturing <12 Yrs
976	Excisional Debridement with Skin Grafting >=12 Yrs
977	Excisional Debridement with Skin Grafting <12 Yrs
978	Excisional Debridement with Flap Reconstruction >=
979	Excisional Debridement with Flap Reconstruction <1
980	Excision Biopsy >=12 Yrs
981	Excision Biopsy <12 Yrs
982	Escharotomy >=12 Yrs
983	Escharotomy <12 Yrs
984	Z-plasty >=12 Yrs
985	Z-plasty <12 Yrs
986	Corrective Osteotomy >=12 Yrs
987	Corrective Osteotomy <12 Yrs
988	Reconstruction >=12 Yrs
989	Reconstruction <12 Yrs
990	Release/Excision and Split Skin Grafting >=12 Yrs
991	Release/Excision and Split Skin Grafting <12 Yrs
992	Release/Excision and Full thickness skin graft  >=
993	Release/Excision and Full thickness skin graft  <1
994	Debaulking >=12 Yrs
995	Debaulking <12 Yrs
996	Primary Suturing >=12 Yrs
997	Primary Suturing <12 Yrs
998	Endoscopy (Rigid & Flexible) >=12 Yrs
999	Endoscopy (Rigid & Flexible) <12 Yrs
1000	Detention for Observation and Treatment - Adult
1001	Detention for Observation and Treatment - Child
1002	Inpatient transfer out/Referral- Adult
1003	Inpatient transfer out/Referral- Child
1004	Change of Catheter >=12 Yrs
1005	Change of Catheter < 12 Yrs
1006	Change of Dressing >=12 Yrs
1007	Change of Dressing < 12 Yrs
1008	Male Circumcision >=12 Yrs
1009	Male Circumcision <12 Yrs
1010	Antenatal/Postnatal
1011	Dental Adult (without procedure)
1012	Dental Child (without procedure)
1013	ENT Adult (without procedure)
1014	ENT Child (without procedure)
1015	Eye Adult (without procedure)
1016	Eye Child (without procedure)
1017	General OPD - Adult
1018	General OPD - Child
1019	Unbundled Consultation - Adult
1020	Unbundled Consultation - Child
1021	Physiotherapy-Adult
1022	Physiotherapy-Child
1023	2 Hour Post Prandial Blood Glucose
1024	24hr Urine for Protein
1025	Alanine Aminotransferase (ALT)
1026	Alpha Amylase (Serum/Urine)
1027	Alpha-Fetoprotein (AFP)
1028	Ap-Prothrombin Time
1029	Arterial Blood Gas (ABG)
1030	Aspartate Aminotransferase (AST)
1031	B/F for Malaria Parasites
1032	Barium Enema
1033	Barium Meal
1034	Barium Meal & Follow Through
1035	Barium Swallow
1036	Bilirubin
1037	Bleeding and Clotting Time
1038	Blood for C/S
1039	Blood Grouping
1040	Blood Grouping & Antibody Screen
1041	Blood Parasites
1042	Blood Urea
1043	Blood Urea & Electrolytes
1044	Bone Marrow - Trephine Biopsy
1045	Bone Marrow Aspirate
1046	Bue & Creatinine
1047	Carcino Embryonic Antigen (CEA)
1048	Cerebrospinal Fluid for C/S
1049	Clusters of Differentiation Cells (CD4)
1050	Coombs Test (Direct)
1051	Creatine Kinase - Mb (CK - Mb)
1052	Creatine Kinase (CK)
1053	CSF Latex Agglutination
1054	CT Scan - 1 Region + 2 Contrast
1055	CT Scan - 1 Region + 1IV Contrast
1056	CT Scan - 1 Region + No Contrast
1057	Cystogram
1058	Cytology
1059	Digoxin Level
1060	Dihydroxy Epiandesterone Sulphate (Dhea-S)
1061	Doppler Scan
1062	Ductologram/Galactographyy
1063	Erythrocyte Sedimentation Rate (ESR)
1064	Estrogen
1065	Factor IX
1066	Factor VIII
1067	Fasting Blood Sugar/Random Blood Sugar
1068	Fistulogram
1069	Follicle Stimulating Hormone (FSH)
1070	FT3
1071	FT4
1072	Full Blood Count FBC (Auto) & Film Comment
1073	Full Blood Count FBC (Automation)
1074	Full Blood Count With Film Comment (Manual)
1075	Fungal Cultures
1076	Gamma Glutamyl Transferase (GGT)
1077	Glucose-6-Phosphate Dehydrogenase (G6PD)
1078	Glycosylated Haemoglobin (HBA 1C)
1079	Haemoglobin A2 & F Estimation
1080	Haemoglobin Electrophoresis
1081	Haemoglobin Estimation (HB)
1082	HDL - Cholesterol
1083	Helicobacter Pylori Test
1084	Hepatitis B Surface Antigen ( HBSAG) HBV
1085	Hepatitis B Virus Profile (HBV Profile)
1086	High Vaginal Swab For C/S
1087	High Vaginal Swab Routine Examination
1088	Histopathology
1089	Human Immunodeficiency Virus (HIV) Confirmation
1090	Human Immunodeficiency Virus (HIV) Screening
1091	Hysterosalpingogram
1092	Immunostaining
1093	Intravenous Urography
1094	LDL - Cholesterol
1095	LFT
1096	Lipid Profile
1097	Lupus Erythematosus Cell (Le Cell)
1098	Luteinizing Hormone (LH)
1099	Mammogram
1100	Miscelllaneous Cultures (Fluids, Aspirates & Exuda
1101	MRI - 1 Region + Contrast
1102	MRI - 1 Region + No Contrast
1103	Myelogram - 1 Region
1104	Oral Glucose Tolerance Test (OGTT)
1105	Orthopanthomograph (OPT)
1106	Pancreatic Amylase
1107	Pap Smear/Fine Needle Aspiration
1108	Percutaneous Biopsy - CT Scan Guide
1109	Percutaneous Biopsy - Flouroscopic Guide
1110	X-ray one region
1111	X-ray two region
1112	Plasma Cortisol
1113	Pregnancy Test
1114	Progesterone (Prog)
1115	Prostate Specific Antigen (PSA)
1116	Prothrombin Time
1117	Reticulocyte Count (Retics)
1118	Rheumatoid Factor
1119	Routine Stool Examination
1120	Routine Urine Examination
1121	Serum Adrenocorticotropic Hormone (ACTH)
1122	Serum Albumin
1123	Serum Alkalne Phosphatase (ALP)
1124	Serum Beta-Human Chorionic Gonadotropin (HCG)
1125	Serum Calcium
1126	Serum Creatinine
1127	Serum Electrolyte (Na+, K+)
1128	Serum Ferritin
1129	Serum Iron (Fe)
1130	Serum Lactate Dehydrogenase (LDH)
1131	Serum Prolactin (PRL)
1132	Serum Total Protein
1133	Serum Triglyceride
1134	Serum Uric Acid
1135	Sialogram
1136	Sickling Test
1137	Skin Scrapping For Fungal Elements
1138	Skin Snip
1139	Stool C/S
1140	Stool For Occult Blood
1141	T3
1142	T4
1143	Testosterone
1144	Thyroid Function Test (TSH)
1145	Thyroid Profile
1146	Total Iron Binding Capacity (TIBC)
1147	Total Serum Cholesterol
1148	Trophozoite Count
1149	Troponin
1150	Ultrasound
1151	Ultrasound - 2 Regions
1152	Ultrasound Guided Incision & Drainage
1153	Urethrogram
1154	Urine C/S
1155	Urine For Bence Jones Protein
1156	Veneral Disease Research Laboratory (VDRL)
1157	Venogram - 1 Region
1158	Widal Test
1159	Acid Phosphate
1160	Chloride
1161	Direct Bilirubin/Total Bilirubin
1162	Donor Screening For HB & AG
1163	Grouping/X' Matching/Unit
1164	Hepatitis C screening
1165	IOPA Xray
1166	Magnesium
1167	NA+
1168	Phosphorus
1169	Platelet Count
1170	Potassium
1171	Renal Function Test
1172	Semen Analysis
1173	Total leucocyte count
1174	Total Proteins Blood
1175	Urine Sugar
1176	VCT
1177	Vitality Test
1178	VLDL
1179	WBC+Differential
1180	Malaria Card Test (Dipstik assay/rapid card)
1181	RH Typing
1182	Keratometry
1183	A-scan
1184	Serum vitamin B12, and folate levels
1185	Ultrasound biomicroscopy
1186	Demonstration of Heinz bodies
1187	Anti-streptolysin test
1188	Viral serology
1189	Calcium Infusion test
1190	Pulmonary Function test
1191	Pleural fluid analysis
1192	Cancer antigen 19-9
1193	Transhepatic cholangiography (PTC) 
1194	Bone Scan
1195	Breast tissue Biopsy
1196	C Reactive Protein
1197	EEG(Electroencephalogram)
1198	Holter
1199	Myocardial perfusion imaging
1200	Guthrie test
1201	Typhi Dot
1202	AEC
1203	Blood Sugar PP
1204	Biopsy L/A
1205	ASO titre
1206	Gonioscopy
1207	Hematocrit
1208	CT Scan - 2 Region with No Contrast
1209	CT Scan - 2 Region + 1Contrast
1210	CT Scan - 2 region + 2 contrast
1211	MRI 2 region with no contrast
1212	MRI 2 region with + contrast
1213	Shock >=12 Yrs
1214	Holter
1215	ECG
1216	General OPD - Adult
1217	Operations on the urethra >=12 Yrs
1218	Operations on the urethra >=12 Yrs
1219	Operations of thyroid & parathyroid glands >=12 Yr
1220	Root Canal Therapy - Single Root (RCT) >=12 Yrs
1221	Laparotomy for peritonitis >=12 Yrs
1222	Apicectomy >=12 Yrs
1223	Incision and Drainage (I & D) of Oro-Facial Absces
1224	Excision and Reconstruction of Oro- and Naso-phary
1225	Non-Specific Abdominal Conditions >=12 Yrs
1226	Evisceration <12 Yrs
1227	Incision and Drainage of Abscesses >=12 Yrs
1228	Eye Adult (without procedure)
1229	ENT Child (without procedure)
\.


--
-- Name: tblprocedurelookup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblprocedurelookup_id_seq', 1229, true);


--
-- Data for Name: tblservicereq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblservicereq (id, serial_num, status, type, patient, remarks, date_done, date_req, service) FROM stdin;
23	1510062768491	f	lab	1	thien hgnth nfbd enrhf	\N	1510062737000	34
25	1510062768491	f	lab	1	ujhh mnh wwki jg	\N	1510062737000	36
26	1510062810827	f	xray	1	te ghg vde wsdf	\N	1510062737000	94
27	1510062810827	f	xray	1	te ghg vde wsdf	\N	1510062737000	94
28	1510062833390	f	pro	1	ddget ghhbn dsw	\N	1510062811000	86
29	1510062833390	f	pro	1	ddget ghhbn dsw	\N	1510062811000	86
24	1510062768491	f	lab	2	gtj hnbg llhj mnh dggr	\N	1510062737000	35
\.


--
-- Name: tblservicereq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblservicereq_id_seq', 29, true);


--
-- Data for Name: tblusers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblusers (password, role, name, id, username, ban) FROM stdin;
$31$16$xg21N9uD4OMz7zhg5qvkPjT2Og8LfJB4xrtMkTxPAM0	d	Kakue Manem Ame	4	doc	f
$31$16$XJffjpcdnl0llxFoHGiVU1bA0uEOjWTaPRsiyexXv-0	a	Admin Name	3	admin	f
$31$16$68tcqxnCzwqb_Klxgku6Mwq9urDHlwJG0b6VDchW_4U	a	Some Admin Name	5	admin1	f
$31$16$2I_eEWrWXkMR-LbtBmKlYsOW95ue--d62r59i-2IU8s	d	Some Doctors Name	6	Doc2	f
\.


--
-- Name: tblusers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblusers_id_seq', 6, true);


--
-- Data for Name: tblxray; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblxray (lookup, cost, id) FROM stdin;
2	45	94
3	32	95
5	34	96
7	5	97
\.


--
-- Name: tblxray_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblxray_id_seq', 97, true);


--
-- Data for Name: tblxraylookup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tblxraylookup (id, name) FROM stdin;
1	Fibula Xray
2	Xray of Rt Foot
3	CT Scan - 2 region + 2 contrast
4	MRI 2 region with no contrast
5	MRI 2 region with + contrast
6	Percutaneous Biopsy - CT Scan Guide
7	Percutaneous Biopsy - Flouroscopic Guide
8	Plain X-ray Musculoskeletal-  any one region
9	Plain X-ray Musculoskeletal-  Two region
10	Ultrasound
11	Ultrasound - 2 Regions
12	Ultrasound Guided Incision & Drainage
13	Intra Oral Periapical Xray (IOPA)
14	EEG(Electroencephalogram)
15	Doppler Scan
16	Ductologram/Galactographyy
17	ECG
18	CT Scan - 1 Region + 2 Contrast
19	CT Scan - 1 Region + 1IV Contrast
20	CT Scan - 1 Region + No Contrast
\.


--
-- Name: tblxraylookup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tblxraylookup_id_seq', 20, true);


--
-- Name: tbllab tbllab_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbllab
    ADD CONSTRAINT tbllab_pkey PRIMARY KEY (id, lookup);


--
-- Name: tbllablookup tbllablookup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbllablookup
    ADD CONSTRAINT tbllablookup_pkey PRIMARY KEY (id);


--
-- Name: tblmenu tblmenu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblmenu
    ADD CONSTRAINT tblmenu_pkey PRIMARY KEY (id);


--
-- Name: tblpatient tblpatient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblpatient
    ADD CONSTRAINT tblpatient_pkey PRIMARY KEY (id);


--
-- Name: tblprocedure tblprocedure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblprocedure
    ADD CONSTRAINT tblprocedure_pkey PRIMARY KEY (id, lookup);


--
-- Name: tblprocedurelookup tblprocedurelookup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblprocedurelookup
    ADD CONSTRAINT tblprocedurelookup_pkey PRIMARY KEY (id);


--
-- Name: tblservicereq tblservicereq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblservicereq
    ADD CONSTRAINT tblservicereq_pkey PRIMARY KEY (id);


--
-- Name: tblusers tblusers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblusers
    ADD CONSTRAINT tblusers_pkey PRIMARY KEY (id);


--
-- Name: tblxray tblxray_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblxray
    ADD CONSTRAINT tblxray_pkey PRIMARY KEY (id, lookup);


--
-- Name: tblxraylookup tblxraylookup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblxraylookup
    ADD CONSTRAINT tblxraylookup_pkey PRIMARY KEY (id);


--
-- Name: tbllab tbllab_lookup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbllab
    ADD CONSTRAINT tbllab_lookup_fkey FOREIGN KEY (lookup) REFERENCES tbllablookup(id);


--
-- Name: tblprocedure tblprocedure_lookup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblprocedure
    ADD CONSTRAINT tblprocedure_lookup_fkey FOREIGN KEY (lookup) REFERENCES tblprocedurelookup(id);


--
-- Name: tblxray tblxray_lookup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tblxray
    ADD CONSTRAINT tblxray_lookup_fkey FOREIGN KEY (lookup) REFERENCES tblxraylookup(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO "fileServer";


--
-- Name: tbllab; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tbllab TO "fileServer";


--
-- Name: tbllab_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tbllab_id_seq TO "fileServer";


--
-- Name: tblmenu; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblmenu TO "fileServer";


--
-- Name: tblmenu_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblmenu_id_seq TO "fileServer";


--
-- Name: tblpatient; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblpatient TO "fileServer";


--
-- Name: tblpatient_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblpatient_id_seq TO "fileServer";


--
-- Name: tblprocedure; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblprocedure TO "fileServer";


--
-- Name: tblprocedure_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblprocedure_id_seq TO "fileServer";


--
-- Name: tblprocedurelookup; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblprocedurelookup TO "fileServer";


--
-- Name: tblprocedurelookup_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblprocedurelookup_id_seq TO "fileServer";


--
-- Name: tblservicereq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblservicereq TO "fileServer";


--
-- Name: tblservicereq_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblservicereq_id_seq TO "fileServer";


--
-- Name: tblusers; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblusers TO "fileServer";


--
-- Name: tblusers_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblusers_id_seq TO "fileServer";


--
-- Name: tblxray; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblxray TO "fileServer";


--
-- Name: tblxray_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblxray_id_seq TO "fileServer";


--
-- Name: tblxraylookup; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE tblxraylookup TO "fileServer";


--
-- Name: tblxraylookup_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE tblxraylookup_id_seq TO "fileServer";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON SEQUENCES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT,USAGE ON SEQUENCES  TO "fileServer";


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TYPES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TYPES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TYPES  TO "fileServer" WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON FUNCTIONS  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON FUNCTIONS  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO "fileServer" WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO "fileServer";


--
-- PostgreSQL database dump complete
--

