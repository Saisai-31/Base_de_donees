--Ces exercices couvrent des concepts de base tels que SELECT, WHERE, ORDER BY et JOIN.
--Exercice 1:
--Sélectionnez tous les enregistrements de la table "Employés".
select * from Employés;

--Exercice 2:
--Sélectionnez le nom et le salaire des employés qui gagnent plus de 50000€. Triez les résultats par salaire décroissant.
select nom, salaire from Employés where salaire > 50 000 order by salaire DESC;

Exercice 3: 
Sélectionnez le nom de l'employé, le nom du département et le salaire pour tous les employés. Si un employé n'est affilié à aucun département,
 affichez "Non affilié".
 select em.nom, em.salaire, IF(dep.nom is not null, dep.nom, 'Non affilié') from Employés as em Join département as dep on em.iddep = dep.iddep
 
 --ou et mieux
 SELECT e.nom, COALESCE(d.nom, 'Non affilié') AS département, e.salaire
FROM Employés e LEFT JOIN Départements d ON e.id_departement = d.id;
 
--Exercice 4:
--Calculez le nombre total d'employés dans chaque département. Affichez le nom du département et le nombre d'employés.
SELECT d.nom AS département, COUNT(e.id) AS nombre_employés
FROM Départements d LEFT JOIN Employés e ON d.id = e.id_departement
GROUP BY d.nom;

--Exercice 5:
--Sélectionnez le nom, le salaire maximum et le salaire minimum de tous les employés.
select nom, max(salaire) AS salaire_maximum, min(salaire) AS salaire_minimum from Employés;