﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class ACCEDER_APPLICATION
{
    public int PERSONNEL_ID { get; set; }
    public decimal APPLICATION_ID { get; set; }
}

public partial class ACCEDER_APPLICATION2
{
    public int PERSONNEL_ID { get; set; }
    public decimal APPLICATION_ID { get; set; }
}

public partial class ACCEDER_APPLICATION3
{
    public int PERSONNEL_ID { get; set; }
    public int APPLICATION_ID { get; set; }
}

public partial class ACCES_APPLICATION
{
    public int APPLICATION_ID { get; set; }
    public string APPLICATION_NOM { get; set; }
}

public partial class ASSOC_MODULE
{
    public int MODULE_PARENT_ID { get; set; }
    public int MODULE_ENFANT_ID { get; set; }
    public int QUANTITE { get; set; }
}

public partial class BUREAU_ETUDE
{
    public int PERSONNEL_ID { get; set; }
    public string SPECIALISATION { get; set; }
    public string PERSONNEL_LOGIN { get; set; }
    public string PERSONNEL_MDP { get; set; }
    public string PERSONNEL_TOKEN { get; set; }
    public string PERSONNEL_NOM { get; set; }
    public string PERSONNEL_PRENOM { get; set; }
}

public partial class CLIENT
{
    public int CLIENT_ID { get; set; }
    public string CLIENT_REFERENCE { get; set; }
    public string CLIENT_NAME { get; set; }
}

public partial class COMMANDE
{
    public int COMMANDE_ID { get; set; }
    public Nullable<System.DateTime> COMMANDE_DATE { get; set; }
    public Nullable<short> COMMANDE_STATUT { get; set; }
}

public partial class COMMERCIAL
{
    public int PERSONNEL_ID { get; set; }
    public string SECTEUR { get; set; }
    public string NUMERO_MOBILE { get; set; }
    public string PERSONNEL_LOGIN { get; set; }
    public string PERSONNEL_MDP { get; set; }
    public string PERSONNEL_TOKEN { get; set; }
    public string PERSONNEL_NOM { get; set; }
    public string PERSONNEL_PRENOM { get; set; }
}

public partial class COMPOSANT
{
    public int COMPOSANT_ID { get; set; }
    public int TYPE_COMPOSANT { get; set; }
    public int FOURNISSEUR_ID { get; set; }
    public string COMPOSANT_NOM { get; set; }
    public Nullable<int> COMPOSANT_STOCK { get; set; }
    public Nullable<decimal> COMPOSANT_VALEUR_CARACTERISTIQUE_1 { get; set; }
    public Nullable<decimal> COMPOSANT_VALEUR_CARACTERISTIQUE_2 { get; set; }
    public double VALEUR_AJOUTEE { get; set; }
}

public partial class COMPOSANT_IMAGE
{
    public int FICHIER_ID { get; set; }
    public int COMPOSANT_ID { get; set; }
}

public partial class COMPTABLE
{
    public int PERSONNEL_ID { get; set; }
    public string NUMERO_POSTE { get; set; }
    public string PERSONNEL_LOGIN { get; set; }
    public string PERSONNEL_MDP { get; set; }
    public string PERSONNEL_TOKEN { get; set; }
    public string PERSONNEL_NOM { get; set; }
    public string PERSONNEL_PRENOM { get; set; }
}

public partial class CONTACT_CLIENT
{
    public int CONTACT_ID { get; set; }
    public int CLIENT_ID { get; set; }
    public string CONTACT_NOM { get; set; }
    public string CONTACT_TELEPHONE { get; set; }
    public string CONTACT_MAIL { get; set; }
    public string CONTACT_ADRESSE { get; set; }
    public string CONTACT_ADRESSE2 { get; set; }
    public string CONTACT_CP { get; set; }
    public string CONTACT_VILLE { get; set; }
    public string CONTACT_CLIENT_SITUATION_MATRIMONIALE { get; set; }
}

