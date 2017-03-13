
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/13/2017 11:28:20
-- Generated from EDMX file: C:\Users\orion\Documents\Visual Studio 2015\websites\MAJOJOGUI\App_Code\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [madera];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ACCEDER_APPLICATION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ACCEDER_APPLICATION];
GO
IF OBJECT_ID(N'[dbo].[ACCEDER_APPLICATION2]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ACCEDER_APPLICATION2];
GO
IF OBJECT_ID(N'[dbo].[ACCEDER_APPLICATION3]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ACCEDER_APPLICATION3];
GO
IF OBJECT_ID(N'[dbo].[ACCES_APPLICATION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ACCES_APPLICATION];
GO
IF OBJECT_ID(N'[dbo].[BUREAU_ETUDE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BUREAU_ETUDE];
GO
IF OBJECT_ID(N'[dbo].[CLIENT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CLIENT];
GO
IF OBJECT_ID(N'[dbo].[COMMANDE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[COMMANDE];
GO
IF OBJECT_ID(N'[dbo].[COMMERCIAL]', 'U') IS NOT NULL
    DROP TABLE [dbo].[COMMERCIAL];
GO
IF OBJECT_ID(N'[dbo].[COMPOSANT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[COMPOSANT];
GO
IF OBJECT_ID(N'[dbo].[COMPOSANT_IMAGE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[COMPOSANT_IMAGE];
GO
IF OBJECT_ID(N'[dbo].[COMPTABLE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[COMPTABLE];
GO
IF OBJECT_ID(N'[dbo].[CONTACT_CLIENT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CONTACT_CLIENT];
GO
IF OBJECT_ID(N'[dbo].[CONTACT_FOURNISSEUR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CONTACT_FOURNISSEUR];
GO
IF OBJECT_ID(N'[dbo].[CONTENIR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CONTENIR];
GO
IF OBJECT_ID(N'[dbo].[DEVIS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DEVIS];
GO
IF OBJECT_ID(N'[dbo].[EST_COUPE_DE_PRINCIPE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EST_COUPE_DE_PRINCIPE];
GO
IF OBJECT_ID(N'[dbo].[EST_DISPONIBLE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EST_DISPONIBLE];
GO
IF OBJECT_ID(N'[dbo].[EST_FICHIER_DEVIS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EST_FICHIER_DEVIS];
GO
IF OBJECT_ID(N'[dbo].[EST_RESPONSABLE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EST_RESPONSABLE];
GO
IF OBJECT_ID(N'[dbo].[ETAPE_ECHELONNEMENT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ETAPE_ECHELONNEMENT];
GO
IF OBJECT_ID(N'[dbo].[FAIRE_PARTIE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FAIRE_PARTIE];
GO
IF OBJECT_ID(N'[dbo].[FICHIER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FICHIER];
GO
IF OBJECT_ID(N'[dbo].[FINITION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FINITION];
GO
IF OBJECT_ID(N'[dbo].[FINITION_IMAGE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FINITION_IMAGE];
GO
IF OBJECT_ID(N'[dbo].[FOURNISSEUR]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FOURNISSEUR];
GO
IF OBJECT_ID(N'[dbo].[GAMME]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GAMME];
GO
IF OBJECT_ID(N'[dbo].[LIER_FINITION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LIER_FINITION];
GO
IF OBJECT_ID(N'[dbo].[LIER_MODULE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LIER_MODULE];
GO
IF OBJECT_ID(N'[dbo].[LIGNE_COMMANDE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LIGNE_COMMANDE];
GO
IF OBJECT_ID(N'[dbo].[MODELE_DE_GAMME]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MODELE_DE_GAMME];
GO
IF OBJECT_ID(N'[dbo].[MODELE_GAMME_IMAGE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MODELE_GAMME_IMAGE];
GO
IF OBJECT_ID(N'[dbo].[MODULE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MODULE];
GO
IF OBJECT_ID(N'[dbo].[PAYER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PAYER];
GO
IF OBJECT_ID(N'[dbo].[PEUT_APPLIQUER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PEUT_APPLIQUER];
GO
IF OBJECT_ID(N'[dbo].[PRODUIT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PRODUIT];
GO
IF OBJECT_ID(N'[dbo].[TYPE_COMPOSANT]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TYPE_COMPOSANT];
GO
IF OBJECT_ID(N'[dbo].[TYPE_FICHIER]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TYPE_FICHIER];
GO
IF OBJECT_ID(N'[dbo].[TYPE_FINITION]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TYPE_FINITION];
GO
IF OBJECT_ID(N'[dbo].[TYPE_MODELE_GAMME]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TYPE_MODELE_GAMME];
GO
IF OBJECT_ID(N'[dbo].[TYPE_MODULE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TYPE_MODULE];
GO
IF OBJECT_ID(N'[dbo].[UTILISER___COUPE_DE_PRINCIPE]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UTILISER___COUPE_DE_PRINCIPE];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ACCEDER_APPLICATION'
CREATE TABLE [dbo].[ACCEDER_APPLICATION] (
    [PERSONNEL_ID] int  NOT NULL,
    [APPLICATION_ID] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'ACCEDER_APPLICATION2'
CREATE TABLE [dbo].[ACCEDER_APPLICATION2] (
    [PERSONNEL_ID] int  NOT NULL,
    [APPLICATION_ID] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'ACCEDER_APPLICATION3'
CREATE TABLE [dbo].[ACCEDER_APPLICATION3] (
    [PERSONNEL_ID] int  NOT NULL,
    [APPLICATION_ID] int  NOT NULL
);
GO

-- Creating table 'ACCES_APPLICATION'
CREATE TABLE [dbo].[ACCES_APPLICATION] (
    [APPLICATION_ID] int IDENTITY(1,1) NOT NULL,
    [APPLICATION_NOM] varchar(80)  NULL
);
GO

-- Creating table 'BUREAU_ETUDE'
CREATE TABLE [dbo].[BUREAU_ETUDE] (
    [PERSONNEL_ID] int IDENTITY(1,1) NOT NULL,
    [SPECIALISATION] varchar(60)  NULL,
    [PERSONNEL_LOGIN] varchar(80)  NULL,
    [PERSONNEL_MDP] varchar(80)  NULL,
    [PERSONNEL_TOKEN] varchar(80)  NULL,
    [PERSONNEL_NOM] varchar(40)  NULL,
    [PERSONNEL_PRENOM] varchar(40)  NULL
);
GO

-- Creating table 'CLIENT'
CREATE TABLE [dbo].[CLIENT] (
    [CLIENT_ID] int IDENTITY(1,1) NOT NULL,
    [CLIENT_REFERENCE] char(10)  NULL,
    [CLIENT_NAME] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'COMMANDE'
CREATE TABLE [dbo].[COMMANDE] (
    [COMMANDE_ID] int IDENTITY(1,1) NOT NULL,
    [COMMANDE_DATE] datetime  NULL,
    [COMMANDE_STATUT] smallint  NULL
);
GO

-- Creating table 'COMMERCIAL'
CREATE TABLE [dbo].[COMMERCIAL] (
    [PERSONNEL_ID] int IDENTITY(1,1) NOT NULL,
    [SECTEUR] varchar(10)  NULL,
    [NUMERO_MOBILE] varchar(16)  NULL,
    [PERSONNEL_LOGIN] varchar(80)  NULL,
    [PERSONNEL_MDP] varchar(80)  NULL,
    [PERSONNEL_TOKEN] varchar(80)  NULL,
    [PERSONNEL_NOM] varchar(40)  NULL,
    [PERSONNEL_PRENOM] varchar(40)  NULL
);
GO

-- Creating table 'COMPOSANT'
CREATE TABLE [dbo].[COMPOSANT] (
    [COMPOSANT_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_COMPOSANT] int  NOT NULL,
    [FOURNISSEUR_ID] int  NOT NULL,
    [COMPOSANT_NOM] varchar(60)  NULL,
    [COMPOSANT_STOCK] int  NULL,
    [COMPOSANT_VALEUR_CARACTERISTIQUE_1] decimal(18,0)  NULL,
    [COMPOSANT_VALEUR_CARACTERISTIQUE_2] decimal(18,0)  NULL,
    [VALEUR_AJOUTEE] float  NOT NULL
);
GO

-- Creating table 'COMPOSANT_IMAGE'
CREATE TABLE [dbo].[COMPOSANT_IMAGE] (
    [FICHIER_ID] int  NOT NULL,
    [COMPOSANT_ID] int  NOT NULL
);
GO

-- Creating table 'COMPTABLE'
CREATE TABLE [dbo].[COMPTABLE] (
    [PERSONNEL_ID] int IDENTITY(1,1) NOT NULL,
    [NUMERO_POSTE] varchar(16)  NULL,
    [PERSONNEL_LOGIN] varchar(80)  NULL,
    [PERSONNEL_MDP] varchar(80)  NULL,
    [PERSONNEL_TOKEN] varchar(80)  NULL,
    [PERSONNEL_NOM] varchar(40)  NULL,
    [PERSONNEL_PRENOM] varchar(40)  NULL
);
GO

-- Creating table 'CONTACT_CLIENT'
CREATE TABLE [dbo].[CONTACT_CLIENT] (
    [CONTACT_ID] int IDENTITY(1,1) NOT NULL,
    [CLIENT_ID] int  NOT NULL,
    [CONTACT_NOM] varchar(60)  NULL,
    [CONTACT_TELEPHONE] char(10)  NULL,
    [CONTACT_MAIL] varchar(70)  NULL,
    [CONTACT_ADRESSE] varchar(90)  NULL,
    [CONTACT_ADRESSE2] varchar(90)  NULL,
    [CONTACT_CP] varchar(5)  NULL,
    [CONTACT_VILLE] varchar(60)  NULL,
    [CONTACT_CLIENT_SITUATION_MATRIMONIALE] varchar(10)  NULL
);
GO

-- Creating table 'CONTACT_FOURNISSEUR'
CREATE TABLE [dbo].[CONTACT_FOURNISSEUR] (
    [CONTACT_ID] int IDENTITY(1,1) NOT NULL,
    [FOURNISSEUR_ID] int  NOT NULL,
    [CONTACT_NOM] varchar(1)  NULL,
    [CONTACT_TELEPHONE] char(10)  NULL,
    [CONTACT_MAIL] varchar(1)  NULL,
    [CONTACT_ADRESSE] varchar(1)  NULL,
    [CONTACT_ADRESSE2] varchar(1)  NULL,
    [CONTACT_CP] varchar(1)  NULL,
    [CONTACT_VILLE] varchar(1)  NULL,
    [CONTACT_FOURNISSEUR_POSTE] varchar(1)  NULL
);
GO

-- Creating table 'CONTENIR'
CREATE TABLE [dbo].[CONTENIR] (
    [PRODUIT_ID] int  NOT NULL,
    [MODELE_GAMME_ID] int  NOT NULL
);
GO

-- Creating table 'DEVIS'
CREATE TABLE [dbo].[DEVIS] (
    [DEVIS_ID] int IDENTITY(1,1) NOT NULL,
    [CLIENT_ID] int  NOT NULL,
    [PERSONNEL_ID] int  NULL,
    [BUR_PERSONNEL_ID] int  NULL,
    [COM_PERSONNEL_ID] int  NULL,
    [DEVIS_ESTIMATION_PRIX] decimal(18,0)  NULL,
    [DEVIS_DATE] datetime  NULL,
    [DEVIS_NOM_PROJET] varchar(60)  NULL,
    [DEVIS_REFERENCE] char(10)  NULL,
    [DEVIS_ETAT] smallint  NULL
);
GO

-- Creating table 'EST_COUPE_DE_PRINCIPE'
CREATE TABLE [dbo].[EST_COUPE_DE_PRINCIPE] (
    [FICHIER_ID] int  NOT NULL,
    [MODULE_ID] int  NOT NULL
);
GO

-- Creating table 'EST_DISPONIBLE'
CREATE TABLE [dbo].[EST_DISPONIBLE] (
    [MODULE_ID] int  NOT NULL,
    [GAMME_ID] int  NOT NULL
);
GO

-- Creating table 'EST_FICHIER_DEVIS'
CREATE TABLE [dbo].[EST_FICHIER_DEVIS] (
    [FICHIER_ID] int  NOT NULL,
    [DEVIS_ID] int  NOT NULL,
    [TYPE_FICHIER_ID] int  NOT NULL
);
GO

-- Creating table 'EST_RESPONSABLE'
CREATE TABLE [dbo].[EST_RESPONSABLE] (
    [PERSONNEL_ID] int  NOT NULL,
    [COMPOSANT_ID] int  NOT NULL
);
GO

-- Creating table 'ETAPE_ECHELONNEMENT'
CREATE TABLE [dbo].[ETAPE_ECHELONNEMENT] (
    [ETAPE_ECHELONNEMENT_ID] int IDENTITY(1,1) NOT NULL,
    [ETAPE_ECHELONNEMENT_NOM] varchar(20)  NULL,
    [ETAPE_ECHELONNEMENT_ORDRE] int  NULL
);
GO

-- Creating table 'FAIRE_PARTIE'
CREATE TABLE [dbo].[FAIRE_PARTIE] (
    [GAMME_ID] int  NOT NULL,
    [FINITION_ID] int  NOT NULL
);
GO

-- Creating table 'FICHIER'
CREATE TABLE [dbo].[FICHIER] (
    [FICHIER_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_FICHIER_ID] int  NOT NULL,
    [FICHIER_NOM] varchar(60)  NULL,
    [FICHIER_CHEMIN] varchar(255)  NULL,
    [FICHIER_POIDS] bigint  NOT NULL
);
GO

-- Creating table 'FINITION'
CREATE TABLE [dbo].[FINITION] (
    [FINITION_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_FINITION_ID] int  NOT NULL,
    [FINITION_NOM] varchar(50)  NULL,
    [FINITION_DESCRIPTION] varchar(max)  NULL
);
GO

-- Creating table 'FINITION_IMAGE'
CREATE TABLE [dbo].[FINITION_IMAGE] (
    [FINITION_ID] int  NOT NULL,
    [FICHIER_ID] int  NOT NULL
);
GO

-- Creating table 'FOURNISSEUR'
CREATE TABLE [dbo].[FOURNISSEUR] (
    [FOURNISSEUR_ID] int IDENTITY(1,1) NOT NULL,
    [FOURNISSEUR_SIRET] char(14)  NULL,
    [FOURNISSEUR_SIREN] char(9)  NULL
);
GO

-- Creating table 'GAMME'
CREATE TABLE [dbo].[GAMME] (
    [GAMME_ID] int IDENTITY(1,1) NOT NULL,
    [GAMME_NOM] varchar(1)  NULL,
    [GAMME_DESCRIPTION] varchar(max)  NULL
);
GO

-- Creating table 'LIER_FINITION'
CREATE TABLE [dbo].[LIER_FINITION] (
    [FINITION_ID] int  NOT NULL,
    [MODELE_GAMME_ID] int  NOT NULL
);
GO

-- Creating table 'LIER_MODULE'
CREATE TABLE [dbo].[LIER_MODULE] (
    [MODULE_ID] int  NOT NULL,
    [MODELE_GAMME_ID] int  NOT NULL,
    [IDENTIFICATION] varchar(60)  NULL,
    [SECTION] varchar(80)  NULL,
    [LONGUEUR] int  NULL,
    [HAUTEUR] int  NULL
);
GO

-- Creating table 'LIGNE_COMMANDE'
CREATE TABLE [dbo].[LIGNE_COMMANDE] (
    [COMMANDE_ID] int  NOT NULL,
    [COMPOSANT_ID] int  NOT NULL,
    [FOURNISSEUR_ID] int  NOT NULL,
    [PRIX_ACHAT] decimal(18,0)  NULL,
    [QUANTITE_LIGNE_COMMANDE] int  NULL
);
GO

-- Creating table 'MODELE_DE_GAMME'
CREATE TABLE [dbo].[MODELE_DE_GAMME] (
    [MODELE_GAMME_ID] int IDENTITY(1,1) NOT NULL,
    [GAMME_ID] int  NOT NULL,
    [TYPE_MODELE_GAMME_ID] int  NOT NULL,
    [EST_PAR_DEFAUT] bit  NOT NULL,
    [MODELE_GAMME_NOM] varchar(40)  NULL,
    [MODELE_GAMME_DESCRIPTION] varchar(max)  NULL,
    [MODELE_GAMME_NB_PIECES] int  NULL,
    [MODELE_GAMME_SURFACE] int  NULL
);
GO

-- Creating table 'MODELE_GAMME_IMAGE'
CREATE TABLE [dbo].[MODELE_GAMME_IMAGE] (
    [MODELE_GAMME_ID] int  NOT NULL,
    [FICHIER_ID] int  NOT NULL
);
GO

-- Creating table 'MODULE'
CREATE TABLE [dbo].[MODULE] (
    [MODULE_ID] int IDENTITY(1,1) NOT NULL,
    [MOD_MODULE_ID] int  NULL,
    [TYPE_MODULE_ID] int  NOT NULL,
    [PERSONNEL_ID] int  NULL,
    [MODULE_NOM] varchar(60)  NULL,
    [MODULE_TYPE] varchar(1)  NULL,
    [MODULE_MARGE_COMMERCIAL] float  NOT NULL,
    [MODULE_MARGE_ENTREPRISE] float  NOT NULL,
    [QUANTITE_PARENT] int  NULL
);
GO

-- Creating table 'PAYER'
CREATE TABLE [dbo].[PAYER] (
    [ETAPE_ECHELONNEMENT_ID] int  NOT NULL,
    [DEVIS_ID] int  NOT NULL,
    [POURCENTAGE_ETAPE] decimal(18,0)  NULL,
    [STATUT_PAIEMENT] bit  NULL,
    [DATE_ECHEANCE] datetime  NULL,
    [DATE_PAIEMENT] datetime  NULL,
    [MONTANT_PAYER] decimal(18,0)  NULL
);
GO

-- Creating table 'PEUT_APPLIQUER'
CREATE TABLE [dbo].[PEUT_APPLIQUER] (
    [MODULE_ID] int  NOT NULL,
    [FINITION_ID] int  NOT NULL
);
GO

-- Creating table 'PRODUIT'
CREATE TABLE [dbo].[PRODUIT] (
    [PRODUIT_ID] int IDENTITY(1,1) NOT NULL,
    [DEVIS_ID] int  NOT NULL,
    [GAMME_ID] int  NOT NULL,
    [PRODUIT_NOM] varchar(90)  NULL,
    [PRODUIT_DESCRIPTION] varchar(max)  NULL,
    [MODELE_DE_GAMME_ID] int  NULL
);
GO

-- Creating table 'TYPE_COMPOSANT'
CREATE TABLE [dbo].[TYPE_COMPOSANT] (
    [TYPE_COMPOSANT1] int IDENTITY(1,1) NOT NULL,
    [TYPE_COMPOSANT_NOM] varchar(40)  NULL,
    [TYPE_COMPOSANT_CARACTERISTIQUE] varchar(40)  NULL,
    [TYPE_COMPOSANT_UNITE_USAGE] varchar(40)  NULL
);
GO

-- Creating table 'TYPE_FICHIER'
CREATE TABLE [dbo].[TYPE_FICHIER] (
    [TYPE_FICHIER_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_FICHIER_NOM] varchar(1)  NULL
);
GO

-- Creating table 'TYPE_FINITION'
CREATE TABLE [dbo].[TYPE_FINITION] (
    [TYPE_FINITION_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_FINITION_NOM] varchar(40)  NULL
);
GO

-- Creating table 'TYPE_MODELE_GAMME'
CREATE TABLE [dbo].[TYPE_MODELE_GAMME] (
    [TYPE_MODELE_GAMME_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_MODELE_GAMME_NOM] varchar(60)  NULL
);
GO

-- Creating table 'TYPE_MODULE'
CREATE TABLE [dbo].[TYPE_MODULE] (
    [TYPE_MODULE_ID] int IDENTITY(1,1) NOT NULL,
    [TYPE_MODULE_NOM] varchar(60)  NULL,
    [TYPE_MODULE_UNITE_USAGE] varchar(20)  NULL,
    [TYPE_MODULE_CARACTERISTIQUE] varchar(30)  NULL
);
GO

-- Creating table 'UTILISER___COUPE_DE_PRINCIPE'
CREATE TABLE [dbo].[UTILISER___COUPE_DE_PRINCIPE] (
    [MODULE_ID] int  NOT NULL,
    [COMPOSANT_ID] int  NOT NULL,
    [QUANTITE_COUPE] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PERSONNEL_ID], [APPLICATION_ID] in table 'ACCEDER_APPLICATION'
ALTER TABLE [dbo].[ACCEDER_APPLICATION]
ADD CONSTRAINT [PK_ACCEDER_APPLICATION]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID], [APPLICATION_ID] ASC);
GO

-- Creating primary key on [PERSONNEL_ID], [APPLICATION_ID] in table 'ACCEDER_APPLICATION2'
ALTER TABLE [dbo].[ACCEDER_APPLICATION2]
ADD CONSTRAINT [PK_ACCEDER_APPLICATION2]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID], [APPLICATION_ID] ASC);
GO

-- Creating primary key on [PERSONNEL_ID], [APPLICATION_ID] in table 'ACCEDER_APPLICATION3'
ALTER TABLE [dbo].[ACCEDER_APPLICATION3]
ADD CONSTRAINT [PK_ACCEDER_APPLICATION3]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID], [APPLICATION_ID] ASC);
GO

-- Creating primary key on [APPLICATION_ID] in table 'ACCES_APPLICATION'
ALTER TABLE [dbo].[ACCES_APPLICATION]
ADD CONSTRAINT [PK_ACCES_APPLICATION]
    PRIMARY KEY CLUSTERED ([APPLICATION_ID] ASC);
GO

-- Creating primary key on [PERSONNEL_ID] in table 'BUREAU_ETUDE'
ALTER TABLE [dbo].[BUREAU_ETUDE]
ADD CONSTRAINT [PK_BUREAU_ETUDE]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID] ASC);
GO

-- Creating primary key on [CLIENT_ID] in table 'CLIENT'
ALTER TABLE [dbo].[CLIENT]
ADD CONSTRAINT [PK_CLIENT]
    PRIMARY KEY CLUSTERED ([CLIENT_ID] ASC);
GO

-- Creating primary key on [COMMANDE_ID] in table 'COMMANDE'
ALTER TABLE [dbo].[COMMANDE]
ADD CONSTRAINT [PK_COMMANDE]
    PRIMARY KEY CLUSTERED ([COMMANDE_ID] ASC);
GO

-- Creating primary key on [PERSONNEL_ID] in table 'COMMERCIAL'
ALTER TABLE [dbo].[COMMERCIAL]
ADD CONSTRAINT [PK_COMMERCIAL]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID] ASC);
GO

-- Creating primary key on [COMPOSANT_ID] in table 'COMPOSANT'
ALTER TABLE [dbo].[COMPOSANT]
ADD CONSTRAINT [PK_COMPOSANT]
    PRIMARY KEY CLUSTERED ([COMPOSANT_ID] ASC);
GO

-- Creating primary key on [FICHIER_ID], [COMPOSANT_ID] in table 'COMPOSANT_IMAGE'
ALTER TABLE [dbo].[COMPOSANT_IMAGE]
ADD CONSTRAINT [PK_COMPOSANT_IMAGE]
    PRIMARY KEY CLUSTERED ([FICHIER_ID], [COMPOSANT_ID] ASC);
GO

-- Creating primary key on [PERSONNEL_ID] in table 'COMPTABLE'
ALTER TABLE [dbo].[COMPTABLE]
ADD CONSTRAINT [PK_COMPTABLE]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID] ASC);
GO

-- Creating primary key on [CONTACT_ID] in table 'CONTACT_CLIENT'
ALTER TABLE [dbo].[CONTACT_CLIENT]
ADD CONSTRAINT [PK_CONTACT_CLIENT]
    PRIMARY KEY CLUSTERED ([CONTACT_ID] ASC);
GO

-- Creating primary key on [CONTACT_ID] in table 'CONTACT_FOURNISSEUR'
ALTER TABLE [dbo].[CONTACT_FOURNISSEUR]
ADD CONSTRAINT [PK_CONTACT_FOURNISSEUR]
    PRIMARY KEY CLUSTERED ([CONTACT_ID] ASC);
GO

-- Creating primary key on [PRODUIT_ID], [MODELE_GAMME_ID] in table 'CONTENIR'
ALTER TABLE [dbo].[CONTENIR]
ADD CONSTRAINT [PK_CONTENIR]
    PRIMARY KEY CLUSTERED ([PRODUIT_ID], [MODELE_GAMME_ID] ASC);
GO

-- Creating primary key on [DEVIS_ID] in table 'DEVIS'
ALTER TABLE [dbo].[DEVIS]
ADD CONSTRAINT [PK_DEVIS]
    PRIMARY KEY CLUSTERED ([DEVIS_ID] ASC);
GO

-- Creating primary key on [FICHIER_ID], [MODULE_ID] in table 'EST_COUPE_DE_PRINCIPE'
ALTER TABLE [dbo].[EST_COUPE_DE_PRINCIPE]
ADD CONSTRAINT [PK_EST_COUPE_DE_PRINCIPE]
    PRIMARY KEY CLUSTERED ([FICHIER_ID], [MODULE_ID] ASC);
GO

-- Creating primary key on [MODULE_ID], [GAMME_ID] in table 'EST_DISPONIBLE'
ALTER TABLE [dbo].[EST_DISPONIBLE]
ADD CONSTRAINT [PK_EST_DISPONIBLE]
    PRIMARY KEY CLUSTERED ([MODULE_ID], [GAMME_ID] ASC);
GO

-- Creating primary key on [FICHIER_ID], [DEVIS_ID], [TYPE_FICHIER_ID] in table 'EST_FICHIER_DEVIS'
ALTER TABLE [dbo].[EST_FICHIER_DEVIS]
ADD CONSTRAINT [PK_EST_FICHIER_DEVIS]
    PRIMARY KEY CLUSTERED ([FICHIER_ID], [DEVIS_ID], [TYPE_FICHIER_ID] ASC);
GO

-- Creating primary key on [PERSONNEL_ID], [COMPOSANT_ID] in table 'EST_RESPONSABLE'
ALTER TABLE [dbo].[EST_RESPONSABLE]
ADD CONSTRAINT [PK_EST_RESPONSABLE]
    PRIMARY KEY CLUSTERED ([PERSONNEL_ID], [COMPOSANT_ID] ASC);
GO

-- Creating primary key on [ETAPE_ECHELONNEMENT_ID] in table 'ETAPE_ECHELONNEMENT'
ALTER TABLE [dbo].[ETAPE_ECHELONNEMENT]
ADD CONSTRAINT [PK_ETAPE_ECHELONNEMENT]
    PRIMARY KEY CLUSTERED ([ETAPE_ECHELONNEMENT_ID] ASC);
GO

-- Creating primary key on [GAMME_ID], [FINITION_ID] in table 'FAIRE_PARTIE'
ALTER TABLE [dbo].[FAIRE_PARTIE]
ADD CONSTRAINT [PK_FAIRE_PARTIE]
    PRIMARY KEY CLUSTERED ([GAMME_ID], [FINITION_ID] ASC);
GO

-- Creating primary key on [FICHIER_ID] in table 'FICHIER'
ALTER TABLE [dbo].[FICHIER]
ADD CONSTRAINT [PK_FICHIER]
    PRIMARY KEY CLUSTERED ([FICHIER_ID] ASC);
GO

-- Creating primary key on [FINITION_ID] in table 'FINITION'
ALTER TABLE [dbo].[FINITION]
ADD CONSTRAINT [PK_FINITION]
    PRIMARY KEY CLUSTERED ([FINITION_ID] ASC);
GO

-- Creating primary key on [FINITION_ID], [FICHIER_ID] in table 'FINITION_IMAGE'
ALTER TABLE [dbo].[FINITION_IMAGE]
ADD CONSTRAINT [PK_FINITION_IMAGE]
    PRIMARY KEY CLUSTERED ([FINITION_ID], [FICHIER_ID] ASC);
GO

-- Creating primary key on [FOURNISSEUR_ID] in table 'FOURNISSEUR'
ALTER TABLE [dbo].[FOURNISSEUR]
ADD CONSTRAINT [PK_FOURNISSEUR]
    PRIMARY KEY CLUSTERED ([FOURNISSEUR_ID] ASC);
GO

-- Creating primary key on [GAMME_ID] in table 'GAMME'
ALTER TABLE [dbo].[GAMME]
ADD CONSTRAINT [PK_GAMME]
    PRIMARY KEY CLUSTERED ([GAMME_ID] ASC);
GO

-- Creating primary key on [FINITION_ID], [MODELE_GAMME_ID] in table 'LIER_FINITION'
ALTER TABLE [dbo].[LIER_FINITION]
ADD CONSTRAINT [PK_LIER_FINITION]
    PRIMARY KEY CLUSTERED ([FINITION_ID], [MODELE_GAMME_ID] ASC);
GO

-- Creating primary key on [MODULE_ID], [MODELE_GAMME_ID] in table 'LIER_MODULE'
ALTER TABLE [dbo].[LIER_MODULE]
ADD CONSTRAINT [PK_LIER_MODULE]
    PRIMARY KEY CLUSTERED ([MODULE_ID], [MODELE_GAMME_ID] ASC);
GO

-- Creating primary key on [COMMANDE_ID], [COMPOSANT_ID], [FOURNISSEUR_ID] in table 'LIGNE_COMMANDE'
ALTER TABLE [dbo].[LIGNE_COMMANDE]
ADD CONSTRAINT [PK_LIGNE_COMMANDE]
    PRIMARY KEY CLUSTERED ([COMMANDE_ID], [COMPOSANT_ID], [FOURNISSEUR_ID] ASC);
GO

-- Creating primary key on [MODELE_GAMME_ID] in table 'MODELE_DE_GAMME'
ALTER TABLE [dbo].[MODELE_DE_GAMME]
ADD CONSTRAINT [PK_MODELE_DE_GAMME]
    PRIMARY KEY CLUSTERED ([MODELE_GAMME_ID] ASC);
GO

-- Creating primary key on [MODELE_GAMME_ID], [FICHIER_ID] in table 'MODELE_GAMME_IMAGE'
ALTER TABLE [dbo].[MODELE_GAMME_IMAGE]
ADD CONSTRAINT [PK_MODELE_GAMME_IMAGE]
    PRIMARY KEY CLUSTERED ([MODELE_GAMME_ID], [FICHIER_ID] ASC);
GO

-- Creating primary key on [MODULE_ID] in table 'MODULE'
ALTER TABLE [dbo].[MODULE]
ADD CONSTRAINT [PK_MODULE]
    PRIMARY KEY CLUSTERED ([MODULE_ID] ASC);
GO

-- Creating primary key on [ETAPE_ECHELONNEMENT_ID], [DEVIS_ID] in table 'PAYER'
ALTER TABLE [dbo].[PAYER]
ADD CONSTRAINT [PK_PAYER]
    PRIMARY KEY CLUSTERED ([ETAPE_ECHELONNEMENT_ID], [DEVIS_ID] ASC);
GO

-- Creating primary key on [MODULE_ID], [FINITION_ID] in table 'PEUT_APPLIQUER'
ALTER TABLE [dbo].[PEUT_APPLIQUER]
ADD CONSTRAINT [PK_PEUT_APPLIQUER]
    PRIMARY KEY CLUSTERED ([MODULE_ID], [FINITION_ID] ASC);
GO

-- Creating primary key on [PRODUIT_ID] in table 'PRODUIT'
ALTER TABLE [dbo].[PRODUIT]
ADD CONSTRAINT [PK_PRODUIT]
    PRIMARY KEY CLUSTERED ([PRODUIT_ID] ASC);
GO

-- Creating primary key on [TYPE_COMPOSANT1] in table 'TYPE_COMPOSANT'
ALTER TABLE [dbo].[TYPE_COMPOSANT]
ADD CONSTRAINT [PK_TYPE_COMPOSANT]
    PRIMARY KEY CLUSTERED ([TYPE_COMPOSANT1] ASC);
GO

-- Creating primary key on [TYPE_FICHIER_ID] in table 'TYPE_FICHIER'
ALTER TABLE [dbo].[TYPE_FICHIER]
ADD CONSTRAINT [PK_TYPE_FICHIER]
    PRIMARY KEY CLUSTERED ([TYPE_FICHIER_ID] ASC);
GO

-- Creating primary key on [TYPE_FINITION_ID] in table 'TYPE_FINITION'
ALTER TABLE [dbo].[TYPE_FINITION]
ADD CONSTRAINT [PK_TYPE_FINITION]
    PRIMARY KEY CLUSTERED ([TYPE_FINITION_ID] ASC);
GO

-- Creating primary key on [TYPE_MODELE_GAMME_ID] in table 'TYPE_MODELE_GAMME'
ALTER TABLE [dbo].[TYPE_MODELE_GAMME]
ADD CONSTRAINT [PK_TYPE_MODELE_GAMME]
    PRIMARY KEY CLUSTERED ([TYPE_MODELE_GAMME_ID] ASC);
GO

-- Creating primary key on [TYPE_MODULE_ID] in table 'TYPE_MODULE'
ALTER TABLE [dbo].[TYPE_MODULE]
ADD CONSTRAINT [PK_TYPE_MODULE]
    PRIMARY KEY CLUSTERED ([TYPE_MODULE_ID] ASC);
GO

-- Creating primary key on [MODULE_ID], [COMPOSANT_ID] in table 'UTILISER___COUPE_DE_PRINCIPE'
ALTER TABLE [dbo].[UTILISER___COUPE_DE_PRINCIPE]
ADD CONSTRAINT [PK_UTILISER___COUPE_DE_PRINCIPE]
    PRIMARY KEY CLUSTERED ([MODULE_ID], [COMPOSANT_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------