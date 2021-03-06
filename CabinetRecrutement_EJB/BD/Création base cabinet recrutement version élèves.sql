-- Titre :             Création base cabinet recrutement version élèves.sql
-- Version :           1.0
-- Date création :     28 juin 2011
-- Date modification : 30 août 2011
-- Auteur :            Philippe Tanguy
-- Description :       Script de création de la base de données pour le SI  gestion de cabinet de
--                     recrutement 
--                     Note : script pour PostgreSQL 8.4
--                     Ebauche du script : ne contient pour le moment que la table  entreprise .

-- +----------------------------------------------------------------------------------------------+
-- | Suppression des tables                                                                       |
-- +----------------------------------------------------------------------------------------------+

drop table if exists  offreEmploi  cascade;
drop table if exists  niveauQualif  cascade;
drop table if exists  secteurActivite  cascade;
drop table if exists  offre_secteur  cascade;
drop table if exists  candidature  cascade;
drop table if exists  candidature_secteur  cascade;
drop table if exists  entreprise  cascade;

-- +----------------------------------------------------------------------------------------------+
-- | Création des tables                                                                          |
-- +----------------------------------------------------------------------------------------------+

create table  entreprise 
(
  id              serial primary key,
  nom             varchar(50) not null,
  descriptif      text,
  adresse_postale varchar(30) -- Pour simplifier, adresse_postale = ville.
);


create table  niveauQualif 
(
  id              serial primary key,
  intitule             varchar(50) not null
);

create table  offreEmploi 
(
  id              serial primary key,
  titre             varchar(50) not null,
  descriptif_mission      text,
  profil_recherche varchar(150),
  date_depot date,
  idEntreprise integer not null references  entreprise on delete cascade on update cascade,
  idQualification integer not null references  niveauQualif on delete cascade on update cascade
);

create table  secteurActivite 
(
  id              serial primary key,
  intitule             varchar(50) not null
);

create table  candidature 
(
  id              serial primary key,
  nom             varchar(50) not null,
  prenom             varchar(50) not null,
  date_naissance date,
  descriptif      text,
  adresse_postale varchar(30),
  adresse_email varchar(50),
  cv text,
  date_depot date,
  idQualification integer not null references  niveauQualif on delete cascade on update cascade
);


-- +----------------------------------------------------------------------------------------------+
-- | Création des tables intermédiaires                                                           |
-- +----------------------------------------------------------------------------------------------+


create table  offre_secteur 
(
  idOffre integer not null references  offreEmploi on delete cascade on update cascade,
  idSecteur integer not null references  secteurActivite on delete cascade on update cascade

);

create table  candidature_secteur 
(
  idCandidature integer not null references  candidature on delete cascade on update cascade,
  idSecteur integer not null references  secteurActivite on delete cascade on update cascade
);

-- +----------------------------------------------------------------------------------------------+
-- | Insertion de quelques données de pour les tests                                              |
-- +----------------------------------------------------------------------------------------------+

-- Insertion des secteurs d'activité

insert into  entreprise  values (nextval('entreprise_id_seq'),'Télécom Bretagne','Télécom Bretagne est une grande école pionnière en formation, en recherche et en entrepreneuriat.','Plouzané');
insert into  entreprise  values (nextval('entreprise_id_seq'),'ENIB','Une école d''ingénieur juste à côté...','Plouzané');

insert into niveauqualif values (nextval('niveauqualif_id_seq'), 'CAP/BEP');
insert into niveauqualif values (nextval('niveauqualif_id_seq'), 'Bac');
insert into niveauqualif values (nextval('niveauqualif_id_seq'), 'Bac+3');
insert into niveauqualif values (nextval('niveauqualif_id_seq'), 'Bac+5');
insert into niveauqualif values (nextval('niveauqualif_id_seq'), 'Doctorat');

insert into candidature values (nextval('candidature_id_seq'),'Herzog', 'Cedric',DATE '1994-05-17','blabla','16 rue de la roue qui chante','qsdqsd@dadazd.com','dcsdoijsdc cjdcpjspcj',DATE '2015-05-05',4);
insert into candidature values (nextval('candidature_id_seq'),'Chovelon', 'Pierrick',DATE '1994-05-17','blabla','16 rue de la roue qui fredonne','qsdqsd@dadazd.fr','dcsdoijsdc ffffff',DATE '2015-08-05',4);

insert into offreemploi values (nextval('offreemploi_id_seq'),'Ingénieur techno-commercial en Bretagne','Vous serez...','du texte',DATE '2015-06-06', 1,1);
insert into offreemploi values (nextval('offreemploi_id_seq'),'Ingénieur techno-commercial dans la Loire','Vous serez 2 ...','du texte 2',DATE '2015-07-07', 2,2);

insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Achat/Logistique');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Assistanat/Secrétariat');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Agrivulture');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Agroalimentaire');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Assurance');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Audit/Conseil/Expertises');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'BTP/Immobilier');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Commercial');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Communication/Art/Média/Mode');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Comptabilité');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Direction Générérale/Executive');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Distribution/Commerce');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Electronique/Microélectronique');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Environnement');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Finance/Banque');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Formation/Enseignement');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Hotellerie/Restauration/Tourisme');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Industrie/Ingénierie/Production');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Informatique');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Juridique/Fiscal/Droit');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Marketing');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Public/Parapublic');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Ressourcers Humaines');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Santé/Social/Biologie/Humanitaire');
insert into secteuractivite values (nextval('secteuractivite_id_seq'),'Télécom/Réseaux');



insert into candidature_secteur values (1,1);
insert into candidature_secteur values (2,2);

insert into offre_secteur values (1,1);
insert into offre_secteur values (2,2);


