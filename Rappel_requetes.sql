

--SQL	|--LMD - Langage de Manipulation des données
--		|	--SELECT / INSERT / UPDATE / DELETE
--		|
--		|--LDD - Langage de Définition des données
--		|	--CREATE / ALTER / DROP
	



-- Créer une BDD mabase
	CREATE DATABASE mabase;

-- Utiliser une base
	USE mabase;

-- Savoir ce que contient la BDD
	SHOW TABLES;

-- Créer une table matable
	CREATE TABLE Matable(
		id_mt INT PRIMARY KEY AUTO_INCREMENT,
		nom_mt VARCHAR(50) NOT NULL,
		prenom_mt VARCHAR(80) NOT NULL,
		age INT NOT NULL
	);

-- Afficher la description de matable
	DESCRIBE matable;

-- Insérer des données dans matable
	INSERT INTO matable (id_mt, nom_mt, prenom_mt, age)
	VALUE ('', 'Pholoppe', 'Cyril', 45);
	
-- Vérifier le contenu de matable
	SELECT * FROM matable;
	
-- Vérifier l'âge maximum
	SELECT MAX(age) FROM matable;
	
-- Afficher un nom qui comprend la lettre l
	SELECT * FROM matable WHERE nom LIKE %l%;
	
-- Créer une table ecole 
	CREATE TABLE ecole(
	id_ec INT PRIMARY KEY AUTO_INCREMENT,
	nom_ec VARCHAR(50) NOT NULL
	);

-- Même chose en précisant que notre table sera en InnoDB
	CREATE TABLE ecole(
	id_ec INT PRIMARY KEY AUTO_INCREMENT,
	nom_ec VARCHAR(50) NOT NULL
	) ENGINE = InnoDB;
	
-- Insertion des données dans école
	INSERT INTO ecole (id_ec, nom_ec)
	VALUE ('', 'Université de Tours'),
	('', 'Université de Paris'),
	('', 'Université de Toulouse');
	
-- Affiche le nom par école
	SELECT m.nom_mt, e.nom_ec
	FROM matable AS m
	JOIN ecole AS e
	ON m.id_ec = e.id_ec;