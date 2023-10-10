

--Exercice 1: 

--Supposons que vous ayez une table "Utilisateurs" avec les colonnes suivantes : id, nom, prénom, âge, ville.

--Q1: afficher tous les utilisateurs.

	SELECT * FROM Utilisateurs; 

--Q2 : afficher le nom et le prénom des utilisateurs. 
	
	SELECT nom, prénom FROM Utilisateurs;


--Exercice 2:Supposons que vous ayez une table "Commandes" avec les colonnes suivantes : 

--id_commande, id_utilisateur, produit, quantité, date.

--Q1. Afficher la première commande;

	SELECT * FROM Commandes WHERE id_commande = 1;

--Q2. Afficher la quantité totale des produits par utilisateur;

	SELECT id_utilisateur, SUM(quantité) as total_produit from Commandes GROUP BY id_utilisateur;
	

--Exercice 3:

--Supposons que vous ayez une table "Produits" avec les colonnes suivantes : id_produit, nom_produit, prix, stock.

--Q1.afficher les produits supérieurs à 50
	
	SELECT * FROM Produits WHERE prix > 50 OR stock > 50;

--Q2. afficher le nom et la quantité en stock des produits;

	SELECT DISTINCT nom_produit, stock FROM Produits;
	SELECT nom_produit, SUM(stock) as total_stock from Produits GROUP BY nom_produit;
