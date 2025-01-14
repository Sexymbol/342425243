PGDMP                  	    |            SegureGuardDB    16.3    16.3 [    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            z           1262    36434    SegureGuardDB    DATABASE     �   CREATE DATABASE "SegureGuardDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "SegureGuardDB";
                postgres    false            �            1259    36865    actionplans    TABLE     H  CREATE TABLE public.actionplans (
    planid integer NOT NULL,
    plantype character varying(30) NOT NULL,
    descriptionaction text,
    creationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    statusaction character varying(20) NOT NULL,
    entityid integer,
    assetid integer,
    employeeid integer,
    riskid integer,
    CONSTRAINT actionplans_statusaction_check CHECK (((statusaction)::text = ANY ((ARRAY['En Proceso'::character varying, 'Finalizado'::character varying])::text[])))
);
    DROP TABLE public.actionplans;
       public         heap    postgres    false            �            1259    36864    actionplans_planid_seq    SEQUENCE     �   ALTER TABLE public.actionplans ALTER COLUMN planid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.actionplans_planid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    36829    assets    TABLE       CREATE TABLE public.assets (
    assetid integer NOT NULL,
    assettype character varying(50) NOT NULL,
    assetstatus character varying(50) NOT NULL,
    assetquantity integer DEFAULT 1,
    description_assets text,
    brand character varying(30) NOT NULL,
    serialnumber character varying(30) NOT NULL,
    hardwaredetails character varying(30) NOT NULL,
    softwaredetails character varying(30),
    location_asset character varying(30) NOT NULL,
    assetcost numeric(10,2) NOT NULL,
    entityid integer
);
    DROP TABLE public.assets;
       public         heap    postgres    false            �            1259    36828    assets_assetid_seq    SEQUENCE     �   ALTER TABLE public.assets ALTER COLUMN assetid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.assets_assetid_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    36962 	   auditlogs    TABLE     �  CREATE TABLE public.auditlogs (
    auditid integer NOT NULL,
    actionaudit character varying(50) NOT NULL,
    entity character varying(50) NOT NULL,
    timestampaudit timestamp without time zone NOT NULL,
    personid integer,
    firstname character varying(100) NOT NULL,
    class character varying(255),
    ipaddress character varying(45),
    useragent character varying(255)
);
    DROP TABLE public.auditlogs;
       public         heap    postgres    false            �            1259    36961    auditlogs_auditid_seq    SEQUENCE     �   ALTER TABLE public.auditlogs ALTER COLUMN auditid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.auditlogs_auditid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    36804    departments    TABLE     �   CREATE TABLE public.departments (
    departmentid integer NOT NULL,
    departmentname character varying(50) NOT NULL,
    description_departments text,
    employeeid integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    36803    departments_departmentid_seq    SEQUENCE     �   ALTER TABLE public.departments ALTER COLUMN departmentid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.departments_departmentid_seq
    START WITH 100
    INCREMENT BY 5
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    36786 	   employees    TABLE     �   CREATE TABLE public.employees (
    employeeid integer NOT NULL,
    personid integer,
    roleid integer,
    email character varying(100) NOT NULL,
    employmentstatus character varying(30) NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    36785    employees_employeeid_seq    SEQUENCE     �   ALTER TABLE public.employees ALTER COLUMN employeeid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.employees_employeeid_seq
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    36817    entities    TABLE     �  CREATE TABLE public.entities (
    entityid integer NOT NULL,
    entityname character varying(100) NOT NULL,
    entityaddress character varying(50) NOT NULL,
    entityphone character varying(25) NOT NULL,
    registrationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    mainactivity character varying(50),
    entitystatus character varying(20),
    personid integer
);
    DROP TABLE public.entities;
       public         heap    postgres    false            �            1259    36816    entities_entityid_seq    SEQUENCE     �   ALTER TABLE public.entities ALTER COLUMN entityid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.entities_entityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    36896    events    TABLE       CREATE TABLE public.events (
    eventid integer NOT NULL,
    eventtype character varying(30) NOT NULL,
    descriptionevents text,
    entityid integer,
    assetid integer,
    riskid integer,
    eventdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.events;
       public         heap    postgres    false            �            1259    36895    events_eventid_seq    SEQUENCE     �   ALTER TABLE public.events ALTER COLUMN eventid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.events_eventid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    36948    history    TABLE     G  CREATE TABLE public.history (
    historyid integer NOT NULL,
    affectedtable character varying(50) NOT NULL,
    operation character varying(20) NOT NULL,
    operationdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    employeeid integer,
    oldvalue text,
    newvalue text,
    primarykeyaffected integer
);
    DROP TABLE public.history;
       public         heap    postgres    false            �            1259    36947    history_historyid_seq    SEQUENCE     �   ALTER TABLE public.history ALTER COLUMN historyid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.history_historyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    36920    notifications    TABLE     �   CREATE TABLE public.notifications (
    notificationid integer NOT NULL,
    communicationchannel character varying(100) NOT NULL,
    descriptionnotifocations text,
    eventid integer
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    36919     notifications_notificationid_seq    SEQUENCE     �   ALTER TABLE public.notifications ALTER COLUMN notificationid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.notifications_notificationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    36778    people    TABLE     s  CREATE TABLE public.people (
    personid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    password_people character varying(30) NOT NULL,
    phone character varying(30) NOT NULL,
    email character varying(100) NOT NULL,
    address_people character varying(100) NOT NULL,
    birthdate date NOT NULL
);
    DROP TABLE public.people;
       public         heap    postgres    false            �            1259    36843    regulations    TABLE     �  CREATE TABLE public.regulations (
    regulationid integer NOT NULL,
    regulationtype character varying(30) NOT NULL,
    descriptionregulation text,
    enactmentdate date NOT NULL,
    statusregulation character varying(20) NOT NULL,
    assetid integer,
    CONSTRAINT regulations_statusregulation_check CHECK (((statusregulation)::text = ANY ((ARRAY['Vigente'::character varying, 'Derogada'::character varying])::text[])))
);
    DROP TABLE public.regulations;
       public         heap    postgres    false            �            1259    36842    regulations_regulationid_seq    SEQUENCE     �   ALTER TABLE public.regulations ALTER COLUMN regulationid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.regulations_regulationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    36857    risks    TABLE     {   CREATE TABLE public.risks (
    riskid integer NOT NULL,
    risktype character varying(50),
    description_risks text
);
    DROP TABLE public.risks;
       public         heap    postgres    false            �            1259    36856    risks_riskid_seq    SEQUENCE     �   ALTER TABLE public.risks ALTER COLUMN riskid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.risks_riskid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    36773    roles    TABLE     �   CREATE TABLE public.roles (
    roleid integer NOT NULL,
    roletype character varying(25) NOT NULL,
    permissions character varying(50) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    36772    roles_roleid_seq    SEQUENCE     �   ALTER TABLE public.roles ALTER COLUMN roleid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_roleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    36933    tests    TABLE     �  CREATE TABLE public.tests (
    testid integer NOT NULL,
    testtype character varying(30) NOT NULL,
    descriptiontests text,
    startdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    enddate date,
    statustests character varying(20) NOT NULL,
    employeeid integer,
    CONSTRAINT tests_statustests_check CHECK (((statustests)::text = ANY ((ARRAY['En Revisión'::character varying, 'En Proceso'::character varying, 'Completado'::character varying])::text[])))
);
    DROP TABLE public.tests;
       public         heap    postgres    false            �            1259    36932    tests_testid_seq    SEQUENCE     �   ALTER TABLE public.tests ALTER COLUMN testid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tests_testid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            j          0    36865    actionplans 
   TABLE DATA           �   COPY public.actionplans (planid, plantype, descriptionaction, creationdate, updatedate, statusaction, entityid, assetid, employeeid, riskid) FROM stdin;
    public          postgres    false    231   �u       d          0    36829    assets 
   TABLE DATA           �   COPY public.assets (assetid, assettype, assetstatus, assetquantity, description_assets, brand, serialnumber, hardwaredetails, softwaredetails, location_asset, assetcost, entityid) FROM stdin;
    public          postgres    false    225   �u       t          0    36962 	   auditlogs 
   TABLE DATA           �   COPY public.auditlogs (auditid, actionaudit, entity, timestampaudit, personid, firstname, class, ipaddress, useragent) FROM stdin;
    public          postgres    false    241   �u       `          0    36804    departments 
   TABLE DATA           h   COPY public.departments (departmentid, departmentname, description_departments, employeeid) FROM stdin;
    public          postgres    false    221   �u       ^          0    36786 	   employees 
   TABLE DATA           Z   COPY public.employees (employeeid, personid, roleid, email, employmentstatus) FROM stdin;
    public          postgres    false    219   v       b          0    36817    entities 
   TABLE DATA           �   COPY public.entities (entityid, entityname, entityaddress, entityphone, registrationdate, mainactivity, entitystatus, personid) FROM stdin;
    public          postgres    false    223   )v       l          0    36896    events 
   TABLE DATA           m   COPY public.events (eventid, eventtype, descriptionevents, entityid, assetid, riskid, eventdate) FROM stdin;
    public          postgres    false    233   Fv       r          0    36948    history 
   TABLE DATA           �   COPY public.history (historyid, affectedtable, operation, operationdate, employeeid, oldvalue, newvalue, primarykeyaffected) FROM stdin;
    public          postgres    false    239   cv       n          0    36920    notifications 
   TABLE DATA           p   COPY public.notifications (notificationid, communicationchannel, descriptionnotifocations, eventid) FROM stdin;
    public          postgres    false    235   �v       \          0    36778    people 
   TABLE DATA           y   COPY public.people (personid, firstname, lastname, password_people, phone, email, address_people, birthdate) FROM stdin;
    public          postgres    false    217   �v       f          0    36843    regulations 
   TABLE DATA           �   COPY public.regulations (regulationid, regulationtype, descriptionregulation, enactmentdate, statusregulation, assetid) FROM stdin;
    public          postgres    false    227   �v       h          0    36857    risks 
   TABLE DATA           D   COPY public.risks (riskid, risktype, description_risks) FROM stdin;
    public          postgres    false    229   �v       [          0    36773    roles 
   TABLE DATA           >   COPY public.roles (roleid, roletype, permissions) FROM stdin;
    public          postgres    false    216   �v       p          0    36933    tests 
   TABLE DATA           p   COPY public.tests (testid, testtype, descriptiontests, startdate, enddate, statustests, employeeid) FROM stdin;
    public          postgres    false    237   w       {           0    0    actionplans_planid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.actionplans_planid_seq', 1, false);
          public          postgres    false    230            |           0    0    assets_assetid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.assets_assetid_seq', 100, false);
          public          postgres    false    224            }           0    0    auditlogs_auditid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.auditlogs_auditid_seq', 1, false);
          public          postgres    false    240            ~           0    0    departments_departmentid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.departments_departmentid_seq', 100, false);
          public          postgres    false    220                       0    0    employees_employeeid_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.employees_employeeid_seq', 100, false);
          public          postgres    false    218            �           0    0    entities_entityid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.entities_entityid_seq', 1, false);
          public          postgres    false    222            �           0    0    events_eventid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.events_eventid_seq', 1, false);
          public          postgres    false    232            �           0    0    history_historyid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.history_historyid_seq', 1, false);
          public          postgres    false    238            �           0    0     notifications_notificationid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.notifications_notificationid_seq', 1, false);
          public          postgres    false    234            �           0    0    regulations_regulationid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.regulations_regulationid_seq', 1, false);
          public          postgres    false    226            �           0    0    risks_riskid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.risks_riskid_seq', 1, false);
          public          postgres    false    228            �           0    0    roles_roleid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.roles_roleid_seq', 1, false);
          public          postgres    false    215            �           0    0    tests_testid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tests_testid_seq', 1, false);
          public          postgres    false    236            �           2606    36874    actionplans actionplans_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.actionplans
    ADD CONSTRAINT actionplans_pkey PRIMARY KEY (planid);
 F   ALTER TABLE ONLY public.actionplans DROP CONSTRAINT actionplans_pkey;
       public            postgres    false    231            �           2606    36836    assets assets_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (assetid);
 <   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_pkey;
       public            postgres    false    225            �           2606    36968    auditlogs auditlogs_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.auditlogs
    ADD CONSTRAINT auditlogs_pkey PRIMARY KEY (auditid);
 B   ALTER TABLE ONLY public.auditlogs DROP CONSTRAINT auditlogs_pkey;
       public            postgres    false    241            �           2606    36810    departments departments_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (departmentid);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    221            �           2606    36792    employees employees_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_email_key;
       public            postgres    false    219            �           2606    36790    employees employees_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    219            �           2606    36822    entities entities_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.entities
    ADD CONSTRAINT entities_pkey PRIMARY KEY (entityid);
 @   ALTER TABLE ONLY public.entities DROP CONSTRAINT entities_pkey;
       public            postgres    false    223            �           2606    36903    events events_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (eventid);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    233            �           2606    36955    history history_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (historyid);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public            postgres    false    239            �           2606    36926     notifications notifications_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notificationid);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    235            �           2606    36784    people people_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.people DROP CONSTRAINT people_email_key;
       public            postgres    false    217            �           2606    36782    people people_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (personid);
 <   ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
       public            postgres    false    217            �           2606    36850    regulations regulations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.regulations
    ADD CONSTRAINT regulations_pkey PRIMARY KEY (regulationid);
 F   ALTER TABLE ONLY public.regulations DROP CONSTRAINT regulations_pkey;
       public            postgres    false    227            �           2606    36863    risks risks_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.risks
    ADD CONSTRAINT risks_pkey PRIMARY KEY (riskid);
 :   ALTER TABLE ONLY public.risks DROP CONSTRAINT risks_pkey;
       public            postgres    false    229            �           2606    36777    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            �           2606    36941    tests tests_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (testid);
 :   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_pkey;
       public            postgres    false    237            �           2606    36851    regulations fk_asset    FK CONSTRAINT     y   ALTER TABLE ONLY public.regulations
    ADD CONSTRAINT fk_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);
 >   ALTER TABLE ONLY public.regulations DROP CONSTRAINT fk_asset;
       public          postgres    false    4777    225    227            �           2606    36880    actionplans fk_asset    FK CONSTRAINT     y   ALTER TABLE ONLY public.actionplans
    ADD CONSTRAINT fk_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);
 >   ALTER TABLE ONLY public.actionplans DROP CONSTRAINT fk_asset;
       public          postgres    false    231    225    4777            �           2606    36909    events fk_asset    FK CONSTRAINT     t   ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_asset FOREIGN KEY (assetid) REFERENCES public.assets(assetid);
 9   ALTER TABLE ONLY public.events DROP CONSTRAINT fk_asset;
       public          postgres    false    4777    233    225            �           2606    36811    departments fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_employee FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);
 A   ALTER TABLE ONLY public.departments DROP CONSTRAINT fk_employee;
       public          postgres    false    4771    221    219            �           2606    36885    actionplans fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.actionplans
    ADD CONSTRAINT fk_employee FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);
 A   ALTER TABLE ONLY public.actionplans DROP CONSTRAINT fk_employee;
       public          postgres    false    4771    219    231            �           2606    36942    tests fk_employee    FK CONSTRAINT        ALTER TABLE ONLY public.tests
    ADD CONSTRAINT fk_employee FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);
 ;   ALTER TABLE ONLY public.tests DROP CONSTRAINT fk_employee;
       public          postgres    false    237    4771    219            �           2606    36956    history fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.history
    ADD CONSTRAINT fk_employee FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);
 =   ALTER TABLE ONLY public.history DROP CONSTRAINT fk_employee;
       public          postgres    false    219    239    4771            �           2606    36837    assets fk_entity    FK CONSTRAINT     y   ALTER TABLE ONLY public.assets
    ADD CONSTRAINT fk_entity FOREIGN KEY (entityid) REFERENCES public.entities(entityid);
 :   ALTER TABLE ONLY public.assets DROP CONSTRAINT fk_entity;
       public          postgres    false    225    223    4775            �           2606    36875    actionplans fk_entity    FK CONSTRAINT     ~   ALTER TABLE ONLY public.actionplans
    ADD CONSTRAINT fk_entity FOREIGN KEY (entityid) REFERENCES public.entities(entityid);
 ?   ALTER TABLE ONLY public.actionplans DROP CONSTRAINT fk_entity;
       public          postgres    false    223    231    4775            �           2606    36904    events fk_entity    FK CONSTRAINT     y   ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_entity FOREIGN KEY (entityid) REFERENCES public.entities(entityid);
 :   ALTER TABLE ONLY public.events DROP CONSTRAINT fk_entity;
       public          postgres    false    223    233    4775            �           2606    36927    notifications fk_event    FK CONSTRAINT     {   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_event FOREIGN KEY (eventid) REFERENCES public.events(eventid);
 @   ALTER TABLE ONLY public.notifications DROP CONSTRAINT fk_event;
       public          postgres    false    233    235    4785            �           2606    36793    employees fk_person    FK CONSTRAINT     z   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_person FOREIGN KEY (personid) REFERENCES public.people(personid);
 =   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_person;
       public          postgres    false    219    4767    217            �           2606    36823    entities fk_person    FK CONSTRAINT     y   ALTER TABLE ONLY public.entities
    ADD CONSTRAINT fk_person FOREIGN KEY (personid) REFERENCES public.people(personid);
 <   ALTER TABLE ONLY public.entities DROP CONSTRAINT fk_person;
       public          postgres    false    223    217    4767            �           2606    36969    auditlogs fk_person    FK CONSTRAINT     z   ALTER TABLE ONLY public.auditlogs
    ADD CONSTRAINT fk_person FOREIGN KEY (personid) REFERENCES public.people(personid);
 =   ALTER TABLE ONLY public.auditlogs DROP CONSTRAINT fk_person;
       public          postgres    false    241    217    4767            �           2606    36890    actionplans fk_risk    FK CONSTRAINT     u   ALTER TABLE ONLY public.actionplans
    ADD CONSTRAINT fk_risk FOREIGN KEY (riskid) REFERENCES public.risks(riskid);
 =   ALTER TABLE ONLY public.actionplans DROP CONSTRAINT fk_risk;
       public          postgres    false    4781    231    229            �           2606    36914    events fk_risk    FK CONSTRAINT     p   ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_risk FOREIGN KEY (riskid) REFERENCES public.risks(riskid);
 8   ALTER TABLE ONLY public.events DROP CONSTRAINT fk_risk;
       public          postgres    false    4781    233    229            �           2606    36798    employees fk_role    FK CONSTRAINT     s   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_role FOREIGN KEY (roleid) REFERENCES public.roles(roleid);
 ;   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_role;
       public          postgres    false    216    4763    219            j      x������ � �      d      x������ � �      t      x������ � �      `      x������ � �      ^      x������ � �      b      x������ � �      l      x������ � �      r      x������ � �      n      x������ � �      \      x������ � �      f      x������ � �      h      x������ � �      [      x������ � �      p      x������ � �     