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
delete from dbo.EST_COUPE_DE_PRINCIPE;
delete from dbo.MODULE;
delete from dbo.TYPE_FINITION;
delete from dbo.FINITION;
delete from dbo.FAIRE_PARTIE;
delete from dbo.LIER_FINITION;
delete from dbo.EST_DISPONIBLE;
delete from dbo.LIER_MODULE;
delete from dbo.ASSOC_MODULE;



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


	
	
insert into dbo.MODULE (TYPE_MODULE_ID, PERSONNEL_ID, MODULE_NOM, MODULE_TYPE, MODULE_MARGE_COMMERCIAL, MODULE_MARGE_ENTREPRISE) values 
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 	'Mur ext nord' 			, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 	'Mur ext sud'  			, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 	'Mur ext est'  			, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 	'Mur ext ouest'			, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 	'Mur int avec porte'	,	'1', 5, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 	'Mur int sans porte'	,	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 	'Mur int ouvert'    	,	'1', 8, 30),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Plancher sur dalle'), 		null, 	'Plancher dalle 1'		, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Plancher sur dalle'), 		null, 	'Plancher dalle 2'		, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Plancher sur dalle'), 		null, 	'Plancher dalle 3'		, 	'1', 6, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Plancher porteur'), 		null, 	'Plancher porteur 1'	,	'1', 5, 30),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Plancher porteur'), 		null, 	'Plancher porteur 2'	,	'1', 5, 30),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Plancher porteur'), 		null, 	'Plancher porteur 3'	,	'1', 5, 30),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Fermes de charpente'), 	null, 	'Ferme de Charpente 1'	, '1', 5, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Fermes de charpente'), 	null, 	'Ferme de Charpente 2'	, '1', 7, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Fermes de charpente'), 	null, 	'Ferme de Charpente 3'	, '1', 9, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Fermes de charpente'), 	null, 	'Ferme de Charpente 4'	, '1', 5, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Couverture'), 				null, 	'Couverture 1'			, '1', 8, 10),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Couverture'), 				null, 	'Couverture 2'			, '1', 6, 15),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Couverture'), 				null, 	'Couverture 3'			, '1', 8, 25),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Couverture'), 				null, 	'Couverture 4'			, '1', 6, 10);
insert into dbo.MODULE (TYPE_MODULE_ID, PERSONNEL_ID, MODULE_NOM, MODULE_TYPE, MODULE_MARGE_COMMERCIAL, MODULE_MARGE_ENTREPRISE) values
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 'Module extérieur petit'	, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 'Module extérieur moyen'	, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Murs extérieurs'), 		null, 'Module extérieur grand'	, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Cuisine américaine'		, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Cuisine classique'		, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Salle de bain x2'			, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Salle de bain'			, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Chambre x3'			, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Chambre x2'			, '1', 7, 20),
	((select TYPE_MODULE_ID from dbo.TYPE_MODULE where TYPE_MODULE_NOM like 'Cloisons intérieures'), 	null, 'Chambre'					, '1', 7, 20);
	
	
insert into dbo.ASSOC_MODULE (MODULE_PARENT_ID, MODULE_ENFANT_ID, QUANTITE) values
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord' 			), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'  			), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'  			), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'			), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord' 			), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'  			), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'  			), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'			), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord' 			), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'  			), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'  			), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'			), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 	'Mur int sans porte'	), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 	'Mur int avec porte'	), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 	'Mur int ouvert'    	), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 		'Mur int sans porte'	), 3),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 		'Mur int avec porte'	), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'	), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 		'Mur int sans porte'    ), 3),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 			'Mur int avec porte'    ), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain x2'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 		'Salle de bain'    ), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 				'Mur int sans porte'    ), 3),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 				'Mur int avec porte'    ), 1),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 		    'Chambre'    ), 2),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x3'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 		    'Chambre'    ), 3);
	

insert into dbo.EST_COUPE_DE_PRINCIPE (FICHIER_ID, MODULE_ID) values 
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord' 			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'  			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'  			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int avec porte'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int sans porte'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int ouvert'    	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'		)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 2'		)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 3'		)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 1'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 2'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 3'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 1'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 4'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 1'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 4'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit')),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen')),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand')),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'	)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'		)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain x2'			)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'				)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'				)),
	((select FICHIER_ID from dbo.FICHIER where FICHIER_NOM like 'Image bidon'), (select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x3'				));

	
	
insert into dbo.TYPE_FINITION (TYPE_FINITION_NOM) values
	('Finition intérieure'),
	('Finition extérieure'),
	('Isolation'),
	('Plancher'),
	('Couverture'),
	('Qualité des huisseries');
	
insert into dbo.FINITION (TYPE_FINITION_ID, FINITION_NOM, FINITION_DESCRIPTION) values
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Isolation'), 'Laine de verre', 'Fibres naturelles'),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Isolation'), 'Chanvre', 'Fibres naturelles'),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Isolation'), 'Laine minérale', 'Fibres naturelles'),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Finition extérieure'), 'Bois', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Finition extérieure'), 'Crépis', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Finition intérieure'), 'Peinture', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Finition intérieure'), 'Papier peint', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Plancher'), 'Parquet', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Plancher'), 'Carrelage', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Couverture'), 'Tuile', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Couverture'), 'Ardoise', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Qualité des huisseries'), 'Huisserie en or', ''),
	((select TYPE_FINITION_ID from dbo.TYPE_FINITION where TYPE_FINITION_NOM like 'Qualité des huisseries'), 'Huisserie en platre', '');
	

