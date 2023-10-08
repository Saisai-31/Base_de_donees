-- Création des 3 tables, Pilote, Avion et vol
CREATE TABLE Pilote(
   NumPil INT,
   NomPil VARCHAR(50),
   Ville VARCHAR(50),
   Salaire DOUBLE,
   PRIMARY KEY(NumPil)
);

CREATE TABLE Avion(
   NumAvion INT,
   NomAv VARCHAR(50),
   Capacite INT,
   Ville VARCHAR(50),
   PRIMARY KEY(NumAvion)
);

CREATE TABLE Vol(
   NumPil INT,
   NumAvion INT,
   NumVol INT,
   Ville_Dep VARCHAR(50),
   Ville_Arr VARCHAR(50),
   H_Dep TIME,
   H_Arr TIME,
   PRIMARY KEY(NumPil, NumAvion),
   FOREIGN KEY(NumPil) REFERENCES Pilote(NumPil),
   FOREIGN KEY(NumAvion) REFERENCES Avion(NumAvion)
);

-- Insersion des data dans la table Avion
INSERT INTO `avion` (`NumAvion`, `NomAv`, `Capacite`, `Ville`) VALUES (NULL, 'Boeing747 French', '450', 'Paris'), 
(NULL, ' A320 french', '200', 'Paris'), (NULL, 'Boeing747 America', '420', 'New-York'), (NULL, ' A320 America', '200', 'New-York'),
 (NULL, 'Boeing747 Spain', '430', 'Madrid'), (NULL, ' A320 Italia', '200', 'Rome');
 
-- Insertion des data Pilote
INSERT INTO `pilote` (`NumPil`, `NomPil`, `Ville`, `Salaire`) VALUES (NULL, 'Saisai', 'Bruxelles', '25000'), 
(NULL, 'Youpi', 'Paris', '19000'), (NULL, 'Hola', 'Madrid', '16000'), (NULL, 'Venevecci', 'Rome', '20000'), 
(NULL, 'Golden', 'New-York', '28000'),(NULL, 'Lola', 'Paris', '15000');

-- -- Insertion des data Vol
INSERT INTO `vol` (`NumPil`, `NumAvion`, `NumVol`, `Ville_Dep`, `Ville_Arr`, `H_Dep`, `H_Arr`) 
VALUES ('1', '1', '1233', 'Paris', 'New-York', '12:00:00', '20:00:00'), ('2', '2', '1234', 'New-York', 'Paris', '10:00:00', '18:00:00'), 
('3', '3', '1235', 'Paris', 'Madrid', '10:00:00', '12:15:00'), ('4', '4', '1236', 'Paris', 'Rome', '12:00:00', '14:05:00'), 
('5', '5', '1237', 'Madrid', 'Paris', '10:00:00', '12:15:00'), ('2', '6', '1238', 'Rome ', 'Paris', '12:00:00', '14:05:00');


-- 1 - Donnez la liste des avions dont la capacité est supérieure à 350 passagers
	select * from avion where capacite > 350;

-- 2 - Quels sont les numéros et noms des avions localisés à New York ?
	SELECT NumAvion, NomAv from avion WHERE Ville = 'New-York';

-- 3 -Quels sont les numéros des pilotes en service et les villes de départ de leurs vols ?
	SELECT NumPil, Ville_Dep from vol;

-- 4. Donnez toutes les informations sur les pilotes de la compagnie
	SELECT * from pilote;

-- 5 - Quel est le nom des pilotes domiciliés à Bruxelles dont le salaire est supérieur à 20000 euros ?
	SELECT NomPil from pilote WHERE Ville='Bruxelles' and Salaire > 20000;

-- 6. Quels sont les avions (numéro et nom) localisés à Paris ou dont la capacité est inférieure à 350 passagers ?
	SELECT NumAvion, NomAv from avion where Ville='Paris' OR Capacite < 350;

-- 7. Quels sont les numéros des pilotes qui ne sont pas en service ?
	SELECT NumPil from pilote except (select Numpil from vol);
