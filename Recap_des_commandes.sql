Microsoft Windows [version 10.0.19045.3448]
(c) Microsoft Corporation. Tous droits réservés.

C:\Windows\system32>mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 38
Server version: 8.0.31 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database banque3
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| banque             |
| banque3            |
| casse              |
| centre_medical     |
| client_commande    |
| ecole              |
| information_schema |
| journal            |
| mabase2            |
| mysql              |
| performance_schema |
| sys                |
| test               |
| tournoi            |
+--------------------+
14 rows in set (0.00 sec)

mysql> use banque3
Database changed

mysql> create table client (id_client int primary key auto_increment, Nom varchar(50) not null, Prenom varchar(50) not null);
Query OK, 0 rows affected (0.01 sec)

mysql> describe client
    -> ;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id_client | int         | NO   | PRI | NULL    | auto_increment |
| Nom       | varchar(50) | NO   |     | NULL    |                |
| Prenom    | varchar(50) | NO   |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> insert into client (id_client, Nom, Prenom) values ("", "Martin", "Oiseau");
Query OK, 1 row affected, 1 warning (0.01 sec)

mysql> insert into client (id_client, Nom, Prenom) values ("", 'Jacques', 'Tralala'),("", 'Henri', 'Yallah');
Query OK, 2 rows affected, 2 warnings (0.00 sec)
Enregistrements: 2  Doublons: 0  Avertissements: 2

mysql> select * from client;
+-----------+---------+---------+
| id_client | Nom     | Prenom  |
+-----------+---------+---------+
|         1 | Martin  | Oiseau  |
|         2 | Jacques | Tralala |
|         3 | Henri   | Yallah  |
+-----------+---------+---------+
3 rows in set (0.00 sec)

mysql> create table commande (id_commande int primary key auto_increment, Nom_Prod varchar(50) not null, Prix_Prod varchar(50) not null);
Query OK, 0 rows affected (0.01 sec)

mysql> describe commande;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_commande | int         | NO   | PRI | NULL    | auto_increment |
| Nom_Prod    | varchar(50) | NO   |     | NULL    |                |
| Prix_Prod   | varchar(50) | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> alter table commande modify Prix_Prod double;
Query OK, 0 rows affected (0.02 sec)
Enregistrements: 0  Doublons: 0  Avertissements: 0

mysql> describe commande;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_commande | int         | NO   | PRI | NULL    | auto_increment |
| Nom_Prod    | varchar(50) | NO   |     | NULL    |                |
| Prix_Prod   | double      | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> alter table commande modify Prix_Prod double not null;
Query OK, 0 rows affected (0.02 sec)
Enregistrements: 0  Doublons: 0  Avertissements: 0

mysql> describe commande;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_commande | int         | NO   | PRI | NULL    | auto_increment |
| Nom_Prod    | varchar(50) | NO   |     | NULL    |                |
| Prix_Prod   | double      | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> show tables;
+-------------------+
| Tables_in_banque3 |
+-------------------+
| client            |
| commande          |
+-------------------+
2 rows in set (0.00 sec)

mysql> describe commande
    -> ;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| id_commande | int         | NO   | PRI | NULL    | auto_increment |
| Nom_Prod    | varchar(50) | NO   |     | NULL    |                |
| Prix_Prod   | double      | NO   |     | NULL    |                |
| id_client   | int         | NO   | MUL | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> use casse
Database changed
mysql> select * from vente;
+------------+------+--------+---------+
| DateVente  | prix | NumAch | NumVoit |
+------------+------+--------+---------+
| 1985-12-03 |   10 |      1 |       1 |
| 1996-03-30 |   70 |      2 |       4 |
| 1998-06-14 |   30 |      4 |       1 |
| 2000-04-02 |   45 |      5 |       2 |
+------------+------+--------+---------+
4 rows in set (0.00 sec)

mysql> select ville as city from personne,
    -> ;