insert into dbo.FAIRE_PARTIE (GAMME_ID, FINITION_ID) values
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'      )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Chanvre'             )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine minérale'      )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Bois'                )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'              )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'            )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Papier peint'        )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'             )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Carrelage'           )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'               )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Ardoise'             )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'     )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en platre' ));
insert into dbo.FAIRE_PARTIE (GAMME_ID, FINITION_ID) values
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'      )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine minérale'      )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Bois'                )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'            )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Papier peint'        )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'             )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'               )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'     )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en platre' ));
insert into dbo.FAIRE_PARTIE (GAMME_ID, FINITION_ID) values
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'      )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Bois'                )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Papier peint'        )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'             )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'               )),
	((select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'), (select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en platre' ));


insert into dbo.LIER_FINITION (FINITION_ID, MODELE_GAMME_ID) values
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'         )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'             )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'     )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'    )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Laine de verre'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'));
 insert into dbo.LIER_FINITION (FINITION_ID, MODELE_GAMME_ID) values
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'         )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'             )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'     )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'    )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Crépis'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'));
 insert into dbo.LIER_FINITION (FINITION_ID, MODELE_GAMME_ID) values
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'         )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'             )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'     )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'    )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Peinture'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'));
 insert into dbo.LIER_FINITION (FINITION_ID, MODELE_GAMME_ID) values
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'         )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'             )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'     )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'    )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Parquet'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'));
 insert into dbo.LIER_FINITION (FINITION_ID, MODELE_GAMME_ID) values
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'         )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'             )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'     )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'    )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Tuile'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'));
 insert into dbo.LIER_FINITION (FINITION_ID, MODELE_GAMME_ID) values
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'                )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'         )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'             )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'      )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'            )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'     )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'    )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'   )),
	((select FINITION_ID from dbo.FINITION where FINITION_NOM like 'Huisserie en or'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'));
 
 insert into dbo.EST_DISPONIBLE (MODULE_ID, GAMME_ID) values
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain x2'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x3'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord'            ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'             ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'             ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int avec porte'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int sans porte'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int ouvert'               ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 2'    ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 3'    ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 1'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 2'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 3'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 1'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 4'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 1'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 4'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Premium'));
  insert into dbo.EST_DISPONIBLE (MODULE_ID, GAMME_ID) values
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'   ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord'            ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'             ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'             ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int avec porte'          ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int sans porte'          ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int ouvert'              ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 2'    ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 1'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 2'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 1'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 1'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Medium'));
 insert into dbo.EST_DISPONIBLE (MODULE_ID, GAMME_ID) values
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext nord'            ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext sud'             ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext est'             ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur ext ouest'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int avec porte'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Mur int sans porte'           ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 1'  ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 1'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 1'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco')),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'        ), (select GAMME_ID from dbo.GAMME where GAMME_NOM like 'Eco'));
	
	
	
 insert into dbo.LIER_MODULE (MODULE_ID, MODELE_GAMME_ID, IDENTIFICATION, SECTION, LONGUEUR, HAUTEUR) values
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'), 'Murs extérieurs'	, 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 1'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 1'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Eco'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'          ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'          ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'), 'Cuisine 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Eco'), 'Couverture 1', 'section', 160, 45);

 insert into dbo.LIER_MODULE (MODULE_ID, MODELE_GAMME_ID, IDENTIFICATION, SECTION, LONGUEUR, HAUTEUR) values	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur petit'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'), 'Murs extérieurs'	, 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Medium'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'       ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'), 'Cuisine 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 2'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Medium'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Cuisine 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Chambre 1'	    , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Cuisine 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Chambre 1 et 2'	    , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 2'  ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Grande maison Medium'), 'Couverture 1', 'section', 160, 45);
	
 insert into dbo.LIER_MODULE (MODULE_ID, MODELE_GAMME_ID, IDENTIFICATION, SECTION, LONGUEUR, HAUTEUR) values
    ((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'), 'Murs extérieurs'			, 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 2'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'), 'Plancher 1'  		, 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 1'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'), 'Charpente 1' 		, 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Studio Premium'), 'Couverture 1'		, 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur moyen'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Cuisine 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Chambre 1'	  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 2'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 2'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 2'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Petite maison Premium'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine classique'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Cuisine 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Chambre 1 et 2'	  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 1'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 1'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison moyenne Premium'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain'         ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Salle de bain 1', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'     ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Cuisine 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'               ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Chambre 1 et 2'	  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 2'  ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 4'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 4'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 1'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain x2'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Salle de bain 1 et 2', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Cuisine 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x2'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Chambre 1 et 2'	 , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher porteur 3'  ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 3'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 4'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Maison grande Premium 2'), 'Couverture 1', 'section', 160, 45),
	
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Module extérieur grand'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Murs extérieurs', 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Salle de bain x2'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Salle de bain 1 et 2' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Cuisine américaine'      ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Cuisine 1'	 , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Chambre x3'           ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Chambre 1, 2 et 3'   , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Plancher dalle 3'    ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Plancher 1'  , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Ferme de Charpente 4'), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Charpente 1' , 'section', 160, 45),
	((select MODULE_ID from dbo.MODULE where MODULE_NOM like 'Couverture 3'        ), (select MODELE_GAMME_ID from dbo.MODELE_DE_GAMME where MODELE_GAMME_NOM like 'Très grande maison Premium'), 'Couverture 1', 'section', 160, 45);
	