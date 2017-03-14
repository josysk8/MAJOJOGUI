delete from dbo.GAMME;
delete from dbo.TYPE_MODELE_GAMME;
delete from dbo.MODELE_DE_GAMME;

insert into dbo.GAMME (GAMME_NOM, GAMME_DESCRIPTION) values ('Premium', 'Pour les plus riches.');
insert into dbo.GAMME (GAMME_NOM, GAMME_DESCRIPTION) values ('Medium', 'Pour les plus medium.');
insert into dbo.GAMME (GAMME_NOM, GAMME_DESCRIPTION) values ('Eco', 'Pour les plus pauvres.');


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
