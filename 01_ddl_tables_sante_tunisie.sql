-- ============================================================================
-- DDL Script - GRH Ministère de la Santé de Tunisie
-- Generated: 2026-03-04
-- Adapted from GRH_BPC (Banque Postale du Congo) for 
-- the Tunisian Ministry of Health context
-- ============================================================================
-- Execution order: Run this script first, then 02_reference_data_sante_tunisie.sql
-- ============================================================================

-- ============================================================================
-- PART 1: INDEPENDENT REFERENCE TABLES (No FK dependencies)
-- ============================================================================

-- ---------------------------------------------------------------------------
-- GOUVERNORAT: 24 gouvernorats de Tunisie
-- Changed: COD_GOUV kept VARCHAR2(4) for consistency
-- Structure unchanged, data adapted for Tunisia
-- ---------------------------------------------------------------------------
CREATE TABLE GOUVERNORAT (
    COD_GOUV      VARCHAR2(4)  NOT NULL,
    LIB_GOUV      VARCHAR2(40) NOT NULL,
    LIB_GOUV_A    VARCHAR2(40),                -- Libellé en arabe
    CONSTRAINT PK_GOUVERNORAT PRIMARY KEY (COD_GOUV)
);

COMMENT ON TABLE GOUVERNORAT IS 'Les 24 gouvernorats de la Tunisie';
COMMENT ON COLUMN GOUVERNORAT.COD_GOUV IS 'Code gouvernorat (ISO 3166-2:TN)';
COMMENT ON COLUMN GOUVERNORAT.LIB_GOUV IS 'Libellé en français';
COMMENT ON COLUMN GOUVERNORAT.LIB_GOUV_A IS 'Libellé en arabe';

-- ---------------------------------------------------------------------------
-- DELEGATION: Délégations au sein des gouvernorats
-- RENAMED from POSTE to DELEGATION to match Tunisia's admin terminology
-- Tunisia: Gouvernorat > Délégation > Secteur(Imada)/Municipalité
-- Structure: COD_DELEG replaces COD_POST as PK, COD_CONT renamed COD_CIRC
-- ---------------------------------------------------------------------------
CREATE TABLE DELEGATION (
    COD_GOUV      VARCHAR2(4)  NOT NULL,
    COD_DELEG     VARCHAR2(4)  NOT NULL,        -- Was COD_POST in POSTE table
    LIB_DELEG     VARCHAR2(60) NOT NULL,        -- Was LIB_POST
    LIB_DELEG_A   VARCHAR2(60),                 -- Was LIB_POST_A (libellé arabe)
    COD_DELEG_ADM VARCHAR2(2),                  -- Was COD_DELEG (code admin délégation)
    COD_CIRC      VARCHAR2(4),                  -- Was COD_CONT (code circonscription sanitaire)
    CONSTRAINT PK_DELEGATION PRIMARY KEY (COD_DELEG),
    CONSTRAINT FK_DELEG_GOUV FOREIGN KEY (COD_GOUV)
        REFERENCES GOUVERNORAT (COD_GOUV) DEFERRABLE
);

COMMENT ON TABLE DELEGATION IS 'Délégations administratives au sein des gouvernorats tunisiens';
COMMENT ON COLUMN DELEGATION.COD_GOUV IS 'Code gouvernorat';
COMMENT ON COLUMN DELEGATION.COD_DELEG IS 'Code délégation';
COMMENT ON COLUMN DELEGATION.LIB_DELEG IS 'Libellé délégation en français';
COMMENT ON COLUMN DELEGATION.LIB_DELEG_A IS 'Libellé délégation en arabe';
COMMENT ON COLUMN DELEGATION.COD_DELEG_ADM IS 'Code administratif de la délégation';
COMMENT ON COLUMN DELEGATION.COD_CIRC IS 'Code de la circonscription sanitaire rattachée';

-- ---------------------------------------------------------------------------
-- LOCALITE: Secteurs (Imadas) / Municipalités au sein des délégations
-- Changed: FK references DELEGATION instead of POSTE
-- ---------------------------------------------------------------------------
CREATE TABLE LOCALITE (
    COD_GOUV      VARCHAR2(4)  NOT NULL,
    COD_LOC       VARCHAR2(4)  NOT NULL,
    COD_DELEG     VARCHAR2(4),                  -- Was COD_POST, now references DELEGATION
    LIB_LOC       VARCHAR2(60) NOT NULL,
    LIB_LOC_A     VARCHAR2(60),                 -- Libellé en arabe
    CONSTRAINT PK_LOCALITE PRIMARY KEY (COD_GOUV, COD_LOC),
    CONSTRAINT FK_LOC_DELEG FOREIGN KEY (COD_DELEG)
        REFERENCES DELEGATION (COD_DELEG),
    CONSTRAINT FK_LOC_GOUV FOREIGN KEY (COD_GOUV)
        REFERENCES GOUVERNORAT (COD_GOUV)
);

COMMENT ON TABLE LOCALITE IS 'Localités (secteurs/imadas/municipalités) au sein des délégations';
COMMENT ON COLUMN LOCALITE.COD_GOUV IS 'Code gouvernorat';
COMMENT ON COLUMN LOCALITE.COD_LOC IS 'Code localité';
COMMENT ON COLUMN LOCALITE.COD_DELEG IS 'Code délégation de rattachement';
COMMENT ON COLUMN LOCALITE.LIB_LOC IS 'Libellé localité en français';
COMMENT ON COLUMN LOCALITE.LIB_LOC_A IS 'Libellé localité en arabe';

-- ---------------------------------------------------------------------------
-- PAYS: Table des pays (referenced by PERSONNEL.COD_NATP)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE PAYS (
    COD_PAYS      VARCHAR2(4)  NOT NULL,
    LIB_PAYS      VARCHAR2(40),
    ABRV_PAYS     VARCHAR2(4),
    CONTINENT     VARCHAR2(1),
    LIB_PAYS_A    VARCHAR2(40),
    ABRV_PAYS_A   VARCHAR2(4),
    ABRV_PAYS1    VARCHAR2(4),
    URL_DRAPEAU   VARCHAR2(100),
    NATIONALITE   VARCHAR2(100),
    CONSTRAINT PK_PAYS PRIMARY KEY (COD_PAYS)
);

-- ---------------------------------------------------------------------------
-- TYP_CATEGORIE: Classification socio-professionnelle
-- Structure unchanged, data adapted for Tunisian public health
-- ---------------------------------------------------------------------------
CREATE TABLE TYP_CATEGORIE (
    TYP_CAT       VARCHAR2(4)  NOT NULL,
    LIB_TYP_CAT   VARCHAR2(60),
    LIB_TYP_CAT_A VARCHAR2(60),                -- Libellé en arabe
    CONSTRAINT PK_TYP_CATEGORIE1 PRIMARY KEY (TYP_CAT)
);

COMMENT ON TABLE TYP_CATEGORIE IS 'Classification socio-professionnelle dans la fonction publique tunisienne';
COMMENT ON COLUMN TYP_CATEGORIE.TYP_CAT IS 'Code classification socio-professionnelle';
COMMENT ON COLUMN TYP_CATEGORIE.LIB_TYP_CAT IS 'Libellé 1ère langue';
COMMENT ON COLUMN TYP_CATEGORIE.LIB_TYP_CAT_A IS 'Libellé 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- TYPE_ORG: Niveaux hiérarchiques de la structure organisationnelle
-- Structure unchanged, data adapted for health ministry
-- ---------------------------------------------------------------------------
CREATE TABLE TYPE_ORG (
    TYP_ORG        VARCHAR2(4)  NOT NULL,
    LIB_TYP_ORG    VARCHAR2(60),
    LIB_TYP_ORG_A  VARCHAR2(60),
    RANG           NUMBER(2,0),
    CONSTRAINT PK_TYPE_ORG PRIMARY KEY (TYP_ORG)
);

COMMENT ON TABLE TYPE_ORG IS 'Niveaux hiérarchiques de la structure organisationnelle du ministère';
COMMENT ON COLUMN TYPE_ORG.TYP_ORG IS 'Code type organisation';
COMMENT ON COLUMN TYPE_ORG.LIB_TYP_ORG IS 'Libellé';
COMMENT ON COLUMN TYPE_ORG.LIB_TYP_ORG_A IS 'Libellé 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- ETAT_PAIE: États de la paie
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE ETAT_PAIE (
    COD_ETAT      VARCHAR2(2)  NOT NULL,
    LIB_ETAT      VARCHAR2(40),
    LIB_ETAT_A    VARCHAR2(40),
    CONSTRAINT PK_ETAT_PAIE PRIMARY KEY (COD_ETAT)
);

COMMENT ON COLUMN ETAT_PAIE.COD_ETAT IS 'Code état';
COMMENT ON COLUMN ETAT_PAIE.LIB_ETAT IS 'Libellé';
COMMENT ON COLUMN ETAT_PAIE.LIB_ETAT_A IS 'Libellé 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- STATUT: Statut d'imposition et de charges sociales
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE STATUT (
    COD_STAT      VARCHAR2(4)  NOT NULL,
    LIB_STAT      VARCHAR2(40) NOT NULL,
    TYPE_DECL     VARCHAR2(10),
    LIB_STAT_A    VARCHAR2(40),
    CONSTRAINT PK_STATUT PRIMARY KEY (COD_STAT)
);

COMMENT ON COLUMN STATUT.COD_STAT IS 'Code statut';
COMMENT ON COLUMN STATUT.LIB_STAT IS 'Libellé';
COMMENT ON COLUMN STATUT.LIB_STAT_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN STATUT.TYPE_DECL IS 'Type de déclaration';

-- ---------------------------------------------------------------------------
-- ECHELON: Échelons salariaux
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE ECHELON (
    COD_ECH       NUMBER(2,0)  NOT NULL,
    DUREE_ECH     NUMBER(2,0),                  -- Durée en mois
    COD_CLASS     VARCHAR2(4),
    LIB_ECH       VARCHAR2(100),
    CONSTRAINT PK_ECHELON PRIMARY KEY (COD_ECH)
);

COMMENT ON COLUMN ECHELON.COD_ECH IS 'Code échelon';
COMMENT ON COLUMN ECHELON.DUREE_ECH IS 'Durée de séjour en mois';

-- ---------------------------------------------------------------------------
-- LISTE_DOMAINE: Domaines de spécialité
-- Structure unchanged, data adapted for health sector
-- ---------------------------------------------------------------------------
CREATE TABLE LISTE_DOMAINE (
    CODE_DOMAINE   VARCHAR2(10) NOT NULL,
    LIB_DOMAINE    VARCHAR2(50),
    LIB_DOMAINE_A  VARCHAR2(50),
    CONSTRAINT PK_LISTE_DOMAINE PRIMARY KEY (CODE_DOMAINE)
);

COMMENT ON COLUMN LISTE_DOMAINE.CODE_DOMAINE IS 'Code de spécialité';
COMMENT ON COLUMN LISTE_DOMAINE.LIB_DOMAINE IS 'Libellé 1ère langue';
COMMENT ON COLUMN LISTE_DOMAINE.LIB_DOMAINE_A IS 'Libellé 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- PRM_LIEU_GEOGRAPHIQUE: Lieux géographiques d'affectation
-- Structure unchanged, data adapted for Tunisia
-- ---------------------------------------------------------------------------
CREATE TABLE PRM_LIEU_GEOGRAPHIQUE (
    COD_LIEU_GEOG    VARCHAR2(10) NOT NULL,
    LIB_LIEU         VARCHAR2(100),
    LIB_LIEU_A       VARCHAR2(100),
    DIST_LIEU_TUNIS  NUMBER(3,0),               -- Distance par rapport à Tunis (km)
    NBR_ASSOCIATION  NUMBER(3,0),               -- Nb d'associations dans chaque lieu
    CONSTRAINT PK_PRM_LIEU PRIMARY KEY (COD_LIEU_GEOG)
);

COMMENT ON COLUMN PRM_LIEU_GEOGRAPHIQUE.COD_LIEU_GEOG IS 'Code lieu géographique';
COMMENT ON COLUMN PRM_LIEU_GEOGRAPHIQUE.LIB_LIEU IS 'Libellé';
COMMENT ON COLUMN PRM_LIEU_GEOGRAPHIQUE.DIST_LIEU_TUNIS IS 'Distance par rapport à la capitale Tunis';

-- ---------------------------------------------------------------------------
-- PRM_MILITAIRE: Situation vis-à-vis du service militaire
-- Structure unchanged (same rules in Tunisia)
-- ---------------------------------------------------------------------------
CREATE TABLE PRM_MILITAIRE (
    COD_MIL       VARCHAR2(2)  NOT NULL,
    LIB_MIL       VARCHAR2(80),
    LIB_MIL_A     VARCHAR2(80),
    CONSTRAINT PK_PRM_MILITAIRE PRIMARY KEY (COD_MIL)
);

COMMENT ON COLUMN PRM_MILITAIRE.COD_MIL IS 'Code situation militaire';
COMMENT ON COLUMN PRM_MILITAIRE.LIB_MIL IS 'Libellé';
COMMENT ON COLUMN PRM_MILITAIRE.LIB_MIL_A IS 'Libellé 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- GROUPE_SANGUIN: Groupes sanguins
-- Structure unchanged (universal)
-- ---------------------------------------------------------------------------
CREATE TABLE GROUPE_SANGUIN (
    GRP_SANG        VARCHAR2(4) NOT NULL,
    LIB_GRP_SANG    VARCHAR2(30),
    LIB_GRP_SANG_A  VARCHAR2(30),
    CONSTRAINT PK_GROUPE_SANGUIN PRIMARY KEY (GRP_SANG)
);

-- ---------------------------------------------------------------------------
-- PARAM_MVT: Paramètres des mouvements de carrière
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE PARAM_MVT (
    COD_MVT       VARCHAR2(4)  NOT NULL,
    LIB_MVT       VARCHAR2(60),
    LIB_MVT_A     VARCHAR2(60),
    TYP_MVT       VARCHAR2(2),                  -- Groupe: 1=recrutement, 2=position, 3=promotion, etc.
    COD_MVT_ANN   VARCHAR2(4),                  -- Code mouvement d'annulation
    CONSTRAINT PK_PARAM_MVT PRIMARY KEY (COD_MVT)
);

COMMENT ON COLUMN PARAM_MVT.COD_MVT IS 'Code mouvement';
COMMENT ON COLUMN PARAM_MVT.LIB_MVT IS 'Libellé';
COMMENT ON COLUMN PARAM_MVT.LIB_MVT_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN PARAM_MVT.TYP_MVT IS 'Groupe de mouvement (1=recrutement, 2=position, 3=promotion, 4=mutation, 5=formation, 6=reclassement, 7=déclassement, 8=départ, 9=annulation)';

-- ---------------------------------------------------------------------------
-- PARAM_NIVEAU: Niveaux d'instruction et diplômes
-- Structure unchanged, data adapted for Tunisian LMD education system
-- ---------------------------------------------------------------------------
CREATE TABLE PARAM_NIVEAU (
    COD_NIVEAU     VARCHAR2(5)  NOT NULL,
    LIB_NIVEAU     VARCHAR2(60),
    TYP_NIVEAU     VARCHAR2(1),                 -- N=niveau, D=diplôme
    ETUDE          VARCHAR2(3),                 -- PRO=professionnel, SEC=secondaire, UNI=universitaire
    CYCLE          VARCHAR2(3),
    NAT_NIVEAU     VARCHAR2(4),
    CODE_DOMAINE   VARCHAR2(10),
    NBR_AN         NUMBER(4,2),                 -- Nombre d'années d'études
    LIB_NIVEAU_A   VARCHAR2(60),
    RANG           NUMBER(3,0),                 -- Rang du diplôme
    CONSTRAINT PK_PARAM_NIVEAU PRIMARY KEY (COD_NIVEAU)
);

COMMENT ON COLUMN PARAM_NIVEAU.COD_NIVEAU IS 'Code de niveau d''instruction';
COMMENT ON COLUMN PARAM_NIVEAU.LIB_NIVEAU IS 'Libellé 1ère langue';
COMMENT ON COLUMN PARAM_NIVEAU.TYP_NIVEAU IS 'N pour les niveaux et D pour les diplômes';
COMMENT ON COLUMN PARAM_NIVEAU.ETUDE IS 'P=préparatoire, B=base, S=secondaire, U=universitaire';
COMMENT ON COLUMN PARAM_NIVEAU.NBR_AN IS 'Nombre d''années d''études';
COMMENT ON COLUMN PARAM_NIVEAU.RANG IS 'Rang de diplôme et de niveau';

-- ---------------------------------------------------------------------------
-- FILLIERE: Filières professionnelles
-- Structure unchanged, data adapted for health sector
-- ---------------------------------------------------------------------------
CREATE TABLE FILLIERE (
    COD_FIL       VARCHAR2(4)  NOT NULL,
    LIB_FIL       VARCHAR2(100),
    CAT_DEB_FIL   VARCHAR2(4),
    CAT_FIN_FIL   VARCHAR2(4),
    LIB_FIL_A     VARCHAR2(100),
    REG_TRAV      VARCHAR2(4),
    TAUX_MAJ      NUMBER(5,2),
    CONSTRAINT PK_FILLIERE PRIMARY KEY (COD_FIL)
);

COMMENT ON COLUMN FILLIERE.COD_FIL IS 'Code filière';
COMMENT ON COLUMN FILLIERE.LIB_FIL IS 'Libellé 1ère langue';
COMMENT ON COLUMN FILLIERE.LIB_FIL_A IS 'Libellé 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- NATURE_RECRUT: Modes de recrutement
-- Structure unchanged, data adapted for Tunisian public sector
-- ---------------------------------------------------------------------------
CREATE TABLE NATURE_RECRUT (
    COD_NAT_RECR   VARCHAR2(4) NOT NULL,
    LIB_NAT_RECR   VARCHAR2(40),
    LIB_NAT_RECR_A VARCHAR2(40),
    TYP_CAND       VARCHAR2(1),                 -- E=externe, D=direct, R=réintégration, A=apprenti, P=parrainage
    TYP_CONT       VARCHAR2(1),
    NAT_AFFECT     VARCHAR2(1),
    COD_STAT       VARCHAR2(4),
    NIV_SAL        NUMBER,
    COD_ECH        NUMBER,
    CONSTRAINT PK_NATURE_RECRUT PRIMARY KEY (COD_NAT_RECR)
);

COMMENT ON COLUMN NATURE_RECRUT.COD_NAT_RECR IS 'Code nature recrutement';
COMMENT ON COLUMN NATURE_RECRUT.LIB_NAT_RECR IS 'Libellé nature';
COMMENT ON COLUMN NATURE_RECRUT.TYP_CAND IS 'E=externe(concours), R=réintégration, D=direct sans concours, A=apprentis, P=parrainés';

-- ---------------------------------------------------------------------------
-- MOTIF_SORT: Positions administratives / motifs d'absence
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE MOTIF_SORT (
    COD_MOTIF       VARCHAR2(4)  NOT NULL,
    LIB_MOTIF       VARCHAR2(50),
    SALAIRE         VARCHAR2(1),
    AVANCEMENT      VARCHAR2(1),
    CONGE           VARCHAR2(1),
    TYPE            VARCHAR2(1),                -- E=entrée, S=sortie
    ETAT_ACT        VARCHAR2(1),
    INCIDENCE       NUMBER(3,0),
    ASSURANCE       VARCHAR2(1),
    INCIDE_ELECT    VARCHAR2(1),
    NATURE_MOTIF    VARCHAR2(1),                -- 1=Activité, 2=Détachement, 3=Sans solde, 4=SN, 5=Détach.interne, 6=Disponibilité, 7=Mise à disposition
    AVC_AID         VARCHAR2(1),
    LIB_MOTIF_A     VARCHAR2(50),
    TYP_IMPOT       VARCHAR2(1) DEFAULT 'N',
    RESERVE         VARCHAR2(1) DEFAULT 'O',
    NIV             NUMBER(3,0),
    COD_MVT         VARCHAR2(4),
    COD_M           VARCHAR2(4),
    SEXE            VARCHAR2(1),
    DEL_DEM_RET     NUMBER,
    AV_AP_DT_FIN    VARCHAR2(1),
    DEM_REPRISE     VARCHAR2(1),
    COD_MVT_REP     VARCHAR2(4),
    COD_TYP_DEPART  VARCHAR2(4),
    ACCORD_AUTORIT  VARCHAR2(1),
    COD_ALERT       VARCHAR2(4),
    DUREE_INSTANCE  NUMBER(3,0),
    NIV_PROLONG     NUMBER(3,0),
    NUM_DECISION    NUMBER(3,0),
    CONSTRAINT PK_MOTIF_SORT PRIMARY KEY (COD_MOTIF)
);

COMMENT ON COLUMN MOTIF_SORT.COD_MOTIF IS 'Code position';
COMMENT ON COLUMN MOTIF_SORT.LIB_MOTIF IS 'Libellé';
COMMENT ON COLUMN MOTIF_SORT.SALAIRE IS 'Salaire payé ou non';
COMMENT ON COLUMN MOTIF_SORT.AVANCEMENT IS 'Durée de position considérée dans l''ancienneté';
COMMENT ON COLUMN MOTIF_SORT.CONGE IS 'Donne droit aux congés (O/N)';
COMMENT ON COLUMN MOTIF_SORT.TYPE IS 'Type (E=entrée, S=sortie)';
COMMENT ON COLUMN MOTIF_SORT.NATURE_MOTIF IS 'Nature: 1=Activité, 2=Détachement, 3=Sans solde, 4=Service national, 5=Détachement interne, 6=Mise en disponibilité, 7=Mise à disposition';

-- ---------------------------------------------------------------------------
-- TYPE_DEPART: Types de départ définitif
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE TYPE_DEPART (
    COD_TYP_DEPART    VARCHAR2(4)  NOT NULL,
    LIB_TYP_DEPART    VARCHAR2(100),
    LIB_TYP_DEPART_A  VARCHAR2(100),
    DEM_TYP_DEPART    VARCHAR2(4),
    COD_MVT            VARCHAR2(4),
    NATURE_DEPART      VARCHAR2(1),             -- D=démission, R=retraite, F=fin contrat, I=invalidité, S=disciplinaire, M=décès, A=abandon, E=enquête, P=période essai, C=licenciement, L=fin relation, N=négocié
    TAUX_PBI           NUMBER(6,2),
    CONSTRAINT CK_NATURE_DEPART CHECK (NATURE_DEPART IN ('D','R','F','I','S','M','A','E','P','C','L','N')),
    CONSTRAINT PK_TYPE_DEPART PRIMARY KEY (COD_TYP_DEPART),
    CONSTRAINT FK1_TYPE_DEPART FOREIGN KEY (COD_MVT)
        REFERENCES PARAM_MVT (COD_MVT)
);

COMMENT ON COLUMN TYPE_DEPART.COD_TYP_DEPART IS 'Code type départ';
COMMENT ON COLUMN TYPE_DEPART.LIB_TYP_DEPART IS 'Libellé';
COMMENT ON COLUMN TYPE_DEPART.NATURE_DEPART IS 'D=démission, R=retraite, F=fin contrat, I=invalidité, S=disciplinaire, M=décès';

-- ---------------------------------------------------------------------------
-- AFFECTATION: Types de statut administratif (titulaire, contractuel, etc.)
-- Structure unchanged, data adapted for Tunisian public sector
-- ---------------------------------------------------------------------------
CREATE TABLE AFFECTATION (
    COD_AFFECT     VARCHAR2(4)  NOT NULL,
    LIB_AFFECT     VARCHAR2(40) NOT NULL,
    REGIME         VARCHAR2(1),                  -- M=mensuel, H=horaire
    JOURS          NUMBER(4,2),
    HEURES         NUMBER(7,3),
    RESERVE        VARCHAR2(1),
    TYP_AFFECT     VARCHAR2(1),
    LIB_AFFECT_A   VARCHAR2(40),
    NAT_AFFECT     VARCHAR2(1),                 -- T=titulaire, C=contractuel, S=stagiaire
    COD_MVT        VARCHAR2(4),
    CONSTRAINT CK_AFFECTAT_REGIME CHECK (REGIME IN ('M','H')),
    CONSTRAINT PK_AFFECTATION PRIMARY KEY (COD_AFFECT)
);

COMMENT ON TABLE AFFECTATION IS 'Statuts administratifs des agents';
COMMENT ON COLUMN AFFECTATION.COD_AFFECT IS 'Code statut administratif';
COMMENT ON COLUMN AFFECTATION.LIB_AFFECT IS 'Libellé';
COMMENT ON COLUMN AFFECTATION.NAT_AFFECT IS 'Nature: T=titulaire, C=contractuel, S=stagiaire, I=intérimaire';

-- ---------------------------------------------------------------------------
-- FONCTIONS: Fonctions et qualifications
-- Structure unchanged, data adapted for health ministry
-- ---------------------------------------------------------------------------
CREATE TABLE FONCTIONS (
    COD_FONCT      VARCHAR2(4)  NOT NULL,
    LIB_FONCT      VARCHAR2(40) NOT NULL,
    TYP_FONCT      VARCHAR2(1) DEFAULT 'F' NOT NULL, -- F=fonction, Q=qualification
    ABRV_FONCT     VARCHAR2(20),
    NIVEAU         NUMBER(3,0),
    LIB_FONCT_A    VARCHAR2(40),
    RESERVE        VARCHAR2(1),                  -- P=nommé par décret, A=autres
    RESP_FONCT     VARCHAR2(1),                  -- Fonction de responsabilité
    NB_SAL         NUMBER,
    IND_INSAL      NUMBER(1,0),
    STRATEGIQU     VARCHAR2(1),                  -- O=stratégique, N=non
    ID_FONCTIONS   NUMBER,
    NOTE           VARCHAR2(1) DEFAULT 'O',      -- Notation (O/N)
    CONSTRAINT CK_FONCTION_TYP_FONCT CHECK (TYP_FONCT IN ('F','Q')),
    CONSTRAINT PK_FONCTIONS PRIMARY KEY (COD_FONCT, TYP_FONCT)
);

COMMENT ON COLUMN FONCTIONS.COD_FONCT IS 'Code fonction';
COMMENT ON COLUMN FONCTIONS.LIB_FONCT IS 'Libellé 1ère langue';
COMMENT ON COLUMN FONCTIONS.TYP_FONCT IS 'Q=qualification, F=fonction';
COMMENT ON COLUMN FONCTIONS.RESERVE IS 'P=nommé par décret présidentiel, A=autres';
COMMENT ON COLUMN FONCTIONS.RESP_FONCT IS 'Fonction de responsabilité ou non';

-- ---------------------------------------------------------------------------
-- AFFELIATION: Organismes d'affiliation (CNRPS, CNSS, mutuelles, syndicats)
-- Structure unchanged, data adapted for Tunisia (CNRPS instead of CNAS/CNR)
-- ---------------------------------------------------------------------------
CREATE TABLE AFFELIATION (
    COD_AFF       VARCHAR2(4)  NOT NULL,
    LIB_AFF       VARCHAR2(100) NOT NULL,
    ABRV_AFF      VARCHAR2(10),
    TYP_AFF       VARCHAR2(1),
    LIB_AFF_A     VARCHAR2(100),
    ABRV_AFF_A    VARCHAR2(10),
    RESERVE       VARCHAR2(1),
    RIB           VARCHAR2(20),
    NAT_AFF       VARCHAR2(1),
    CONSTRAINT PK_AFFELIATION PRIMARY KEY (COD_AFF)
);

-- ---------------------------------------------------------------------------
-- CODE_AFFILIATION: Types et codes d'affiliation
-- Structure unchanged, data adapted for Tunisia (CNRPS, CNSS)
-- ---------------------------------------------------------------------------
CREATE TABLE CODE_AFFILIATION (
    TYP_AFFIL        VARCHAR2(15),
    COD_AFFIL        VARCHAR2(4),
    LIB_AFFIL        VARCHAR2(80),
    LIB_AFFIL_A      VARCHAR2(80),
    ID_CODE_AFFILIATION NUMBER,
    AGE              NUMBER,                    -- Nombre de mois (pour retraite)
    CONSTRAINT PK_CODE_AFFILIATION PRIMARY KEY (TYP_AFFIL, COD_AFFIL)
);

COMMENT ON COLUMN CODE_AFFILIATION.AGE IS 'Nombre de mois en cas de retraite';

-- ---------------------------------------------------------------------------
-- ACTIVITE_FAMILLE: Activités des membres de famille (conjoints/enfants)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE ACTIVITE_FAMILLE (
    COD_ACTIVITE      VARCHAR2(4)  NOT NULL,
    LIB_ACTIVITE      VARCHAR2(40) NOT NULL,
    ALLOCATION        VARCHAR2(1) NOT NULL,
    PARENTE_ACT       VARCHAR2(1) NOT NULL,     -- E=enfant, C=conjoint
    PENSION           VARCHAR2(1),
    LIB_ACTIVITE_A    VARCHAR2(40),
    MNT_PENSION       NUMBER(7,3),
    AGE               NUMBER(3,0),
    PRM_SCOL          NUMBER(10,3),
    MIN_AGE           NUMBER(3,0),
    MAX_AGE           NUMBER(3,0),
    SCOL              VARCHAR2(1),
    TYP_ACTIVITE      VARCHAR2(4),
    ID_ACTIVITE_FAMILLE NUMBER,
    CONSTRAINT CK_ACTIVITE_PARENTE_ACT CHECK (PARENTE_ACT IN ('E','C')),
    CONSTRAINT PK_ACTIVITE_FAMILLE PRIMARY KEY (COD_ACTIVITE, PARENTE_ACT)
);

-- ============================================================================
-- PART 2: TABLES WITH SINGLE-LEVEL DEPENDENCIES
-- ============================================================================

-- ---------------------------------------------------------------------------
-- CATEG: Nature des grilles (Classification niveau 1)
-- Structure unchanged, data adapted for Tunisian public health
-- ---------------------------------------------------------------------------
CREATE TABLE CATEG (
    COD_CATEG       VARCHAR2(4)  NOT NULL,
    LIB_CATEG       VARCHAR2(60) NOT NULL,
    NBR_ECH         NUMBER(2,0),
    TYP_CAT         VARCHAR2(2),
    LIB_CATEG_A     VARCHAR2(60),
    DUREE           NUMBER(10,0),               -- Durée de séjour dans la classification
    COD_GRAD_MIN    VARCHAR2(4),
    COD_GRAD_MAX    VARCHAR2(4),
    CATEG_COD_CATEG VARCHAR2(4),
    COD_FIL         VARCHAR2(4),                -- Code filière
    REGIME_TRAV     VARCHAR2(1),
    REGIME_HEUR     VARCHAR2(2),
    VPI             NUMBER(7,3),                -- Valeur de point indiciaire
    SAL_MIN         NUMBER(12,3),
    CONSTRAINT PK_CATEG PRIMARY KEY (COD_CATEG)
);

COMMENT ON TABLE CATEG IS 'Nature des grilles - classification niveau 1';
COMMENT ON COLUMN CATEG.COD_CATEG IS 'Code classification niveau 1';
COMMENT ON COLUMN CATEG.LIB_CATEG IS 'Libellé 1ère langue';
COMMENT ON COLUMN CATEG.LIB_CATEG_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN CATEG.DUREE IS 'Durée de séjour dans la classification';
COMMENT ON COLUMN CATEG.VPI IS 'Valeur de point indiciaire';

