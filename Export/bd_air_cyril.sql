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
-- Base de données : `bd_air_cyril`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

DROP TABLE IF EXISTS `avion`;
CREATE TABLE IF NOT EXISTS `avion` (
  `NumAvion` int NOT NULL AUTO_INCREMENT,
  `NomAv` varchar(50) DEFAULT NULL,
  `Capacite` int DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NumAvion`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `avion`
--

INSERT INTO `avion` (`NumAvion`, `NomAv`, `Capacite`, `Ville`) VALUES
(1, 'Boeing747 French', 450, 'Paris'),
(2, ' A320 french', 200, 'Paris'),
(3, 'Boeing747 America', 420, 'New-York'),
(4, ' A320 America', 200, 'New-York'),
(5, 'Boeing747 Spain', 430, 'Madrid'),
(6, ' A320 Italia', 200, 'Rome');

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

DROP TABLE IF EXISTS `pilote`;
CREATE TABLE IF NOT EXISTS `pilote` (
  `NumPil` int NOT NULL AUTO_INCREMENT,
  `NomPil` varchar(50) DEFAULT NULL,
  `Ville` varchar(50) DEFAULT NULL,
  `Salaire` double DEFAULT NULL,
  PRIMARY KEY (`NumPil`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`NumPil`, `NomPil`, `Ville`, `Salaire`) VALUES
(1, 'Saisai', 'Bruxelles', 25000),
(2, 'Youpi', 'Paris', 19000),
(3, 'Hola', 'Madrid', 16000),
(4, 'Venevecci', 'Rome', 20000),
(5, 'Golden', 'New-York', 28000),
(6, 'Lola', 'Paris', 15000);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `NumPil` int NOT NULL,
  `NumAvion` int NOT NULL,
  `NumVol` int DEFAULT NULL,
  `Ville_Dep` varchar(50) DEFAULT NULL,
  `Ville_Arr` varchar(50) DEFAULT NULL,
  `H_Dep` time DEFAULT NULL,
  `H_Arr` time DEFAULT NULL,
  PRIMARY KEY (`NumPil`,`NumAvion`),
  KEY `NumAvion` (`NumAvion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`NumPil`, `NumAvion`, `NumVol`, `Ville_Dep`, `Ville_Arr`, `H_Dep`, `H_Arr`) VALUES
(1, 1, 1233, 'Paris', 'New-York', '12:00:00', '20:00:00'),
(2, 2, 1234, 'New-York', 'Paris', '10:00:00', '18:00:00'),
(3, 3, 1235, 'Paris', 'Madrid', '10:00:00', '12:15:00'),
(4, 4, 1236, 'Paris', 'Rome', '12:00:00', '14:05:00'),
(5, 5, 1237, 'Madrid', 'Paris', '10:00:00', '12:15:00'),
(2, 6, 1238, 'Rome ', 'Paris', '12:00:00', '14:05:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