public partial class CONTACT_FOURNISSEUR
{
    public int CONTACT_ID { get; set; }
    public int FOURNISSEUR_ID { get; set; }
    public string CONTACT_NOM { get; set; }
    public string CONTACT_TELEPHONE { get; set; }
    public string CONTACT_MAIL { get; set; }
    public string CONTACT_ADRESSE { get; set; }
    public string CONTACT_ADRESSE2 { get; set; }
    public string CONTACT_CP { get; set; }
    public string CONTACT_VILLE { get; set; }
    public string CONTACT_FOURNISSEUR_POSTE { get; set; }
}

public partial class CONTENIR
{
    public int PRODUIT_ID { get; set; }
    public int MODELE_GAMME_ID { get; set; }
}

public partial class DEVIS
{
    public int DEVIS_ID { get; set; }
    public int CLIENT_ID { get; set; }
    public Nullable<int> PERSONNEL_ID { get; set; }
    public Nullable<int> BUR_PERSONNEL_ID { get; set; }
    public Nullable<int> COM_PERSONNEL_ID { get; set; }
    public Nullable<decimal> DEVIS_ESTIMATION_PRIX { get; set; }
    public Nullable<System.DateTime> DEVIS_DATE { get; set; }
    public string DEVIS_NOM_PROJET { get; set; }
    public string DEVIS_REFERENCE { get; set; }
    public Nullable<short> DEVIS_ETAT { get; set; }
}

public partial class EST_COUPE_DE_PRINCIPE
{
    public int FICHIER_ID { get; set; }
    public int MODULE_ID { get; set; }
}

public partial class EST_DISPONIBLE
{
    public int MODULE_ID { get; set; }
    public int GAMME_ID { get; set; }
}

public partial class EST_FICHIER_DEVIS
{
    public int FICHIER_ID { get; set; }
    public int DEVIS_ID { get; set; }
    public int TYPE_FICHIER_ID { get; set; }
}

public partial class EST_RESPONSABLE
{
    public int PERSONNEL_ID { get; set; }
    public int COMPOSANT_ID { get; set; }
}

public partial class ETAPE_ECHELONNEMENT
{
    public int ETAPE_ECHELONNEMENT_ID { get; set; }
    public string ETAPE_ECHELONNEMENT_NOM { get; set; }
    public Nullable<int> ETAPE_ECHELONNEMENT_ORDRE { get; set; }
}

public partial class FAIRE_PARTIE
{
    public int GAMME_ID { get; set; }
    public int FINITION_ID { get; set; }
}

public partial class FICHIER
{
    public int FICHIER_ID { get; set; }
    public int TYPE_FICHIER_ID { get; set; }
    public string FICHIER_NOM { get; set; }
    public string FICHIER_CHEMIN { get; set; }
    public long FICHIER_POIDS { get; set; }
}

public partial class FINITION
{
    public int FINITION_ID { get; set; }
    public int TYPE_FINITION_ID { get; set; }
    public string FINITION_NOM { get; set; }
    public string FINITION_DESCRIPTION { get; set; }
}

public partial class FINITION_IMAGE
{
    public int FINITION_ID { get; set; }
    public int FICHIER_ID { get; set; }
}

public partial class FOURNISSEUR
{
    public int FOURNISSEUR_ID { get; set; }
    public string FOURNISSEUR_SIRET { get; set; }
    public string FOURNISSEUR_SIREN { get; set; }
    public string FOURNISSEUR_NOM { get; set; }
}

public partial class GAMME
{
    public int GAMME_ID { get; set; }
    public string GAMME_NOM { get; set; }
    public string GAMME_DESCRIPTION { get; set; }
}

public partial class LIER_FINITION
{
    public int FINITION_ID { get; set; }
    public int MODELE_GAMME_ID { get; set; }
}

public partial class LIER_MODULE
{
    public int MODULE_ID { get; set; }
    public int MODELE_GAMME_ID { get; set; }
    public string IDENTIFICATION { get; set; }
    public string SECTION { get; set; }
    public Nullable<int> LONGUEUR { get; set; }
    public Nullable<int> HAUTEUR { get; set; }
}