ERROR 1064 (42000): Erreur de syntaxe près de '' à la ligne 1
mysql> select ville as city from personne;
+----------+
| city     |
+----------+
| Paris    |
| Lille    |
| Paris    |
| Lyon     |
| Bordeaux |
+----------+
5 rows in set (0.00 sec)

mysql> select distinct Marque from voiture;
+---------+
| Marque  |
+---------+
| Peugeot |
| Citroen |
| Opel    |
| Renault |
+---------+
4 rows in set (0.00 sec)

mysql> select upper(nom) as NomEnMajuscule from personne;
+----------------+
| NomEnMajuscule |
+----------------+
| NESTOR         |
| IRMA           |
| HENRI          |
| JOSETTE        |
| JACQUES        |
+----------------+
5 rows in set (0.00 sec)

mysql> select month(DateVente) as mois from vente;
+------+
| mois |
+------+
|   12 |
|    3 |
|    6 |
|    4 |
+------+
4 rows in set (0.00 sec)

mysql> select year(DateVente) as mois from vente;
+------+
| mois |
+------+
| 1985 |
| 1996 |
| 1998 |
| 2000 |
+------+
4 rows in set (0.00 sec)

mysql> select day(DateVente) as mois from vente;
+------+
| mois |
+------+
|    3 |
|   30 |
|   14 |
|    2 |
+------+
4 rows in set (0.00 sec)

mysql> select avg(prix) as prix_moyen from vente;
+------------+
| prix_moyen |
+------------+
|    38.7500 |
+------------+
1 row in set (0.00 sec)

mysql> select count(*) as nombre_personne from personne;
+-----------------+
| nombre_personne |
+-----------------+
|               5 |
+-----------------+
1 row in set (0.00 sec)

mysql> select * from vente where prix > 50;
+------------+------+--------+---------+
| DateVente  | prix | NumAch | NumVoit |
+------------+------+--------+---------+
| 1996-03-30 |   70 |      2 |       4 |
+------------+------+--------+---------+
1 row in set (0.00 sec)

mysql> select * from voiture where couleur = "Blanche" or Marque = "Peugeot";
+---------+---------+------+---------+
| NumVoit | Marque  | Type | Couleur |
+---------+---------+------+---------+
|       1 | Peugeot | 405  | rouge   |
|       3 | Opel    | GT   | Blanche |
|       4 | Peugeot | 403  | Blanche |
+---------+---------+------+---------+
3 rows in set (0.00 sec)

mysql> select * from personne where not (ville = 'Paris');
+--------+---------+-----+----------+------+
| NumAch | Nom     | Age | Ville    | Sexe |
+--------+---------+-----+----------+------+
|      2 | Irma    |  20 | Lille    | F    |
|      4 | Josette |  34 | Lyon     | F    |
|      5 | Jacques |  50 | Bordeaux | M    |
+--------+---------+-----+----------+------+
3 rows in set (0.00 sec)

mysql> select marque from voiture group by marque;
+---------+
| marque  |
+---------+
| Peugeot |
| Citroen |
| Opel    |
| Renault |
+---------+
4 rows in set (0.00 sec)

mysql> select marque, count(*) from voiture group by marque;
+---------+----------+
| marque  | count(*) |
+---------+----------+
| Peugeot |        2 |
| Citroen |        1 |
| Opel    |        1 |
| Renault |        3 |
+---------+----------+
4 rows in set (0.00 sec)

mysql> select * from voiture;
+---------+---------+-------------+---------+
| NumVoit | Marque  | Type        | Couleur |
+---------+---------+-------------+---------+
|       1 | Peugeot | 405         | rouge   |
|       2 | Citroen | SM          | Noire   |
|       3 | Opel    | GT          | Blanche |
|       4 | Peugeot | 403         | Blanche |
|       5 | Renault | Alpine A310 | Rose    |
|       6 | Renault | Alpine A310 | Rose    |
|       7 | Renault | Floride     | Bleue   |
+---------+---------+-------------+---------+
7 rows in set (0.00 sec)

