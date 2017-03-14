delete from dbo.GAMME;
delete from dbo.TYPE_MODELE_GAMME;
delete from dbo.MODELE_DE_GAMME;
delete from dbo.TYPE_MODULE;
delete from dbo.TYPE_FICHIER;
delete from dbo.TYPE_COMPOSANT;
delete from dbo.COMPOSANT;
delete from dbo.FOURNISSEUR;
delete from dbo.MODELE_GAMME_IMAGE;
delete from dbo.FICHIER;




insert into dbo.GAMME (GAMME_NOM, GAMME_DESCRIPTION) values ('Premium', 'Pour les plus riches.');
insert into dbo.GAMME (GAMME_NOM, GAMME_DESCRIPTION) values ('Medium', 'Pour les plus medium.');
insert into dbo.GAMME (GAMME_NOM, GAMME_DESCRIPTION) values ('Eco', 'Pour les plus pauvres.');

insert into dbo.TYPE_FICHIER (TYPE_FICHIER_NOM) values ('Image');

insert into dbo.FICHIER (TYPE_FICHIER_ID, FICHIER_NOM, FICHIER_CHEMIN, FICHIER_POIDS) values 
	((select TYPE_FICHIER_ID from dbo.TYPE_FICHIER where TYPE_FICHIER_NOM like 'Image'), 'Image bidon', '/path/name', 15);


insert into dbo.TYPE_MODELE_GAMME (TYPE_MODELE_GAMME_NOM) values ('F1');
insert into dbo.TYPE_MODELE_GAMME (TYPE_MODELE_GAMME_NOM) values ('F2');
insert into dbo.TYPE_MODELE_GAMME (TYPE_MODELE_GAMME_NOM) values ('F3');
insert into dbo.TYPE_MODELE_GAMME (TYPE_MODELE_GAMME_NOM) values ('F4');


insert into dbo.MODELE_DE_GAMME (GAMME_ID, TYPE_MODELE_GAMME_ID, EST_PAR_DEFAUT, MODELE_GAMME_NOM, MODELE_GAMME_DESCRIPTION, MODELE_GAMME_NB_PIECES, MODELE_GAMME_SURFACE) values
	((select GAMME_ID from GAMME where GAMME_NOM like 'Eco'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F1'), 0, 'Studio Eco', 'Petit studio', 1, 20),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Eco'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F2'), 0, 'Petite maison Eco', 'Petite maison', 2, 30),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Medium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F1'), 0, 'Studio Medium', 'Studio', 1, 25),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Medium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F2'), 0, 'Petite maison Medium', 'Petite maison', 2, 35),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Medium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F3'), 0, 'Maison moyenne', 'Maison de taille moyenne', 3, 45),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Medium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F3'), 0, 'Grande maison Medium', 'Grande maison', 3, 60),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Premium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F1'), 0, 'Studio Premium', 'Grand Studio', 1, 40),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Premium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F2'), 0, 'Petite maison Premium', 'Petite maison', 2, 50),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Premium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F2'), 0, 'Maison moyenne Premium', 'Maison moyenne', 2, 60),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Premium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F3'), 0, 'Maison grande Premium 1', 'Grande maison', 3, 70),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Premium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F3'), 0, 'Maison grande Premium 2', 'Grande maison', 3, 75),
	((select GAMME_ID from GAMME where GAMME_NOM like 'Premium'), (select TYPE_MODELE_GAMME_ID from TYPE_MODELE_GAMME where TYPE_MODELE_GAMME_NOM='F4'), 0, 'Très grande maison Premium', 'Grande maison', 4, 85);

insert into dbo.MODELE_GAMME_IMAGE (MODELE_GAMME_ID, FICHIER_ID) values
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                 ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'          ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'              ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'       ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'             ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'       ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'             ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'      ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'     ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'    ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'    ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon')),
	((select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium' ), (select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'));

	
	
insert into dbo.TYPE_MODULE (TYPE_MODULE_NOM, TYPE_MODULE_UNITE_USAGE,TYPE_MODULE_CARACTERISTIQUE) values 
	('Murs extérieurs', 'm', 'Hauteur-Longueur'),
	('Cloisons intérieures', 'm', 'Hauteur-Longueur'),
	('Plancher sur dalle', 'm2', 'Hauteur-Longueur'),
	('Plancher porteur', 'm2', 'Hauteur-Longueur'),
	('Fermes de charpente', 'unité', 'Longueur'),
	('Couverture', 'm2', 'Hauteur-Longueur');

insert into dbo.TYPE_COMPOSANT (TYPE_COMPOSANT_NOM, TYPE_COMPOSANT_CARACTERISTIQUE, TYPE_COMPOSANT_UNITE_USAGE) values
	('Lisses', 'Section en cm', 'Longueur en cm'),
	('Eléments de montages', 'Section en cm', 'pièce'),
	('Panneaux d’isolation et pare-pluie', 'Epaisseur en cm', 'Surface en m2'),
	('Panneaux intermédiaires et de couverture', 'Section en mm', 'Surface en m2'),
	('Planchers', 'Section en mm', 'Surface en m2'),
	('Couverture (tuiles ou ardoises)', 'Longueur et largeur en mm', '');

insert into dbo.FOURNISSEUR (FOURNISSEUR_SIRET, FOURNISSEUR_SIREN, FOURNISSEUR_NOM) values
	('123456', '123456789', 'IKEA');


insert into dbo.COMPOSANT (TYPE_COMPOSANT, FOURNISSEUR_ID, COMPOSANT_NOM, COMPOSANT_STOCK, COMPOSANT_VALEUR_CARACTERISTIQUE_1, COMPOSANT_VALEUR_CARACTERISTIQUE_2, VALEUR_AJOUTEE) values
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Lisses'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Montant vertical', 100, 120, null, 0),
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Lisses'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Lisse basse', 150, 120, null, 0),
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Lisses'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Lisse haute', 150, 120, null, 0),
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Lisses'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Entretoise', 150, 120, null, 0),
	
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Eléments de montages'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Sabot métallique', 1000, 120, null, 0),
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Eléments de montages'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Boulon', 1200, 120, null, 0),
	((select TYPE_COMPOSANT1 from dbo.TYPE_COMPOSANT where TYPE_COMPOSANT_NOM like 'Eléments de montages'), (select FOURNISSEUR_ID from dbo.FOURNISSEUR where FOURNISSEUR_NOM like 'IKEA'), 'Goujeon', 1500, 120, null, 0);


















