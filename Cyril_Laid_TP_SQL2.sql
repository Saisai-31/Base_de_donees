

--* Sélectionnez tous les enregistrements de la table "Employés" où le salaire est supérieur à 50000.

	SELECT * FROM Employés where salaire > 50000;

--* Augmentez le salaire de tous les employés de la table "Employés" de 10 %.

	UPDATE Employés SET salaire = salaire*1.1;

--Ajoutez un nouvel employé à la table "Employés" avec les informations suivantes :
--Nom : Smith
--Prénom : John 
--Poste : Manager
--Salaire : 60000

	INSERT INTO Employés (Id_emp, Nom, Prénom, Poste, Salaire) values ('', 'Smith', 'John', 'Manager', 60000);  
	
--* Supprimez tous les employés de la table "Employés" dont le salaire est inférieur à 40000.
	
	DELETE FROM Employés WHERE salaire<40000;

--Sélectionnez le nom de l'employé et le nom du département dans lequel chaque employé travaille en utilisant la table "Employés" 
--(qui contient l'ID du département) et la table "Départements" (qui contient l'ID du département et le nom du département).

	SELECT Employés.nom, Départements.dep_nom FROM Employés join Départements 
	ON Employés.id_dep = Département.id_dep;