mysql> select marque, count(*) as compte from voiture group by marque having compte > 1;
+---------+--------+
| marque  | compte |
+---------+--------+
| Peugeot |      2 |
| Renault |      3 |
+---------+--------+
2 rows in set (0.00 sec)

mysql> select marque, count(*) as compte from voiture where not (couleur='Rouge') group by marque;
+---------+--------+
| marque  | compte |
+---------+--------+
| Citroen |      1 |
| Opel    |      1 |
| Peugeot |      1 |
| Renault |      3 |
+---------+--------+
4 rows in set (0.00 sec)


mysql> select voiture.marque, voiture.couleur from voiture;
+---------+---------+
| marque  | couleur |
+---------+---------+
| Peugeot | rouge   |
| Citroen | Noire   |
| Opel    | Blanche |
| Peugeot | Blanche |
| Renault | Rose    |
| Renault | Rose    |
| Renault | Bleue   |
+---------+---------+
7 rows in set (0.00 sec)

mysql> select vo.marque, vo.couleur from voiture as vo;
+---------+---------+
| marque  | couleur |
+---------+---------+
| Peugeot | rouge   |
| Citroen | Noire   |
| Opel    | Blanche |
| Peugeot | Blanche |
| Renault | Rose    |
| Renault | Rose    |
| Renault | Bleue   |
+---------+---------+
7 rows in set (0.00 sec)

mysql> select * from voiture, personne;
+---------+---------+-------------+---------+--------+---------+-----+----------+------+
| NumVoit | Marque  | Type        | Couleur | NumAch | Nom     | Age | Ville    | Sexe |
+---------+---------+-------------+---------+--------+---------+-----+----------+------+
|       1 | Peugeot | 405         | rouge   |      5 | Jacques |  50 | Bordeaux | M    |
|       1 | Peugeot | 405         | rouge   |      4 | Josette |  34 | Lyon     | F    |
|       1 | Peugeot | 405         | rouge   |      3 | Henri   |  45 | Paris    | M    |
|       1 | Peugeot | 405         | rouge   |      2 | Irma    |  20 | Lille    | F    |
|       1 | Peugeot | 405         | rouge   |      1 | Nestor  |  96 | Paris    | M    |
|       2 | Citroen | SM          | Noire   |      5 | Jacques |  50 | Bordeaux | M    |
|       2 | Citroen | SM          | Noire   |      4 | Josette |  34 | Lyon     | F    |
|       2 | Citroen | SM          | Noire   |      3 | Henri   |  45 | Paris    | M    |
|       2 | Citroen | SM          | Noire   |      2 | Irma    |  20 | Lille    | F    |
|       2 | Citroen | SM          | Noire   |      1 | Nestor  |  96 | Paris    | M    |
|       3 | Opel    | GT          | Blanche |      5 | Jacques |  50 | Bordeaux | M    |
|       3 | Opel    | GT          | Blanche |      4 | Josette |  34 | Lyon     | F    |
|       3 | Opel    | GT          | Blanche |      3 | Henri   |  45 | Paris    | M    |
|       3 | Opel    | GT          | Blanche |      2 | Irma    |  20 | Lille    | F    |
|       3 | Opel    | GT          | Blanche |      1 | Nestor  |  96 | Paris    | M    |
|       4 | Peugeot | 403         | Blanche |      5 | Jacques |  50 | Bordeaux | M    |
|       4 | Peugeot | 403         | Blanche |      4 | Josette |  34 | Lyon     | F    |
|       4 | Peugeot | 403         | Blanche |      3 | Henri   |  45 | Paris    | M    |
|       4 | Peugeot | 403         | Blanche |      2 | Irma    |  20 | Lille    | F    |
|       4 | Peugeot | 403         | Blanche |      1 | Nestor  |  96 | Paris    | M    |
|       5 | Renault | Alpine A310 | Rose    |      5 | Jacques |  50 | Bordeaux | M    |
|       5 | Renault | Alpine A310 | Rose    |      4 | Josette |  34 | Lyon     | F    |
|       5 | Renault | Alpine A310 | Rose    |      3 | Henri   |  45 | Paris    | M    |
|       5 | Renault | Alpine A310 | Rose    |      2 | Irma    |  20 | Lille    | F    |
|       5 | Renault | Alpine A310 | Rose    |      1 | Nestor  |  96 | Paris    | M    |
|       6 | Renault | Alpine A310 | Rose    |      5 | Jacques |  50 | Bordeaux | M    |
|       6 | Renault | Alpine A310 | Rose    |      4 | Josette |  34 | Lyon     | F    |
|       6 | Renault | Alpine A310 | Rose    |      3 | Henri   |  45 | Paris    | M    |
|       6 | Renault | Alpine A310 | Rose    |      2 | Irma    |  20 | Lille    | F    |
|       6 | Renault | Alpine A310 | Rose    |      1 | Nestor  |  96 | Paris    | M    |
|       7 | Renault | Floride     | Bleue   |      5 | Jacques |  50 | Bordeaux | M    |
|       7 | Renault | Floride     | Bleue   |      4 | Josette |  34 | Lyon     | F    |
|       7 | Renault | Floride     | Bleue   |      3 | Henri   |  45 | Paris    | M    |
|       7 | Renault | Floride     | Bleue   |      2 | Irma    |  20 | Lille    | F    |
|       7 | Renault | Floride     | Bleue   |      1 | Nestor  |  96 | Paris    | M    |
+---------+---------+-------------+---------+--------+---------+-----+----------+------+
35 rows in set (0.00 sec)