-- ---------------------------------------------------------------------------
-- CATEGORIE: Classification niveau 2
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CATEGORIE (
    COD_CATEG       VARCHAR2(4)  NOT NULL,
    COD_CAT         VARCHAR2(4)  NOT NULL,
    LIB_CAT         VARCHAR2(40),
    DUREE           NUMBER(2,0),                -- Durée en mois
    NBR_ECH         NUMBER(2,0),
    TYP_CAT         VARCHAR2(2),
    NBR_PAIE        NUMBER(5,2),
    ABS_CNG         VARCHAR2(1),
    PRIME           NUMBER(10,3),
    NOTE_REND       VARCHAR2(1),                -- Notation O/N
    COD_GROUP       NUMBER(2,0),
    QUALF           VARCHAR2(10),
    PLAFOND_GRADE   NUMBER,
    GR_COMP         VARCHAR2(1) DEFAULT 'N',
    JOUR_DEMISSION  NUMBER(3,0),                -- Nb jours de préavis
    QUOTA_PBI       NUMBER(4,0),
    QUOTA_PBI_AG    NUMBER(4,0),
    QUOTA_ECH       NUMBER(4,0),
    VAR1_SOLUTION1  NUMBER(4,0),
    VAR1_SOLUTION2  NUMBER(4,0),
    VARIANTE2       NUMBER(4,0),
    PERIOD_ESSAI    NUMBER(3,0),                -- Nb mois période d'essai
    ID_CATEGORIE    NUMBER,
    LIB_CAT_A       VARCHAR2(40),
    CONSTRAINT PK_CATEGORIE PRIMARY KEY (COD_CATEG, COD_CAT),
    CONSTRAINT FK_CAT_CLASSE FOREIGN KEY (TYP_CAT)
        REFERENCES TYP_CATEGORIE (TYP_CAT),
    CONSTRAINT FK_CATEGORIE FOREIGN KEY (COD_CATEG)
        REFERENCES CATEG (COD_CATEG)
);

COMMENT ON COLUMN CATEGORIE.COD_CATEG IS 'Code classification niveau 1';
COMMENT ON COLUMN CATEGORIE.COD_CAT IS 'Code classification niveau 2';
COMMENT ON COLUMN CATEGORIE.LIB_CAT IS 'Libellé';
COMMENT ON COLUMN CATEGORIE.DUREE IS 'Durée en mois';
COMMENT ON COLUMN CATEGORIE.NOTE_REND IS 'Notation O/N';
COMMENT ON COLUMN CATEGORIE.PERIOD_ESSAI IS 'Nombre de mois période d''essai';

-- ---------------------------------------------------------------------------
-- GRADE: Classification niveau 3 (niveaux de salaire)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE GRADE (
    COD_CATEG       VARCHAR2(4)  NOT NULL,
    COD_CAT         VARCHAR2(4)  NOT NULL,
    COD_GRAD        VARCHAR2(4)  NOT NULL,
    LIB_GRAD        VARCHAR2(60),
    ABRV_GRAD1      VARCHAR2(10),
    ABRV_GRAD2      VARCHAR2(20),
    DUREE           NUMBER(2,0),                -- Durée de séjour
    NBR_ECH         NUMBER(2,0),                -- Nombre des échelons
    COD_CAT_ELECT   VARCHAR2(4),
    NOTE            VARCHAR2(1),                -- Notation O/N
    COD_GROUP       NUMBER(2,0),
    COD_CAT_RS      VARCHAR2(4),
    CAT_RESULTAT_RS VARCHAR2(4),
    LIB_GRAD_A      VARCHAR2(60),               -- Libellé en arabe
    MNT_COMP        NUMBER(15,3),
    COD_SOC         VARCHAR2(4),
    TYP_CAT         VARCHAR2(4),
    ID_GRADE        NUMBER,
    CONSTRAINT PK_GRADE PRIMARY KEY (COD_CATEG, COD_CAT, COD_GRAD),
    CONSTRAINT FK_TYP_CATE FOREIGN KEY (TYP_CAT)
        REFERENCES TYP_CATEGORIE (TYP_CAT),
    CONSTRAINT FK_GRADE FOREIGN KEY (COD_CATEG, COD_CAT)
        REFERENCES CATEGORIE (COD_CATEG, COD_CAT)
);

COMMENT ON TABLE GRADE IS 'Niveaux de salaire - classification niveau 3';
COMMENT ON COLUMN GRADE.COD_CATEG IS 'Code classification niveau 1';
COMMENT ON COLUMN GRADE.COD_CAT IS 'Code classification niveau 2';
COMMENT ON COLUMN GRADE.COD_GRAD IS 'Code classification niveau 3 (grade)';
COMMENT ON COLUMN GRADE.LIB_GRAD IS 'Libellé du grade';
COMMENT ON COLUMN GRADE.DUREE IS 'Durée de séjour dans le grade';
COMMENT ON COLUMN GRADE.NBR_ECH IS 'Nombre des échelons';

-- ---------------------------------------------------------------------------
-- AXE: Support table for METIER (required FK dependency)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE AXE (
    COD_AXE        VARCHAR2(4) NOT NULL,
    CONSTRAINT PK_AXE PRIMARY KEY (COD_AXE)
);

-- ---------------------------------------------------------------------------
-- METIER: Groupes de métiers/emplois
-- Structure unchanged, data adapted for health sector
-- ---------------------------------------------------------------------------
CREATE TABLE METIER (
    COD_METIER     VARCHAR2(4)  NOT NULL,
    LIB_METIER     VARCHAR2(60),
    LIB_METIER_A   VARCHAR2(60),
    DESCRIP        VARCHAR2(200),
    DESCRIP_A      VARCHAR2(200),
    COD_AXE        VARCHAR2(4),
    CONSTRAINT PK_METIER PRIMARY KEY (COD_METIER),
    CONSTRAINT U_AXE UNIQUE (COD_METIER, COD_AXE),
    CONSTRAINT FK_MTIER_AXE FOREIGN KEY (COD_AXE)
        REFERENCES AXE (COD_AXE)
);

-- ---------------------------------------------------------------------------
-- FILLIERE_POSTE: Filières des postes de travail
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE FILLIERE_POSTE (
    COD_FIL        VARCHAR2(4)  NOT NULL,
    LIB_FIL        VARCHAR2(100),
    CAT_DEB_FIL    VARCHAR2(4),
    CAT_FIN_FIL    VARCHAR2(4),
    LIB_FIL_A      VARCHAR2(100),
    REG_TRAV       VARCHAR2(4),
    TAUX_MAJ       NUMBER(5,2),
    COD_METIER     VARCHAR2(4),
    CONSTRAINT PK_FILIERE_POSTE PRIMARY KEY (COD_FIL)
);

-- ---------------------------------------------------------------------------
-- POSTE_TRAV: Référentiel des emplois / postes de travail
-- Structure unchanged, data adapted for health sector jobs
-- ---------------------------------------------------------------------------
CREATE TABLE POSTE_TRAV (
    COD_METIER     VARCHAR2(4)  NOT NULL,
    COD_POST       VARCHAR2(15) NOT NULL,
    POST_TYP       VARCHAR2(1),                 -- F=fonctionnel, Q=non fonctionnel
    LIB_POST       VARCHAR2(200),
    LIB_POST_A     VARCHAR2(200),
    ABRV_POST      VARCHAR2(10),
    ABRV_POST_A    VARCHAR2(10),
    DESCRIP        VARCHAR2(2000),
    DESCRIP_A      VARCHAR2(2000),
    SECT_ACTIVI    VARCHAR2(200),
    APP_NNP        VARCHAR2(200),
    DOM_TRAV       VARCHAR2(400),
    NATURE_POST    VARCHAR2(1),                 -- Poste stratégique ou non
    SECT_ACTIVI_A  VARCHAR2(200),
    APP_NNP_A      VARCHAR2(200),
    DOM_TRAV_A     VARCHAR2(400),
    REFERENTIEL    VARCHAR2(4),
    R_COD_METIER   VARCHAR2(4),
    R_COD_POST     VARCHAR2(15),
    COD_CATEG      VARCHAR2(4),
    COD_CAT        VARCHAR2(4),
    COD_GRAD       VARCHAR2(4),
    COD_FIL        VARCHAR2(4),
    CONSTRAINT PK_POSTE_TRAV PRIMARY KEY (COD_POST),
    CONSTRAINT FK_POSTE_FILIERE FOREIGN KEY (COD_FIL)
        REFERENCES FILLIERE_POSTE (COD_FIL),
    CONSTRAINT FK_POSTE_TRAV_MET FOREIGN KEY (COD_METIER)
        REFERENCES METIER (COD_METIER)
);

COMMENT ON COLUMN POSTE_TRAV.COD_POST IS 'Code de l''emploi';
COMMENT ON COLUMN POSTE_TRAV.LIB_POST IS 'Libellé de l''emploi 1ère langue';
COMMENT ON COLUMN POSTE_TRAV.POST_TYP IS 'F=emploi fonctionnel, Q=emploi non fonctionnel';
COMMENT ON COLUMN POSTE_TRAV.NATURE_POST IS 'Poste stratégique ou non stratégique';

-- ============================================================================
-- PART 3: MAIN ENTITY TABLE (SOCIETE)
-- ============================================================================

-- ---------------------------------------------------------------------------
-- SOCIETE: Information sur l'organisme (Ministère de la Santé)
-- Structure unchanged, data adapted for Tunisian Health Ministry
-- ---------------------------------------------------------------------------
CREATE TABLE SOCIETE (
    COD_SOC           VARCHAR2(4)   NOT NULL,
    COD_SECT          VARCHAR2(4),
    COD_POST          VARCHAR2(5)   NOT NULL,    -- Code postal
    LIB_SOC           VARCHAR2(100) NOT NULL,
    ABRV_SOC          VARCHAR2(20),
    RUE_SOC           VARCHAR2(40),
    VILLE_SOC         VARCHAR2(20),
    PAYS_SOC          VARCHAR2(20),
    TEL_SOC           VARCHAR2(10),
    FAX_SOC           VARCHAR2(10),
    COD_TVA           VARCHAR2(20),
    NUM_RETR          VARCHAR2(20),              -- N° affiliation CNRPS
    JOUR_TRAV         NUMBER(4,2),
    HEUR_TRAV         NUMBER(5,2),
    HEUR_HEBD         NUMBER(5,2),
    DEB_CYCLE         VARCHAR2(4),
    FIN_CYCLE         VARCHAR2(4),
    REP_WEB           VARCHAR2(1),
    LIB_SOC_A         VARCHAR2(100),             -- Libellé en arabe
    NOM_SIG1          VARCHAR2(200),
    NOM_SIG2          VARCHAR2(200),
    REPOS             VARCHAR2(1),
    NAT_ARROND        VARCHAR2(1),
    VAL_ARROND        NUMBER(4,1),
    TYP_SOC           VARCHAR2(1),
    ABRV_SOC_A        VARCHAR2(20),
    RUE_SOC_A         VARCHAR2(40),
    VILLE_SOC_A       VARCHAR2(20),
    PAYS_SOC_A        VARCHAR2(20),
    WEB               VARCHAR2(1),
    NUM_RETR_COMP     VARCHAR2(20),
    ACCT_SOC          VARCHAR2(20),
    SOC_COD_SOC       VARCHAR2(4),
    JJ_DEB            NUMBER(2,0),
    MAX_AGE           NUMBER(3,0),
    MIN_AGE           NUMBER(3,0),
    MINISTERE_SOC     VARCHAR2(100),             -- Ministère de tutelle
    COD_RETR          VARCHAR2(5),
    ADR_ELC           VARCHAR2(150),
    ACT_SOC           VARCHAR2(40),
    NAT_IMPOT         NUMBER(2,0),
    TAUX_CHARG_PROF   NUMBER(5,2),
    PLAF_CHARG_PROF   NUMBER(10,3),
    IETUD             NUMBER(10,3),
    IHAND             NUMBER(10,3),
    REGISTRE_COMMERCE VARCHAR2(40),
    SIG_SOC           BLOB,
    CONSTRAINT PK_SOCIETE PRIMARY KEY (COD_SOC)
);

COMMENT ON COLUMN SOCIETE.COD_SOC IS 'Code société/organisme, par défaut 01';
COMMENT ON COLUMN SOCIETE.COD_POST IS 'Code postal';
COMMENT ON COLUMN SOCIETE.LIB_SOC IS 'Libellé 1ère langue';
COMMENT ON COLUMN SOCIETE.LIB_SOC_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN SOCIETE.ABRV_SOC IS 'Sigle 1ère langue';
COMMENT ON COLUMN SOCIETE.MINISTERE_SOC IS 'Ministère de tutelle';
COMMENT ON COLUMN SOCIETE.NUM_RETR IS 'Numéro affiliation CNRPS';

-- ============================================================================
-- PART 4: MAIN ENTITY TABLE (PERSONNEL) AND DEPENDENTS
-- ============================================================================

-- ---------------------------------------------------------------------------
-- SERVICE: Structure organisationnelle (directions, services, etc.)
-- Structure unchanged, data adapted for health ministry
-- ---------------------------------------------------------------------------
CREATE TABLE SERVICE (
    COD_SOC         VARCHAR2(4)  NOT NULL,
    COD_SERV        VARCHAR2(10) NOT NULL,
    SER_COD_SERV    VARCHAR2(10),               -- Code service niveau supérieur
    LIB_SERV        VARCHAR2(120) NOT NULL,
    ABR_SERV        VARCHAR2(10),
    TYPE_SERV       VARCHAR2(2),                 -- Niveau de service (voir TYPE_ORG)
    LIB_SERV_A      VARCHAR2(120),               -- Libellé en arabe
    ABR_SERV_A      VARCHAR2(10),
    TYPE_SERV_CHEF  VARCHAR2(1),
    DEPT_ANAL       VARCHAR2(4),
    COURANT         VARCHAR2(1),                 -- Utilisable O/N
    ORDRE           NUMBER(5,0),
    ACTIVITE_SERV   VARCHAR2(1),                 -- Service extérieur O/N
    REGIME_SERV     NUMBER(2,0),
    COD_SECT        VARCHAR2(10),
    NB_SAL          NUMBER,
    REG_POST        VARCHAR2(1),
    COD_REG         VARCHAR2(4),
    PDMM            VARCHAR2(1),
    TAUX_DEF        NUMBER(7,3),
    DROIT_ASTR      VARCHAR2(1) DEFAULT 'N',     -- Droit à l'astreinte
    TEL_ASTR        VARCHAR2(15),
    ORG_SERV        VARCHAR2(15),
    PRIM_ADM_PARA   VARCHAR2(1),
    PRM_MAIT_CHANT  VARCHAR2(1) DEFAULT 'N',
    PRM_MAIT_MAINT  VARCHAR2(1) DEFAULT 'N',
    COD_FONCT       VARCHAR2(10),               -- Fonction de responsable de structure
    TYP_FONCT       VARCHAR2(1),
    MAT_PERS        VARCHAR2(10),               -- Matricule de responsable
    DAT_AFFECT      DATE,
    TYP_AFFECT      VARCHAR2(1),                -- V=affectation, I=intérim
    COD_LIEU_GEOG   VARCHAR2(4),
    COD_CENTRE      VARCHAR2(4),                -- Centre payeur
    COD_ETAB        VARCHAR2(10),               -- Établissement sanitaire
    CPT_FRAIS       VARCHAR2(10),
    SERV_CPT        VARCHAR2(10),
    SERV_PAYEUR     VARCHAR2(10),
    ID_SERVICE      NUMBER,
    CONSTRAINT CH1_SERVICE CHECK (REG_POST IN ('0','1','2')),
    CONSTRAINT PK_SERVICE PRIMARY KEY (COD_SOC, COD_SERV),
    CONSTRAINT FK_SERV_TYPE_SERV FOREIGN KEY (TYPE_SERV)
        REFERENCES TYPE_ORG (TYP_ORG)
);

COMMENT ON COLUMN SERVICE.COD_SERV IS 'Code service/structure';
COMMENT ON COLUMN SERVICE.SER_COD_SERV IS 'Code service niveau supérieur (hiérarchie)';
COMMENT ON COLUMN SERVICE.LIB_SERV IS 'Libellé service 1ère langue';
COMMENT ON COLUMN SERVICE.LIB_SERV_A IS 'Libellé service 2ème langue (arabe)';
COMMENT ON COLUMN SERVICE.TYPE_SERV IS 'Niveau de service dans la hiérarchie (référence TYPE_ORG)';
COMMENT ON COLUMN SERVICE.COD_ETAB IS 'Établissement sanitaire de rattachement';
COMMENT ON COLUMN SERVICE.COD_LIEU_GEOG IS 'Lieu géographique de la structure';
COMMENT ON COLUMN SERVICE.MAT_PERS IS 'Matricule du responsable du service';
COMMENT ON COLUMN SERVICE.TYP_AFFECT IS 'V=affectation, I=intérim';

-- ---------------------------------------------------------------------------
-- PERSONNEL: Table principale des agents
-- Structure unchanged, FKs adapted (POSTE_TRAV FK confirmed, GOUVERNORAT/LOCALITE unchanged)
-- ---------------------------------------------------------------------------
CREATE TABLE PERSONNEL (
    COD_SOC         VARCHAR2(4)   NOT NULL,
    MAT_PERS        VARCHAR2(10)  NOT NULL,
    NOM_PERS        VARCHAR2(40),
    PREN_PERS       VARCHAR2(40),
    NOM_PERS_A      VARCHAR2(60),               -- Nom en arabe
    PREN_PERS_A     VARCHAR2(60),               -- Prénom en arabe
    NOM_JF          VARCHAR2(80),               -- Nom de jeune fille
    NOM_JF_A        VARCHAR2(40),
    CIN             VARCHAR2(20),               -- N° CIN
    SEXE            VARCHAR2(1),
    COD_SIT         VARCHAR2(1),                -- Situation familiale: C/D/V/M/R
    DAT_SIT         DATE,
    CHEF_FAM        VARCHAR2(1),                -- Chef de famille O/N
    NBRE_ENF        NUMBER(2,0) DEFAULT 0,
    CHARG_ENF       VARCHAR2(4),                -- Nb enfants à charge
    CHARG_ALL       VARCHAR2(4),                -- Nb enfants (alloc. familiales)
    FCT_FAM         VARCHAR2(1),                -- Conjoint actif O/N
    DAT_ENT         DATE,                       -- Date d'entrée
    DAT_TIT         DATE,                       -- Date titularisation
    COD_SERV        VARCHAR2(10),               -- Code service
    COD_FONCT       VARCHAR2(4),                -- Code fonction
    COD_CATEG       VARCHAR2(4),                -- Classification niveau 1
    COD_CAT         VARCHAR2(4),                -- Classification niveau 2
    COD_GRAD        VARCHAR2(4),                -- Classification niveau 3 (grade)
    COD_MOTIF       VARCHAR2(4),                -- Position administrative
    COD_NATP        VARCHAR2(4),                -- Code nationalité
    COD_STAT        VARCHAR2(4) DEFAULT '01',   -- Statut d'imposition
    DAT_SERV        DATE,
    DAT_FONCT       DATE,
    DAT_QUALF       DATE,
    DAT_CATEG       DATE,
    DAT_CAT         DATE,
    DAT_GRAD        DATE,
    DAT_ECH         DATE,
    DAT_EMB         DATE,                       -- Date d'embauche
    DAT_MOTIF       DATE,                       -- Date position
    DAT_NAIS        DATE,                       -- Date naissance
    ETAT_ACT        VARCHAR2(1),                -- État paie: 0=actif, 1=bloqué, 5=arrêt, 8=STC
    PER_MAT_PERS    VARCHAR2(10),               -- Ancien matricule
    QUALF           VARCHAR2(4),
    COD_ECH         NUMBER(2,0),                -- Code échelon
    COD_AFFECT      VARCHAR2(4),                -- Statut administratif
    COD_NIVEAU      VARCHAR2(5),                -- Niveau d'instruction/diplôme
    POSTE_TRAV      VARCHAR2(15),               -- Poste de travail (réf. POSTE_TRAV)
    COD_METIER      VARCHAR2(4),
    COD_USER        VARCHAR2(10),
    DAT_MAJ         DATE,
    ADM_TECH        VARCHAR2(10),               -- Emploi fonctionnel (réf. TYP_ADM_TECH)
    DAT_STAT        DATE,
    DAT_CIN         DATE,                       -- Date de délivrance CIN
    LIE_EMI_CIN     VARCHAR2(100),              -- Lieu de délivrance CIN
    DAT_AFFECT      DATE,
    LIEU_NAIS       VARCHAR2(200),              -- Lieu de naissance
    COD_LIEU_GEOG   VARCHAR2(10),               -- Lieu géographique
    DAT_LIEU_GEOG   DATE,
    GRP_SANG        VARCHAR2(3),                -- Groupe sanguin
    NUM_RETR        VARCHAR2(12),               -- N° CNRPS/CNSS
    COD_FIL         VARCHAR2(4),                -- Filière
    DAT_FIL         DATE,
    SERV_MIL        VARCHAR2(2),                -- Service militaire
    CODE_DOMAINE    VARCHAR2(10),               -- Spécialité
    COD_UR          VARCHAR2(10),
    COD_CLASS       VARCHAR2(4),
    DAT_CLASS       DATE,
    COD_TYP_DEPART  VARCHAR2(4),                -- Type de départ
    DAT_DEPART      DATE,
    DAT_UR          DATE,
    ORG_SERV        VARCHAR2(15),               -- Affectation fonctionnelle
    DAT_POSTE_TRAV  DATE,
    COD_NAT_RECR    VARCHAR2(4),                -- Nature de recrutement
    DAT_ADM_TECH    DATE,
    DAT_ORG_SERV    DATE,
    MAINTIEN_PERS   VARCHAR2(1),
    MAINTIEN_DATE   DATE,
    TYP_RANG        VARCHAR2(1),
    HANDICAP        VARCHAR2(1) DEFAULT '0',    -- 0=non, 1=normal, 2=prioritaire, 3=avec accompagnant
    POURCENT_HAND   NUMBER(5,2) DEFAULT 0,      -- Taux IPP
    TYP_HANDICAP    VARCHAR2(1),                -- 0=physique, 1=intellectuelle, 2=vision, 3=oreille
    NUM_FICH_HAND   VARCHAR2(10),
    NIV_SAL         NUMBER(4,0),                -- Indice salarial
    COD_ASSUR       VARCHAR2(4) DEFAULT '001',
    NUM_ASSUR       VARCHAR2(20),
    COD_RETR        VARCHAR2(5),
    TYP_ID          VARCHAR2(1),                -- Type identifiant: CIN, Passeport
    ETAT_SANTE      VARCHAR2(1),                -- S=sain, H=handicapé
    DAT_EFF_FICH_HAND DATE,
    DAT_FIN_FICH_HAND DATE,
    REF_FONCT       VARCHAR2(20),               -- Référence JORT
    NAT_TEXTE_FONCT VARCHAR2(2),
    NOUV_DAT_ECH    DATE,
    DAT_NIV_SAL     DATE,
    DAT_ASS         DATE,
    DAT_AFF_CNAM    DATE,
    ETAT_POSTE_TRAV VARCHAR2(1),                -- O=confirmé, N=intérim, A=avantage
    DAT_FIN_CONT    DATE,
    PRESUM_NAIS     VARCHAR2(1) DEFAULT 'N',    -- Date naissance présumée O/N
    COD_FILL        VARCHAR2(5),
    SUSPENS_ASS     VARCHAR2(1),
    COD_MOTIF_SUSP  VARCHAR2(4),
    DAT_FIN_SUSPENS DATE,
    DAT_DEB_SUSPENS DATE,
    CHRONIQUE       VARCHAR2(1),
    COD_CAT_CLASS   VARCHAR2(4),
    COD_GOUV        VARCHAR2(4),                -- Gouvernorat (adresse)
    COD_LOC         VARCHAR2(4),                -- Localité (adresse)
    NUM_ASS_GAT     VARCHAR2(10),
    NUM_ACC         VARCHAR2(20),               -- N° accident de travail
    CATEG_EMB       VARCHAR2(4),
    CAT_EMB         VARCHAR2(4),
    GRAD_EMB        VARCHAR2(4),
    ECH_EMB         NUMBER(2,0),
    ID_PERSONNEL    NUMBER,
    LIEU_NAIS_A     VARCHAR2(200),              -- Lieu naissance en arabe
    BENEF_ALLF      VARCHAR2(4),
    COD_DIR         VARCHAR2(4),
    COD_UF          VARCHAR2(10),
    CONSTRAINT CK_PERSONNEL_TYP_ID CHECK (ETAT_POSTE_TRAV IN ('O','N','A')),
    CONSTRAINT PK_PERSONNEL PRIMARY KEY (COD_SOC, MAT_PERS),
    CONSTRAINT CK_PERSONNE_FCT_FAM CHECK (FCT_FAM IN ('O','N')) DISABLE,
    CONSTRAINT CK_PERSONNEL_GRPS CHECK (GRP_SANG IN ('A+','A-','AB-','AB+','B+','B-','O+','O-')) DISABLE,
    CONSTRAINT CK_PERSONNE_CHEF_FAM CHECK (CHEF_FAM IN ('O','N')),
    CONSTRAINT CK_PERSONNEL_ETAT_SANTE CHECK (ETAT_SANTE IN ('S','H')),
    CONSTRAINT CK_PERSONNE_DAT_NAIS CHECK (DAT_NAIS < DAT_EMB) DISABLE,
    CONSTRAINT CK_PERSONNEL_DAT_RECRUT CHECK (DAT_CIN > DAT_NAIS) DISABLE,
    CONSTRAINT CK_PERSONNE_SEXE CHECK (SEXE IN ('M','F')),
    CONSTRAINT CK_PERSONNEL_COD_SIT CHECK (COD_SIT IN ('C','D','V','M','R')),
    CONSTRAINT FK_SOCIETE_PERSONNEL FOREIGN KEY (COD_SOC)
        REFERENCES SOCIETE (COD_SOC),
    CONSTRAINT FK_PERSONNEL_LISTE_DOMAINE FOREIGN KEY (CODE_DOMAINE)
        REFERENCES LISTE_DOMAINE (CODE_DOMAINE),
    CONSTRAINT FK_DEPART_PERSONNEL FOREIGN KEY (COD_TYP_DEPART)
        REFERENCES TYPE_DEPART (COD_TYP_DEPART),
    CONSTRAINT FK_PERSONNEL_SERV_MIL FOREIGN KEY (SERV_MIL)
        REFERENCES PRM_MILITAIRE (COD_MIL),
    CONSTRAINT FK_PERSONNE_REF_1111_CATEGORI FOREIGN KEY (COD_CATEG, COD_CAT)
        REFERENCES CATEGORIE (COD_CATEG, COD_CAT),
    CONSTRAINT FK_PERSONNEL_POSTE_TRAV FOREIGN KEY (POSTE_TRAV)
        REFERENCES POSTE_TRAV (COD_POST),
    CONSTRAINT FK_LIEU_GEOG FOREIGN KEY (COD_LIEU_GEOG)
        REFERENCES PRM_LIEU_GEOGRAPHIQUE (COD_LIEU_GEOG),
    CONSTRAINT FK_PERSONNEL_GRADE FOREIGN KEY (COD_CATEG, COD_CAT, COD_GRAD)
        REFERENCES GRADE (COD_CATEG, COD_CAT, COD_GRAD),
    CONSTRAINT FK_PERSONNEL_PARAM_NIVEAU FOREIGN KEY (COD_NIVEAU)
        REFERENCES PARAM_NIVEAU (COD_NIVEAU),
    CONSTRAINT FK_PERSONNEL_NATIONALITE FOREIGN KEY (COD_NATP)
        REFERENCES PAYS (COD_PAYS),
    CONSTRAINT FK_PERSONNEL_ETAT_PAIE FOREIGN KEY (ETAT_ACT)
        REFERENCES ETAT_PAIE (COD_ETAT),
    CONSTRAINT FK_PERSONNEL_ECHELON FOREIGN KEY (COD_ECH)
        REFERENCES ECHELON (COD_ECH),
    CONSTRAINT FK_PERSONNEL_MOTIF_SORT FOREIGN KEY (COD_MOTIF)
        REFERENCES MOTIF_SORT (COD_MOTIF),
    CONSTRAINT FK_PERSONNEL_STATUT FOREIGN KEY (COD_STAT)
        REFERENCES STATUT (COD_STAT),
    CONSTRAINT FK_PERSONNEL_PRM_ORGANIGRAMME FOREIGN KEY (COD_SOC, COD_SERV)
        REFERENCES SERVICE (COD_SOC, COD_SERV),
    CONSTRAINT FK_PERSONNEL_AFFECT FOREIGN KEY (COD_AFFECT)
        REFERENCES AFFECTATION (COD_AFFECT),
    CONSTRAINT FK_GROUP_SANGAIN FOREIGN KEY (GRP_SANG)
        REFERENCES GROUPE_SANGUIN (GRP_SANG),
    CONSTRAINT FK_NATURE_PERSONNEL FOREIGN KEY (COD_NAT_RECR)
        REFERENCES NATURE_RECRUT (COD_NAT_RECR)
);

COMMENT ON TABLE PERSONNEL IS 'Les agents du Ministère de la Santé';
COMMENT ON COLUMN PERSONNEL.MAT_PERS IS 'Matricule agent';
COMMENT ON COLUMN PERSONNEL.NOM_PERS IS 'Nom en français';
COMMENT ON COLUMN PERSONNEL.PREN_PERS IS 'Prénom en français';
COMMENT ON COLUMN PERSONNEL.NOM_PERS_A IS 'Nom en arabe';
COMMENT ON COLUMN PERSONNEL.PREN_PERS_A IS 'Prénom en arabe';
COMMENT ON COLUMN PERSONNEL.CIN IS 'Numéro carte d''identité nationale';
COMMENT ON COLUMN PERSONNEL.COD_SIT IS 'Situation familiale: C=célibataire, M=marié, D=divorcé, V=veuf, R=remarié';
COMMENT ON COLUMN PERSONNEL.COD_AFFECT IS 'Statut administratif (titulaire, contractuel, stagiaire)';
COMMENT ON COLUMN PERSONNEL.COD_MOTIF IS 'Position administrative (activité, détachement, disponibilité, etc.)';
COMMENT ON COLUMN PERSONNEL.ETAT_ACT IS 'État paie: 0=actif, 1=bloqué, 5=arrêt définitif, 8=STC';
COMMENT ON COLUMN PERSONNEL.NUM_RETR IS 'N° immatriculation CNRPS';
COMMENT ON COLUMN PERSONNEL.HANDICAP IS '0=non handicapé, 1=handicap normal, 2=prioritaire, 3=avec accompagnant';

-- ---------------------------------------------------------------------------
-- TYP_ADM_TECH: Emplois fonctionnels / postes de travail typés
-- Changed: Added FK from COD_POST to POSTE_TRAV (as specified by user)
-- ---------------------------------------------------------------------------
CREATE TABLE TYP_ADM_TECH (
    ADM_TECH         VARCHAR2(10) NOT NULL,
    LIB_ADM_TECH     VARCHAR2(40),
    ABRV_ADM_TECH    VARCHAR2(20),
    LIB_ADM_TECH_A   VARCHAR2(40),
    ABRV_ADM_TECH_A  VARCHAR2(20),
    TYP_ADM_TEC      VARCHAR2(1),
    COD_GRAD         VARCHAR2(4),
    H_DEROG          NUMBER(5,2),               -- Coefficient prime enveloppe
    COD_CAT          VARCHAR2(4),
    COD_CATEG        VARCHAR2(4),
    COD_FIL          VARCHAR2(4),
    POST_ORGANIQUE   VARCHAR2(1),               -- O=organique, N=non organique
    COD_POST         VARCHAR2(15),              -- Réf. POSTE_TRAV (NOT DELEGATION!)
    NIVEAU           VARCHAR2(1),
    DROIT_VEHICUL    VARCHAR2(1),
    CONSTRAINT PK_TYP_ADM_TECH PRIMARY KEY (ADM_TECH),
    CONSTRAINT FK2_ADM_GRAD FOREIGN KEY (COD_CATEG, COD_CAT, COD_GRAD)
        REFERENCES GRADE (COD_CATEG, COD_CAT, COD_GRAD),
    CONSTRAINT FK_ADM_TECH_FILLIERE FOREIGN KEY (COD_FIL)
        REFERENCES FILLIERE (COD_FIL),
    -- ADDED: FK to POSTE_TRAV as specified (cod_post in typ_adm_tech -> poste_trav)
    CONSTRAINT FK_ADM_TECH_POSTE_TRAV FOREIGN KEY (COD_POST)
        REFERENCES POSTE_TRAV (COD_POST)
);

