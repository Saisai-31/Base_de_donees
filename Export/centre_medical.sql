-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 oct. 2023 à 11:23
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
-- Base de données : `centre_medical`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id_Consultation` int NOT NULL AUTO_INCREMENT,
  `Numero_de_consultation` int DEFAULT NULL,
  `Date_de_consultation` date DEFAULT NULL,
  `id_Patient` int NOT NULL,
  `id_Medecin` int NOT NULL,
  PRIMARY KEY (`id_Consultation`),
  KEY `id_Patient` (`id_Patient`),
  KEY `id_Medecin` (`id_Medecin`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id_Consultation`, `Numero_de_consultation`, `Date_de_consultation`, `id_Patient`, `id_Medecin`) VALUES
(1, 1245, '2023-09-04', 0, 0),
(3, 1246, '2023-09-05', 0, 0),
(4, 1247, '2023-09-06', 0, 0),
(5, 1248, '2023-09-10', 0, 0),
(6, 1249, '2023-09-11', 0, 0),
(7, 1250, '2023-09-13', 0, 0),
(8, 1251, '2023-09-14', 0, 0),
(9, 1252, '2023-09-15', 0, 0),
(10, 1253, '2023-09-17', 0, 0),
(11, 1254, '2023-09-19', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id_Medecin` int NOT NULL AUTO_INCREMENT,
  `Matricule` int DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Medecin`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id_Medecin`, `Matricule`, `Nom`) VALUES
(1, 2536, 'Docteur Cyril'),
(2, 2537, 'Docteur Youss'),
(4, 2538, 'Docteur Lala'),
(5, 2539, 'Docteur Loulou'),
(6, 2539, 'Docteur Dure'),
(7, 2540, 'Docteur More'),
(8, 2541, 'Docteur Quota'),
(9, 2542, 'Docteur Suret'),
(10, 2543, 'Docteur Vasseur'),
(11, 2544, 'Docteur Vaillant');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id_Medicament` int NOT NULL AUTO_INCREMENT,
  `Code` int DEFAULT NULL,
  `Libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Medicament`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id_Medicament`, `Code`, `Libelle`) VALUES
(1, 1000, 'Dafalgan'),
(2, 1001, 'Doliprane'),
(3, 1002, 'Efferalgan'),
(4, 1003, 'Nurofen'),
(5, 1004, 'Advil'),
(6, 1005, 'Codeine'),
(7, 1006, 'Tramadol'),
(8, 1007, 'Levothyroxine'),
(9, 1008, 'Amoxicilline'),
(10, 1009, 'Adrigyl');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id_Patient` int NOT NULL AUTO_INCREMENT,
  `Numéro_de_Sécurité_Sociale` bigint DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Patient`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id_Patient`, `Numéro_de_Sécurité_Sociale`, `Nom`) VALUES
(1, 160042531111426, 'Plot'),
(2, 260042531111426, 'Loops'),
(3, 265042531111426, 'Veropa'),
(4, 165042531111426, 'Laurent'),
(5, 270020531111426, 'Mbala'),
(6, 170020531111426, 'Chang'),
(7, 178020831111426, 'Youpi'),
(8, 278020831111426, 'Houlala'),
(9, 280020831111426, 'Cimer'),
(10, 180020831111426, 'Vanne');

-- --------------------------------------------------------

--
-- Structure de la table `prescrit`
--

DROP TABLE IF EXISTS `prescrit`;
CREATE TABLE IF NOT EXISTS `prescrit` (
  `id_Medicament` int NOT NULL,
  `id_Consultation` int NOT NULL,
  `Nb_prises` int DEFAULT NULL,
  PRIMARY KEY (`id_Medicament`,`id_Consultation`),
  KEY `id_Consultation` (`id_Consultation`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prescrit`
--

INSERT INTO `prescrit` (`id_Medicament`, `id_Consultation`, `Nb_prises`) VALUES
(1, 0, 5),
(2, 0, 2),
(3, 0, 1),
(4, 0, 3),
(5, 0, 2),
(6, 0, 1),
(7, 0, 6),
(8, 0, 3),
(9, 0, 2),
(10, 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
