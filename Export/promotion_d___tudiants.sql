-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 07 oct. 2023 à 22:19
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `promotion d'étudiants`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `Num_Etudiant` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prénom` varchar(50) NOT NULL,
  PRIMARY KEY (`Num_Etudiant`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`Num_Etudiant`, `Nom`, `Prénom`) VALUES
(1, 'Youpi', 'Laurianne'),
(2, 'Ranplant', 'Laurent'),
(3, 'Jaillard', 'Lucile'),
(4, 'Djebali', 'Sonia'),
(5, 'Revers', 'Christophe');

-- --------------------------------------------------------

--
-- Structure de la table `evaluer`
--

DROP TABLE IF EXISTS `evaluer`;
CREATE TABLE IF NOT EXISTS `evaluer` (
  `Num_Etudiant` int NOT NULL,
  `Code_Mat` int NOT NULL,
  `Dates` date DEFAULT NULL,
  `Note` int DEFAULT NULL,
  PRIMARY KEY (`Num_Etudiant`,`Code_Mat`),
  KEY `Code_Mat` (`Code_Mat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `evaluer`
--

INSERT INTO `evaluer` (`Num_Etudiant`, `Code_Mat`, `Dates`, `Note`) VALUES
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

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `Code_Mat` int NOT NULL AUTO_INCREMENT,
  `Libelle_matiere` varchar(50) NOT NULL,
  `Coef_Mat` double NOT NULL,
  PRIMARY KEY (`Code_Mat`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`Code_Mat`, `Libelle_matiere`, `Coef_Mat`) VALUES
(1, 'Francais', 2),
(2, 'Anglais', 1),
(3, 'EPS', 1),
(4, 'Math', 5),
(5, 'Histoire', 2);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `moyenne_generale`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `moyenne_generale`;
CREATE TABLE IF NOT EXISTS `moyenne_generale` (
`Num_Etudiant` int
,`Nom` varchar(50)
,`Prénom` varchar(50)
,`Moyenne_generale` double
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `moyenne_matiere`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `moyenne_matiere`;
CREATE TABLE IF NOT EXISTS `moyenne_matiere` (
`Num_Etudiant` int
,`Nom` varchar(50)
,`Prénom` varchar(50)
,`Libelle_matiere` varchar(50)
,`Coef_Mat` double
,`Moyenne_Matiere` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Structure de la vue `moyenne_generale`
--
DROP TABLE IF EXISTS `moyenne_generale`;

DROP VIEW IF EXISTS `moyenne_generale`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `moyenne_generale`  AS SELECT `moyenne_matiere`.`Num_Etudiant` AS `Num_Etudiant`, `moyenne_matiere`.`Nom` AS `Nom`, `moyenne_matiere`.`Prénom` AS `Prénom`, (sum((`moyenne_matiere`.`Moyenne_Matiere` * `moyenne_matiere`.`Coef_Mat`)) / sum(`moyenne_matiere`.`Coef_Mat`)) AS `Moyenne_generale` FROM `moyenne_matiere` GROUP BY `moyenne_matiere`.`Num_Etudiant`, `moyenne_matiere`.`Nom`, `moyenne_matiere`.`Prénom``Prénom`  ;

-- --------------------------------------------------------

--
-- Structure de la vue `moyenne_matiere`
--
DROP TABLE IF EXISTS `moyenne_matiere`;

DROP VIEW IF EXISTS `moyenne_matiere`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `moyenne_matiere`  AS SELECT `etudiant`.`Num_Etudiant` AS `Num_Etudiant`, `etudiant`.`Nom` AS `Nom`, `etudiant`.`Prénom` AS `Prénom`, `matiere`.`Libelle_matiere` AS `Libelle_matiere`, `matiere`.`Coef_Mat` AS `Coef_Mat`, avg(`evaluer`.`Note`) AS `Moyenne_Matiere` FROM ((`etudiant` join `matiere`) join `evaluer`) WHERE ((`evaluer`.`Code_Mat` = `matiere`.`Code_Mat`) AND (`evaluer`.`Num_Etudiant` = `etudiant`.`Num_Etudiant`)) GROUP BY `etudiant`.`Nom`, `etudiant`.`Prénom`, `matiere`.`Libelle_matiere`, `matiere`.`Coef_Mat``Coef_Mat`  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
