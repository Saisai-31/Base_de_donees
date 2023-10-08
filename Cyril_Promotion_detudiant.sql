-- Création de ma base de données
	create database `promotion d'étudiants`;
 
-- Vérifier que ma base de donnée à bien été crée
	show datababes;
 
-- Entrer dans ma bdd promotion d'étudiants
	use `promotion d'étudiants`;
 
-- Création de la table étudiants`
	create table etudiant (Num_Etudiant int primary key auto_increment not null, Nom varchar(50) not null, Prénom varchar(50) not null);
 
 -- Voir ma table étudiant avec son descriftifs
	describe etudiant;
 
-- Insérer les data dans la table étidiants
	INSERT INTO etudiant (Num_Etudiant, Nom, Prénom) VALUES(1, 'Youpi', 'Laurianne'),(2, 'Ranplant', 'Laurent'),(3, 'Jaillard', 'Lucile'),(4, 'Djebali', 'Sonia'),(5, 'Revers', 'Christophe');
 
 -- Voir ma table etudiant avec ses datababes
	select * from etudiant;
 
-- Création de la table matiere avec ses verifications
	CREATE TABLE matiere (Code_Mat int primary key  AUTO_INCREMENT not null, Libelle_matiere varchar(50) not null,  Coef_Mat DOUBLE not null);
	show tables;
	describe matiere;
   
-- Insérer les data dans la table matiere et vérifier
	 INSERT INTO matiere (Code_Mat, Libelle_matiere, Coef_Mat) VALUES(1, 'Francais', '2'),(2, 'Anglais', '1'),(3, 'EPS', '1'),(4, 'Math', '5'),(5, 'Histoire', '2');
	 select * from matiere;
	 
-- Création de la table evaluer avec ses verifications
	CREATE TABLE Evaluer(
    ->    Num_Etudiant INT,
    ->    Code_Mat INT,
    ->    Dates DATE,
    ->    Note INT),
    ->    PRIMARY KEY(Num_Etudiant, Code_Mat),
    ->    FOREIGN KEY(Num_Etudiant) REFERENCES Etudiant(Num_Etudiant),
    ->    FOREIGN KEY(Code_Mat) REFERENCES Matiere(Code_Mat)
    -> );
	show tables;
	describe evaluer;
	
-- Insérer les data dans la table evaluer et vérifier
	INSERT INTO evaluer (Num_Etudiant, Code_Mat, Dates, Note) VALUES
	(1, 1, '2023-10-01', 12),
	(1, 2, '2023-10-02', 15),
	(1, 3, '2023-10-03', 8),
	(1, 4, '2023-10-04', 7),
	(1, 5, '2023-10-05', 16),
	(2, 1, '2023-10-01', 13),
	(2, 2, '2023-10-02', 15),
	(2, 3, '2023-10-03', 8),
	(2, 4, '2023-10-04', 15),
	(2, 5, '2023-10-05', 15),
	(3, 1, '2023-10-01', 8),
	(3, 2, '2023-10-02', 15),
	(3, 3, '2023-10-03', 15),
	(3, 4, '2023-10-04', 15),
	(3, 5, '2023-10-05', 15),
	(4, 1, '2023-10-01', 8),
	(4, 2, '2023-10-02', 7),
	(4, 3, '2023-10-03', 5),
	(4, 4, '2023-10-04', 9),
	(4, 5, '2023-10-05', 10),
	(5, 1, '2023-10-01', 15),
	(5, 2, '2023-10-02', 15),
	(5, 3, '2023-10-03', 14),
	(5, 4, '2023-10-04', 18),
	(5, 5, '2023-10-05', 16);
	select * from evaluer;
	
-- 1 - Donner le nombre total d'étudiants ? 
	select count(*) FROM etudiant;
	
-- 2 - Afficher parmi l'ensemble des notes, la note la plus haute et la note la plus basse ?
	select max(Note), min(Note) from evaluer;
	
-- 3 - Afficher les moyennes de chaque étudiant dans chacune des matières ? 
	-- Join pour joindre les table entre elles, ON relie les tables par leur ID, j'utilise dans select nomDeLaTable.Champs 
	-- GROUP BY pour regrouper les résultats par numéro d'étudiant, nom et prénom de l'étudiant et le libellé des matière.
	SELECT etudiant.Num_Etudiant, etudiant.Nom, etudiant.Prénom, matiere.Libelle_matiere AS Matiere, AVG(evaluer.Note) AS Moyenne 
	FROM etudiant JOIN evaluer ON etudiant.Num_Etudiant = evaluer.Num_Etudiant JOIN  matiere ON evaluer.Code_Mat = matiere.Code_Mat 
	GROUP BY etudiant.Num_Etudiant, etudiant.Nom, etudiant.Prénom, matiere.Libelle_matiere;
	
-- 4 - Afficher la moyenne générale de chaque étudiants
	-- Order by me permet de trier les résultats par le Num_Etudiant (l'ID) de la table etudiant
	SELECT etudiant.Num_Etudiant, etudiant.Nom, etudiant.Prénom, SUM(evaluer.Note * matiere.Coef_Mat) / SUM(matiere.Coef_Mat) AS Moyenne_Générale_Pondérée 
	FROM etudiant JOIN Evaluer ON etudiant.Num_Etudiant = evaluer.Num_Etudiant JOIN matiere ON evaluer.Code_Mat = matiere.Code_Mat 
	GROUP BY etudiant.Num_Etudiant, etudiant.Nom, etudiant.Prénom ORDER BY etudiant.Num_Etudiant;
	
-- 5 - Afficher les étudiants qui ont une moyenne générale supérieure 15 
	--(Having permet de filtrer les résultats généré dans Moyenne_Générale_Pondéré
	SELECT etudiant.Num_Etudiant, etudiant.Nom, etudiant.Prénom, SUM(evaluer.Note * matiere.Coef_Mat) / SUM(matiere.Coef_Mat) AS Moyenne_Générale_Pondérée 
	FROM etudiant JOIN Evaluer ON etudiant.Num_Etudiant = evaluer.Num_Etudiant JOIN matiere ON evaluer.Code_Mat = matiere.Code_Mat 
	GROUP BY etudiant.Num_Etudiant, etudiant.Nom, etudiant.Prénom HAVING Moyenne_Générale_Pondérée > 15 ORDER BY etudiant.Num_Etudiant;