mysql> describe vente;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| DateVente | date | NO   |     | NULL    |       |
| prix      | int  | NO   |     | NULL    |       |
| NumAch    | int  | NO   | MUL | NULL    |       |
| NumVoit   | int  | NO   | MUL | NULL    |       |
+-----------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select voiture.marque, voiture.couleur, vente.prix from voiture, vente where voiture.numVoit=vente.numVoit;
+---------+---------+------+
| marque  | couleur | prix |
+---------+---------+------+
| Peugeot | rouge   |   10 |
| Peugeot | Blanche |   70 |
| Peugeot | rouge   |   30 |
| Citroen | Noire   |   45 |
+---------+---------+------+
4 rows in set (0.00 sec)

mysql> select vo.marque, vo.couleur, ve.prix, pe.nom, pe.age from voiture as vo, vente as ve, personne as pe where (vo.numvoit=ve.numvoit) and (pe.numach=ve.numach);
+---------+---------+------+---------+-----+
| marque  | couleur | prix | nom     | age |
+---------+---------+------+---------+-----+
| Peugeot | rouge   |   10 | Nestor  |  96 |
| Peugeot | Blanche |   70 | Irma    |  20 |
| Peugeot | rouge   |   30 | Josette |  34 |
| Citroen | Noire   |   45 | Jacques |  50 |
+---------+---------+------+---------+-----+
4 rows in set (0.00 sec)

mysql> select voiture.marque, voiture.couleur, vente.prix from voiture join vente on voiture.numvoit = vente.numvoit;
+---------+---------+------+
| marque  | couleur | prix |
+---------+---------+------+
| Peugeot | rouge   |   10 |
| Peugeot | Blanche |   70 |
| Peugeot | rouge   |   30 |
| Citroen | Noire   |   45 |
+---------+---------+------+
4 rows in set (0.00 sec)

mysql> select vo.marque, vo.couleur, ve.prix, pe.nom, pe.age from voiture as vo join vente as ve join personne as pe on (vo.numvoit=ve.numvoit) and (pe.numach=ve.numach);
+---------+---------+------+---------+-----+
| marque  | couleur | prix | nom     | age |
+---------+---------+------+---------+-----+
| Peugeot | rouge   |   10 | Nestor  |  96 |
| Peugeot | Blanche |   70 | Irma    |  20 |
| Peugeot | rouge   |   30 | Josette |  34 |
| Citroen | Noire   |   45 | Jacques |  50 |
+---------+---------+------+---------+-----+
4 rows in set (0.00 sec)