COMMENT ON COLUMN TYP_ADM_TECH.ADM_TECH IS 'Code emploi fonctionnel';
COMMENT ON COLUMN TYP_ADM_TECH.LIB_ADM_TECH IS 'Libellé 1ère langue';
COMMENT ON COLUMN TYP_ADM_TECH.COD_POST IS 'Code poste dans le référentiel des postes (POSTE_TRAV)';
COMMENT ON COLUMN TYP_ADM_TECH.POST_ORGANIQUE IS 'O=poste organique, N=non organique';

-- ============================================================================
-- PART 5: CHILD TABLES OF PERSONNEL
-- ============================================================================

-- ---------------------------------------------------------------------------
-- FAMILLE: Membres de la famille de l'agent
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE FAMILLE (
    NUM_FAM         NUMBER(2,0)  NOT NULL,
    PARENTE_ACT     VARCHAR2(1),                -- E=enfant, C=conjoint
    COD_ACTIVITE    VARCHAR2(4),
    PRENOM          VARCHAR2(35) NOT NULL,
    PARENTE         VARCHAR2(1)  NOT NULL,       -- E=enfant, C=conjoint, M=mère, P=père, D=divers, V=veuf
    DAT_MAR         DATE,
    NOM_JF          VARCHAR2(40),
    DAT_NAISS       DATE,
    SEXE            VARCHAR2(1),
    BENEF           VARCHAR2(1),                -- Bénéficiaire O/N
    REGIME_CONJ     VARCHAR2(5),
    DAT_DECE        DATE,
    MAT_CONJ        VARCHAR2(10),
    PLAF_TOT_REMB   NUMBER(10,3),
    COD_SOC         VARCHAR2(4)  NOT NULL,
    MAT_PERS        VARCHAR2(10) NOT NULL,
    LIEU_NAISS      VARCHAR2(40),
    ASS_CONJ        VARCHAR2(40),
    PROFESSION      VARCHAR2(40),
    EMPLOYEUR       VARCHAR2(40),
    DAT_DIV         DATE,
    BOURSIER        VARCHAR2(3),
    COD_SIT         VARCHAR2(1),
    DAT_EFFET_ACT   DATE,
    NUM_ASS_CONJ    VARCHAR2(10),
    DAT_ENGAG_PARENT DATE,
    DAT_E_SAIS      DATE,
    DATE_VALIDATION  DATE,
    DECLAR_ALL      VARCHAR2(1),
    PROCED_JUDIC    VARCHAR2(1),
    PENSION         VARCHAR2(1),
    ETAT_FAM        VARCHAR2(1),
    MERE            NUMBER(2,0),
    GRP_SANG        VARCHAR2(3),
    PRENOM_A        VARCHAR2(35),
    NOM_JF_A        VARCHAR2(35),
    ETAT_VALID      VARCHAR2(1),                -- V=validé, S=instance
    PEC             VARCHAR2(1),                -- O=pris en charge, N=non
    CIN             VARCHAR2(20),
    MNT_PENSION     NUMBER(10,3),
    DAT_DIVORCE     DATE,
    PEC_MUT         VARCHAR2(1),
    NOM_PREN        VARCHAR2(60),
    NUM_FICH_HAND   VARCHAR2(10),
    DAT_EFF_FICH_HAND DATE,
    DAT_FIN_FICH_HAND DATE,
    TYP_MEMBRE      VARCHAR2(1),                -- F=fils, P=parrain
    CIN_CONJ        VARCHAR2(20),
    PRENOM_MERE     VARCHAR2(35),
    NUM_MERE        NUMBER(2,0),
    COD_AFF_CSS     VARCHAR2(4),
    DAT_CIN         DATE,
    LIEU_CIN        VARCHAR2(50),
    DAT_PEC         DATE,
    HANDICAP        VARCHAR2(1),
    DAT_PEC_MUT     DATE,
    PRESUM_NAIS     VARCHAR2(1),
    OBSERVATION     VARCHAR2(100),
    CHRONIQUE       VARCHAR2(1),
    TYP_CIN         VARCHAR2(1),                -- 1=CIN, 2=Passeport, 3=Carte séjour
    ID_FAMILLE      NUMBER,
    COD_USER        VARCHAR2(10),
    COD_PAYS        VARCHAR2(4),
    CONSTRAINT CK_FAMILLE_COD_SIT CHECK (COD_SIT IN ('M','C','V','D')) DISABLE,
    CONSTRAINT FAMILLE_PK PRIMARY KEY (COD_SOC, MAT_PERS, NUM_FAM),
    CONSTRAINT CK_FAMILLE_SEXE CHECK (SEXE IN ('M','F')),
    CONSTRAINT CK_FAMILLE_BENEF CHECK (BENEF IN ('O','N')),
    CONSTRAINT CK_FAMILLE_PARENTE_ACT CHECK (PARENTE_ACT IN ('E','C')),
    CONSTRAINT CK_FAMILLE_PARENTE CHECK (PARENTE IN ('E','C','M','P','D','V')),
    CONSTRAINT FK_FAMILLE_ACTIVITE_FAM FOREIGN KEY (COD_ACTIVITE, PARENTE_ACT)
        REFERENCES ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT),
    CONSTRAINT FK_FAMILLE_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON COLUMN FAMILLE.NUM_FAM IS '99=conjoint, 97=mère, 98=père, 1..80=enfants, 81=grand-père, 82=grand-mère';
COMMENT ON COLUMN FAMILLE.PARENTE IS 'E=enfant, C=conjoint, M=mère, P=père, D=divers, V=veuf';

-- ---------------------------------------------------------------------------
-- ADR_PERS: Adresses des agents
-- Changed: COD_DELEG replaces COD_POST reference to DELEGATION
-- ---------------------------------------------------------------------------
CREATE TABLE ADR_PERS (
    COD_GOUV         VARCHAR2(4),
    COD_DELEG        VARCHAR2(4),               -- Code délégation (compatible FK DELEGATION)
    COD_POST         VARCHAR2(4),               -- Code postal (NOT FK to DELEGATION)
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    NUM_ADR          NUMBER(4,0)  NOT NULL,
    RUE              VARCHAR2(100),
    RUE_A            VARCHAR2(100),
    TEL_PERS         VARCHAR2(30),
    FAX_PERS         VARCHAR2(15),
    ADR_COURANT      VARCHAR2(1),               -- Adresse courante O/N
    ADR_ELECTRONIQUE VARCHAR2(100),
    TEL_PORT_PERS    VARCHAR2(30),
    NUMERO_ADR       NUMBER,
    ETAT_ADR         VARCHAR2(1),
    IMMB_PERS        VARCHAR2(4),
    APP_PERS         VARCHAR2(4),
    LOCAL_PERS       VARCHAR2(4),
    ID_ADR_PERS      NUMBER,
    REC_MAIL         VARCHAR2(1) DEFAULT 'O',
    COD_USER         VARCHAR2(10),
    CONSTRAINT PK_ADR_PERS PRIMARY KEY (COD_SOC, MAT_PERS, NUM_ADR),
    CONSTRAINT CK_ADR_PERS_ADR_COURANT CHECK (ADR_COURANT IS NULL OR (ADR_COURANT IN ('O','N'))),
    CONSTRAINT FK_ADR_SOCIETE FOREIGN KEY (COD_SOC)
        REFERENCES SOCIETE (COD_SOC),
    CONSTRAINT FK_ADR_GOUVERNORAT FOREIGN KEY (COD_GOUV)
        REFERENCES GOUVERNORAT (COD_GOUV)
);

COMMENT ON COLUMN ADR_PERS.COD_GOUV IS 'Gouvernorat';
COMMENT ON COLUMN ADR_PERS.COD_DELEG IS 'Code délégation';
COMMENT ON COLUMN ADR_PERS.COD_POST IS 'Code postal';
COMMENT ON COLUMN ADR_PERS.ADR_COURANT IS 'Adresse courante O/N';
COMMENT ON COLUMN ADR_PERS.ADR_ELECTRONIQUE IS 'Adresse email';
COMMENT ON COLUMN ADR_PERS.TEL_PORT_PERS IS 'Téléphone portable';