public partial class LIGNE_COMMANDE
{
    public int COMMANDE_ID { get; set; }
    public int COMPOSANT_ID { get; set; }
    public int FOURNISSEUR_ID { get; set; }
    public decimal PRIX_ACHAT { get; set; }
    public int QUANTITE_LIGNE_COMMANDE { get; set; }
}

public partial class MODELE_DE_GAMME
{
    public int MODELE_GAMME_ID { get; set; }
    public int GAMME_ID { get; set; }
    public int TYPE_MODELE_GAMME_ID { get; set; }
    public bool EST_PAR_DEFAUT { get; set; }
    public string MODELE_GAMME_NOM { get; set; }
    public string MODELE_GAMME_DESCRIPTION { get; set; }
    public Nullable<int> MODELE_GAMME_NB_PIECES { get; set; }
    public Nullable<int> MODELE_GAMME_SURFACE { get; set; }
}

public partial class MODELE_GAMME_IMAGE
{
    public int MODELE_GAMME_ID { get; set; }
    public int FICHIER_ID { get; set; }
}

public partial class MODULE
{
    public int MODULE_ID { get; set; }
    public int TYPE_MODULE_ID { get; set; }
    public Nullable<int> PERSONNEL_ID { get; set; }
    public string MODULE_NOM { get; set; }
    public string MODULE_TYPE { get; set; }
    public double MODULE_MARGE_COMMERCIAL { get; set; }
    public double MODULE_MARGE_ENTREPRISE { get; set; }
}

public partial class PAYER
{
    public int ETAPE_ECHELONNEMENT_ID { get; set; }
    public int DEVIS_ID { get; set; }
    public Nullable<decimal> POURCENTAGE_ETAPE { get; set; }
    public Nullable<bool> STATUT_PAIEMENT { get; set; }
    public Nullable<System.DateTime> DATE_ECHEANCE { get; set; }
    public Nullable<System.DateTime> DATE_PAIEMENT { get; set; }
    public Nullable<decimal> MONTANT_PAYER { get; set; }
}

public partial class PEUT_APPLIQUER
{
    public int MODULE_ID { get; set; }
    public int FINITION_ID { get; set; }
}

public partial class PRODUIT
{
    public int PRODUIT_ID { get; set; }
    public int DEVIS_ID { get; set; }
    public int GAMME_ID { get; set; }
    public string PRODUIT_NOM { get; set; }
    public string PRODUIT_DESCRIPTION { get; set; }
    public Nullable<int> MODELE_DE_GAMME_ID { get; set; }
}

public partial class TYPE_COMPOSANT
{
    public int TYPE_COMPOSANT1 { get; set; }
    public string TYPE_COMPOSANT_NOM { get; set; }
    public string TYPE_COMPOSANT_CARACTERISTIQUE { get; set; }
    public string TYPE_COMPOSANT_UNITE_USAGE { get; set; }
}

public partial class TYPE_FICHIER
{
    public int TYPE_FICHIER_ID { get; set; }
    public string TYPE_FICHIER_NOM { get; set; }
}

public partial class TYPE_FINITION
{
    public int TYPE_FINITION_ID { get; set; }
    public string TYPE_FINITION_NOM { get; set; }
}

public partial class TYPE_MODELE_GAMME
{
    public int TYPE_MODELE_GAMME_ID { get; set; }
    public string TYPE_MODELE_GAMME_NOM { get; set; }
}

public partial class TYPE_MODULE
{
    public int TYPE_MODULE_ID { get; set; }
    public string TYPE_MODULE_NOM { get; set; }
    public string TYPE_MODULE_UNITE_USAGE { get; set; }
    public string TYPE_MODULE_CARACTERISTIQUE { get; set; }
}

public partial class UTILISER___COUPE_DE_PRINCIPE
{
    public int MODULE_ID { get; set; }
    public int COMPOSANT_ID { get; set; }
    public int QUANTITE_COUPE { get; set; }
}
