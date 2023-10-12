mysql> use casse
Database changed
mysql> show tables;
+-----------------+
| Tables_in_casse |
+-----------------+
| personne        |
| vente           |
| voiture         |
+-----------------+
3 rows in set (0.00 sec)

mysql> select * from personne;
+--------+---------+-----+----------+------+
| NumAch | Nom     | Age | Ville    | Sexe |
+--------+---------+-----+----------+------+
|      1 | Nestor  |  96 | Paris    | M    |
|      2 | Irma    |  20 | Lille    | F    |
|      3 | Henri   |  45 | Paris    | M    |
|      4 | Josette |  34 | Lyon     | F    |
|      5 | Jacques |  50 | Bordeaux | M    |
+--------+---------+-----+----------+------+
5 rows in set (0.00 sec)

mysql> update personne set ville="Paris-centre" where ville="Paris";
Query OK, 2 rows affected (0.00 sec)
Enregistrements correspondants: 2  Modifi├®s: 2  Warnings: 0

mysql> select * from personne;
+--------+---------+-----+--------------+------+
| NumAch | Nom     | Age | Ville        | Sexe |
+--------+---------+-----+--------------+------+
|      1 | Nestor  |  96 | Paris-centre | M    |
|      2 | Irma    |  20 | Lille        | F    |
|      3 | Henri   |  45 | Paris-centre | M    |
|      4 | Josette |  34 | Lyon         | F    |
|      5 | Jacques |  50 | Bordeaux     | M    |
+--------+---------+-----+--------------+------+
5 rows in set (0.00 sec)

mysql> update personne set nom="Cyril" where numAch=3;
Query OK, 1 row affected (0.00 sec)
Enregistrements correspondants: 1  Modifi├®s: 1  Warnings: 0

mysql> select * from personne;
+--------+---------+-----+--------------+------+
| NumAch | Nom     | Age | Ville        | Sexe |
+--------+---------+-----+--------------+------+
|      1 | Nestor  |  96 | Paris-centre | M    |
|      2 | Irma    |  20 | Lille        | F    |
|      3 | Cyril   |  45 | Paris-centre | M    |
|      4 | Josette |  34 | Lyon         | F    |
|      5 | Jacques |  50 | Bordeaux     | M    |
+--------+---------+-----+--------------+------+
5 rows in set (0.00 sec)

mysql> update personne set nom="Jacque", ville="Nantes" where NumAch=5;
Query OK, 1 row affected (0.00 sec)
Enregistrements correspondants: 1  Modifi├®s: 1  Warnings: 0

mysql> select * from personne;
+--------+---------+-----+--------------+------+
| NumAch | Nom     | Age | Ville        | Sexe |
+--------+---------+-----+--------------+------+
|      1 | Nestor  |  96 | Paris-centre | M    |
|      2 | Irma    |  20 | Lille        | F    |
|      3 | Cyril   |  45 | Paris-centre | M    |
|      4 | Josette |  34 | Lyon         | F    |
|      5 | Jacque  |  50 | Nantes       | M    |
+--------+---------+-----+--------------+------+
5 rows in set (0.00 sec)

mysql> select * from personne;
+--------+---------+-----+--------------+------+
| NumAch | Nom     | Age | Ville        | Sexe |
+--------+---------+-----+--------------+------+
|      1 | Nestor  |  96 | Paris-centre | M    |
|      2 | Irma    |  20 | Lille        | F    |
|      3 | Cyril   |  45 | Paris-centre | M    |
|      4 | Josette |  34 | Lyon         | F    |
|      5 | Jacque  |  50 | Nantes       | M    |
+--------+---------+-----+--------------+------+
5 rows in set (0.00 sec)

mysql>  delete from personne where numach=5;
Query OK, 1 row affected (0.00 sec)

mysql> select * from personne;
+--------+---------+-----+--------------+------+
| NumAch | Nom     | Age | Ville        | Sexe |
+--------+---------+-----+--------------+------+
|      1 | Nestor  |  96 | Paris-centre | M    |
|      2 | Irma    |  20 | Lille        | F    |
|      3 | Cyril   |  45 | Paris-centre | M    |
|      4 | Josette |  34 | Lyon         | F    |
+--------+---------+-----+--------------+------+
4 rows in set (0.00 sec)

mysql> describe personne;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| NumAch | int         | NO   | PRI | NULL    | auto_increment |
| Nom    | varchar(20) | NO   |     | NULL    |                |
| Age    | int         | NO   |     | NULL    |                |
| Ville  | varchar(20) | NO   |     | NULL    |                |
| Sexe   | char(10)    | NO   |     | NULL    |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> insert into personne(numach, nom, age, ville, sexe) values("", "Jacques", 50, "Bordeaux", "M");
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> select * from personne;
+--------+---------+-----+--------------+------+
| NumAch | Nom     | Age | Ville        | Sexe |
+--------+---------+-----+--------------+------+
|      1 | Nestor  |  96 | Paris-centre | M    |
|      2 | Irma    |  20 | Lille        | F    |
|      3 | Cyril   |  45 | Paris-centre | M    |
|      4 | Josette |  34 | Lyon         | F    |
|      6 | Jacques |  50 | Bordeaux     | M    |
+--------+---------+-----+--------------+------+
5 rows in set (0.00 sec