-- ---------------------------------------------------------------------------
-- RENSEIGNEMENT_PERS: Informations complémentaires sur l'agent
-- Structure unchanged (FKs to referenced tables kept as-is)
-- Note: FKs to REGIME, REGIME_CONGE, CYCLE_CONGE, GROUPE_POINTE, 
-- BAREME_TRANSPORT are kept but those tables are NOT in the extracted scope
-- ---------------------------------------------------------------------------
CREATE TABLE RENSEIGNEMENT_PERS (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    REG_CNG          VARCHAR2(4),
    COD_CYCL         VARCHAR2(4),
    SAL_NEG          NUMBER(12,3),               -- Salaire hors grille
    TAUX_IMP         NUMBER(5,2),
    REGIME_TRAV      VARCHAR2(1),                -- M=mensuel, H=horaire
    DROIT_LAIT       NUMBER(1,0),
    COD_REG          VARCHAR2(4),
    NAT_REG          VARCHAR2(1),
    COMP_CNG         VARCHAR2(2),
    CODE_COMP_CNG    VARCHAR2(2),
    REG_POST         VARCHAR2(1),
    COD_EQUIP        VARCHAR2(1),
    POINTE           VARCHAR2(1) DEFAULT 'O',    -- Pointage O/N
    ANC_PERS         NUMBER(6,0),                -- Ancienneté en mois
    REGIME_HEUR      NUMBER(3,0),
    PERS_CLOG        VARCHAR2(1) DEFAULT '0',    -- Prime de logement
    PERS_CELEC       VARCHAR2(1),
    PERS_CVOIT       VARCHAR2(1),
    PERS_CEAU        VARCHAR2(1),
    CODE_CCHAUF      VARCHAR2(1),
    CODE_RESIDENCE   VARCHAR2(4),
    PRIM_ADM_PARA    VARCHAR2(1) DEFAULT '0',
    CODE_PELERINAGE  VARCHAR2(1),
    COEF_PTRIM       VARCHAR2(1),
    TAUX_IMP_PTRIM   NUMBER(10,3),
    ART40            VARCHAR2(1) DEFAULT 'N',
    COD_GRP          VARCHAR2(2),
    COD_SGRP         VARCHAR2(4),
    IND_DOMEST       VARCHAR2(1) DEFAULT '0',
    DAT_ART40        DATE,
    UNIFORM          VARCHAR2(1) DEFAULT '0',    -- 0=sans, 1=uniform, 2=prime uniform
    ANC_PERS_TIT     NUMBER(6,0),                -- Ancienneté titularisation
    COD_GROUP        VARCHAR2(10),
    NUM_POINTEUSE    VARCHAR2(10),
    POINTE_LIBRE     VARCHAR2(1),
    COD_GRP_POINT    VARCHAR2(10),
    SIGNATURE        VARCHAR2(1),
    COD_BAREME       VARCHAR2(4),
    DAT_DEB_ASSUR    DATE,
    DAT_FIN_ASSUR    DATE,
    F_MOJHD_CHEHID   VARCHAR2(1),               -- Fils de moudjahid/chahid
    IEP_MOJHD_CHEHID NUMBER(3,0),
    IEP_HORS_BEA     NUMBER(4,0),
    CONTRAT_FIDELITE  VARCHAR2(1),
    DT_DEB_FIDELITE   DATE,
    DT_FIN_FIDELITE   DATE,
    COD_MEMB         VARCHAR2(4),
    MNT_PARAM        NUMBER(12,3),
    BON_REST         VARCHAR2(1) DEFAULT 'O',
    COMPTE_PROCED_JUDIC VARCHAR2(20),
    BENEF_PROCED_JUDIC  VARCHAR2(50),
    BENEF            VARCHAR2(50),
    COMPTE_HERIT     VARCHAR2(20),
    NOM_PERS_CNSS    VARCHAR2(100),              -- Nom de l'agent à la CNRPS/CNSS
    AVC              NUMBER,
    DAT_AVQ          DATE,
    AVQ              NUMBER,
    DAT_AVC          DATE,
    TRS              VARCHAR2(1),
    DAT_TRS          DATE,
    COD_EXCEP        VARCHAR2(10),
    COD_PAY          VARCHAR2(2),
    SIT_CHEQ         VARCHAR2(1),
    DAT_SIT_CHEQ     DATE,
    COD_BAT          VARCHAR2(10),
    COD_BUR          VARCHAR2(10),
    DAT_ENCAD        DATE,
    FONCT            VARCHAR2(1),
    ID_RENSEIGNEMENT_PERS NUMBER,
    COD_ETAB_DET     NUMBER(10,0),
    COD_ETAB_ORG     NUMBER(10,0),
    COD_SEC          VARCHAR2(20),
    COD_USER         VARCHAR2(10),
    CONSTRAINT CH4_RENSEIGNEMENT_PERS CHECK (POINTE_LIBRE IN ('O','N')),
    CONSTRAINT CH1_RENSEIGNEMENT_PERS CHECK (REG_POST IN ('0','1')),
    CONSTRAINT CH3_RENSEIGNEMENT_PERS CHECK (POINTE IN ('O','N')),
    CONSTRAINT PK_RENSEIGNEMENT_PERS PRIMARY KEY (COD_SOC, MAT_PERS),
    CONSTRAINT CH2_RENSEIGNEMET_PERS CHECK (ART40 IN ('O','N')),
    CONSTRAINT FK_RENSEIGNEMENT_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON COLUMN RENSEIGNEMENT_PERS.ANC_PERS IS 'Ancienneté en mois';
COMMENT ON COLUMN RENSEIGNEMENT_PERS.REGIME_TRAV IS 'Régime de travail: M=mensuel, H=horaire';
COMMENT ON COLUMN RENSEIGNEMENT_PERS.NOM_PERS_CNSS IS 'Nom de l''agent à la CNRPS';

-- ---------------------------------------------------------------------------
-- COMPTE_PERS: Comptes bancaires des agents
-- Structure unchanged
-- Note: FK to AGENCE kept but AGENCE table not in extracted scope
-- ---------------------------------------------------------------------------
CREATE TABLE COMPTE_PERS (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    COD_BANQ         VARCHAR2(4)  NOT NULL,
    COD_AGC          VARCHAR2(5)  NOT NULL,
    COD_TYP_BUL      VARCHAR2(4)  NOT NULL,
    CPT_BANQ_PERS    VARCHAR2(25) NOT NULL,      -- RIB
    ETAT_DOM         VARCHAR2(1) DEFAULT 'N',
    NUM_DOM          VARCHAR2(20),
    COMPT_COU        VARCHAR2(1),
    COD_BANQ_SOC     VARCHAR2(4),
    COD_AGC_SOC      VARCHAR2(5),
    ID_COMPTE_PERS   NUMBER,
    DAT_DOM          DATE,
    COD_USER         VARCHAR2(10),
    CONSTRAINT PK_COMPTE_PERS PRIMARY KEY (COD_SOC, MAT_PERS, COD_TYP_BUL, CPT_BANQ_PERS),
    CONSTRAINT UK_COMPTE_PERS UNIQUE (COD_SOC, MAT_PERS, COD_TYP_BUL),
    CONSTRAINT FK_COMPTE_PERS FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON COLUMN COMPTE_PERS.COD_BANQ IS 'Code banque';
COMMENT ON COLUMN COMPTE_PERS.CPT_BANQ_PERS IS 'RIB complet';
COMMENT ON COLUMN COMPTE_PERS.COD_TYP_BUL IS 'Type bulletin de paie';

-- ---------------------------------------------------------------------------
-- CONTRAT: Contrats de travail
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CONTRAT (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    NUM_CONTRAT      NUMBER       NOT NULL,
    COD_TYP          VARCHAR2(4)  NOT NULL,
    ETAT             VARCHAR2(1),
    NAT_CONTRAT      VARCHAR2(4),
    NUM_NUM_CONTRAT  NUMBER,
    DAT_CONTRAT      DATE NOT NULL,
    DAT_ECH          DATE,
    COD_MOTIF        VARCHAR2(4),
    COD_DEPT         VARCHAR2(4),
    COD_SERV         VARCHAR2(10),
    MNT_MENS         NUMBER(10,3),
    COD_EVA          VARCHAR2(4),
    DATE_EVA         DATE,
    COD_NIVEAU       VARCHAR2(5),
    VALID            VARCHAR2(1),
    DUREE            NUMBER(10,0),
    COD_FILL         VARCHAR2(10),
    NUM_ORD          NUMBER(10,0),
    DAT_EFF_CONTRAT  DATE,
    DAT_ORD          DATE,
    EDIT             VARCHAR2(1),
    DAT_CREATION     DATE,
    DAT_VALID        DATE,
    NOUV_MOTIF       VARCHAR2(4),
    DUREE_ESSAI      NUMBER(4,0),
    COD_AFFECT       VARCHAR2(4),
    NUM_MVT          NUMBER(6,0),
    COD_ALERT        VARCHAR2(4),
    SEQ_ALERT        NUMBER(10,0),
    NADM_TECH        VARCHAR2(10),
    NCOD_AFFECT      VARCHAR2(4),
    NCOD_SERV        VARCHAR2(10),
    NBR_PTS          NUMBER,
    COD_CAT          VARCHAR2(4),
    COD_GRAD         VARCHAR2(4),
    COD_CATEG        VARCHAR2(4),
    COD_ECH          NUMBER(2,0),
    NIV_SAL          NUMBER(4,0),
    DAT_RUPTURE      DATE,
    TYP_SALAIRE      VARCHAR2(1),
    NCOD_CATEG       VARCHAR2(4),
    NCOD_CAT         VARCHAR2(4),
    NCOD_GRAD        VARCHAR2(4),
    NCOD_ECH         NUMBER(2,0),
    NCOD_STAT        VARCHAR2(4),
    ID_CONTRAT       NUMBER,
    COD_USER         VARCHAR2(10),
    DAT_FIN_ESSAI    DATE,
    DAT_ECH_FIN      DATE,
    CONSTRAINT PK_CONTRAT PRIMARY KEY (COD_SOC, MAT_PERS, NUM_CONTRAT),
    CONSTRAINT FK_CONTRAT FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON COLUMN CONTRAT.COD_TYP IS 'Type contrat';
COMMENT ON COLUMN CONTRAT.DAT_CONTRAT IS 'Date début contrat';
COMMENT ON COLUMN CONTRAT.DAT_ECH IS 'Date fin contrat';
COMMENT ON COLUMN CONTRAT.TYP_SALAIRE IS 'N=salaire net, B=salaire de base';

-- ---------------------------------------------------------------------------
-- MOUVEMENT_PERS: Historique des mouvements de carrière
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE MOUVEMENT_PERS (
    COD_SOC          VARCHAR2(4)   NOT NULL,
    MAT_PERS         VARCHAR2(10)  NOT NULL,
    NUM_MVT          NUMBER(10,0)  NOT NULL,
    DAT_MVT          DATE,
    DAT_EFFET        DATE,
    DAT_DECISION     DATE,
    NUM_DECISION     VARCHAR2(20),
    ETAT_MVT         VARCHAR2(1),
    COD_MVT          VARCHAR2(4),
    COD_DEPT         VARCHAR2(4),
    COD_SERV         VARCHAR2(10),
    ORG_SERV         VARCHAR2(15),
    COD_LIEU_GEOG    VARCHAR2(4),
    QUALF            VARCHAR2(4),
    ADM_TECH         VARCHAR2(10),
    COD_CLASS        VARCHAR2(4),
    COD_FIL          VARCHAR2(4),
    COD_CATEG        VARCHAR2(4),
    COD_CAT          VARCHAR2(4),
    COD_GRAD         VARCHAR2(4),
    COD_ECH          VARCHAR2(4),
    COD_FONCT        VARCHAR2(4),
    COD_AFFECT       VARCHAR2(4),
    COD_MOTIF        VARCHAR2(4),
    COD_TYP_DEPART   VARCHAR2(4),
    COD_METIER       VARCHAR2(4),
    COD_POST         VARCHAR2(15),
    NIV_SAL          NUMBER(4,0),
    -- Nouvelles valeurs (après mouvement)
    NCOD_DEPT        VARCHAR2(4),
    NCOD_SERV        VARCHAR2(10),
    NORG_SERV        VARCHAR2(15),
    NCOD_LIEU_GEOG   VARCHAR2(4),
    NQUALF           VARCHAR2(4),
    NADM_TECH        VARCHAR2(10),
    NCOD_CLASS       VARCHAR2(4),
    NCOD_FIL         VARCHAR2(4),
    NCOD_CATEG       VARCHAR2(4),
    NCOD_CAT         VARCHAR2(4),
    NCOD_GRAD        VARCHAR2(4),
    NCOD_ECH         VARCHAR2(4),
    NCOD_FONCT       VARCHAR2(4),
    NCOD_AFFECT      VARCHAR2(4),
    NCOD_MOTIF       VARCHAR2(4),
    NCOD_TYP_DEPART  VARCHAR2(4),
    NCOD_METIER      VARCHAR2(4),
    NCOD_POST        VARCHAR2(15),
    NNIV_SAL         NUMBER(4,0),
    REF_MVT          VARCHAR2(1),
    ORDONNANCE       VARCHAR2(1) DEFAULT 'N',
    ETAT_ACT         VARCHAR2(1),
    VAL_PERS         VARCHAR2(1),
    REG_POST         VARCHAR2(4),
    NREG_POST        VARCHAR2(4),
    ID_MOUVEMENT_PERS NUMBER,
    CONSTRAINT PK_MOUVEMENT_PERS PRIMARY KEY (COD_SOC, MAT_PERS, NUM_MVT)
);

-- ---------------------------------------------------------------------------
-- AFFIL_PERS: Affiliations de l'agent (CNRPS, mutuelles, syndicats, etc.)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE AFFIL_PERS (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    COD_AFFIL        VARCHAR2(4),
    TYP_AFFIL        VARCHAR2(15),
    DAT_AFFIL        DATE,
    ID_AFFIL_PERS    NUMBER,
    DAT_FIN          DATE,
    NUM_AFFIL        VARCHAR2(20),
    COD_USER         VARCHAR2(10),
    CONSTRAINT PK_AFFIL_PERS PRIMARY KEY (COD_SOC, MAT_PERS, COD_AFFIL, TYP_AFFIL),
    CONSTRAINT FK_AFFIL_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS),
    CONSTRAINT FK_AFFIL_PERS1 FOREIGN KEY (TYP_AFFIL, COD_AFFIL)
        REFERENCES CODE_AFFILIATION (TYP_AFFIL, COD_AFFIL)
);

-- ---------------------------------------------------------------------------
-- ATTEST_TRAV: Attestations de travail
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE ATTEST_TRAV (
    ANNEE            NUMBER       NOT NULL,
    NUM_ATTEST       NUMBER       NOT NULL,
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    COD_SERV         VARCHAR2(6),
    COD_MOTIF        VARCHAR2(4),
    COD_CATEG        VARCHAR2(4),
    COD_CAT          VARCHAR2(4),
    COD_GRAD         VARCHAR2(4),
    COD_FONCT        VARCHAR2(4),
    QUALF            VARCHAR2(4),
    DATE_EDITION     DATE,
    MOTIF            VARCHAR2(100),
    AFFECTATION      VARCHAR2(100),
    EDIT             VARCHAR2(1) DEFAULT 'N',
    RESPONSABLE      VARCHAR2(100),
    MOTIF_A          VARCHAR2(100),
    AFFECTATION_A    VARCHAR2(100),
    RESPONSABLE_A    VARCHAR2(100),
    TYP_ATT          VARCHAR2(2)  NOT NULL,
    COD_USER         VARCHAR2(10),
    COD_AFF          VARCHAR2(4),
    TNET             NUMBER(15,3),
    ID_ATTEST_TRAV   NUMBER,
    DAT_DEM          DATE,
    NUM_DEC          VARCHAR2(10),
    DAT_DEC          DATE,
    NB_COEF          NUMBER(5,2),
    NBR_MOIS         NUMBER(2,0),
    DECOUV_DEM       NUMBER(15,3),
    CONSTRAINT PK_ATTEST_TRAV PRIMARY KEY (COD_SOC, MAT_PERS, ANNEE, NUM_ATTEST, TYP_ATT)
);

-- ---------------------------------------------------------------------------
-- CONSEIL_ADMINISTRATION: Conseil d'administration de l'établissement
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CONSEIL_ADMINISTRATION (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    REF_REG          VARCHAR2(40) NOT NULL,
    DAT_CONSEIL      DATE,
    MAT_PERS         VARCHAR2(10),
    ID_CONSEIL_ADMINISTRATION NUMBER,
    CONSTRAINT PK_CONSEIL_ADMINISTRATION PRIMARY KEY (COD_SOC, REF_REG),
    CONSTRAINT FK_CONSEIL_ADMINISTRATION FOREIGN KEY (COD_SOC)
        REFERENCES SOCIETE (COD_SOC)
);

-- ============================================================================
-- PART 6: MODULE CONGÉ ET POINTAGE (Leave & Attendance Management)
-- Added: Phase 2 - 2026-03-05
-- Tables: 26 tables (+ CYCLE_POINTAGE dependency)
-- Note: PERSONNEL, SOCIETE and RENSEIGNEMENT_PERS already defined in Phase 1
-- ============================================================================

-- ============================================================================
-- PART 6A: TABLES DE RÉFÉRENCE CONGÉ/POINTAGE (No FK to other Phase 2 tables)
-- ============================================================================

-- ---------------------------------------------------------------------------
-- TYP_CONGE: Types/groupes de congé et de pointage
-- Groups: C=Congé, P=Pointage, S=Sanction
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE TYP_CONGE (
    TYP_CNG          VARCHAR2(4)  NOT NULL,
    LIB_CNG          VARCHAR2(40),
    MOIS_DEBUT       VARCHAR2(5),
    MOIS_FIN         VARCHAR2(5),
    RESERVE          VARCHAR2(1),
    LIB_CNG_A        VARCHAR2(40),
    DROIT_CONGE      VARCHAR2(1),
    NAT_TYP_CNG      VARCHAR2(1),
    SOLD             VARCHAR2(1),
    CONSTRAINT PK_TYP_CONGE PRIMARY KEY (TYP_CNG)
);

COMMENT ON TABLE TYP_CONGE IS 'Types/groupes de congé et codes de pointage';
COMMENT ON COLUMN TYP_CONGE.TYP_CNG IS 'Code type de congé';
COMMENT ON COLUMN TYP_CONGE.LIB_CNG IS 'Libellé 1ère langue';
COMMENT ON COLUMN TYP_CONGE.LIB_CNG_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN TYP_CONGE.MOIS_DEBUT IS 'Début de cycle (JJ/MM)';
COMMENT ON COLUMN TYP_CONGE.MOIS_FIN IS 'Fin de cycle (JJ/MM)';
COMMENT ON COLUMN TYP_CONGE.RESERVE IS 'Réservé (O/N)';
COMMENT ON COLUMN TYP_CONGE.DROIT_CONGE IS 'M=Avec droit de congé';
COMMENT ON COLUMN TYP_CONGE.NAT_TYP_CNG IS 'Nature: C=congé, P=pointage, S=sanction';
COMMENT ON COLUMN TYP_CONGE.SOLD IS 'Répercussion sur solde congé (O/N)';

-- ---------------------------------------------------------------------------
-- REGIME_CONGE: Régimes de congé (droits annuels selon ancienneté)
-- Adapted: Rights per Tunisian public service law
-- ---------------------------------------------------------------------------
CREATE TABLE REGIME_CONGE (
    REG_CNG          VARCHAR2(4)  NOT NULL,
    LIB_REG_CNG      VARCHAR2(40),
    LIB_REG_CNG_A    VARCHAR2(40),
    TAUX_REG_CNG     NUMBER(6,1),
    TYP_PLAFOND      VARCHAR2(4),
    CONSTRAINT PK_REGIME_CONGE PRIMARY KEY (REG_CNG)
);

COMMENT ON TABLE REGIME_CONGE IS 'Régimes de congé annuel - droits selon ancienneté (fonction publique tunisienne)';
COMMENT ON COLUMN REGIME_CONGE.REG_CNG IS 'Code régime de congé';
COMMENT ON COLUMN REGIME_CONGE.LIB_REG_CNG IS 'Libellé 1ère langue';
COMMENT ON COLUMN REGIME_CONGE.LIB_REG_CNG_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN REGIME_CONGE.TAUX_REG_CNG IS 'Nombre de jours pour un cycle complet';
COMMENT ON COLUMN REGIME_CONGE.TYP_PLAFOND IS 'Type de plafond';

-- ---------------------------------------------------------------------------
-- CYCLE_CONGE: Cycles de congé (période de référence)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CYCLE_CONGE (
    COD_CYCL         VARCHAR2(4)  NOT NULL,
    DAT_DEBUT_CYCL   VARCHAR2(5),
    DAT_FIN_CYCL     VARCHAR2(5),
    CONSTRAINT PK_CYCLE_CONGE PRIMARY KEY (COD_CYCL)
);

COMMENT ON TABLE CYCLE_CONGE IS 'Cycles de congé (période de référence pour le calcul des droits)';
COMMENT ON COLUMN CYCLE_CONGE.COD_CYCL IS 'Code cycle';
COMMENT ON COLUMN CYCLE_CONGE.DAT_DEBUT_CYCL IS 'Date début du cycle (MM/JJ)';
COMMENT ON COLUMN CYCLE_CONGE.DAT_FIN_CYCL IS 'Date fin du cycle (MM/JJ)';

-- ---------------------------------------------------------------------------
-- CONDITION_CONGE: Conditions d'éligibilité au congé par régime
-- FK: REGIME_CONGE
-- ---------------------------------------------------------------------------
CREATE TABLE CONDITION_CONGE (
    COD_COND         VARCHAR2(4)  NOT NULL,
    LIB_COND         VARCHAR2(60),
    ANC_COND         NUMBER(4,0),
    REG_CNG          VARCHAR2(4)  NOT NULL,
    ID_CONDITION_CONGE NUMBER,
    CONSTRAINT PK_CONDITION_CONGE PRIMARY KEY (COD_COND, REG_CNG),
    CONSTRAINT FK_CONDITION_REG_CNG FOREIGN KEY (REG_CNG)
        REFERENCES REGIME_CONGE (REG_CNG)
);

COMMENT ON TABLE CONDITION_CONGE IS 'Conditions d''éligibilité au congé par régime (ancienneté requise)';
COMMENT ON COLUMN CONDITION_CONGE.COD_COND IS 'Code condition';
COMMENT ON COLUMN CONDITION_CONGE.LIB_COND IS 'Libellé condition';
COMMENT ON COLUMN CONDITION_CONGE.ANC_COND IS 'Ancienneté minimale requise (en années)';
COMMENT ON COLUMN CONDITION_CONGE.REG_CNG IS 'Régime de congé';

-- ---------------------------------------------------------------------------
-- CRITERE_CONGE: Critères dynamiques pour l'évaluation des conditions de congé
-- Moteur de règles: NOM_TABLE/NOM_COL permettent des critères paramétrables
-- FK: CONDITION_CONGE
-- ---------------------------------------------------------------------------
CREATE TABLE CRITERE_CONGE (
    REG_CNG          VARCHAR2(4)  NOT NULL,
    NOM_TABLE        VARCHAR2(40) NOT NULL,
    NOM_COL          VARCHAR2(40) NOT NULL,
    CONDITION_CRITERE VARCHAR2(40),
    VALEUR_CRITERE   VARCHAR2(200),
    ORDRE            NUMBER(4,0)  NOT NULL,
    OPERATOR         VARCHAR2(5),
    COD_COND         VARCHAR2(4)  NOT NULL,
    ID_CRITERE_CONGE NUMBER,
    CONSTRAINT PK_CRITERE_CONGE PRIMARY KEY (REG_CNG, COD_COND, NOM_TABLE, NOM_COL, ORDRE),
    CONSTRAINT FK_CRITERE_CONDITION FOREIGN KEY (COD_COND, REG_CNG)
        REFERENCES CONDITION_CONGE (COD_COND, REG_CNG)
);

COMMENT ON TABLE CRITERE_CONGE IS 'Critères dynamiques pour l''évaluation des conditions de congé';
COMMENT ON COLUMN CRITERE_CONGE.NOM_TABLE IS 'Nom de la table source du critère';
COMMENT ON COLUMN CRITERE_CONGE.NOM_COL IS 'Nom de la colonne à évaluer';
COMMENT ON COLUMN CRITERE_CONGE.CONDITION_CRITERE IS 'Opérateur de comparaison (EGAL, INFERIEUR, SUPERIEUR...)';
COMMENT ON COLUMN CRITERE_CONGE.VALEUR_CRITERE IS 'Valeur de référence à comparer';
COMMENT ON COLUMN CRITERE_CONGE.ORDRE IS 'Ordre d''évaluation du critère';
COMMENT ON COLUMN CRITERE_CONGE.OPERATOR IS 'Opérateur SQL (AND, OR)';

-- ---------------------------------------------------------------------------
-- CRITERE_CYCLE_CONGE: Critères dynamiques pour la détermination du cycle de congé
-- Même pattern que CRITERE_CONGE
-- FK: CYCLE_CONGE
-- ---------------------------------------------------------------------------
CREATE TABLE CRITERE_CYCLE_CONGE (
    COD_CYCL         VARCHAR2(4)  NOT NULL,
    NOM_TABLE        VARCHAR2(40) NOT NULL,
    NOM_COL          VARCHAR2(40) NOT NULL,
    CONDITION_CRITERE VARCHAR2(40) NOT NULL,
    VALEUR_CRITERE   VARCHAR2(200) NOT NULL,
    ORDRE            NUMBER(4,0)  NOT NULL,
    OPERATOR         VARCHAR2(5),
    ID_CRITERE_CYCLE_CONGE NUMBER,
    CONSTRAINT PK_CRITERE_CYCLE_CONGE PRIMARY KEY (COD_CYCL, NOM_TABLE, NOM_COL, CONDITION_CRITERE, VALEUR_CRITERE, ORDRE),
    CONSTRAINT FK_CRITERE_CYCLE FOREIGN KEY (COD_CYCL)
        REFERENCES CYCLE_CONGE (COD_CYCL)
);

COMMENT ON TABLE CRITERE_CYCLE_CONGE IS 'Critères dynamiques pour la détermination du cycle de congé';

-- ---------------------------------------------------------------------------
-- JOUR_SEMAINE: Jours de la semaine (référence universelle)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE JOUR_SEMAINE (
    NUM_JOUR         NUMBER(1,0)  NOT NULL,
    LIB_JOUR         VARCHAR2(20),
    CONSTRAINT PK_JOUR_SEMAINE PRIMARY KEY (NUM_JOUR)
);

COMMENT ON TABLE JOUR_SEMAINE IS 'Jours de la semaine';
COMMENT ON COLUMN JOUR_SEMAINE.NUM_JOUR IS 'Numéro du jour (1=Lundi ... 7=Dimanche)';
COMMENT ON COLUMN JOUR_SEMAINE.LIB_JOUR IS 'Libellé du jour';

-- ---------------------------------------------------------------------------
-- JOURS_FERIERS: Jours fériés (définition)
-- Adapted: Tunisian public holidays (fixed + Islamic)
-- Note: FK to PAR_FIXE (ABRV_FIXE) removed - table not in scope
-- ---------------------------------------------------------------------------
CREATE TABLE JOURS_FERIERS (
    COD_FERIE        NUMBER(2,0)  NOT NULL,
    REGIME_TRAV      VARCHAR2(1)  NOT NULL,
    LIB_FERIE        VARCHAR2(40),
    TYP_FERIE        VARCHAR2(1),
    COD_M            VARCHAR2(4),
    LIB_FERIE_A      VARCHAR2(40),
    RECUP_F          VARCHAR2(1),
    ABRV_FIXE        VARCHAR2(10),
    ID_JOURS_FERIERS NUMBER,
    CONSTRAINT PK_JOURS_FERIERS PRIMARY KEY (COD_FERIE, REGIME_TRAV)
);

COMMENT ON TABLE JOURS_FERIERS IS 'Jours fériés officiels de la République Tunisienne';
COMMENT ON COLUMN JOURS_FERIERS.COD_FERIE IS 'Code jour férié';
COMMENT ON COLUMN JOURS_FERIERS.REGIME_TRAV IS 'Régime: M=mensuel, H=horaire';
COMMENT ON COLUMN JOURS_FERIERS.LIB_FERIE IS 'Libellé en français';
COMMENT ON COLUMN JOURS_FERIERS.LIB_FERIE_A IS 'Libellé en arabe';
COMMENT ON COLUMN JOURS_FERIERS.TYP_FERIE IS 'Type: 1=fixe, 2=mobile (fêtes islamiques)';
COMMENT ON COLUMN JOURS_FERIERS.COD_M IS 'Code pointage correspondant';
COMMENT ON COLUMN JOURS_FERIERS.RECUP_F IS 'Récupérable (O/N)';

-- ---------------------------------------------------------------------------
-- DATE_FERIERS: Dates effectives des jours fériés par année
-- FK: Logiquement lié à JOURS_FERIERS (COD_FERIE)
-- ---------------------------------------------------------------------------
CREATE TABLE DATE_FERIERS (
    COD_FERIE        NUMBER(2,0)  NOT NULL,
    DAT_FERIE        DATE         NOT NULL,
    ID_DATE_FERIERS  NUMBER,
    CONSTRAINT PK_DATE_FERIERS PRIMARY KEY (COD_FERIE, DAT_FERIE)
);

COMMENT ON TABLE DATE_FERIERS IS 'Dates effectives des jours fériés par année';
COMMENT ON COLUMN DATE_FERIERS.COD_FERIE IS 'Code jour férié (réf. JOURS_FERIERS)';
COMMENT ON COLUMN DATE_FERIERS.DAT_FERIE IS 'Date effective du jour férié';

-- ---------------------------------------------------------------------------
-- TYP_AUTORISATION: Types d'autorisations de sortie
-- Adapted for public health sector
-- ---------------------------------------------------------------------------
CREATE TABLE TYP_AUTORISATION (
    COD_TYP_AUT      VARCHAR2(4)  NOT NULL,
    LIB_TYP_AUT      VARCHAR2(50),
    LIB_TYP_AUT_A    VARCHAR2(50),
    NAT_TYP_AUT      VARCHAR2(4),
    PLAF_PAY          NUMBER(2,0),
    CONSTRAINT PK_TYP_AUTORISATION PRIMARY KEY (COD_TYP_AUT)
);

COMMENT ON TABLE TYP_AUTORISATION IS 'Types d''autorisations de sortie et d''absence';
COMMENT ON COLUMN TYP_AUTORISATION.COD_TYP_AUT IS 'Code type autorisation';
COMMENT ON COLUMN TYP_AUTORISATION.LIB_TYP_AUT IS 'Libellé 1ère langue';
COMMENT ON COLUMN TYP_AUTORISATION.LIB_TYP_AUT_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN TYP_AUTORISATION.NAT_TYP_AUT IS 'O=payée, N=non payée';
COMMENT ON COLUMN TYP_AUTORISATION.PLAF_PAY IS 'Plafond en heures par mois';

-- ---------------------------------------------------------------------------
-- CYCLE_POINTAGE: Cycles de pointage (périodes de contrôle de présence)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CYCLE_POINTAGE (
    DAT_DEBUT        DATE         NOT NULL,
    DAT_FIN          DATE         NOT NULL,
    LIB_CYCLE        VARCHAR2(40),
    ID_CYCLE_POINTAGE NUMBER,
    CONSTRAINT PK_CYCLE_POINTAGE PRIMARY KEY (DAT_DEBUT, DAT_FIN)
);

COMMENT ON TABLE CYCLE_POINTAGE IS 'Cycles de pointage (périodes temporaires de régime spécial, ex: allaitement)';
COMMENT ON COLUMN CYCLE_POINTAGE.DAT_DEBUT IS 'Date début du cycle';
COMMENT ON COLUMN CYCLE_POINTAGE.DAT_FIN IS 'Date fin du cycle';
COMMENT ON COLUMN CYCLE_POINTAGE.LIB_CYCLE IS 'Libellé du cycle';

-- ---------------------------------------------------------------------------
-- CARTE_POINT: Cartes de pointage (badges)
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CARTE_POINT (
    N_CARTE          NUMBER(10,0) NOT NULL,
    ETAT_CARTE       VARCHAR2(1)  NOT NULL,
    COD_SOC          VARCHAR2(4)  NOT NULL,
    BORNE_INF        NUMBER(10,0),
    BORNE_SUP        NUMBER(10,0),
    ID_CARTE_POINT   NUMBER,
    CONSTRAINT PK_CARTE_POINT PRIMARY KEY (N_CARTE, COD_SOC),
    CONSTRAINT CK_CARTE_POINTE CHECK (N_CARTE = LPAD(N_CARTE, 4, '0'))
);

COMMENT ON TABLE CARTE_POINT IS 'Cartes/badges de pointage';
COMMENT ON COLUMN CARTE_POINT.N_CARTE IS 'Numéro de carte (matricule badge)';
COMMENT ON COLUMN CARTE_POINT.ETAT_CARTE IS 'État: A=affecté, L=libre';
COMMENT ON COLUMN CARTE_POINT.COD_SOC IS 'Code société/établissement';
COMMENT ON COLUMN CARTE_POINT.BORNE_INF IS 'Matricule début (plage)';
COMMENT ON COLUMN CARTE_POINT.BORNE_SUP IS 'Matricule fin (plage)';

-- ============================================================================
-- PART 6B: TABLES LIÉES À SOCIETE (Régimes, Shifts, Calendrier)
-- ============================================================================

-- ---------------------------------------------------------------------------
-- REGIME: Régimes de pointage/travail
-- Adapted: Specific regimes for health sector (hospital 24/7, admin, etc.)
-- FK: SOCIETE
-- ---------------------------------------------------------------------------
CREATE TABLE REGIME (
    COD_REG          VARCHAR2(4)  NOT NULL,
    LIB_REGIME       VARCHAR2(40),
    TAUX_SAL         NUMBER(5,2),
    LIB_REGIME_A     VARCHAR2(40),
    TYPE             VARCHAR2(1),
    COD_SOC          VARCHAR2(4)  NOT NULL,
    NAT_REG          VARCHAR2(1),
    TYP_REG          VARCHAR2(1),
    TOL_ENTREE       NUMBER(4,0),
    TOL_SORTIE       NUMBER(4,0),
    TOL_HS_ENTREE    NUMBER(4,0),
    TOL_HS_SORTIE    NUMBER(4,0),
    ID_REGIME        NUMBER,
    CONSTRAINT PK_REGIME PRIMARY KEY (COD_REG, COD_SOC),
    CONSTRAINT FK_REGIME_SOCIETE FOREIGN KEY (COD_SOC)
        REFERENCES SOCIETE (COD_SOC)
);

COMMENT ON TABLE REGIME IS 'Régimes de pointage et de travail';
COMMENT ON COLUMN REGIME.COD_REG IS 'Code régime';
COMMENT ON COLUMN REGIME.LIB_REGIME IS 'Libellé';
COMMENT ON COLUMN REGIME.LIB_REGIME_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN REGIME.TYPE IS 'S=Entrée et sortie le même jour';
COMMENT ON COLUMN REGIME.NAT_REG IS 'N=séance normale, P=permanence';
COMMENT ON COLUMN REGIME.TYP_REG IS 'P=principal, O=occasionnel';
COMMENT ON COLUMN REGIME.TOL_ENTREE IS 'Tolérance entrée (minutes)';
COMMENT ON COLUMN REGIME.TOL_SORTIE IS 'Tolérance sortie (minutes)';

-- ---------------------------------------------------------------------------
-- REGIME_REGIME: Liens entre régimes et cycles de pointage
-- Permet d'appliquer un régime temporaire (ex: allaitement)
-- FK: CYCLE_POINTAGE
-- ---------------------------------------------------------------------------
CREATE TABLE REGIME_REGIME (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    COD_REG          VARCHAR2(4)  NOT NULL,
    REG_COD_REG      VARCHAR2(4)  NOT NULL,
    DAT_DEBUT        DATE         NOT NULL,
    DAT_FIN          DATE         NOT NULL,
    ID_REGIME_REGIME NUMBER,
    CONSTRAINT PK_REGIME_REGIME PRIMARY KEY (COD_SOC, COD_REG, REG_COD_REG, DAT_DEBUT, DAT_FIN),
    CONSTRAINT FK_REGIME_REGIME_CYCLE FOREIGN KEY (DAT_DEBUT, DAT_FIN)
        REFERENCES CYCLE_POINTAGE (DAT_DEBUT, DAT_FIN)
);

COMMENT ON TABLE REGIME_REGIME IS 'Liens entre régimes permanents et cycles temporaires de pointage';
COMMENT ON COLUMN REGIME_REGIME.COD_REG IS 'Régime actuel';
COMMENT ON COLUMN REGIME_REGIME.REG_COD_REG IS 'Régime cible (temporaire)';
COMMENT ON COLUMN REGIME_REGIME.DAT_DEBUT IS 'Date début du cycle';
COMMENT ON COLUMN REGIME_REGIME.DAT_FIN IS 'Date fin du cycle';

-- ---------------------------------------------------------------------------
-- SHIF: Définition des shifts/séances de travail
-- Adapted: Health sector shifts (matin, soir, nuit, garde 24h)
-- FK: SOCIETE
-- ---------------------------------------------------------------------------
CREATE TABLE SHIF (
    COD_SHIFT        VARCHAR2(4)  NOT NULL,
    MARG_SHIFT       VARCHAR2(4),
    LIB_SHIFT        VARCHAR2(40) NOT NULL,
    ABR_SHIFT        VARCHAR2(10),
    PAUSE_SHIFT      NUMBER(3,0),
    H_ENTREE         NUMBER(2,0),
    M_ENTREE         NUMBER(2,0),
    H_SORTIE         NUMBER(2,0),
    M_SORTIE         NUMBER(2,0),
    TYPE             VARCHAR2(1),
    PLAGE_A_E        NUMBER,
    PLAGE_A_S        NUMBER,
    PLAGE_AP_S       NUMBER,
    PLAGE_AP_E       NUMBER,
    LIB_SHIFT_A      VARCHAR2(40),
    TYP_REG          VARCHAR2(1),
    COD_SOC          VARCHAR2(4)  NOT NULL,
    ID_SHIF          NUMBER,
    TYPE_SHIF        VARCHAR2(1)  DEFAULT 'S',
    PLAGE_A_E_C      NUMBER       DEFAULT 0,
    PLAGE_A_S_C      NUMBER       DEFAULT 0,
    PLAGE_AP_S_C     NUMBER       DEFAULT 0,
    PLAGE_AP_E_C     NUMBER       DEFAULT 0,
    CONSTRAINT PK_SHIF PRIMARY KEY (COD_SHIFT, COD_SOC),
    CONSTRAINT FK_SHIF_SOCIETE FOREIGN KEY (COD_SOC)
        REFERENCES SOCIETE (COD_SOC)
);

COMMENT ON TABLE SHIF IS 'Définition des shifts/séances de travail';
COMMENT ON COLUMN SHIF.COD_SHIFT IS 'Code shift';
COMMENT ON COLUMN SHIF.LIB_SHIFT IS 'Libellé 1ère langue';
COMMENT ON COLUMN SHIF.LIB_SHIFT_A IS 'Libellé 2ème langue (arabe)';
COMMENT ON COLUMN SHIF.PAUSE_SHIFT IS 'Durée pause (minutes)';
COMMENT ON COLUMN SHIF.H_ENTREE IS 'Heure d''entrée';
COMMENT ON COLUMN SHIF.M_ENTREE IS 'Minute d''entrée';
COMMENT ON COLUMN SHIF.H_SORTIE IS 'Heure de sortie';
COMMENT ON COLUMN SHIF.M_SORTIE IS 'Minute de sortie';
COMMENT ON COLUMN SHIF.PLAGE_A_E IS 'Plage avant entrée (tolérance en minutes)';
COMMENT ON COLUMN SHIF.PLAGE_A_S IS 'Plage avant sortie (tolérance en minutes)';
COMMENT ON COLUMN SHIF.PLAGE_AP_S IS 'Plage après sortie';
COMMENT ON COLUMN SHIF.PLAGE_AP_E IS 'Plage après entrée';
COMMENT ON COLUMN SHIF.TYPE_SHIF IS 'Type shift: S=standard';

-- ---------------------------------------------------------------------------
-- SHIFT_REG: Association shift-régime par jour de semaine
-- Définit quel shift s'applique pour chaque jour dans un régime
-- FK: SHIF
-- ---------------------------------------------------------------------------
CREATE TABLE SHIFT_REG (
    COD_REG          VARCHAR2(4)  NOT NULL,
    COD_SHIFT        VARCHAR2(4)  NOT NULL,
    BASE_H           NUMBER(2,0),
    BASE_M           NUMBER(2,0),
    JOURS_SEM        NUMBER(1,0)  NOT NULL,
    TYPE             VARCHAR2(1),
    PAUSE            NUMBER(4,2),
    MARGE            NUMBER(4,2),
    COD_SOC          VARCHAR2(4)  NOT NULL,
    ID_SHIFT_REG     NUMBER,
    CONSTRAINT PK_SHIFT_REG PRIMARY KEY (COD_REG, COD_SHIFT, JOURS_SEM, COD_SOC),
    CONSTRAINT FK_SHIFT_REG_SHIF FOREIGN KEY (COD_SHIFT, COD_SOC)
        REFERENCES SHIF (COD_SHIFT, COD_SOC)
);

COMMENT ON TABLE SHIFT_REG IS 'Association shift-régime par jour de la semaine';
COMMENT ON COLUMN SHIFT_REG.COD_REG IS 'Code régime';
COMMENT ON COLUMN SHIFT_REG.COD_SHIFT IS 'Code shift';
COMMENT ON COLUMN SHIFT_REG.BASE_H IS 'Nombre d''heures de base';
COMMENT ON COLUMN SHIFT_REG.BASE_M IS 'Nombre de minutes de base';
COMMENT ON COLUMN SHIFT_REG.JOURS_SEM IS 'Jour de la semaine (1=Lun...7=Dim)';
COMMENT ON COLUMN SHIFT_REG.TYPE IS 'Type: 3=séance unique, M=matin, S=soir';
COMMENT ON COLUMN SHIFT_REG.COD_SOC IS 'Code société/établissement';

-- ---------------------------------------------------------------------------
-- CALANDRIER: Calendrier journalier par société/année
-- Structure unchanged
-- ---------------------------------------------------------------------------
CREATE TABLE CALANDRIER (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    AN               NUMBER(4,0)  NOT NULL,
    MO               NUMBER(2,0)  NOT NULL,
    JS               NUMBER(2,0)  NOT NULL,
    COD_FERIE        NUMBER(4,0),
    LIB_J            VARCHAR2(15),
    LIB_MO           VARCHAR2(15),
    JSEM             NUMBER(1,0),
    FERIER           VARCHAR2(4),
    SEMAIN           NUMBER(2,0),
    SEANCE           NUMBER(1,0),
    LIB_J_A          VARCHAR2(15),
    LIB_MO_A         VARCHAR2(15),
    ID_CALANDRIER    NUMBER,
    CONSTRAINT PK_CALANDRIER PRIMARY KEY (COD_SOC, AN, MO, JS)
);

COMMENT ON TABLE CALANDRIER IS 'Calendrier journalier par société/établissement et année';
COMMENT ON COLUMN CALANDRIER.COD_SOC IS 'Code société/établissement';
COMMENT ON COLUMN CALANDRIER.AN IS 'Année';
COMMENT ON COLUMN CALANDRIER.MO IS 'Mois';
COMMENT ON COLUMN CALANDRIER.JS IS 'Jour';
COMMENT ON COLUMN CALANDRIER.COD_FERIE IS 'Code jour férié (si applicable)';
COMMENT ON COLUMN CALANDRIER.FERIER IS 'P=jour ouvrable, R1=repos hebdomadaire, R3=jour férié';
COMMENT ON COLUMN CALANDRIER.JSEM IS 'Jour de la semaine (1-7)';
COMMENT ON COLUMN CALANDRIER.SEMAIN IS 'Numéro de la semaine';
COMMENT ON COLUMN CALANDRIER.LIB_J IS 'Libellé jour';
COMMENT ON COLUMN CALANDRIER.LIB_MO IS 'Libellé mois';

-- ============================================================================
-- PART 6C: MOTIFS ET JUSTIFICATIFS DE CONGÉ
-- ============================================================================

-- ---------------------------------------------------------------------------
-- MOTIF_J: Motifs d'absence / codes de pointage
-- Table centrale du module congé - définit toutes les règles par motif
-- FK: TYP_CONGE
-- ---------------------------------------------------------------------------
CREATE TABLE MOTIF_J (
    COD_M            VARCHAR2(4)  NOT NULL,
    TYP_CNG          VARCHAR2(4),
    ABRV_FIXE        VARCHAR2(10),
    LIB_MOT          VARCHAR2(60),
    ABRV_MOT         VARCHAR2(10),
    DED_SAL          VARCHAR2(1),
    DED_CNG          VARCHAR2(1),
    PLAFOND_CNG      NUMBER(5,0),
    TYP_PLAFOND      VARCHAR2(1),
    FREQUENCE        NUMBER(4,0),
    UNITE            VARCHAR2(1),
    ABATEMENT        VARCHAR2(2),
    JOUR             VARCHAR2(1),
    LIM_DEM_CNG      NUMBER(4,0),
    UNIT_PLAF        VARCHAR2(1),
    PLAFOND_CNG_DEMI NUMBER(5,0),
    PLAFOND_CNG_SOLD NUMBER(5,0),
    PLAFOND_DECE     VARCHAR2(1),
    ORD_REND         NUMBER(2,0),
    RESERVE          VARCHAR2(1),
    PLAFOND_ABAT     NUMBER(10,0),
    MOIS_DEBUT       VARCHAR2(5),
    MOIS_FIN         VARCHAR2(5),
    PLAFOND_BONUS    NUMBER(10,2),
    LIB_MOT_A        VARCHAR2(40),
    ABRV_MOT_A       VARCHAR2(10),
    DED_CNR          NUMBER(3,0),
    NATURE_CNG       VARCHAR2(1),
    CORRES_COD_M     VARCHAR2(10),
    MOTIF_POINT      VARCHAR2(2),
    TYPE_ABS         VARCHAR2(4),
    CORRES_PERS      VARCHAR2(2),
    NAT_CNG          VARCHAR2(1),
    MOTIF_CHEV_POINT VARCHAR2(1),
    NBR_JOUR_MIN     NUMBER(5,2),
    CUMUL_HSUP48     VARCHAR2(1),
    DED_ANCIENNETE   VARCHAR2(1),
    UNITE_POINT      VARCHAR2(2),
    COEF_POINT       NUMBER(1,0),
    COD_SIT          VARCHAR2(1),
    SEXE             VARCHAR2(1),
    DED_TICKET       VARCHAR2(1),
    FRANCH_TICKET    VARCHAR2(6),
    COD_ALERT        VARCHAR2(4),
    ABAT_PSPES       VARCHAR2(1),
    NUM_DEC          NUMBER,
    ENFANT           VARCHAR2(1),
    NUM_DEC_REP      NUMBER,
    CONSTRAINT PK_MOTIF_J PRIMARY KEY (COD_M),
    CONSTRAINT FK_MOTIF_J_TYP_CONGE FOREIGN KEY (TYP_CNG)
        REFERENCES TYP_CONGE (TYP_CNG),
    CONSTRAINT CK_MOTIF_J_UNITE CHECK (UNITE IN ('C','A','S','N')),
    CONSTRAINT CK_MOTIF_J_DED_ANC CHECK (DED_ANCIENNETE IN ('O','N'))
);

COMMENT ON TABLE MOTIF_J IS 'Motifs d''absence et codes de pointage - table centrale du module congé';
COMMENT ON COLUMN MOTIF_J.COD_M IS 'Code pointage/motif';
COMMENT ON COLUMN MOTIF_J.TYP_CNG IS 'Type de congé (réf. TYP_CONGE)';
COMMENT ON COLUMN MOTIF_J.LIB_MOT IS 'Libellé du motif 1ère langue';
COMMENT ON COLUMN MOTIF_J.LIB_MOT_A IS 'Libellé du motif 2ème langue (arabe)';
COMMENT ON COLUMN MOTIF_J.ABRV_MOT IS 'Abréviation 1ère langue';
COMMENT ON COLUMN MOTIF_J.ABRV_MOT_A IS 'Abréviation 2ème langue (arabe)';
COMMENT ON COLUMN MOTIF_J.DED_SAL IS 'Incidence sur salaire (O=déduction, N=pas de déduction)';
COMMENT ON COLUMN MOTIF_J.DED_CNG IS 'Incidence sur congé annuel (O=déduit du solde, N=non)';
COMMENT ON COLUMN MOTIF_J.PLAFOND_CNG IS 'Plafond en nombre de jours';
COMMENT ON COLUMN MOTIF_J.TYP_PLAFOND IS 'Unité du plafond: heure, jour, carrière';
COMMENT ON COLUMN MOTIF_J.FREQUENCE IS 'Fréquence du droit';
COMMENT ON COLUMN MOTIF_J.UNITE IS 'Unité: C=carrière, A=annuel, S=semestriel, N=illimité';
COMMENT ON COLUMN MOTIF_J.JOUR IS 'Calcul: O=jours ouvrables, C=jours calendaires';
COMMENT ON COLUMN MOTIF_J.PLAFOND_CNG_DEMI IS 'Plafond maladie demi-traitement (jours)';
COMMENT ON COLUMN MOTIF_J.PLAFOND_CNG_SOLD IS 'Plafond maladie sans solde (jours)';
COMMENT ON COLUMN MOTIF_J.NAT_CNG IS 'Nature: A=permission, C=congé';
COMMENT ON COLUMN MOTIF_J.DED_ANCIENNETE IS 'Considéré dans l''ancienneté (O/N)';
COMMENT ON COLUMN MOTIF_J.SEXE IS 'Restriction par sexe (F=féminin, pour maternité)';
COMMENT ON COLUMN MOTIF_J.TYPE_ABS IS 'T=Acc. travail, P=Maladie prof., A=Autre';
COMMENT ON COLUMN MOTIF_J.MOTIF_CHEV_POINT IS 'Permet chevauchement avec pointage (O/N)';
COMMENT ON COLUMN MOTIF_J.NBR_JOUR_MIN IS 'Nombre minimum de jours par demande';
COMMENT ON COLUMN MOTIF_J.PLAFOND_BONUS IS 'Nombre de jours bonus par code de pointage';
COMMENT ON COLUMN MOTIF_J.LIM_DEM_CNG IS 'Délai minimum de demande avant date début (jours)';
COMMENT ON COLUMN MOTIF_J.NUM_DEC IS 'Référence au numéro de décision';

-- ---------------------------------------------------------------------------
-- JUSTIF_MOTIF: Justificatifs requis par motif d'absence
-- FK: MOTIF_J
-- ---------------------------------------------------------------------------
CREATE TABLE JUSTIF_MOTIF (
    COD_JUSTIF       VARCHAR2(4)  NOT NULL,
    COD_M            VARCHAR2(4)  NOT NULL,
    OBSERV_JUSTIF    VARCHAR2(40),
    TYP_CONTROL      VARCHAR2(1),
    LIMIT_CONTROL    NUMBER(4,0),
    OBSERV_JUSTIF_A  VARCHAR2(40),
    ID_JUSTIF_MOTIF  NUMBER,
    CONSTRAINT PK_JUSTIF_MOTIF PRIMARY KEY (COD_M, COD_JUSTIF),
    CONSTRAINT FK_JUSTIF_MOTIF FOREIGN KEY (COD_M)
        REFERENCES MOTIF_J (COD_M)
);

COMMENT ON TABLE JUSTIF_MOTIF IS 'Justificatifs requis par motif d''absence';
COMMENT ON COLUMN JUSTIF_MOTIF.COD_JUSTIF IS 'Code justificatif';
COMMENT ON COLUMN JUSTIF_MOTIF.COD_M IS 'Code motif/pointage';
COMMENT ON COLUMN JUSTIF_MOTIF.OBSERV_JUSTIF IS 'Description du justificatif';
COMMENT ON COLUMN JUSTIF_MOTIF.OBSERV_JUSTIF_A IS 'Description 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- PLAF_MOTIF_CNG: Plafonds de congé par motif, statut et ancienneté
-- Gère les paliers: plein traitement, demi-traitement, sans solde
-- FK: MOTIF_J
-- ---------------------------------------------------------------------------
CREATE TABLE PLAF_MOTIF_CNG (
    COD_M            VARCHAR2(4)  NOT NULL,
    COD_AFFECT       VARCHAR2(4)  NOT NULL,
    ANCIEN_MIN       NUMBER(5,0)  NOT NULL,
    ANCIEN_MAX       NUMBER(5,0),
    PLAF_PT          NUMBER(5,0),
    PLAF_T50         NUMBER(5,0),
    PLAF_T100        NUMBER(5,0),
    UNIT_PLAF        VARCHAR2(1),
    ID_PLAF_MOTIF_CNG NUMBER,
    CONSTRAINT PK_PLAF_MOTIF_CNG PRIMARY KEY (COD_M, COD_AFFECT, ANCIEN_MIN),
    CONSTRAINT FK_PLAF_MOTIF_CNG FOREIGN KEY (COD_M)
        REFERENCES MOTIF_J (COD_M)
);

COMMENT ON TABLE PLAF_MOTIF_CNG IS 'Plafonds de congé maladie par motif, statut et ancienneté';
COMMENT ON COLUMN PLAF_MOTIF_CNG.COD_M IS 'Code motif d''absence';
COMMENT ON COLUMN PLAF_MOTIF_CNG.COD_AFFECT IS 'Statut administratif (réf. AFFECTATION)';
COMMENT ON COLUMN PLAF_MOTIF_CNG.ANCIEN_MIN IS 'Ancienneté minimale (mois)';
COMMENT ON COLUMN PLAF_MOTIF_CNG.ANCIEN_MAX IS 'Ancienneté maximale (mois)';
COMMENT ON COLUMN PLAF_MOTIF_CNG.PLAF_PT IS 'Plafond plein traitement (jours)';
COMMENT ON COLUMN PLAF_MOTIF_CNG.PLAF_T50 IS 'Plafond demi-traitement (jours)';
COMMENT ON COLUMN PLAF_MOTIF_CNG.PLAF_T100 IS 'Plafond sans solde (jours)';
COMMENT ON COLUMN PLAF_MOTIF_CNG.UNIT_PLAF IS 'Unité: I=illimité, C=carrière, A=annuel, Y=cyclique';

-- ============================================================================
-- PART 6D: GESTION DES SOLDES ET PLANNING DE CONGÉ
-- ============================================================================

-- ---------------------------------------------------------------------------
-- SOLD_CNG: Solde de congé par agent, année et type
-- FK: PERSONNEL, TYP_CONGE
-- ---------------------------------------------------------------------------
CREATE TABLE SOLD_CNG (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    ANNEE_CNG        NUMBER(4,0)  NOT NULL,
    TYP_CNG          VARCHAR2(4)  NOT NULL,
    INIT_CNG         NUMBER(6,3),
    CUM_CNG          NUMBER(6,3),
    PRIS_CNG         NUMBER(7,3),
    FREQUENCE        NUMBER(4,0),
    OBS_CNG          VARCHAR2(80),
    SEM_CNG          VARCHAR2(1),
    SOLD_CNG         NUMBER(7,3),
    CUM_CNG_ANN_1   NUMBER(7,3),
    CNG_NJUSTIF      NUMBER(2,0),
    CNG_JUSTIF       NUMBER(2,0),
    NOT_1_PRIS       VARCHAR2(1),
    NOT_2_PRIS       VARCHAR2(1),
    BONUS_CNG        NUMBER(6,3),
    OBS_CNG_A        VARCHAR2(80),
    SOLD_3112        NUMBER(7,2),
    BRUT_3112        NUMBER(10,3),
    SERV_3112        VARCHAR2(10),
    RECUP_CNG        NUMBER(6,3),
    CHARG_3112       NUMBER(10,3),
    NBR_HEURS_PRIS   NUMBER,
    NBR_HEURS_INIT   NUMBER,
    NBR_HEURS_SOLD   NUMBER,
    VALID_DROIT      VARCHAR2(1)  DEFAULT 'N',
    CNG_PAYE         NUMBER(7,3),
    ID_SOLD_CNG      NUMBER,
    CONSTRAINT PK_SOLD_CNG PRIMARY KEY (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG),
    CONSTRAINT FK_SOLD_CNG_TYP_CONGE FOREIGN KEY (TYP_CNG)
        REFERENCES TYP_CONGE (TYP_CNG),
    CONSTRAINT FK_SOLD_CNG_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE SOLD_CNG IS 'Solde de congé par agent, année et type de congé';
COMMENT ON COLUMN SOLD_CNG.INIT_CNG IS 'Reliquat des cycles précédents';
COMMENT ON COLUMN SOLD_CNG.CUM_CNG IS 'Droit de l''année en cours';
COMMENT ON COLUMN SOLD_CNG.PRIS_CNG IS 'Nombre de jours pris';
COMMENT ON COLUMN SOLD_CNG.SOLD_CNG IS 'Solde restant';
COMMENT ON COLUMN SOLD_CNG.CUM_CNG_ANN_1 IS 'Reliquat cycle précédent';
COMMENT ON COLUMN SOLD_CNG.BONUS_CNG IS 'Jours bonus';
COMMENT ON COLUMN SOLD_CNG.SOLD_3112 IS 'Solde au 31/12 (provision congé)';
COMMENT ON COLUMN SOLD_CNG.BRUT_3112 IS 'Brut au 31/12 (calcul provision)';
COMMENT ON COLUMN SOLD_CNG.RECUP_CNG IS 'Jours récupérés (au-delà du plafond)';
COMMENT ON COLUMN SOLD_CNG.VALID_DROIT IS 'O=validé, N=en instance';

-- ---------------------------------------------------------------------------
-- PLANING_CNG: Planning prévisionnel de congé
-- FK: PERSONNEL, TYP_CONGE
-- ---------------------------------------------------------------------------
CREATE TABLE PLANING_CNG (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    ANNEE_CNG        NUMBER(4,0)  NOT NULL,
    TYP_CNG          VARCHAR2(4)  NOT NULL,
    AVANCE_CNG       NUMBER(6,3),
    INIT_CNG         NUMBER(6,3),
    CUM_CNG          NUMBER(6,3),
    CNG_PRIS         NUMBER(6,3),
    CATEG            VARCHAR2(4),
    CAT              VARCHAR2(4),
    GRAD             VARCHAR2(4),
    DEPT             VARCHAR2(4),
    SERV             VARCHAR2(10),
    CUM_CNG_ANN_1   NUMBER(6,3),
    BONUS_CNG        NUMBER(6,3),
    SOLD_CNG         NUMBER(6,3),
    ID_PLANING_CNG   NUMBER,
    ETAT_PLANING     VARCHAR2(2)  DEFAULT 'I',
    DAT_DEBUT        DATE,
    CONSTRAINT PK_PLANING_CNG PRIMARY KEY (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG),
    CONSTRAINT FK_PLANING_CNG_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS),
    CONSTRAINT FK_PLANING_CNG_TYP_CONGE FOREIGN KEY (TYP_CNG)
        REFERENCES TYP_CONGE (TYP_CNG)
);

COMMENT ON TABLE PLANING_CNG IS 'Planning prévisionnel de congé par agent';
COMMENT ON COLUMN PLANING_CNG.ETAT_PLANING IS 'I=en instance, V=validé, E=exécuté';
COMMENT ON COLUMN PLANING_CNG.INIT_CNG IS 'Reliquat année précédente';
COMMENT ON COLUMN PLANING_CNG.CUM_CNG IS 'Droit de l''année';
COMMENT ON COLUMN PLANING_CNG.CNG_PRIS IS 'Congé pris';
COMMENT ON COLUMN PLANING_CNG.SOLD_CNG IS 'Solde restant';
COMMENT ON COLUMN PLANING_CNG.CATEG IS 'Catégorie au moment du planning';
COMMENT ON COLUMN PLANING_CNG.SERV IS 'Affectation';

-- ---------------------------------------------------------------------------
-- DETAIL_PLANING_CNG: Détail du planning de congé (périodes)
-- FK: PLANING_CNG
-- ---------------------------------------------------------------------------
CREATE TABLE DETAIL_PLANING_CNG (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    ANNEE_CNG        NUMBER(4,0)  NOT NULL,
    TYP_CNG          VARCHAR2(4)  NOT NULL,
    DATE_DEBUT       DATE         NOT NULL,
    DATE_FIN         DATE         NOT NULL,
    NBR_JOURS        NUMBER(6,3),
    NBR_JOURS_CAL    NUMBER(6,3),
    MAT_PERS_INT     VARCHAR2(10),
    OBS              VARCHAR2(100),
    OBS_A            VARCHAR2(100),
    ID_DETAIL_PLANING_CNG NUMBER,
    NUM_DCNG         NUMBER(8,0),
    CONSTRAINT PK_DETAIL_PLANING_CNG PRIMARY KEY (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG, DATE_DEBUT),
    CONSTRAINT FK_DETAIL_PLANING_PLANING FOREIGN KEY (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG)
        REFERENCES PLANING_CNG (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG)
);

COMMENT ON TABLE DETAIL_PLANING_CNG IS 'Périodes détaillées du planning prévisionnel de congé';
COMMENT ON COLUMN DETAIL_PLANING_CNG.DATE_DEBUT IS 'Date début de la période';
COMMENT ON COLUMN DETAIL_PLANING_CNG.DATE_FIN IS 'Date fin de la période';
COMMENT ON COLUMN DETAIL_PLANING_CNG.NBR_JOURS IS 'Nombre de jours ouvrables';
COMMENT ON COLUMN DETAIL_PLANING_CNG.NBR_JOURS_CAL IS 'Nombre de jours calendaires';
COMMENT ON COLUMN DETAIL_PLANING_CNG.MAT_PERS_INT IS 'Matricule intérimaire';

-- ---------------------------------------------------------------------------
-- VERIF_PLANING_CNG: Vérification et erreurs du planning de congé
-- FK: PLANING_CNG
-- ---------------------------------------------------------------------------
CREATE TABLE VERIF_PLANING_CNG (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    ANNEE_CNG        NUMBER(4,0)  NOT NULL,
    TYP_CNG          VARCHAR2(4)  NOT NULL,
    DATE_DEBUT       DATE         NOT NULL,
    DATE_FIN         DATE         NOT NULL,
    TYP_ERROR        VARCHAR2(2),
    LIB_ERROR        VARCHAR2(100),
    LIB_ERROR_A      VARCHAR2(100),
    ID_VERIF_PLANING_CNG NUMBER,
    CONSTRAINT PK_VERIF_PLANING_CNG PRIMARY KEY (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG, DATE_DEBUT),
    CONSTRAINT FK_VERIF_PLANING_PLANING FOREIGN KEY (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG)
        REFERENCES PLANING_CNG (COD_SOC, MAT_PERS, ANNEE_CNG, TYP_CNG)
);

COMMENT ON TABLE VERIF_PLANING_CNG IS 'Vérification et erreurs du planning de congé';
COMMENT ON COLUMN VERIF_PLANING_CNG.TYP_ERROR IS 'Type erreur (chevauchement, pas d''intérim, etc.)';
COMMENT ON COLUMN VERIF_PLANING_CNG.LIB_ERROR IS 'Libellé de l''erreur';
COMMENT ON COLUMN VERIF_PLANING_CNG.LIB_ERROR_A IS 'Libellé erreur 2ème langue (arabe)';

-- ---------------------------------------------------------------------------
-- RECUP_SOLD_CNG: Demandes de récupération de solde de congé
-- FK: PERSONNEL
-- ---------------------------------------------------------------------------
CREATE TABLE RECUP_SOLD_CNG (
    COD_SOC          VARCHAR2(4),
    MAT_PERS         VARCHAR2(10),
    ANNEE_CNG        NUMBER(4,0),
    NUM_DEM          NUMBER,
    DAT_DEM          DATE,
    NBR_JOUR_DEM     NUMBER(7,3),
    ETAT_DEM         VARCHAR2(4),
    DAT_ETAT_DEM     DATE,
    OBS_DEM          VARCHAR2(200),
    NBR_JOUR         NUMBER(7,3),
    ID_RECUP_SOLD_CNG NUMBER,
    CONSTRAINT PK_RECUP_SOLD_CNG PRIMARY KEY (COD_SOC, MAT_PERS, NUM_DEM),
    CONSTRAINT FK_RECUP_SOLD FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE RECUP_SOLD_CNG IS 'Demandes de récupération de solde de congé non consommé';
COMMENT ON COLUMN RECUP_SOLD_CNG.NUM_DEM IS 'Numéro de la demande';
COMMENT ON COLUMN RECUP_SOLD_CNG.NBR_JOUR_DEM IS 'Nombre de jours demandés';
COMMENT ON COLUMN RECUP_SOLD_CNG.ETAT_DEM IS 'État de la demande';
COMMENT ON COLUMN RECUP_SOLD_CNG.NBR_JOUR IS 'Nombre de jours accordés';

-- ============================================================================
-- PART 6E: DEMANDES DE CONGÉ ET INTÉRIM
-- ============================================================================

-- ---------------------------------------------------------------------------
-- DEM_CNG: Demandes de congé (table principale des demandes)
-- FK: PERSONNEL, MOTIF_J
-- Table très détaillée: gère tous les types de congé, prolongations,
-- demi-traitement, sans solde, visites médicales, etc.
-- ---------------------------------------------------------------------------
CREATE TABLE DEM_CNG (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    NUM_DCNG         NUMBER(8,0)  NOT NULL,
    ANNEE_CNG        NUMBER(4,0),
    CODE_M           VARCHAR2(4),
    DAT_DCNG         DATE         NOT NULL,
    DAT_DEBUT        DATE         NOT NULL,
    DAT_FIN          DATE         NOT NULL,
    NBR_JOURS        NUMBER(7,3),
    NBR_JOURS_CAL    NUMBER(7,3),
    BONUS_CNG        NUMBER(6,3),
    MOTIF_CNG        VARCHAR2(1000),
    RESIDENCE        VARCHAR2(80),
    TEL              VARCHAR2(20),
    VALID            VARCHAR2(1),
    ETAT_CNG         VARCHAR2(1),
    EDIT_TITRE       VARCHAR2(1),
    NBO              VARCHAR2(10),
    DAT_NBO          DATE,
    DAT_PREV_RET     DATE,
    DAT_RETOUR       DATE,
    NBO_RET          VARCHAR2(10),
    DAT_NBO_RET      DATE,
    CNG_PROL         VARCHAR2(1),
    NUM_DCNG_PROL    NUMBER(8,0),
    NBR_JOUR_PROL    NUMBER,
    PLANIFIER        VARCHAR2(1),
    NAT_CNG          VARCHAR2(4),
    CNG_TEMPS        VARCHAR2(1),
    CNG_TEMPS_DEBUT  VARCHAR2(1),
    CNG_TEMPS_FIN    VARCHAR2(1),
    NBR_JOURS_DEMI   NUMBER(6,3),
    NBR_JOURS_SOLD   NUMBER(6,3),
    DAT_JOURS_DEMI   DATE,
    DAT_JOURS_SOLD   DATE,
    COD_UR           VARCHAR2(4),
    COD_SERV         VARCHAR2(10),
    COD_MOTIF        VARCHAR2(4),
    COD_AFFECT       VARCHAR2(4),
    COD_CLASS        VARCHAR2(4),
    REGIME_TRAV      VARCHAR2(4),
    REG_CNG          VARCHAR2(4),
    COD_CYCL         VARCHAR2(4),
    RESIDENCE_A      VARCHAR2(1000),
    MOTIF_A          VARCHAR2(50),
    NUM_SANC         NUMBER(8,0),
    NUM_ACC          VARCHAR2(10),
    NUM_MAL          VARCHAR2(10),
    NUM_SAIS         NUMBER(10,0),
    DAT_SAIS_SYS     DATE,
    COD_USER         VARCHAR2(10),
    COD_ALERT        VARCHAR2(4),
    SEQ_ALERT        NUMBER(10,0),
    SOLD_CNG         NUMBER(10,3),
    CNG_VISIT        VARCHAR2(1),
    DAT_CONTRE_VISIT DATE,
    CNG_INIT         VARCHAR2(1),
    AVANCE_CNG       NUMBER,
    NBR_HEURE        NUMBER,
    NOM_MEDCIN       VARCHAR2(100),
    CUM_RETENUE      NUMBER(7,3),
    RETENUE_MOIS     NUMBER(7,3),
    CUM_RAPPEL       NUMBER(7,3),
    COD_CATEG        VARCHAR2(4),
    COD_CAT          VARCHAR2(4),
    COD_GRAD         VARCHAR2(4),
    SIGN_CNG         VARCHAR2(1),
    SPECIALITE       VARCHAR2(100),
    CNG_SAL          VARCHAR2(1),
    CNG_DOC          VARCHAR2(1),
    ORD_CAND         NUMBER(2,0),
    CLOTURE          VARCHAR2(1),
    INJECT           VARCHAR2(1),
    COD_USER_CONF    VARCHAR2(10),
    DAT_USER_CONF    DATE,
    ID_DEM_CNG       NUMBER,
    NBR_JOURS_OUV    NUMBER(7,3),
    CONSTRAINT PK_DEM_CNG PRIMARY KEY (COD_SOC, MAT_PERS, NUM_DCNG),
    CONSTRAINT FK_DEM_CNG_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS),
    CONSTRAINT FK_DEM_CNG_MOTIF_J FOREIGN KEY (CODE_M)
        REFERENCES MOTIF_J (COD_M)
);

COMMENT ON TABLE DEM_CNG IS 'Demandes de congé - table principale';
COMMENT ON COLUMN DEM_CNG.NUM_DCNG IS 'Numéro de demande de congé';
COMMENT ON COLUMN DEM_CNG.CODE_M IS 'Code motif de congé (réf. MOTIF_J)';
COMMENT ON COLUMN DEM_CNG.DAT_DCNG IS 'Date de la demande';
COMMENT ON COLUMN DEM_CNG.DAT_DEBUT IS 'Date début du congé';
COMMENT ON COLUMN DEM_CNG.DAT_FIN IS 'Date fin du congé';
COMMENT ON COLUMN DEM_CNG.NBR_JOURS IS 'Nombre de jours ouvrables';
COMMENT ON COLUMN DEM_CNG.NBR_JOURS_CAL IS 'Nombre de jours calendaires';
COMMENT ON COLUMN DEM_CNG.NBR_JOURS_OUV IS 'Nombre de jours ouvrables';
COMMENT ON COLUMN DEM_CNG.VALID IS 'État: I=en instance, A=annulé, O=validé, N=non validé';
COMMENT ON COLUMN DEM_CNG.CNG_PROL IS 'Prolongation de congé (O/N)';
COMMENT ON COLUMN DEM_CNG.NUM_DCNG_PROL IS 'N° demande de congé à prolonger';
COMMENT ON COLUMN DEM_CNG.CNG_TEMPS IS 'Unité: J=jour complet, M=matin, S=soir';
COMMENT ON COLUMN DEM_CNG.CNG_TEMPS_DEBUT IS 'Début: M=matin, S=après-midi';
COMMENT ON COLUMN DEM_CNG.CNG_TEMPS_FIN IS 'Fin: M=matin, S=après-midi';
COMMENT ON COLUMN DEM_CNG.NBR_JOURS_DEMI IS 'Jours demi-traitement (maladie)';
COMMENT ON COLUMN DEM_CNG.NBR_JOURS_SOLD IS 'Jours sans solde (maladie)';
COMMENT ON COLUMN DEM_CNG.CNG_VISIT IS 'Visite médicale requise (O/N) - congé maladie';
COMMENT ON COLUMN DEM_CNG.DAT_CONTRE_VISIT IS 'Date contre-visite médicale';
COMMENT ON COLUMN DEM_CNG.CNG_INIT IS 'I=initial, P=prolongation';
COMMENT ON COLUMN DEM_CNG.NOM_MEDCIN IS 'Nom du médecin (congé maladie)';
COMMENT ON COLUMN DEM_CNG.SPECIALITE IS 'Spécialité médicale';
COMMENT ON COLUMN DEM_CNG.NUM_SANC IS 'N° sanction (si mise à pied)';
COMMENT ON COLUMN DEM_CNG.NUM_ACC IS 'N° accident de travail';
COMMENT ON COLUMN DEM_CNG.NUM_MAL IS 'N° maladie professionnelle';
COMMENT ON COLUMN DEM_CNG.RESIDENCE IS 'Résidence pendant le congé';
COMMENT ON COLUMN DEM_CNG.SOLD_CNG IS 'Solde congé au moment de la demande';

-- ---------------------------------------------------------------------------
-- JUSTIF_DEM_CNG: Justificatifs fournis pour une demande de congé
-- FK: DEM_CNG
-- ---------------------------------------------------------------------------
CREATE TABLE JUSTIF_DEM_CNG (
    COD_JUSTIF       VARCHAR2(4)  NOT NULL,
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    NUM_DCNG         NUMBER(8,0)  NOT NULL,
    DAT_JUSTIF       DATE,
    NUM_JUSTIF       VARCHAR2(20),
    OBSERV_JUSTIF    VARCHAR2(40),
    DAT_PIECE        DATE,
    COD_M            VARCHAR2(4),
    ID_JUSTIF_DEM_CNG NUMBER,
    CONSTRAINT PK_JUSTIF_DEM_CNG PRIMARY KEY (COD_JUSTIF, COD_SOC, MAT_PERS, NUM_DCNG),
    CONSTRAINT FK_DEM_CNG_JUSTIF FOREIGN KEY (COD_SOC, MAT_PERS, NUM_DCNG)
        REFERENCES DEM_CNG (COD_SOC, MAT_PERS, NUM_DCNG)
);

COMMENT ON TABLE JUSTIF_DEM_CNG IS 'Justificatifs fournis pour une demande de congé';
COMMENT ON COLUMN JUSTIF_DEM_CNG.COD_JUSTIF IS 'Code justificatif';
COMMENT ON COLUMN JUSTIF_DEM_CNG.NUM_JUSTIF IS 'Numéro de la pièce justificative';
COMMENT ON COLUMN JUSTIF_DEM_CNG.DAT_PIECE IS 'Date de la pièce';
COMMENT ON COLUMN JUSTIF_DEM_CNG.OBSERV_JUSTIF IS 'Observation';

-- ---------------------------------------------------------------------------
-- INTERIM_CNG: Intérimaires désignés pendant les congés
-- FK: DEM_CNG
-- ---------------------------------------------------------------------------
CREATE TABLE INTERIM_CNG (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    NUM_DCNG         NUMBER(8,0)  NOT NULL,
    MAT_PERS_INT     VARCHAR2(10) NOT NULL,
    DAT_DEBUT_INT    DATE,
    DAT_FIN_INT      DATE,
    DAT_DECISION     DATE,
    NUM_DECISION     VARCHAR2(10),
    NATURE_INT       VARCHAR2(1),
    ORDONANCE        VARCHAR2(1),
    MNT_INT          NUMBER(10,3),
    COD_UR           VARCHAR2(4),
    COD_SERV         VARCHAR2(10),
    COD_MOTIF        VARCHAR2(4),
    COD_AFFECT       VARCHAR2(4),
    COD_CLASS        VARCHAR2(4),
    REGIME_TRAV      VARCHAR2(4),
    ID_INTERIM_CNG   NUMBER,
    COD_USER         VARCHAR2(10),
    CONSTRAINT PK_INTERIM_CNG PRIMARY KEY (COD_SOC, MAT_PERS, NUM_DCNG, MAT_PERS_INT),
    CONSTRAINT FK_INTERIM_CNG_DEM_CNG FOREIGN KEY (COD_SOC, MAT_PERS, NUM_DCNG)
        REFERENCES DEM_CNG (COD_SOC, MAT_PERS, NUM_DCNG)
);

COMMENT ON TABLE INTERIM_CNG IS 'Intérimaires désignés pendant les congés';
COMMENT ON COLUMN INTERIM_CNG.MAT_PERS IS 'Matricule de l''agent en congé';
COMMENT ON COLUMN INTERIM_CNG.MAT_PERS_INT IS 'Matricule de l''intérimaire';
COMMENT ON COLUMN INTERIM_CNG.DAT_DEBUT_INT IS 'Date début d''intérim';
COMMENT ON COLUMN INTERIM_CNG.DAT_FIN_INT IS 'Date fin d''intérim';
COMMENT ON COLUMN INTERIM_CNG.NUM_DECISION IS 'Numéro de décision d''intérim';
COMMENT ON COLUMN INTERIM_CNG.ORDONANCE IS 'Ordonnance de paiement (O/N)';
COMMENT ON COLUMN INTERIM_CNG.COD_MOTIF IS 'Position administrative';

-- ============================================================================
-- PART 6F: POINTAGE ET PRÉSENCE
-- ============================================================================

-- ---------------------------------------------------------------------------
-- PERS_CARTE: Association personnel-carte de pointage
-- FK: PERSONNEL
-- ---------------------------------------------------------------------------
CREATE TABLE PERS_CARTE (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    N_CARTE          NUMBER(10,0) NOT NULL,
    DATE_OPT         DATE,
    CART_COUR        VARCHAR2(1),
    ETAT_CARTE       VARCHAR2(1),
    ID_PERS_CARTE    NUMBER,
    CONSTRAINT PK_PERS_CARTE PRIMARY KEY (COD_SOC, MAT_PERS, N_CARTE),
    CONSTRAINT FK_PERS_CARTE_PERS FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE PERS_CARTE IS 'Association personnel-carte/badge de pointage';
COMMENT ON COLUMN PERS_CARTE.N_CARTE IS 'Numéro de carte/badge';
COMMENT ON COLUMN PERS_CARTE.DATE_OPT IS 'Date d''affectation';
COMMENT ON COLUMN PERS_CARTE.ETAT_CARTE IS 'A=affecté, L=libre';

-- ---------------------------------------------------------------------------
-- AUTORISATION_SORT: Autorisations de sortie pendant les heures de travail
-- FK: PERSONNEL, TYP_AUTORISATION
-- ---------------------------------------------------------------------------
CREATE TABLE AUTORISATION_SORT (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    NUM_AUT          NUMBER       NOT NULL,
    DAT_DEBUT_AUT    DATE         NOT NULL,
    DAT_FIN_AUT      DATE,
    COD_AUT          VARCHAR2(4)  NOT NULL,
    ETAT_AUT         VARCHAR2(1),
    HEUR_S           NUMBER,
    MIN_S            NUMBER,
    HEUR_R           NUMBER,
    MIN_R            NUMBER,
    DUREE            NUMBER,
    DAT_DECISION     DATE,
    NUM_DECISION     VARCHAR2(10),
    OBS_AUT          VARCHAR2(300),
    COD_UR           VARCHAR2(10),
    COD_SERV         VARCHAR2(10),
    COD_CLASS        VARCHAR2(4),
    COD_METIER       VARCHAR2(4),
    POSTE_TRAV       VARCHAR2(15),
    ORG_SERV         VARCHAR2(15),
    DAT_SAISIE       DATE,
    DAT_MAJ          DATE,
    COD_USER         VARCHAR2(10),
    DUREE_M          NUMBER,
    TYP_AUT          VARCHAR2(1),
    DUREE_J          NUMBER,
    LUN              VARCHAR2(1),
    MAR              VARCHAR2(1),
    MER              VARCHAR2(1),
    JEU              VARCHAR2(1),
    VEN              VARCHAR2(1),
    SAM              VARCHAR2(1),
    ETAT_AUTO        VARCHAR2(1),
    CONSTRAINT PK_AUTORISATION_SORT PRIMARY KEY (COD_SOC, MAT_PERS, DAT_DEBUT_AUT, NUM_AUT),
    CONSTRAINT FK_AUTORISATION_SORT_PERS FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS),
    CONSTRAINT FK_AUTORISATION_SORT_TYP FOREIGN KEY (COD_AUT)
        REFERENCES TYP_AUTORISATION (COD_TYP_AUT)
);

COMMENT ON TABLE AUTORISATION_SORT IS 'Autorisations de sortie pendant les heures de travail';
COMMENT ON COLUMN AUTORISATION_SORT.NUM_AUT IS 'Numéro d''autorisation dans la journée';
COMMENT ON COLUMN AUTORISATION_SORT.DAT_DEBUT_AUT IS 'Date début de l''autorisation';
COMMENT ON COLUMN AUTORISATION_SORT.DAT_FIN_AUT IS 'Date fin de l''autorisation';
COMMENT ON COLUMN AUTORISATION_SORT.COD_AUT IS 'Code type d''autorisation';
COMMENT ON COLUMN AUTORISATION_SORT.ETAT_AUT IS 'État: I=instance, V=validée, R=refusée';
COMMENT ON COLUMN AUTORISATION_SORT.HEUR_S IS 'Heure de sortie';
COMMENT ON COLUMN AUTORISATION_SORT.MIN_S IS 'Minute de sortie';
COMMENT ON COLUMN AUTORISATION_SORT.HEUR_R IS 'Heure de retour';
COMMENT ON COLUMN AUTORISATION_SORT.MIN_R IS 'Minute de retour';
COMMENT ON COLUMN AUTORISATION_SORT.DUREE IS 'Durée totale';
COMMENT ON COLUMN AUTORISATION_SORT.TYP_AUT IS 'Type: H=en heures, M=en minutes';
COMMENT ON COLUMN AUTORISATION_SORT.DUREE_J IS 'Durée en jours';
COMMENT ON COLUMN AUTORISATION_SORT.DUREE_M IS 'Durée en minutes';

-- ---------------------------------------------------------------------------
-- POINTER_IND: Pointages individuels bruts (données de la pointeuse)
-- Données importées automatiquement depuis les pointeuses/badgeuses
-- ---------------------------------------------------------------------------
CREATE TABLE POINTER_IND (
    MAT_PERS         VARCHAR2(10),
    H_POINT          VARCHAR2(2)  DEFAULT '0' NOT NULL,
    MIN_POINT        VARCHAR2(2)  DEFAULT '0' NOT NULL,
    MONTHS           VARCHAR2(2)  NOT NULL,
    YEARS            VARCHAR2(2)  NOT NULL,
    DAYS             VARCHAR2(2)  NOT NULL,
    N_CARTE          VARCHAR2(10) NOT NULL,
    COD_SOC          VARCHAR2(4)  NOT NULL,
    NUM_POINTEUSE    VARCHAR2(4),
    NAT_POINT        VARCHAR2(1),
    COD_REG          VARCHAR2(4),
    ETAT_IND         VARCHAR2(1)  DEFAULT 'I',
    NUM_POINT        NUMBER,
    TYP_VALID        VARCHAR2(1),
    SS_POINT         VARCHAR2(2),
    COD_M            VARCHAR2(8),
    ID_POINTER_IND   NUMBER,
    CONSTRAINT PK_POINTER_IND PRIMARY KEY (COD_SOC, N_CARTE, YEARS, MONTHS, DAYS, H_POINT, MIN_POINT)
);

COMMENT ON TABLE POINTER_IND IS 'Pointages individuels bruts importés des pointeuses/badgeuses';
COMMENT ON COLUMN POINTER_IND.H_POINT IS 'Heure de pointage';
COMMENT ON COLUMN POINTER_IND.MIN_POINT IS 'Minute de pointage';
COMMENT ON COLUMN POINTER_IND.SS_POINT IS 'Seconde de pointage';
COMMENT ON COLUMN POINTER_IND.N_CARTE IS 'Numéro de carte/badge';
COMMENT ON COLUMN POINTER_IND.NUM_POINTEUSE IS 'Numéro de la pointeuse';
COMMENT ON COLUMN POINTER_IND.ETAT_IND IS 'V=validé, R=rejeté, I=en instance';
COMMENT ON COLUMN POINTER_IND.TYP_VALID IS 'M=pointage manuel, sinon par pointeuse';
COMMENT ON COLUMN POINTER_IND.COD_M IS 'Code de pointage';
COMMENT ON COLUMN POINTER_IND.COD_REG IS 'Régime de pointage';

-- ---------------------------------------------------------------------------
-- POINTER: Pointages traités/consolidés par agent et jour
-- FK: PERSONNEL
-- ---------------------------------------------------------------------------
CREATE TABLE POINTER (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    TYP_POINT        VARCHAR2(2),
    H_POINT          NUMBER(4,0)  NOT NULL,
    MIN_POINT        NUMBER(4,0)  NOT NULL,
    DATE_POINT       DATE         NOT NULL,
    N_CARTE          NUMBER(10,0),
    NUM_POINT        NUMBER(10,0),
    TYPE             VARCHAR2(1),
    NUM_POINTEUSE    VARCHAR2(40),
    SEMAINE          NUMBER(1,0),
    TYP_REG          VARCHAR2(1),
    COD_REG          VARCHAR2(4),
    H_REG            NUMBER(2,0),
    M_REG            NUMBER(2,0),
    COD_M            VARCHAR2(4),
    DATE_J_POINT     DATE         NOT NULL,
    TYP_VALID        VARCHAR2(1),
    COD_AUTO         VARCHAR2(4),
    CLOTURE          VARCHAR2(1),
    DAT_SAIS_SYS     DATE,
    TOT_RET          NUMBER(5,2),
    RET_HEUR         NUMBER(5,2),
    RET_MIN          NUMBER(5,2),
    ID_POINTER       NUMBER,
    INTERMED         VARCHAR2(4),
    S_POINT          NUMBER(4,0),
    OLD_TYP_POINT    VARCHAR2(2),
    DAT_JOUR         DATE,
    YEARS_           NUMBER(4,0),
    MONTHS_          NUMBER(2,0),
    DAYS_            NUMBER(2,0),
    SERV_POINT       VARCHAR2(10),
    DUREE_H          NUMBER(2,0),
    DUREE_M          NUMBER(2,0),
    DUREE_TOT        VARCHAR2(20),
    TEMP_COMP        NUMBER,
    CONSTRAINT PK_POINTER PRIMARY KEY (COD_SOC, MAT_PERS, H_POINT, MIN_POINT, DATE_POINT, DATE_J_POINT),
    CONSTRAINT FK_POINTER_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE POINTER IS 'Pointages traités/consolidés par agent et jour';
COMMENT ON COLUMN POINTER.TYP_POINT IS 'E=entrée, S=sortie';
COMMENT ON COLUMN POINTER.H_POINT IS 'Heure de pointage';
COMMENT ON COLUMN POINTER.MIN_POINT IS 'Minute de pointage';
COMMENT ON COLUMN POINTER.DATE_POINT IS 'Date du jour de pointage';
COMMENT ON COLUMN POINTER.DATE_J_POINT IS 'Date journée de pointage';
COMMENT ON COLUMN POINTER.COD_M IS 'Code de pointage/motif';
COMMENT ON COLUMN POINTER.COD_REG IS 'Régime de pointage';
COMMENT ON COLUMN POINTER.H_REG IS 'Heure prévue par le régime';
COMMENT ON COLUMN POINTER.M_REG IS 'Minute prévue par le régime';
COMMENT ON COLUMN POINTER.TOT_RET IS 'Total retard (heures.minutes)';
COMMENT ON COLUMN POINTER.CLOTURE IS 'Clôturé (O/N)';
COMMENT ON COLUMN POINTER.DUREE_H IS 'Durée de présence (heures)';
COMMENT ON COLUMN POINTER.DUREE_M IS 'Durée de présence (minutes)';
COMMENT ON COLUMN POINTER.TEMP_COMP IS 'Temps compensatoire';

-- ---------------------------------------------------------------------------
-- RETARD_JOURNEE: Retards journaliers enregistrés
-- FK: PERSONNEL
-- ---------------------------------------------------------------------------
CREATE TABLE RETARD_JOURNEE (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    DAT_POINT        DATE         NOT NULL,
    NUM_POINT        NUMBER       NOT NULL,
    H_POINT          NUMBER,
    M_POINT          NUMBER,
    H_REG            NUMBER,
    M_REG            NUMBER,
    TYPE             VARCHAR2(2),
    DUREE_H          NUMBER,
    DUREE_M          NUMBER,
    DUREE_TOT        VARCHAR2(20),
    SEMAINE          NUMBER,
    COD_SERV         VARCHAR2(10),
    COD_REG          VARCHAR2(4),
    DATE_SHIFT       DATE,
    ETAT_RETARD      VARCHAR2(1),
    DAT_SAIS         DATE,
    ID_RETARD_JOURNEE NUMBER,
    H_ENTRE          NUMBER(4,0),
    M_ENTRE          NUMBER(4,0),
    TYP_SAIS         VARCHAR2(1)  DEFAULT 'A',
    TYP_POINT        VARCHAR2(1),
    TRANSF           VARCHAR2(1),
    COD_AUT          VARCHAR2(4),
    DURE_AUT         NUMBER,
    TEMP_COMP        NUMBER,
    NAT_COMP         VARCHAR2(2),
    CONSTRAINT PK_RETARD_JOURNEE PRIMARY KEY (COD_SOC, MAT_PERS, DAT_POINT, NUM_POINT),
    CONSTRAINT FK_RETARD_JOURNEE_PERS FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE RETARD_JOURNEE IS 'Retards journaliers enregistrés par agent';
COMMENT ON COLUMN RETARD_JOURNEE.DAT_POINT IS 'Date de pointage';
COMMENT ON COLUMN RETARD_JOURNEE.H_POINT IS 'Heure de pointage effective';
COMMENT ON COLUMN RETARD_JOURNEE.M_POINT IS 'Minute de pointage effective';
COMMENT ON COLUMN RETARD_JOURNEE.H_REG IS 'Heure prévue par le régime';
COMMENT ON COLUMN RETARD_JOURNEE.M_REG IS 'Minute prévue par le régime';
COMMENT ON COLUMN RETARD_JOURNEE.TYPE IS 'E=entrée, S=sortie';
COMMENT ON COLUMN RETARD_JOURNEE.DUREE_H IS 'Durée du retard (heures)';
COMMENT ON COLUMN RETARD_JOURNEE.DUREE_M IS 'Durée du retard (minutes)';
COMMENT ON COLUMN RETARD_JOURNEE.ETAT_RETARD IS 'S=saisi, V=validé';
COMMENT ON COLUMN RETARD_JOURNEE.COD_SERV IS 'Affectation';
COMMENT ON COLUMN RETARD_JOURNEE.COD_REG IS 'Régime de travail';
COMMENT ON COLUMN RETARD_JOURNEE.TEMP_COMP IS 'Temps compensatoire';

-- ---------------------------------------------------------------------------
-- CAL_PERS: Calendrier personnalisé par agent (pointage quotidien)
-- FK: PERSONNEL, MOTIF_J
-- Table opérationnelle: générée quotidiennement pour chaque agent
-- ---------------------------------------------------------------------------
CREATE TABLE CAL_PERS (
    COD_SOC          VARCHAR2(4)  NOT NULL,
    MAT_PERS         VARCHAR2(10) NOT NULL,
    YEARS            NUMBER(4,0)  NOT NULL,
    MONTHS           NUMBER(2,0)  NOT NULL,
    DAYS             NUMBER(2,0)  NOT NULL,
    J_SEMAINE        NUMBER(2,0),
    COD_M            VARCHAR2(4),
    SEMAINE          NUMBER(2,0),
    PREC_COD_M       VARCHAR2(4),
    BASE_H           NUMBER,
    BASE_M           NUMBER,
    PAUSE_SHIFT      NUMBER(4,2),
    MARG_SHIFT       NUMBER(4,2),
    COD_REG          VARCHAR2(4),
    COD_SERV         VARCHAR2(10),
    PRES_H           NUMBER(5,2),
    PRES_M           NUMBER(5,2),
    COD_FIL          VARCHAR2(10),
    REGIME_TRAV      VARCHAR2(1),
    REGIME_HEUR      NUMBER(2,0),
    DROIT_ASTR       VARCHAR2(1)  DEFAULT 'N',
    DT_BUL           DATE,
    COD_TYP_BUL      VARCHAR2(4),
    ID_CAL_PERS      NUMBER,
    UNITE            VARCHAR2(1),
    SEANCE           VARCHAR2(1)  DEFAULT 'J',
    CONSTRAINT PK_CAL_PERS PRIMARY KEY (COD_SOC, MAT_PERS, YEARS, MONTHS, DAYS),
    CONSTRAINT FK_CAL_PERS_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS),
    CONSTRAINT FK_CAL_PERS_MOTIF FOREIGN KEY (COD_M)
        REFERENCES MOTIF_J (COD_M)
);

COMMENT ON TABLE CAL_PERS IS 'Calendrier personnalisé par agent - pointage quotidien';
COMMENT ON COLUMN CAL_PERS.COD_M IS 'Code pointage du jour';
COMMENT ON COLUMN CAL_PERS.PREC_COD_M IS 'Code pointage avant dernière modification';
COMMENT ON COLUMN CAL_PERS.BASE_H IS 'Heures de base selon régime';
COMMENT ON COLUMN CAL_PERS.BASE_M IS 'Minutes de base selon régime';
COMMENT ON COLUMN CAL_PERS.COD_REG IS 'Code régime de travail';
COMMENT ON COLUMN CAL_PERS.PRES_H IS 'Heures de présence effectives';
COMMENT ON COLUMN CAL_PERS.PRES_M IS 'Minutes de présence effectives';
COMMENT ON COLUMN CAL_PERS.REGIME_TRAV IS 'Régime: M=mensuel, H=horaire';
COMMENT ON COLUMN CAL_PERS.REGIME_HEUR IS 'Régime horaire (37, 40, 48h)';
COMMENT ON COLUMN CAL_PERS.DROIT_ASTR IS 'Droit à l''astreinte: I=instance, V=validée, N=non';
COMMENT ON COLUMN CAL_PERS.SEANCE IS 'J=journée, M=matin, S=soir';

-- ############################################################################
-- PART 7 : MODULE RECRUTEMENT ET CONCOURS
-- Tables de gestion du recrutement, concours, candidatures, évaluation
-- et stages pour le Ministère de la Santé de Tunisie
-- ############################################################################

-- ============================================================================
-- PART 7A : Tables de référence du recrutement
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7A.1 VILLE : Villes de Tunisie (résidence des candidats)
-- ADAPTED: Villes tunisiennes (Tunis, Sfax, Sousse, Kairouan, Bizerte...)
-- ----------------------------------------------------------------------------
CREATE TABLE VILLE (
    CODE_VILLE       VARCHAR2(10)    NOT NULL,
    LIB_VILLE        VARCHAR2(40),
    LIB_VILLE_A      VARCHAR2(40),
    CONSTRAINT PK_VILLE PRIMARY KEY (CODE_VILLE)
);

COMMENT ON TABLE VILLE IS 'Référentiel des villes tunisiennes pour les candidats';
COMMENT ON COLUMN VILLE.CODE_VILLE IS 'Code ville';
COMMENT ON COLUMN VILLE.LIB_VILLE IS 'Libellé ville en français';
COMMENT ON COLUMN VILLE.LIB_VILLE_A IS 'Libellé ville en arabe';

-- ----------------------------------------------------------------------------
-- 7A.2 TYPE_BONIFICATION : Types de bonification aux concours
-- ADAPTED: Bonifications secteur public tunisien (anciens combattants,
-- fils de chahid/moujahid, handicapés, zones prioritaires)
-- ----------------------------------------------------------------------------
CREATE TABLE TYPE_BONIFICATION (
    COD_MOTIF_BONIF      VARCHAR2(4)     NOT NULL,
    LIB_MOTIF_BONIF      VARCHAR2(120),
    LIB_MOTIF_BONIF_A    VARCHAR2(120),
    TAUX                 NUMBER,
    CONSTRAINT PK_TYPE_BONIFICATION PRIMARY KEY (COD_MOTIF_BONIF)
);

COMMENT ON TABLE TYPE_BONIFICATION IS 'Types de bonification applicables aux concours de la fonction publique';
COMMENT ON COLUMN TYPE_BONIFICATION.COD_MOTIF_BONIF IS 'Code motif bonification';
COMMENT ON COLUMN TYPE_BONIFICATION.LIB_MOTIF_BONIF IS 'Libellé motif bonification en français';
COMMENT ON COLUMN TYPE_BONIFICATION.LIB_MOTIF_BONIF_A IS 'Libellé motif bonification en arabe';
COMMENT ON COLUMN TYPE_BONIFICATION.TAUX IS 'Taux de bonification applicable';

-- ----------------------------------------------------------------------------
-- 7A.3 MODELE_EVALUATION : Modèles d''évaluation (recrutement et stage)
-- ----------------------------------------------------------------------------
CREATE TABLE MODELE_EVALUATION (
    NUM_MODELE       VARCHAR2(10)    NOT NULL,
    LIB_MODELE       VARCHAR2(40),
    LIB_MODELE_A     VARCHAR2(40),
    TYP_MODELE       VARCHAR2(1),
    CONSTRAINT PK_MODELE_EVALUATION PRIMARY KEY (NUM_MODELE)
);

COMMENT ON TABLE MODELE_EVALUATION IS 'Modèles d''évaluation pour le recrutement et les stages';
COMMENT ON COLUMN MODELE_EVALUATION.NUM_MODELE IS 'Code modèle d''évaluation';
COMMENT ON COLUMN MODELE_EVALUATION.LIB_MODELE IS 'Libellé modèle en français';
COMMENT ON COLUMN MODELE_EVALUATION.LIB_MODELE_A IS 'Libellé modèle en arabe';
COMMENT ON COLUMN MODELE_EVALUATION.TYP_MODELE IS 'Type: R=recrutement, F=formation/stage';

-- ----------------------------------------------------------------------------
-- 7A.4 EPREUVE : Référentiel des épreuves de concours
-- ADAPTED: Épreuves types secteur santé (culture générale, spécialité
-- médicale, épreuve pratique soins, psychotechnique...)
-- ----------------------------------------------------------------------------
CREATE TABLE EPREUVE (
    CODE_EPREUVE     VARCHAR2(10)    NOT NULL,
    LIB_EPREUVE      VARCHAR2(40),
    TYP_EPREUVE      VARCHAR2(1),
    ABRV_EPREUVE     VARCHAR2(10),
    LIB_EPREUVE_A    VARCHAR2(40),
    CONSTRAINT PK_EPREUVE PRIMARY KEY (CODE_EPREUVE)
);

COMMENT ON TABLE EPREUVE IS 'Référentiel des épreuves de concours';
COMMENT ON COLUMN EPREUVE.CODE_EPREUVE IS 'Code épreuve';
COMMENT ON COLUMN EPREUVE.LIB_EPREUVE IS 'Libellé épreuve en français';
COMMENT ON COLUMN EPREUVE.TYP_EPREUVE IS 'Type d''épreuve (non utilisé)';
COMMENT ON COLUMN EPREUVE.ABRV_EPREUVE IS 'Abréviation (non utilisé)';
COMMENT ON COLUMN EPREUVE.LIB_EPREUVE_A IS 'Libellé épreuve en arabe';

-- ----------------------------------------------------------------------------
-- 7A.5 SALLE : Salles d''examen dans les établissements de santé
-- ADAPTED: Salles d''examen dans les hôpitaux, facultés de médecine,
-- centres de formation en santé
-- ----------------------------------------------------------------------------
CREATE TABLE SALLE (
    COD_SALLE        VARCHAR2(2)     NOT NULL,
    LIB_SALLE        VARCHAR2(60)    NOT NULL,
    CAPACITE         NUMBER,
    LIB_SALLE_A      VARCHAR2(60),
    COD_ETAB_CONC    VARCHAR2(4)     NOT NULL,
    ID_SALLE         NUMBER,
    CONSTRAINT PK_SALLE PRIMARY KEY (COD_ETAB_CONC, COD_SALLE)
);

COMMENT ON TABLE SALLE IS 'Salles d''examen pour les concours de recrutement';
COMMENT ON COLUMN SALLE.COD_SALLE IS 'Code salle';
COMMENT ON COLUMN SALLE.LIB_SALLE IS 'Libellé salle en français';
COMMENT ON COLUMN SALLE.CAPACITE IS 'Capacité de la salle';
COMMENT ON COLUMN SALLE.LIB_SALLE_A IS 'Libellé salle en arabe';
COMMENT ON COLUMN SALLE.COD_ETAB_CONC IS 'Code établissement du concours';

-- ----------------------------------------------------------------------------
-- 7A.6 LISTE_DIVERS : Liste des pièces/documents/compétences diverses
-- ADAPTED: Documents requis secteur santé (permis, certificats, attestations)
-- ----------------------------------------------------------------------------
CREATE TABLE LISTE_DIVERS (
    CODE_DIVERS      VARCHAR2(10)    NOT NULL,
    LIB_DIVERS       VARCHAR2(50),
    LIB_DIVERS_A     VARCHAR2(50),
    CONSTRAINT PK_LISTE_DIVERS PRIMARY KEY (CODE_DIVERS)
);

COMMENT ON TABLE LISTE_DIVERS IS 'Liste des éléments divers (permis, certificats, etc.)';
COMMENT ON COLUMN LISTE_DIVERS.CODE_DIVERS IS 'Code divers';
COMMENT ON COLUMN LISTE_DIVERS.LIB_DIVERS IS 'Libellé en français';
COMMENT ON COLUMN LISTE_DIVERS.LIB_DIVERS_A IS 'Libellé en arabe';

-- ----------------------------------------------------------------------------
-- 7A.7 VALEUR_CRITERE : Valeurs possibles pour les critères d''évaluation
-- ----------------------------------------------------------------------------
CREATE TABLE VALEUR_CRITERE (
    COD_VAL          VARCHAR2(4)     NOT NULL,
    LIB_VAL          VARCHAR2(80),
    LIB_VAL_A        VARCHAR2(80),
    CONSTRAINT PK_VALEUR_CRITERE PRIMARY KEY (COD_VAL)
);

COMMENT ON TABLE VALEUR_CRITERE IS 'Valeurs possibles pour les critères d''évaluation';
COMMENT ON COLUMN VALEUR_CRITERE.COD_VAL IS 'Code valeur';
COMMENT ON COLUMN VALEUR_CRITERE.LIB_VAL IS 'Libellé valeur en français';
COMMENT ON COLUMN VALEUR_CRITERE.LIB_VAL_A IS 'Libellé valeur en arabe';

-- ============================================================================
-- PART 7B : Tables principales du recrutement
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7B.1 AVIS : Avis de recrutement / appels à candidatures
-- ADAPTED: Avis publiés par le Ministère de la Santé au JORT
-- et sur le site du ministère
-- ----------------------------------------------------------------------------
CREATE TABLE AVIS (
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    LIBELLE_AVIS     VARCHAR2(40),
    DAT_AVIS         DATE,
    DAT_LIMIT        DATE,
    TYPE_AVIS        VARCHAR2(1),
    SITE_INSCRIP     VARCHAR2(100),
    ADR_CORRESP      VARCHAR2(300),
    BUR_REGIONAL     VARCHAR2(100),
    ETAT_AVIS        VARCHAR2(1),
    SUJET_AVIS       VARCHAR2(300),
    COD_SOC          VARCHAR2(4),
    CONSTRAINT PK_AVIS PRIMARY KEY (NUM_AVIS)
);

COMMENT ON TABLE AVIS IS 'Avis de recrutement publiés par le Ministère de la Santé';
COMMENT ON COLUMN AVIS.NUM_AVIS IS 'Numéro de l''avis de recrutement';
COMMENT ON COLUMN AVIS.LIBELLE_AVIS IS 'Libellé de l''avis';
COMMENT ON COLUMN AVIS.DAT_AVIS IS 'Date de saisie de l''avis';
COMMENT ON COLUMN AVIS.DAT_LIMIT IS 'Date limite de dépôt des candidatures';
COMMENT ON COLUMN AVIS.TYPE_AVIS IS 'Type d''avis (non utilisé)';
COMMENT ON COLUMN AVIS.SITE_INSCRIP IS 'Site web pour inscription à distance';
COMMENT ON COLUMN AVIS.ADR_CORRESP IS 'Adresse de correspondance';
COMMENT ON COLUMN AVIS.BUR_REGIONAL IS 'Bureau régional d''emploi (ANETI)';
COMMENT ON COLUMN AVIS.ETAT_AVIS IS 'État: I=instance, V=validé';
COMMENT ON COLUMN AVIS.SUJET_AVIS IS 'Sujet de l''avis';

-- ----------------------------------------------------------------------------
-- 7B.2 LINE_AVIS : Lignes de l''avis (postes ouverts par spécialité)
-- ADAPTED: Postes ouverts par établissement de santé et spécialité
-- ----------------------------------------------------------------------------
CREATE TABLE LINE_AVIS (
    ORDR_AVIS        NUMBER          NOT NULL,
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    NOMBRE           NUMBER,
    NBR_LOI          NUMBER,
    AGE_MAX          NUMBER(2),
    AGE_MIN          NUMBER(2),
    COD_SOC          VARCHAR2(4),
    ID_LINE_AVIS     NUMBER,
    CONSTRAINT PK_LINE_AVIS PRIMARY KEY (NUM_AVIS, CODE_DOMAINE, ORDR_AVIS),
    CONSTRAINT UN_LINE_AVIS UNIQUE (NUM_AVIS, CODE_DOMAINE),
    CONSTRAINT FK_LINE_AVIS FOREIGN KEY (NUM_AVIS)
        REFERENCES AVIS (NUM_AVIS)
);

COMMENT ON TABLE LINE_AVIS IS 'Lignes d''avis - postes ouverts par spécialité';
COMMENT ON COLUMN LINE_AVIS.NUM_AVIS IS 'Numéro de l''avis';
COMMENT ON COLUMN LINE_AVIS.ORDR_AVIS IS 'Ordre dans l''avis';
COMMENT ON COLUMN LINE_AVIS.CODE_DOMAINE IS 'Spécialité / domaine';
COMMENT ON COLUMN LINE_AVIS.NOMBRE IS 'Nombre de postes demandés';
COMMENT ON COLUMN LINE_AVIS.NBR_LOI IS 'Nombre selon la loi cadre';
COMMENT ON COLUMN LINE_AVIS.AGE_MAX IS 'Âge maximum permis';
COMMENT ON COLUMN LINE_AVIS.AGE_MIN IS 'Âge minimum permis';

-- ----------------------------------------------------------------------------
-- 7B.3 CONCOURS : Concours de recrutement
-- ADAPTED: Concours fonction publique santé (concours externe, interne,
-- sur dossier, sur épreuves) selon décret n°2006-1031
-- ----------------------------------------------------------------------------
CREATE TABLE CONCOURS (
    CODE_CONCOURS    VARCHAR2(10)    NOT NULL,
    LIB_CONCOURS     VARCHAR2(40),
    COD_ETAB_CONC    VARCHAR2(10),
    DATE_CONCOURS    DATE,
    TYPE_CONCOURS    VARCHAR2(1)     NOT NULL,
    HEUR_C           DATE,
    LIEU_C           VARCHAR2(60),
    ETAT1            VARCHAR2(2),
    MOY_CONCOURS     NUMBER(5,2),
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    ORDR_AVIS        NUMBER          NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    TYPE_REUSSITE    VARCHAR2(1),
    NAT_SELECT       VARCHAR2(1),
    ETAT_CONC        VARCHAR2(1),
    BONIFICATION     VARCHAR2(1),
    CONC_COD_CONC    VARCHAR2(10),
    COEF             NUMBER(2),
    COD_CAT_CLASS    VARCHAR2(4),
    COD_SOC          VARCHAR2(4),
    CONSTRAINT PK_CONC PRIMARY KEY (CODE_CONCOURS),
    CONSTRAINT FK_CONCOURS FOREIGN KEY (CODE_DOMAINE)
        REFERENCES LISTE_DOMAINE (CODE_DOMAINE),
    CONSTRAINT FK_CONCOURS_AVIS FOREIGN KEY (NUM_AVIS)
        REFERENCES AVIS (NUM_AVIS)
);

COMMENT ON TABLE CONCOURS IS 'Concours de recrutement - fonction publique santé';
COMMENT ON COLUMN CONCOURS.CODE_CONCOURS IS 'Code du concours';
COMMENT ON COLUMN CONCOURS.LIB_CONCOURS IS 'Libellé du concours';
COMMENT ON COLUMN CONCOURS.COD_ETAB_CONC IS 'Lieu/établissement du concours';
COMMENT ON COLUMN CONCOURS.DATE_CONCOURS IS 'Date début du concours';
COMMENT ON COLUMN CONCOURS.TYPE_CONCOURS IS 'Type: E=écrit, O=oral, T=technique, P=psychotechnique, B=entretien';
COMMENT ON COLUMN CONCOURS.HEUR_C IS 'Heure de début';
COMMENT ON COLUMN CONCOURS.LIEU_C IS 'Lieu si plusieurs sites';
COMMENT ON COLUMN CONCOURS.MOY_CONCOURS IS 'Moyenne d''admission';
COMMENT ON COLUMN CONCOURS.NUM_AVIS IS 'N° avis de recrutement';
COMMENT ON COLUMN CONCOURS.ORDR_AVIS IS 'Ordre dans l''avis';
COMMENT ON COLUMN CONCOURS.CODE_DOMAINE IS 'Spécialité';
COMMENT ON COLUMN CONCOURS.TYPE_REUSSITE IS 'M=par moyenne, N=par nombre, G=moyenne générale';
COMMENT ON COLUMN CONCOURS.NAT_SELECT IS 'I=sélection intermédiaire, D=sélection définitive';
COMMENT ON COLUMN CONCOURS.ETAT_CONC IS 'I=saisie, V=validé, C=clôturé';
COMMENT ON COLUMN CONCOURS.BONIFICATION IS 'O=avec bonification, N=sans';
COMMENT ON COLUMN CONCOURS.CONC_COD_CONC IS 'Code concours père (si existant)';
COMMENT ON COLUMN CONCOURS.COEF IS 'Coefficient du concours';
COMMENT ON COLUMN CONCOURS.COD_CAT_CLASS IS 'Catégorie de classe (ouvrier, cadre, cadre moyen...)';

-- ----------------------------------------------------------------------------
-- 7B.4 FICHE_CANDIDAT : Fiche complète du candidat
-- ADAPTED: Candidats aux concours du Ministère de la Santé
-- Inclut données CIN, service militaire, handicap, antécédents
-- F_MOJHD_CHEHID: M=fils de moudjahid, C=fils de chahid (spécifique Tunisie)
-- REMOVED FK: FK_MOYEN_CONVOC → MOTIF_CORRESPONDANCE (hors périmètre)
-- ----------------------------------------------------------------------------
CREATE TABLE FICHE_CANDIDAT (
    NUM_FICHE            VARCHAR2(15)    NOT NULL,
    COD_SOC              VARCHAR2(4),
    MAT_PERS             VARCHAR2(10),
    NOM_CAND             VARCHAR2(40),
    PREN_CAND            VARCHAR2(40),
    TYP_CAND             VARCHAR2(1),
    NOM_JF               VARCHAR2(80),
    DAT_NAIS             DATE,
    LIEU_NAIS            VARCHAR2(200),
    COD_NAT_P            VARCHAR2(4),
    ADRESSE              VARCHAR2(100),
    IDENTIFIANT          VARCHAR2(20),
    TYP_IDENTIFIANT      VARCHAR2(1),
    DAT_EMI_IDENT        DATE,
    LIEU_EMI_IDENT       VARCHAR2(100),
    NUM_PERMIS           VARCHAR2(10),
    DAT_OBT_PERMIS       DATE,
    SIT_FAM              VARCHAR2(1),
    NBR_ENF              NUMBER,
    PROF_CONJ            VARCHAR2(30),
    ORG_PROF_CONJ        VARCHAR2(50),
    TAILLE               NUMBER,
    POIDS                NUMBER,
    GRP_SANGUIN          VARCHAR2(3),
    ETAT_SANTE           VARCHAR2(1),
    HANDICAP             VARCHAR2(1)     DEFAULT NULL,
    NOM_HANDICAP         VARCHAR2(100),
    ANTECED_JUDICIAIRE   VARCHAR2(1),
    DAT_ANTECED_JUD      DATE,
    SERV_MILITAIRE       VARCHAR2(20),
    ACTION_PREVUE        VARCHAR2(100),
    DAT_CREAT_FICHE      DATE,
    DAT_MAJ_FICHE        DATE,
    ETAT_FICHE           VARCHAR2(1),
    COD_SOURCE           VARCHAR2(6),
    OBSERV               VARCHAR2(100),
    COD_SALLE            VARCHAR2(2),
    CODE_CONCOURS        VARCHAR2(10),
    MOYEN_FINAL          NUMBER          DEFAULT NULL,
    RESULT_FINAL         VARCHAR2(1),
    CLASSEMENT           NUMBER(4)       DEFAULT NULL,
    CODE_MOYEN           VARCHAR2(2),
    DATE_CONVOCATION     DATE,
    SEXE                 VARCHAR2(1),
    NUM_FAM              NUMBER(2),
    TELEPHONE            VARCHAR2(30),
    FAX                  VARCHAR2(15),
    E_MAIL               VARCHAR2(30),
    CODE_VILLE           VARCHAR2(10),
    COD_SERV             VARCHAR2(10),
    VM                   VARCHAR2(1)     DEFAULT NULL,
    DF                   VARCHAR2(1)     DEFAULT NULL,
    PERE                 VARCHAR2(10),
    ANC_MAT              VARCHAR2(10),
    COD_MOTIF_BONIF      VARCHAR2(4),
    COD_REFUS            VARCHAR2(10),
    DAT_DEPOS_DEM        DATE,
    NUM_CACHET           NUMBER,
    ORG_SERV             VARCHAR2(15),
    COD_METIER           VARCHAR2(4),
    COD_POST             VARCHAR2(15),
    COD_GOUV             VARCHAR2(4),
    POURCENT_HAND        NUMBER(5,2),
    TYP_HANDICAP         VARCHAR2(1),
    NUM_FICH_HAND        VARCHAR2(10),
    COEF_COMP            NUMBER(6),
    COD_NAT_RECR         VARCHAR2(4),
    COD_TYP_CONT         VARCHAR2(4),
    REQUETE_ADM          VARCHAR2(1),
    CASIER_JUD           VARCHAR2(1),
    OBS_ENQUETE          VARCHAR2(500),
    DAT_REQUETE          DATE,
    COD_PROMO            VARCHAR2(4),
    F_MOJHD_CHEHID       VARCHAR2(1),
    ADM_TECH             VARCHAR2(10),
    ADRESSE_A            VARCHAR2(100),
    ID_FICHE_CANDIDAT    NUMBER,
    NOM_CAND_A           VARCHAR2(40),
    PREN_CAND_A          VARCHAR2(40),
    CONSTRAINT PK_FICHE_CANDIDAT PRIMARY KEY (NUM_FICHE),
    CONSTRAINT FK_FICHE_CAND_VILLE FOREIGN KEY (CODE_VILLE)
        REFERENCES VILLE (CODE_VILLE),
    CONSTRAINT FK_BONIFICATION FOREIGN KEY (COD_MOTIF_BONIF)
        REFERENCES TYPE_BONIFICATION (COD_MOTIF_BONIF),
    CONSTRAINT FK_NATIONALITE_CAND FOREIGN KEY (COD_NAT_P)
        REFERENCES PAYS (COD_PAYS)
);

COMMENT ON TABLE FICHE_CANDIDAT IS 'Fiche candidat aux concours du Ministère de la Santé';
COMMENT ON COLUMN FICHE_CANDIDAT.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN FICHE_CANDIDAT.MAT_PERS IS 'Matricule personnel après recrutement';
COMMENT ON COLUMN FICHE_CANDIDAT.NOM_CAND IS 'Nom du candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.PREN_CAND IS 'Prénom du candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.TYP_CAND IS 'E=externe, R=réintégration, D=sans concours, A=apprenti, P=parrainage, N=insertion professionnelle';
COMMENT ON COLUMN FICHE_CANDIDAT.NOM_JF IS 'Nom de jeune fille';
COMMENT ON COLUMN FICHE_CANDIDAT.DAT_NAIS IS 'Date de naissance';
COMMENT ON COLUMN FICHE_CANDIDAT.LIEU_NAIS IS 'Lieu de naissance';
COMMENT ON COLUMN FICHE_CANDIDAT.COD_NAT_P IS 'Code nationalité';
COMMENT ON COLUMN FICHE_CANDIDAT.ADRESSE IS 'Adresse du candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.IDENTIFIANT IS 'CIN, N° carte séjour ou N° passeport';
COMMENT ON COLUMN FICHE_CANDIDAT.TYP_IDENTIFIANT IS 'Type d''identifiant (CIN, carte séjour, passeport)';
COMMENT ON COLUMN FICHE_CANDIDAT.DAT_EMI_IDENT IS 'Date d''émission de l''identifiant';
COMMENT ON COLUMN FICHE_CANDIDAT.LIEU_EMI_IDENT IS 'Lieu d''émission de l''identifiant';
COMMENT ON COLUMN FICHE_CANDIDAT.SIT_FAM IS 'Situation familiale';
COMMENT ON COLUMN FICHE_CANDIDAT.NBR_ENF IS 'Nombre d''enfants';
COMMENT ON COLUMN FICHE_CANDIDAT.GRP_SANGUIN IS 'Groupe sanguin';
COMMENT ON COLUMN FICHE_CANDIDAT.ETAT_SANTE IS 'État de santé';
COMMENT ON COLUMN FICHE_CANDIDAT.HANDICAP IS '0=non handicapé, 1=handicap normal, 2=handicap prioritaire, 3=avec accompagnement';
COMMENT ON COLUMN FICHE_CANDIDAT.ANTECED_JUDICIAIRE IS 'Antécédent judiciaire';
COMMENT ON COLUMN FICHE_CANDIDAT.SERV_MILITAIRE IS 'Service militaire national';
COMMENT ON COLUMN FICHE_CANDIDAT.ACTION_PREVUE IS 'Action prévue pour le service militaire';
COMMENT ON COLUMN FICHE_CANDIDAT.DAT_CREAT_FICHE IS 'Date de création de la fiche';
COMMENT ON COLUMN FICHE_CANDIDAT.DAT_MAJ_FICHE IS 'Date dernière mise à jour';
COMMENT ON COLUMN FICHE_CANDIDAT.ETAT_FICHE IS '1=saisie, 2=validé, 3=sélectionné, 4=rejeté, 5=convoqué, 6=admis, 7=refusé, 8=retenu, 9=recruté';
COMMENT ON COLUMN FICHE_CANDIDAT.CODE_CONCOURS IS 'Code concours';
COMMENT ON COLUMN FICHE_CANDIDAT.MOYEN_FINAL IS 'Moyenne finale du concours';
COMMENT ON COLUMN FICHE_CANDIDAT.RESULT_FINAL IS 'A=admis, R=non admis';
COMMENT ON COLUMN FICHE_CANDIDAT.CLASSEMENT IS 'Classement du candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.CODE_MOYEN IS 'Moyen de convocation (poste, téléphone...)';
COMMENT ON COLUMN FICHE_CANDIDAT.SEXE IS 'Sexe du candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.CODE_VILLE IS 'Ville de résidence du candidat';
COMMENT ON COLUMN FICHE_CANDIDAT.COD_MOTIF_BONIF IS 'Type de bonification si applicable';
COMMENT ON COLUMN FICHE_CANDIDAT.COD_REFUS IS 'Code de refus pour demandes rejetées';
COMMENT ON COLUMN FICHE_CANDIDAT.COD_METIER IS 'Code regroupement emploi si retenu';
COMMENT ON COLUMN FICHE_CANDIDAT.COD_POST IS 'Code emploi si retenu';
COMMENT ON COLUMN FICHE_CANDIDAT.POURCENT_HAND IS 'Pourcentage de handicap';
COMMENT ON COLUMN FICHE_CANDIDAT.TYP_HANDICAP IS '0=physique, 1=intellectuelle, 2=vision, 3=audition';
COMMENT ON COLUMN FICHE_CANDIDAT.VM IS 'Visite médicale effectuée: O/N';
COMMENT ON COLUMN FICHE_CANDIDAT.DF IS 'Documents complémentaires fournis: O/N';
COMMENT ON COLUMN FICHE_CANDIDAT.REQUETE_ADM IS 'Requête administrative: F=favorable, D=défavorable';
COMMENT ON COLUMN FICHE_CANDIDAT.CASIER_JUD IS 'Casier judiciaire: F=favorable, D=défavorable';
COMMENT ON COLUMN FICHE_CANDIDAT.F_MOJHD_CHEHID IS 'M=fils de moudjahid, C=fils de chahid';
COMMENT ON COLUMN FICHE_CANDIDAT.NOM_CAND_A IS 'Nom candidat en arabe';
COMMENT ON COLUMN FICHE_CANDIDAT.PREN_CAND_A IS 'Prénom candidat en arabe';
COMMENT ON COLUMN FICHE_CANDIDAT.ADRESSE_A IS 'Adresse en arabe';

-- ----------------------------------------------------------------------------
-- 7B.5 STAGE : Stages probatoires des agents recrutés
-- ADAPTED: Stage probatoire fonction publique tunisienne (1 an titulaire,
-- 6 mois contractuel, prolongation possible)
-- ----------------------------------------------------------------------------
CREATE TABLE STAGE (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    MAT_PERS         VARCHAR2(10)    NOT NULL,
    DAT_DEBUT        DATE            NOT NULL,
    PERIODE          NUMBER,
    DAT_FIN          DATE            NOT NULL,
    ETAT             VARCHAR2(1),
    DAT_DEB_PROLG    DATE,
    DAT_FIN_PROLG    DATE,
    TYP_STAGE        VARCHAR2(1),
    PERIODE_PROLG    NUMBER,
    DAT_QUIT         DATE,
    DAT_TIT          DATE,
    TYP_DEPART       VARCHAR2(4),
    NUM_RETR         VARCHAR2(10),
    DAT_MEMOIR       DATE,
    DAT_REM_MEM      DATE,
    SUJET_MEM        VARCHAR2(300),
    ENCADREUR        VARCHAR2(100),
    OBJET_STAGE      VARCHAR2(300),
    RESULT_STAGE     VARCHAR2(1),
    COD_ALERT        VARCHAR2(4),
    SEQ_ALERT        NUMBER(10),
    ID_STAGE         NUMBER,
    DAT_DECISION     DATE,
    NUM_DECISION     VARCHAR2(20),
    CONSTRAINT PK_STAGE PRIMARY KEY (COD_SOC, MAT_PERS, DAT_DEBUT),
    CONSTRAINT FK_STAGE_PERSONNEL FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE STAGE IS 'Stages probatoires des agents recrutés dans la fonction publique santé';
COMMENT ON COLUMN STAGE.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN STAGE.MAT_PERS IS 'Matricule personnel (stagiaire)';
COMMENT ON COLUMN STAGE.DAT_DEBUT IS 'Date début du stage';
COMMENT ON COLUMN STAGE.PERIODE IS 'Période de stage en mois';
COMMENT ON COLUMN STAGE.DAT_FIN IS 'Date fin du stage';
COMMENT ON COLUMN STAGE.ETAT IS 'E=instance, V=titularisation, P=prolongé, F=fin de stage';
COMMENT ON COLUMN STAGE.DAT_DEB_PROLG IS 'Date début prolongation';
COMMENT ON COLUMN STAGE.DAT_FIN_PROLG IS 'Date fin prolongation';
COMMENT ON COLUMN STAGE.TYP_STAGE IS 'Stage première fois ou prolongation';
COMMENT ON COLUMN STAGE.PERIODE_PROLG IS 'Période de prolongation en mois';
COMMENT ON COLUMN STAGE.DAT_QUIT IS 'Date de départ si stage non concluant';
COMMENT ON COLUMN STAGE.DAT_TIT IS 'Date de titularisation si stage concluant';
COMMENT ON COLUMN STAGE.TYP_DEPART IS 'Motif de départ par défaut';
COMMENT ON COLUMN STAGE.NUM_RETR IS 'Numéro CNSS/CNRPS';
COMMENT ON COLUMN STAGE.DAT_MEMOIR IS 'Date de l''exposition du mémoire';
COMMENT ON COLUMN STAGE.DAT_REM_MEM IS 'Date de dépôt du mémoire';
COMMENT ON COLUMN STAGE.SUJET_MEM IS 'Sujet du mémoire';
COMMENT ON COLUMN STAGE.ENCADREUR IS 'Nom et prénom de l''encadreur';
COMMENT ON COLUMN STAGE.OBJET_STAGE IS 'Objectif attendu du stage';
COMMENT ON COLUMN STAGE.RESULT_STAGE IS 'Résultat du stage';
COMMENT ON COLUMN STAGE.DAT_DECISION IS 'Date de la décision';
COMMENT ON COLUMN STAGE.NUM_DECISION IS 'Numéro de la décision';

-- ----------------------------------------------------------------------------
-- 7B.6 DETAIL_CONTRAT : Détails / avenants des contrats
-- FK vers CONTRAT (PART 4)
-- ----------------------------------------------------------------------------
CREATE TABLE DETAIL_CONTRAT (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    MAT_PERS         VARCHAR2(10)    NOT NULL,
    NUM_CONTRAT      NUMBER          NOT NULL,
    DAT_DEBUT        DATE            NOT NULL,
    DAT_FIN          DATE,
    SALAIRE          NUMBER(12,3),
    COD_STAT         VARCHAR2(4),
    ID_DETAIL_CONTRAT NUMBER,
    CONSTRAINT PK_DETAIL_CONTRAT PRIMARY KEY (COD_SOC, MAT_PERS, NUM_CONTRAT, DAT_DEBUT),
    CONSTRAINT FK_DETAIL_CONT_CONTRAT FOREIGN KEY (COD_SOC, MAT_PERS, NUM_CONTRAT)
        REFERENCES CONTRAT (COD_SOC, MAT_PERS, NUM_CONTRAT)
);

COMMENT ON TABLE DETAIL_CONTRAT IS 'Détails et avenants des contrats de recrutement';
COMMENT ON COLUMN DETAIL_CONTRAT.DAT_DEBUT IS 'Date début de la période';
COMMENT ON COLUMN DETAIL_CONTRAT.DAT_FIN IS 'Date fin de la période';
COMMENT ON COLUMN DETAIL_CONTRAT.SALAIRE IS 'Montant mensuel octroyé pendant la période';

-- ----------------------------------------------------------------------------
-- 7B.7 PERSONNEL_RECRUT : Données pré-recrutement du personnel
-- ADAPTED: Table miroir de PERSONNEL pour préparer le recrutement
-- avant validation définitive et création dans PERSONNEL
-- ----------------------------------------------------------------------------
CREATE TABLE PERSONNEL_RECRUT (
    COD_SOC              VARCHAR2(4)     NOT NULL,
    MAT_PERS             VARCHAR2(10)    NOT NULL,
    COD_SERV             VARCHAR2(10),
    COD_FONCT            VARCHAR2(4),
    COD_CATEG            VARCHAR2(4),
    COD_CAT              VARCHAR2(4),
    COD_GRAD             VARCHAR2(4),
    COD_MOTIF            VARCHAR2(4),
    COD_NATP             VARCHAR2(4),
    COD_STAT             VARCHAR2(4),
    NOM_PERS             VARCHAR2(40),
    PREN_PERS            VARCHAR2(40),
    CIN                  VARCHAR2(20),
    SEXE                 VARCHAR2(1),
    DAT_SERV             DATE,
    DAT_FONCT            DATE,
    DAT_QUALF            DATE,
    DAT_CATEG            DATE,
    DAT_CAT              DATE,
    DAT_GRAD             DATE,
    DAT_ECH              DATE,
    DAT_EMB              DATE,
    DAT_ENT              DATE,
    DAT_TIT              DATE,
    DAT_MOTIF            DATE,
    DAT_NAIS             DATE,
    ETAT_ACT             VARCHAR2(1),
    PER_MAT_PERS         VARCHAR2(10),
    QUALF                VARCHAR2(4),
    COD_SIT              VARCHAR2(1),
    DAT_SIT              DATE,
    CHEF_FAM             VARCHAR2(1),
    NBRE_ENF             NUMBER(2),
    CHARG_ENF            VARCHAR2(4),
    CHARG_ALL            VARCHAR2(4),
    FCT_FAM              VARCHAR2(1),
    COD_ECH              NUMBER(2),
    COD_AFFECT           VARCHAR2(4),
    COD_NIVEAU           VARCHAR2(5),
    NOM_JF               VARCHAR2(80),
    NOM_PERS_A           VARCHAR2(60),
    PREN_PERS_A          VARCHAR2(60),
    POSTE_TRAV           VARCHAR2(15),
    COD_METIER           VARCHAR2(4),
    COD_USER             VARCHAR2(10),
    DAT_MAJ              DATE,
    ADM_TECH             VARCHAR2(10),
    DAT_STAT             DATE,
    DAT_CIN              DATE,
    LIE_EMI_CIN          VARCHAR2(100),
    DAT_AFFECT           DATE,
    LIEU_NAIS            VARCHAR2(200),
    COD_LIEU_GEOG        VARCHAR2(10),
    DAT_LIEU_GEOG        DATE,
    GRP_SANG             VARCHAR2(3),
    NUM_RETR             VARCHAR2(12),
    COD_FIL              VARCHAR2(4),
    DAT_FIL              DATE,
    SERV_MIL             VARCHAR2(2),
    CODE_DOMAINE         VARCHAR2(10),
    COD_UR               VARCHAR2(10),
    COD_CLASS            VARCHAR2(4),
    DAT_CLASS            DATE,
    COD_TYP_DEPART       VARCHAR2(4),
    DAT_DEPART           DATE,
    DAT_UR               DATE,
    ORG_SERV             VARCHAR2(15),
    DAT_POSTE_TRAV       DATE,
    COD_NAT_RECR         VARCHAR2(4),
    DAT_ADM_TECH         DATE,
    DAT_ORG_SERV         DATE,
    NOM_JF_A             VARCHAR2(40),
    COD_CAT_CLASS        VARCHAR2(4),
    MAINTIEN_PERS        VARCHAR2(1),
    MAINTIEN_DATE        DATE,
    TYP_RANG             VARCHAR2(1),
    HANDICAP             VARCHAR2(1),
    POURCENT_HAND        NUMBER(5,2),
    TYP_HANDICAP         VARCHAR2(1),
    NUM_FICH_HAND        VARCHAR2(10),
    NIV_SAL              NUMBER(4),
    COD_ASSUR            VARCHAR2(4),
    NUM_ASSUR            VARCHAR2(10),
    COD_RETR             VARCHAR2(5),
    TYP_ID               VARCHAR2(1),
    ETAT_SANTE           VARCHAR2(1),
    DAT_EFF_FICH_HAND    DATE,
    DAT_FIN_FICH_HAND    DATE,
    REF_FONCT            VARCHAR2(20),
    NAT_TEXTE_FONCT      VARCHAR2(2),
    NOUV_DAT_ECH         DATE,
    DAT_NIV_SAL          DATE,
    DAT_ASS              DATE,
    DAT_AFF_CNAM         DATE,
    ETAT_POSTE_TRAV      VARCHAR2(1),
    ETAT                 VARCHAR2(1),
    COD_TYP_CONT         VARCHAR2(4),
    COD_BANQ             VARCHAR2(4),
    COD_AGC              VARCHAR2(5),
    CPT_BANQ_PERS        VARCHAR2(25),
    ID_PERSONNEL_RECRUT  NUMBER,
    NUM_DECIS            VARCHAR2(20),
    DAT_DECIS            DATE,
    CONSTRAINT PK_PERSONNEL_REC PRIMARY KEY (COD_SOC, MAT_PERS)
);

COMMENT ON TABLE PERSONNEL_RECRUT IS 'Données pré-recrutement avant validation et création dans PERSONNEL';
COMMENT ON COLUMN PERSONNEL_RECRUT.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN PERSONNEL_RECRUT.MAT_PERS IS 'Matricule personnel';
COMMENT ON COLUMN PERSONNEL_RECRUT.NOM_PERS IS 'Nom de l''agent';
COMMENT ON COLUMN PERSONNEL_RECRUT.PREN_PERS IS 'Prénom de l''agent';
COMMENT ON COLUMN PERSONNEL_RECRUT.NOM_PERS_A IS 'Nom en arabe';
COMMENT ON COLUMN PERSONNEL_RECRUT.PREN_PERS_A IS 'Prénom en arabe';
COMMENT ON COLUMN PERSONNEL_RECRUT.ETAT IS 'I=instance, V=validé (personnel créé)';
COMMENT ON COLUMN PERSONNEL_RECRUT.NUM_RETR IS 'Numéro CNRPS/CNSS';
COMMENT ON COLUMN PERSONNEL_RECRUT.COD_NAT_RECR IS 'Nature de recrutement';
COMMENT ON COLUMN PERSONNEL_RECRUT.NUM_DECIS IS 'Numéro de la décision de recrutement';
COMMENT ON COLUMN PERSONNEL_RECRUT.DAT_DECIS IS 'Date de la décision de recrutement';

-- ============================================================================
-- PART 7C : Tables détails de l''avis de recrutement
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7C.1 DIPLOME_AVIS : Diplômes requis par avis
-- ADAPTED: Diplômes exigés (infirmier, sage-femme, médecin, pharmacien...)
-- ----------------------------------------------------------------------------
CREATE TABLE DIPLOME_AVIS (
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    ORDR_AVIS        NUMBER          NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    COD_NIVEAU       VARCHAR2(5)     NOT NULL,
    CODE_OPTION      VARCHAR2(10),
    COD_ETAB         VARCHAR2(15),
    DATE_OBT         DATE,
    ETAT             VARCHAR2(1),
    OBLIG            VARCHAR2(1),
    ID_DIPLOME_AVIS  NUMBER,
    CONSTRAINT PK_DIPLOME_AVIS PRIMARY KEY (NUM_AVIS, ORDR_AVIS, CODE_DOMAINE, COD_NIVEAU),
    CONSTRAINT FK_DIPLOM_DIP FOREIGN KEY (COD_NIVEAU)
        REFERENCES PARAM_NIVEAU (COD_NIVEAU),
    CONSTRAINT FK_DIPLOME_AVIS FOREIGN KEY (NUM_AVIS)
        REFERENCES AVIS (NUM_AVIS)
);

COMMENT ON TABLE DIPLOME_AVIS IS 'Diplômes requis par ligne d''avis';
COMMENT ON COLUMN DIPLOME_AVIS.COD_NIVEAU IS 'Code diplôme requis';
COMMENT ON COLUMN DIPLOME_AVIS.CODE_DOMAINE IS 'Spécialité';
COMMENT ON COLUMN DIPLOME_AVIS.OBLIG IS 'Obligatoire ou non';
COMMENT ON COLUMN DIPLOME_AVIS.DATE_OBT IS 'Date d''obtention requise';

-- ----------------------------------------------------------------------------
-- 7C.2 DIVERS_AVIS : Éléments divers requis par avis (permis, certificats)
-- ----------------------------------------------------------------------------
CREATE TABLE DIVERS_AVIS (
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    ORDR_AVIS        NUMBER          NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    CODE_DIVERS      VARCHAR2(10)    NOT NULL,
    OBSERVATION      VARCHAR2(30),
    ETAT             VARCHAR2(1),
    NBR_DIVERS_AVIS  NUMBER,
    OBLIG            VARCHAR2(1),
    COD_SOC          VARCHAR2(4),
    ID_DIVERS_AVIS   NUMBER,
    CONSTRAINT PK_DIVERS_AVIS PRIMARY KEY (NUM_AVIS, ORDR_AVIS, CODE_DOMAINE, CODE_DIVERS),
    CONSTRAINT FK_DIVERS_AVIS FOREIGN KEY (NUM_AVIS)
        REFERENCES AVIS (NUM_AVIS),
    CONSTRAINT FK_DIVERS_DIVERS FOREIGN KEY (CODE_DIVERS)
        REFERENCES LISTE_DIVERS (CODE_DIVERS)
);

COMMENT ON TABLE DIVERS_AVIS IS 'Éléments divers requis par avis (permis, certificats...)';
COMMENT ON COLUMN DIVERS_AVIS.CODE_DIVERS IS 'Code élément divers';
COMMENT ON COLUMN DIVERS_AVIS.OBLIG IS 'Obligatoire ou non';
COMMENT ON COLUMN DIVERS_AVIS.OBSERVATION IS 'Observation complémentaire';

-- ----------------------------------------------------------------------------
-- 7C.3 FORM_AVIS : Formations requises par avis
-- REMOVED FK: FK_FORMATION_FORMAT → FORMATION (hors périmètre)
-- ----------------------------------------------------------------------------
CREATE TABLE FORM_AVIS (
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    ORDR_AVIS        NUMBER          NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    COD_FORM         VARCHAR2(10)    NOT NULL,
    COD_ETAB         VARCHAR2(15),
    DUREE            NUMBER,
    TYP_DUREE        VARCHAR2(1),
    ETAT             VARCHAR2(1),
    OBLIG            VARCHAR2(1),
    ID_FORM_AVIS     NUMBER,
    CONSTRAINT PK_FORMATION_AVIS PRIMARY KEY (NUM_AVIS, ORDR_AVIS, CODE_DOMAINE, COD_FORM),
    CONSTRAINT FK_FORMATION_AVIS FOREIGN KEY (NUM_AVIS)
        REFERENCES AVIS (NUM_AVIS)
);

COMMENT ON TABLE FORM_AVIS IS 'Formations requises par avis de recrutement';
COMMENT ON COLUMN FORM_AVIS.COD_FORM IS 'Code formation requise';
COMMENT ON COLUMN FORM_AVIS.DUREE IS 'Durée de la formation';
COMMENT ON COLUMN FORM_AVIS.TYP_DUREE IS 'Unité: J=jour, M=mois, A=année';
COMMENT ON COLUMN FORM_AVIS.OBLIG IS 'Obligatoire ou non';

-- ----------------------------------------------------------------------------
-- 7C.4 DOCUMENT_AVIS : Documents à fournir par ligne d''avis
-- ADAPTED: Documents secteur santé (diplôme médical, aptitude physique,
-- certificat de vaccination, inscription à l''ordre professionnel...)
-- ----------------------------------------------------------------------------
CREATE TABLE DOCUMENT_AVIS (
    ORDR_AVIS        NUMBER          NOT NULL,
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    COD_DOC          VARCHAR2(10)    NOT NULL,
    NBR              NUMBER,
    OBLIG            VARCHAR2(1),
    COD_SOC          VARCHAR2(4),
    ID_DOCUMENT_AVIS NUMBER,
    CONSTRAINT PK_DOCUMENT_AVIS PRIMARY KEY (ORDR_AVIS, NUM_AVIS, CODE_DOMAINE, COD_DOC),
    CONSTRAINT FK_DOCUMENT_AVIS FOREIGN KEY (NUM_AVIS, CODE_DOMAINE, ORDR_AVIS)
        REFERENCES LINE_AVIS (NUM_AVIS, CODE_DOMAINE, ORDR_AVIS)
);

COMMENT ON TABLE DOCUMENT_AVIS IS 'Documents à fournir par les candidats pour l''avis';
COMMENT ON COLUMN DOCUMENT_AVIS.COD_DOC IS 'Code du document';
COMMENT ON COLUMN DOCUMENT_AVIS.NBR IS 'Nombre de copies requises';
COMMENT ON COLUMN DOCUMENT_AVIS.OBLIG IS 'Obligatoire ou non';

-- ----------------------------------------------------------------------------
-- 7C.5 DET_LINE_AVIS : Détail des postes par ligne d''avis
-- Ventilation par métier et poste de travail
-- ----------------------------------------------------------------------------
CREATE TABLE DET_LINE_AVIS (
    ORDR_AVIS        NUMBER          NOT NULL,
    NUM_AVIS         VARCHAR2(6)     NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    COD_METIER       VARCHAR2(4)     NOT NULL,
    COD_POST         VARCHAR2(15)    NOT NULL,
    NOMBRE           NUMBER,
    OBLIG            VARCHAR2(1),
    ID_DET_LINE_AVIS NUMBER,
    CONSTRAINT PK_DET_LINE_AVIS PRIMARY KEY (ORDR_AVIS, NUM_AVIS, CODE_DOMAINE, COD_METIER, COD_POST)
);

COMMENT ON TABLE DET_LINE_AVIS IS 'Détail des postes par ligne d''avis (ventilation métier/poste)';
COMMENT ON COLUMN DET_LINE_AVIS.COD_METIER IS 'Code métier';
COMMENT ON COLUMN DET_LINE_AVIS.COD_POST IS 'Code poste de travail';
COMMENT ON COLUMN DET_LINE_AVIS.NOMBRE IS 'Nombre de postes';
COMMENT ON COLUMN DET_LINE_AVIS.OBLIG IS 'O=oui, N=non';

-- ============================================================================
-- PART 7D : Tables concours et épreuves
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7D.1 LINE_CONCOURS : Épreuves d''un concours
-- REMOVED FK: FK_LANGUE_CONC → LANGUE (hors périmètre)
-- ----------------------------------------------------------------------------
CREATE TABLE LINE_CONCOURS (
    CODE_EPREUVE     VARCHAR2(10)    NOT NULL,
    CODE_CONCOURS    VARCHAR2(10)    NOT NULL,
    COEF             NUMBER(4,2),
    NOT_ELIM         NUMBER(4,2),
    CODE_LANGUE      VARCHAR2(10),
    DUREE            NUMBER,
    SPECIAL          VARCHAR2(1),
    DAT_EPREUVE      DATE,
    HEUR_DEB_EPREUVE NUMBER(2),
    MIN_DEB_EPREUVE  NUMBER(2),
    HEUR_FIN_EPREUVE NUMBER(2),
    MIN_FIN_EPREUVE  NUMBER(2),
    NBR_NOTE         NUMBER,
    COD_SOC          VARCHAR2(4),
    ID_LINE_CONCOURS NUMBER,
    CONSTRAINT PK_LINE_CONCOURS PRIMARY KEY (CODE_EPREUVE, CODE_CONCOURS),
    CONSTRAINT FK_EPREUVE_CONC FOREIGN KEY (CODE_EPREUVE)
        REFERENCES EPREUVE (CODE_EPREUVE),
    CONSTRAINT FK_LINE_CONCOURS FOREIGN KEY (CODE_CONCOURS)
        REFERENCES CONCOURS (CODE_CONCOURS)
);

COMMENT ON TABLE LINE_CONCOURS IS 'Épreuves composant un concours de recrutement';
COMMENT ON COLUMN LINE_CONCOURS.CODE_EPREUVE IS 'Code de l''épreuve';
COMMENT ON COLUMN LINE_CONCOURS.CODE_CONCOURS IS 'Code du concours';
COMMENT ON COLUMN LINE_CONCOURS.COEF IS 'Coefficient de l''épreuve';
COMMENT ON COLUMN LINE_CONCOURS.NOT_ELIM IS 'Note éliminatoire (non utilisé)';
COMMENT ON COLUMN LINE_CONCOURS.CODE_LANGUE IS 'Langue de l''épreuve';
COMMENT ON COLUMN LINE_CONCOURS.DUREE IS 'Durée de l''épreuve';
COMMENT ON COLUMN LINE_CONCOURS.SPECIAL IS 'Épreuve dans la spécialité ou non';
COMMENT ON COLUMN LINE_CONCOURS.DAT_EPREUVE IS 'Date de l''épreuve';
COMMENT ON COLUMN LINE_CONCOURS.HEUR_DEB_EPREUVE IS 'Heure début';
COMMENT ON COLUMN LINE_CONCOURS.MIN_DEB_EPREUVE IS 'Minute début';
COMMENT ON COLUMN LINE_CONCOURS.HEUR_FIN_EPREUVE IS 'Heure fin';
COMMENT ON COLUMN LINE_CONCOURS.MIN_FIN_EPREUVE IS 'Minute fin';
COMMENT ON COLUMN LINE_CONCOURS.NBR_NOTE IS 'Nombre de notes par épreuve';

-- ----------------------------------------------------------------------------
-- 7D.2 SALLE_CONCOURS : Affectation des salles aux concours
-- ----------------------------------------------------------------------------
CREATE TABLE SALLE_CONCOURS (
    CODE_CONCOURS    VARCHAR2(10)    NOT NULL,
    COD_SALLE        VARCHAR2(2)     NOT NULL,
    CAPACITE_REEL    NUMBER,
    CAPACITE_CONC    NUMBER,
    CODE_EPREUVE     VARCHAR2(10)    NOT NULL,
    COD_ETAB_CONC    VARCHAR2(4)     NOT NULL,
    VALIDE           VARCHAR2(1),
    COD_SOC          VARCHAR2(4),
    ID_SALLE_CONCOURS NUMBER,
    CONSTRAINT PK_SALLE_CONCOURS PRIMARY KEY (CODE_CONCOURS, COD_ETAB_CONC, COD_SALLE, CODE_EPREUVE),
    CONSTRAINT FK1_SALLE_CONCOURS FOREIGN KEY (COD_ETAB_CONC, COD_SALLE)
        REFERENCES SALLE (COD_ETAB_CONC, COD_SALLE),
    CONSTRAINT FK_SALLE_CONC_CONC FOREIGN KEY (CODE_CONCOURS)
        REFERENCES CONCOURS (CODE_CONCOURS)
);

COMMENT ON TABLE SALLE_CONCOURS IS 'Affectation des salles d''examen aux concours';
COMMENT ON COLUMN SALLE_CONCOURS.CODE_CONCOURS IS 'Code concours';
COMMENT ON COLUMN SALLE_CONCOURS.COD_SALLE IS 'Code salle';
COMMENT ON COLUMN SALLE_CONCOURS.CAPACITE_REEL IS 'Capacité réelle de la salle';
COMMENT ON COLUMN SALLE_CONCOURS.CAPACITE_CONC IS 'Capacité selon le concours';
COMMENT ON COLUMN SALLE_CONCOURS.CODE_EPREUVE IS 'Épreuve pour laquelle la salle est occupée';
COMMENT ON COLUMN SALLE_CONCOURS.VALIDE IS 'S=saisie, V=validé';

-- ============================================================================
-- PART 7E : Tables détails candidat
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7E.1 COMPETENCE_CANDIDAT : Compétences déclarées par le candidat
-- REMOVED FK: FK_COMPET → COMPETENCE (hors périmètre)
-- ----------------------------------------------------------------------------
CREATE TABLE COMPETENCE_CANDIDAT (
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    COD_NAT_COMP     VARCHAR2(4)     NOT NULL,
    COD_COMP         VARCHAR2(15)    NOT NULL,
    ID_COMPETENCE_CANDIDAT NUMBER,
    CONSTRAINT PK_COMP_CAND PRIMARY KEY (NUM_FICHE, COD_NAT_COMP, COD_COMP),
    CONSTRAINT FK_COMP_CAND FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE COMPETENCE_CANDIDAT IS 'Compétences déclarées par le candidat';
COMMENT ON COLUMN COMPETENCE_CANDIDAT.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN COMPETENCE_CANDIDAT.COD_NAT_COMP IS 'Nature de la compétence';
COMMENT ON COLUMN COMPETENCE_CANDIDAT.COD_COMP IS 'Code compétence';

-- ----------------------------------------------------------------------------
-- 7E.2 FORM_CAND : Formations du candidat
-- REMOVED FK: FK_FORMATION → FORMATION (hors périmètre)
-- ----------------------------------------------------------------------------
CREATE TABLE FORM_CAND (
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    COD_FORM         VARCHAR2(10)    NOT NULL,
    DUREE            NUMBER,
    TYP_DUREE_FC     VARCHAR2(1),
    COD_ETAB         VARCHAR2(15),
    ID_FORM_CAND     NUMBER,
    CONSTRAINT PK_FORM_CANDIDAT PRIMARY KEY (NUM_FICHE, COD_FORM),
    CONSTRAINT FK_FORM_FICHE_CANDIDAT FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE FORM_CAND IS 'Formations suivies par le candidat';
COMMENT ON COLUMN FORM_CAND.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN FORM_CAND.COD_FORM IS 'Code formation';
COMMENT ON COLUMN FORM_CAND.DUREE IS 'Durée de la formation';
COMMENT ON COLUMN FORM_CAND.TYP_DUREE_FC IS 'Unité: J=jour, M=mois, A=année';
COMMENT ON COLUMN FORM_CAND.COD_ETAB IS 'Organisme formateur';

-- ----------------------------------------------------------------------------
-- 7E.3 FAMILLE_CANDIDAT : Membres de la famille du candidat
-- FK vers ACTIVITE_FAMILLE (PART 2) et FICHE_CANDIDAT
-- CHECK constraints: SEXE in (M,F), PARENTE in (E,C,M,P,D,V)
-- ----------------------------------------------------------------------------
CREATE TABLE FAMILLE_CANDIDAT (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    NUM_FICHE        VARCHAR2(15),
    NUM_FAM          NUMBER(2)       NOT NULL,
    COD_ACTIVITE     VARCHAR2(4),
    SEXE             VARCHAR2(1),
    NOM              VARCHAR2(60),
    NOM_A            VARCHAR2(60),
    PRENOM           VARCHAR2(35)    NOT NULL,
    PRENOM_A         VARCHAR2(35),
    PARENTE          VARCHAR2(1)     NOT NULL,
    DAT_MAR          DATE,
    NOM_JF           VARCHAR2(40),
    DAT_NAISS        DATE,
    DAT_DECE         DATE,
    TYP_CIN          VARCHAR2(1),
    CIN              VARCHAR2(20),
    DAT_CIN          DATE,
    NUM_MERE         NUMBER(2),
    ID_FAMILLE       NUMBER,
    COD_USER         VARCHAR2(10),
    CONSTRAINT CK_FAM_CAND_SEXE CHECK (SEXE IN ('M','F')),
    CONSTRAINT CK_FAM_CAND_PARENTE CHECK (PARENTE IN ('E','C','M','P','D','V')),
    CONSTRAINT FAMILLE_CANDIDAT_PK PRIMARY KEY (COD_SOC, NUM_FICHE, NUM_FAM),
    CONSTRAINT FK_FAM_CAND_ACTIVITE FOREIGN KEY (COD_ACTIVITE, PARENTE)
        REFERENCES ACTIVITE_FAMILLE (COD_ACTIVITE, PARENTE_ACT),
    CONSTRAINT FK_FAMILLE_FICHE_CAND FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE FAMILLE_CANDIDAT IS 'Membres de la famille du candidat';
COMMENT ON COLUMN FAMILLE_CANDIDAT.NUM_FAM IS '99=conjoint, 97=mère, 98=père, 1..80=enfants, 81=grand-père, 82=grand-mère';
COMMENT ON COLUMN FAMILLE_CANDIDAT.PARENTE IS 'Lien: E=enfant, C=conjoint, M=mère, P=père, D=grand-mère, V=grand-père';
COMMENT ON COLUMN FAMILLE_CANDIDAT.SEXE IS 'Sexe: M=masculin, F=féminin';
COMMENT ON COLUMN FAMILLE_CANDIDAT.COD_ACTIVITE IS 'Activité du membre de la famille';
COMMENT ON COLUMN FAMILLE_CANDIDAT.TYP_CIN IS '1=CIN, 2=passeport, 3=carte séjour';
COMMENT ON COLUMN FAMILLE_CANDIDAT.DAT_MAR IS 'Date de mariage (pour le conjoint)';
COMMENT ON COLUMN FAMILLE_CANDIDAT.NOM_JF IS 'Nom de jeune fille (pour le conjoint)';

-- ----------------------------------------------------------------------------
-- 7E.4 EXPERIENCE_CAND : Expériences professionnelles du candidat
-- FK vers LISTE_DOMAINE (PART 1) et FICHE_CANDIDAT
-- ----------------------------------------------------------------------------
CREATE TABLE EXPERIENCE_CAND (
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    CODE_DOMAINE     VARCHAR2(10)    NOT NULL,
    COD_ETAB         VARCHAR2(15),
    DUREE_AVIS       NUMBER,
    TYP_DUREE_FC     VARCHAR2(1),
    COD_FONCT        VARCHAR2(4),
    CONSTRAINT PK_EXPERIENCE_CAND PRIMARY KEY (NUM_FICHE, CODE_DOMAINE),
    CONSTRAINT FK_DOMAINE_EXP FOREIGN KEY (CODE_DOMAINE)
        REFERENCES LISTE_DOMAINE (CODE_DOMAINE),
    CONSTRAINT FK_EXP_FICHE_CANDIDAT FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE EXPERIENCE_CAND IS 'Expériences professionnelles du candidat';
COMMENT ON COLUMN EXPERIENCE_CAND.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN EXPERIENCE_CAND.CODE_DOMAINE IS 'Domaine/spécialité de l''expérience';
COMMENT ON COLUMN EXPERIENCE_CAND.COD_ETAB IS 'Établissement de l''expérience';
COMMENT ON COLUMN EXPERIENCE_CAND.DUREE_AVIS IS 'Durée de l''expérience';
COMMENT ON COLUMN EXPERIENCE_CAND.TYP_DUREE_FC IS 'Unité de durée';

-- ----------------------------------------------------------------------------
-- 7E.5 DOC_CAND : Documents fournis par le candidat
-- ----------------------------------------------------------------------------
CREATE TABLE DOC_CAND (
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    COD_DOC          VARCHAR2(10)    NOT NULL,
    NBR              NUMBER,
    DAT_DOC          DATE,
    VALID            VARCHAR2(1),
    COD_SOC          VARCHAR2(4),
    ID_DOC_CAND      NUMBER,
    CONSTRAINT PK_DOC_CANDIDAT PRIMARY KEY (NUM_FICHE, COD_DOC),
    CONSTRAINT FK_DOC_FICHE_CANDIDAT FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE DOC_CAND IS 'Documents fournis par le candidat';
COMMENT ON COLUMN DOC_CAND.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN DOC_CAND.COD_DOC IS 'Code du document';
COMMENT ON COLUMN DOC_CAND.NBR IS 'Nombre de copies fournies';
COMMENT ON COLUMN DOC_CAND.DAT_DOC IS 'Date du document';
COMMENT ON COLUMN DOC_CAND.VALID IS 'Document validé ou non';

-- ----------------------------------------------------------------------------
-- 7E.6 DET_FICHE_CANDIDAT : Résultats du candidat par concours
-- Permet à un candidat de participer à plusieurs concours
-- ----------------------------------------------------------------------------
CREATE TABLE DET_FICHE_CANDIDAT (
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    CODE_CONCOURS    VARCHAR2(10)    NOT NULL,
    ETAT_FICHE       VARCHAR2(1),
    MOYEN_FINAL      NUMBER,
    RESULT_FINAL     VARCHAR2(1),
    CLASSEMENT       NUMBER(4),
    CONSTRAINT PK_DET_FICHE_CANDIDAT PRIMARY KEY (NUM_FICHE, CODE_CONCOURS),
    CONSTRAINT FK_DET_FICHE_CANDIDAT FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE DET_FICHE_CANDIDAT IS 'Résultats du candidat ventilés par concours';
COMMENT ON COLUMN DET_FICHE_CANDIDAT.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN DET_FICHE_CANDIDAT.CODE_CONCOURS IS 'Code concours';
COMMENT ON COLUMN DET_FICHE_CANDIDAT.ETAT_FICHE IS 'État de la fiche pour ce concours';
COMMENT ON COLUMN DET_FICHE_CANDIDAT.MOYEN_FINAL IS 'Moyenne finale obtenue';
COMMENT ON COLUMN DET_FICHE_CANDIDAT.RESULT_FINAL IS 'A=admis, R=non admis';
COMMENT ON COLUMN DET_FICHE_CANDIDAT.CLASSEMENT IS 'Classement du candidat';

-- ----------------------------------------------------------------------------
-- 7E.7 CAND_DIPLOM : Diplômes du candidat
-- FK vers PARAM_NIVEAU (PART 1) et FICHE_CANDIDAT
-- REMOVED FK: FK_CAND_DIP_OPTION → OPTION_DIPLOM (hors périmètre)
-- ----------------------------------------------------------------------------
CREATE TABLE CAND_DIPLOM (
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    COD_NIVEAU       VARCHAR2(5)     NOT NULL,
    DAT_NIV          DATE,
    CODE_DOMAINE     VARCHAR2(10),
    CODE_OPTION      VARCHAR2(10),
    COD_ETAB         VARCHAR2(15),
    TYP_NIVEAU       VARCHAR2(1),
    ID_CAND_DIPLOM   NUMBER,
    CONSTRAINT PK_CAND_DIPLOME PRIMARY KEY (NUM_FICHE, COD_NIVEAU),
    CONSTRAINT FK_CANDIDAT_NIVEAU FOREIGN KEY (COD_NIVEAU)
        REFERENCES PARAM_NIVEAU (COD_NIVEAU),
    CONSTRAINT FK_CAND_DIPLOM_CANDIDAT FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE CAND_DIPLOM IS 'Diplômes obtenus par le candidat';
COMMENT ON COLUMN CAND_DIPLOM.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN CAND_DIPLOM.COD_NIVEAU IS 'Code niveau/diplôme';
COMMENT ON COLUMN CAND_DIPLOM.DAT_NIV IS 'Date d''obtention du diplôme';
COMMENT ON COLUMN CAND_DIPLOM.CODE_DOMAINE IS 'Spécialité';
COMMENT ON COLUMN CAND_DIPLOM.CODE_OPTION IS 'Option du diplôme (non utilisé)';
COMMENT ON COLUMN CAND_DIPLOM.COD_ETAB IS 'Établissement d''études';
COMMENT ON COLUMN CAND_DIPLOM.TYP_NIVEAU IS 'D=diplôme, N=niveau';

-- ----------------------------------------------------------------------------
-- 7E.8 DIVERS_CAND : Éléments divers du candidat (permis, etc.)
-- FK vers LISTE_DIVERS et FICHE_CANDIDAT
-- ----------------------------------------------------------------------------
CREATE TABLE DIVERS_CAND (
    CODE_DIVERS      VARCHAR2(10)    NOT NULL,
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    OBSERVATION      VARCHAR2(30),
    OBSERVATION_A    VARCHAR2(30),
    COD_SOC          VARCHAR2(4),
    ID_DIVERS_CAND   NUMBER,
    CONSTRAINT PK_DIVERS_CANDIDAT PRIMARY KEY (CODE_DIVERS, NUM_FICHE),
    CONSTRAINT FK_DIVERS FOREIGN KEY (CODE_DIVERS)
        REFERENCES LISTE_DIVERS (CODE_DIVERS),
    CONSTRAINT FK_DIVERS_CANDIDAT FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE)
);

COMMENT ON TABLE DIVERS_CAND IS 'Éléments divers du candidat (permis, certificats...)';
COMMENT ON COLUMN DIVERS_CAND.CODE_DIVERS IS 'Code élément divers (permis, etc.)';
COMMENT ON COLUMN DIVERS_CAND.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN DIVERS_CAND.OBSERVATION IS 'Détails en français';
COMMENT ON COLUMN DIVERS_CAND.OBSERVATION_A IS 'Détails en arabe';

-- ============================================================================
-- PART 7F : Tables évaluation, direction des besoins, évaluation de stage
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7F.1 LIGNE_DIR : Lignes directrices des besoins en recrutement
-- FK vers POSTE_TRAV (PART 2)
-- REMOVED FK: FK_LIGNE_DIR_SOURCE_BESOIN → SOURCE_BESOIN (hors périmètre)
-- ADAPTED: Expression des besoins par structure sanitaire
-- ----------------------------------------------------------------------------
CREATE TABLE LIGNE_DIR (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    COD_SERV         VARCHAR2(10)    NOT NULL,
    DAT_DIR          DATE            NOT NULL,
    COD_AFF          VARCHAR2(10)    NOT NULL,
    COD_METIER       VARCHAR2(4)     NOT NULL,
    COD_POST         VARCHAR2(15)    NOT NULL,
    COD_SOURCE       VARCHAR2(6),
    NAT_CAND         VARCHAR2(1),
    NIV_URGENCE      VARCHAR2(1),
    AGE_MIN          NUMBER(2),
    AGE_MAX          NUMBER(2),
    NBRE_FEM         NUMBER,
    NBRE_MASC        NUMBER,
    NBRE_GEN         NUMBER,
    VALID            VARCHAR2(1),
    OBSERV           VARCHAR2(1000),
    SERV_CIBLE       VARCHAR2(10),
    ID_LIGNE_DIR     NUMBER,
    CONSTRAINT PK_LIGNE_DIR PRIMARY KEY (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST),
    CONSTRAINT FK_LIGNE_DIR_POSTE FOREIGN KEY (COD_POST)
        REFERENCES POSTE_TRAV (COD_POST)
);

COMMENT ON TABLE LIGNE_DIR IS 'Lignes directrices - expression des besoins en recrutement par structure';
COMMENT ON COLUMN LIGNE_DIR.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN LIGNE_DIR.COD_SERV IS 'Service demandeur';
COMMENT ON COLUMN LIGNE_DIR.DAT_DIR IS 'Date de la demande';
COMMENT ON COLUMN LIGNE_DIR.COD_AFF IS 'Code affectation';
COMMENT ON COLUMN LIGNE_DIR.COD_METIER IS 'Code métier demandé';
COMMENT ON COLUMN LIGNE_DIR.COD_POST IS 'Poste de travail demandé';
COMMENT ON COLUMN LIGNE_DIR.NAT_CAND IS 'Nature du candidat recherché';
COMMENT ON COLUMN LIGNE_DIR.NIV_URGENCE IS 'Niveau d''urgence du besoin';
COMMENT ON COLUMN LIGNE_DIR.NBRE_FEM IS 'Nombre requis - femmes';
COMMENT ON COLUMN LIGNE_DIR.NBRE_MASC IS 'Nombre requis - hommes';
COMMENT ON COLUMN LIGNE_DIR.NBRE_GEN IS 'Nombre requis - total';
COMMENT ON COLUMN LIGNE_DIR.SERV_CIBLE IS 'Service cible d''affectation';

-- ----------------------------------------------------------------------------
-- 7F.2 DIPLOME_DIR : Diplômes requis par ligne directrice
-- FK vers LIGNE_DIR et PARAM_NIVEAU (PART 1)
-- ----------------------------------------------------------------------------
CREATE TABLE DIPLOME_DIR (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    COD_SERV         VARCHAR2(10)    NOT NULL,
    DAT_DIR          DATE            NOT NULL,
    COD_AFF          VARCHAR2(10)    NOT NULL,
    COD_METIER       VARCHAR2(4)     NOT NULL,
    COD_POST         VARCHAR2(15)    NOT NULL,
    COD_NIVEAU       VARCHAR2(5)     NOT NULL,
    CODE_OPTION      VARCHAR2(10),
    COD_ETAB         VARCHAR2(15),
    DATE_OBT         DATE,
    ETAT             VARCHAR2(1),
    OBLIG            VARCHAR2(1),
    ID_DIPLOME_DIR   NUMBER,
    CONSTRAINT PK_DIPLOME_DIR PRIMARY KEY (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST, COD_NIVEAU),
    CONSTRAINT FK_DIPLOME_DIR FOREIGN KEY (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST)
        REFERENCES LIGNE_DIR (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST),
    CONSTRAINT FK_DIPLOME_DIR_NIV FOREIGN KEY (COD_NIVEAU)
        REFERENCES PARAM_NIVEAU (COD_NIVEAU)
);

COMMENT ON TABLE DIPLOME_DIR IS 'Diplômes requis par ligne directrice de besoin';
COMMENT ON COLUMN DIPLOME_DIR.COD_NIVEAU IS 'Code diplôme requis';
COMMENT ON COLUMN DIPLOME_DIR.OBLIG IS 'Obligatoire ou non';

-- ----------------------------------------------------------------------------
-- 7F.3 DIVERS_DIR : Éléments divers requis par ligne directrice
-- FK vers LIGNE_DIR et LISTE_DIVERS
-- ----------------------------------------------------------------------------
CREATE TABLE DIVERS_DIR (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    COD_SERV         VARCHAR2(10)    NOT NULL,
    DAT_DIR          DATE            NOT NULL,
    COD_AFF          VARCHAR2(10)    NOT NULL,
    COD_METIER       VARCHAR2(4)     NOT NULL,
    COD_POST         VARCHAR2(15)    NOT NULL,
    CODE_DIVERS      VARCHAR2(10)    NOT NULL,
    OBSERVATION      VARCHAR2(30),
    ETAT             VARCHAR2(1),
    NBR_DIVERS_AVIS  NUMBER,
    OBLIG            VARCHAR2(1),
    ID_DIVERS_DIR    NUMBER,
    CONSTRAINT PK_DIVERS_DIR PRIMARY KEY (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST, CODE_DIVERS),
    CONSTRAINT FK_DIVERS_DIR FOREIGN KEY (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST)
        REFERENCES LIGNE_DIR (COD_SOC, COD_AFF, COD_SERV, DAT_DIR, COD_METIER, COD_POST),
    CONSTRAINT FK_DIVERS1 FOREIGN KEY (CODE_DIVERS)
        REFERENCES LISTE_DIVERS (CODE_DIVERS)
);

COMMENT ON TABLE DIVERS_DIR IS 'Éléments divers requis par ligne directrice';
COMMENT ON COLUMN DIVERS_DIR.CODE_DIVERS IS 'Code élément divers';
COMMENT ON COLUMN DIVERS_DIR.OBLIG IS 'Obligatoire ou non';

-- ----------------------------------------------------------------------------
-- 7F.4 FICHE_EVAL_RECRU : Fiche d''évaluation pour le recrutement
-- FK vers CONCOURS, FICHE_CANDIDAT, MODELE_EVALUATION
-- ----------------------------------------------------------------------------
CREATE TABLE FICHE_EVAL_RECRU (
    CODE_CONCOURS    VARCHAR2(10)    NOT NULL,
    NUM_MODELE       VARCHAR2(10)    NOT NULL,
    COD_SOC          VARCHAR2(4)     NOT NULL,
    NUM_FICHE        VARCHAR2(15)    NOT NULL,
    DAT_FICHE        DATE,
    OBS              VARCHAR2(200),
    AVIS             VARCHAR2(1),
    DECISIONS        VARCHAR2(100),
    RECOMMAND        VARCHAR2(100),
    COD_AFFECT       VARCHAR2(4),
    MAT_MEMBRE       VARCHAR2(10)    NOT NULL,
    ID_FICHE_EVAL_RECRU NUMBER,
    CONSTRAINT PK_EVAL_RECRU PRIMARY KEY (CODE_CONCOURS, NUM_MODELE, NUM_FICHE, COD_SOC, MAT_MEMBRE),
    CONSTRAINT FK_EVAL_RECRU FOREIGN KEY (CODE_CONCOURS)
        REFERENCES CONCOURS (CODE_CONCOURS),
    CONSTRAINT FK2_EVAL_RECRU FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE),
    CONSTRAINT FK3_EVAL_RECRU FOREIGN KEY (NUM_MODELE)
        REFERENCES MODELE_EVALUATION (NUM_MODELE)
);

COMMENT ON TABLE FICHE_EVAL_RECRU IS 'Fiche d''évaluation du candidat lors du recrutement';
COMMENT ON COLUMN FICHE_EVAL_RECRU.CODE_CONCOURS IS 'Code concours';
COMMENT ON COLUMN FICHE_EVAL_RECRU.NUM_MODELE IS 'Modèle d''évaluation utilisé';
COMMENT ON COLUMN FICHE_EVAL_RECRU.NUM_FICHE IS 'Numéro de fiche candidat';
COMMENT ON COLUMN FICHE_EVAL_RECRU.DAT_FICHE IS 'Date de l''évaluation';
COMMENT ON COLUMN FICHE_EVAL_RECRU.OBS IS 'Observations';
COMMENT ON COLUMN FICHE_EVAL_RECRU.AVIS IS 'Avis du jury';
COMMENT ON COLUMN FICHE_EVAL_RECRU.DECISIONS IS 'Décisions prises';
COMMENT ON COLUMN FICHE_EVAL_RECRU.RECOMMAND IS 'Recommandations';
COMMENT ON COLUMN FICHE_EVAL_RECRU.MAT_MEMBRE IS 'Matricule du membre du jury';

-- ----------------------------------------------------------------------------
-- 7F.5 DET_FICHE_EVAL_RECRU : Détails de l''évaluation de recrutement
-- FK vers FICHE_EVAL_RECRU
-- ----------------------------------------------------------------------------
CREATE TABLE DET_FICHE_EVAL_RECRU (
    NUM_FICHE            VARCHAR2(15)    NOT NULL,
    DAT_FICHE            DATE,
    COD_CRIT             VARCHAR2(4)     NOT NULL,
    COD_VAL              VARCHAR2(4),
    VALEUR               VARCHAR2(1),
    COD_SOC              VARCHAR2(4)     NOT NULL,
    CODE_CONCOURS        VARCHAR2(10)    NOT NULL,
    NUM_MODELE           VARCHAR2(10)    NOT NULL,
    OBSERVATIONS         VARCHAR2(200),
    MAT_MEMBRE           VARCHAR2(10)    NOT NULL,
    ID_DET_FICHE_EVAL_RECRU NUMBER,
    CONSTRAINT PK_DET_EVAL_RECRU PRIMARY KEY (COD_SOC, CODE_CONCOURS, NUM_MODELE, NUM_FICHE, COD_CRIT, MAT_MEMBRE),
    CONSTRAINT FK_DET_EVAL_RECRU FOREIGN KEY (CODE_CONCOURS, NUM_MODELE, NUM_FICHE, COD_SOC, MAT_MEMBRE)
        REFERENCES FICHE_EVAL_RECRU (CODE_CONCOURS, NUM_MODELE, NUM_FICHE, COD_SOC, MAT_MEMBRE)
);

COMMENT ON TABLE DET_FICHE_EVAL_RECRU IS 'Détails de l''évaluation par critère';
COMMENT ON COLUMN DET_FICHE_EVAL_RECRU.COD_CRIT IS 'Code critère d''évaluation';
COMMENT ON COLUMN DET_FICHE_EVAL_RECRU.COD_VAL IS 'Valeur attribuée';
COMMENT ON COLUMN DET_FICHE_EVAL_RECRU.VALEUR IS 'Note attribuée';
COMMENT ON COLUMN DET_FICHE_EVAL_RECRU.OBSERVATIONS IS 'Observations du jury';

-- ----------------------------------------------------------------------------
-- 7F.6 FICHE_EVAL_STAGE : Fiche d''évaluation de stage
-- FK vers STAGE et MODELE_EVALUATION
-- ----------------------------------------------------------------------------
CREATE TABLE FICHE_EVAL_STAGE (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    MAT_PERS         VARCHAR2(10)    NOT NULL,
    DAT_DEBUT        DATE            NOT NULL,
    DAT_FICHE        DATE,
    NUM_MODELE       VARCHAR2(10),
    OBS              VARCHAR2(200),
    TOT              NUMBER,
    MOYENNE          NUMBER(5,2),
    ETAT             VARCHAR2(1),
    ID_FICHE_EVAL_STAGE NUMBER,
    CONSTRAINT PK_FICHE_EVAL_STAGE PRIMARY KEY (COD_SOC, MAT_PERS, DAT_DEBUT),
    CONSTRAINT FK_FICHE_EVAL_STAGE FOREIGN KEY (COD_SOC, MAT_PERS, DAT_DEBUT)
        REFERENCES STAGE (COD_SOC, MAT_PERS, DAT_DEBUT),
    CONSTRAINT FK_FICHE_MODELE FOREIGN KEY (NUM_MODELE)
        REFERENCES MODELE_EVALUATION (NUM_MODELE)
);

COMMENT ON TABLE FICHE_EVAL_STAGE IS 'Fiche d''évaluation du stage probatoire';
COMMENT ON COLUMN FICHE_EVAL_STAGE.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN FICHE_EVAL_STAGE.MAT_PERS IS 'Matricule personnel (stagiaire)';
COMMENT ON COLUMN FICHE_EVAL_STAGE.DAT_DEBUT IS 'Date début du stage';
COMMENT ON COLUMN FICHE_EVAL_STAGE.DAT_FICHE IS 'Date de création de la fiche d''évaluation';
COMMENT ON COLUMN FICHE_EVAL_STAGE.NUM_MODELE IS 'Modèle d''évaluation utilisé';
COMMENT ON COLUMN FICHE_EVAL_STAGE.OBS IS 'Observations';
COMMENT ON COLUMN FICHE_EVAL_STAGE.TOT IS 'Score total obtenu';
COMMENT ON COLUMN FICHE_EVAL_STAGE.MOYENNE IS 'Moyenne obtenue';
COMMENT ON COLUMN FICHE_EVAL_STAGE.ETAT IS 'I=instance, V=validé';

-- ----------------------------------------------------------------------------
-- 7F.7 DET_EVAL_STAGE : Détails de l''évaluation de stage par critère
-- FK vers FICHE_EVAL_STAGE et VALEUR_CRITERE
-- ----------------------------------------------------------------------------
CREATE TABLE DET_EVAL_STAGE (
    COD_SOC          VARCHAR2(4)     NOT NULL,
    MAT_PERS         VARCHAR2(10)    NOT NULL,
    DAT_DEBUT        DATE            NOT NULL,
    COD_CRIT         VARCHAR2(4)     NOT NULL,
    COD_VAL          VARCHAR2(4),
    VALEUR           NUMBER(17,2),
    NUM_MODELE       VARCHAR2(10),
    NOTE1            NUMBER(8,2),
    NOTE2            NUMBER(8,2),
    APPRECIATION1    VARCHAR2(100),
    APPRECIATION2    VARCHAR2(100),
    COMMENTAIRE      VARCHAR2(100),
    ID_DET_EVAL_STAGE NUMBER,
    CONSTRAINT PK_DET_EVAL_STAGE PRIMARY KEY (COD_SOC, MAT_PERS, DAT_DEBUT, COD_CRIT),
    CONSTRAINT FK_DET_EVAL_STAGE FOREIGN KEY (COD_SOC, MAT_PERS, DAT_DEBUT)
        REFERENCES FICHE_EVAL_STAGE (COD_SOC, MAT_PERS, DAT_DEBUT),
    CONSTRAINT FK_DET_FICHE_VALEUR FOREIGN KEY (COD_VAL)
        REFERENCES VALEUR_CRITERE (COD_VAL)
);

COMMENT ON TABLE DET_EVAL_STAGE IS 'Détails de l''évaluation de stage par critère';
COMMENT ON COLUMN DET_EVAL_STAGE.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN DET_EVAL_STAGE.MAT_PERS IS 'Matricule personnel (stagiaire)';
COMMENT ON COLUMN DET_EVAL_STAGE.DAT_DEBUT IS 'Date début du stage';
COMMENT ON COLUMN DET_EVAL_STAGE.COD_CRIT IS 'Code critère d''évaluation';
COMMENT ON COLUMN DET_EVAL_STAGE.COD_VAL IS 'Valeur de l''évaluation';
COMMENT ON COLUMN DET_EVAL_STAGE.VALEUR IS 'Note attribuée';
COMMENT ON COLUMN DET_EVAL_STAGE.NUM_MODELE IS 'Modèle d''évaluation';
COMMENT ON COLUMN DET_EVAL_STAGE.NOTE1 IS 'Note évaluateur 1';
COMMENT ON COLUMN DET_EVAL_STAGE.NOTE2 IS 'Note évaluateur 2';
COMMENT ON COLUMN DET_EVAL_STAGE.APPRECIATION1 IS 'Appréciation évaluateur 1';
COMMENT ON COLUMN DET_EVAL_STAGE.APPRECIATION2 IS 'Appréciation évaluateur 2';
COMMENT ON COLUMN DET_EVAL_STAGE.COMMENTAIRE IS 'Commentaire général';

-- ============================================================================
-- PART 8 : TABLE UTILISATEUR (authentification et rôles)
-- Créée en dernier car FK vers PERSONNEL (PART 3) et FICHE_CANDIDAT (PART 7)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- UTILISATEUR : Comptes utilisateurs du système GRH / portail web
-- FK: SOCIETE, PERSONNEL, FICHE_CANDIDAT
-- Rôles: ADMIN, DIRECTEUR, RH, AGENT, CANDIDAT
-- ----------------------------------------------------------------------------
CREATE TABLE UTILISATEUR (
    COD_USER      VARCHAR2(10)  NOT NULL,
    COD_SOC       VARCHAR2(4),
    MAT_PERS      VARCHAR2(10),                 -- Lien vers PERSONNEL si agent/directeur/RH
    NUM_FICHE     VARCHAR2(15),                 -- Lien vers FICHE_CANDIDAT si candidat
    LOGIN         VARCHAR2(50)  NOT NULL,
    MOT_PASSE     VARCHAR2(255),                -- Hash du mot de passe
    ROLE_USER     VARCHAR2(20)  NOT NULL,       -- ADMIN, DIRECTEUR, RH, AGENT, CANDIDAT
    ETAT_USER     VARCHAR2(1)   DEFAULT 'A',    -- A=actif, I=inactif, B=bloqué
    DAT_CREATION  DATE          DEFAULT SYSDATE,
    DAT_DERNIERE_CONN DATE,
    CONSTRAINT PK_UTILISATEUR PRIMARY KEY (COD_USER),
    CONSTRAINT UK_UTILISATEUR_LOGIN UNIQUE (LOGIN),
    CONSTRAINT FK_UTILISATEUR_SOC FOREIGN KEY (COD_SOC)
        REFERENCES SOCIETE (COD_SOC),
    CONSTRAINT FK_UTILISATEUR_PERS FOREIGN KEY (COD_SOC, MAT_PERS)
        REFERENCES PERSONNEL (COD_SOC, MAT_PERS),
    CONSTRAINT FK_UTILISATEUR_CAND FOREIGN KEY (NUM_FICHE)
        REFERENCES FICHE_CANDIDAT (NUM_FICHE),
    CONSTRAINT CK_UTILISATEUR_ROLE CHECK (ROLE_USER IN ('ADMIN','DIRECTEUR','RH','AGENT','CANDIDAT')),
    CONSTRAINT CK_UTILISATEUR_ETAT CHECK (ETAT_USER IN ('A','I','B'))
);

COMMENT ON TABLE UTILISATEUR IS 'Comptes utilisateurs du système GRH et portail web';
COMMENT ON COLUMN UTILISATEUR.COD_USER IS 'Code utilisateur unique';
COMMENT ON COLUMN UTILISATEUR.COD_SOC IS 'Code structure sanitaire';
COMMENT ON COLUMN UTILISATEUR.MAT_PERS IS 'Matricule personnel (si rôle AGENT/DIRECTEUR/RH)';
COMMENT ON COLUMN UTILISATEUR.NUM_FICHE IS 'N° fiche candidat (si rôle CANDIDAT)';
COMMENT ON COLUMN UTILISATEUR.LOGIN IS 'Identifiant de connexion (unique)';
COMMENT ON COLUMN UTILISATEUR.MOT_PASSE IS 'Mot de passe hashé (bcrypt/SHA-256)';
COMMENT ON COLUMN UTILISATEUR.ROLE_USER IS 'Rôle: ADMIN, DIRECTEUR, RH, AGENT, CANDIDAT';
COMMENT ON COLUMN UTILISATEUR.ETAT_USER IS 'A=actif, I=inactif, B=bloqué';
COMMENT ON COLUMN UTILISATEUR.DAT_CREATION IS 'Date de création du compte';
COMMENT ON COLUMN UTILISATEUR.DAT_DERNIERE_CONN IS 'Date de dernière connexion';

-- ============================================================================
-- END OF DDL
-- ============================================================================
