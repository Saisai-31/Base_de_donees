-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 oct. 2023 à 11:24
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
-- Base de données : `tournoi`
--

-- --------------------------------------------------------

--
-- Structure de la table `gagne`
--

DROP TABLE IF EXISTS `gagne`;
CREATE TABLE IF NOT EXISTS `gagne` (
  `id_Joueur` int NOT NULL,
  `id_Game` int NOT NULL,
  `Score` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Joueur`,`id_Game`),
  KEY `id_Game` (`id_Game`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `gagne`
--

INSERT INTO `gagne` (`id_Joueur`, `id_Game`, `Score`) VALUES
(0, 0, '3 à 0');

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id_Game` int NOT NULL AUTO_INCREMENT,
  `Numero_du_match` int DEFAULT NULL,
  `Horaire` time DEFAULT NULL,
  PRIMARY KEY (`id_Game`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id_Game`, `Numero_du_match`, `Horaire`) VALUES
(1, 1, '10:24:19'),
(2, 2, '10:24:19'),
(3, 3, '11:25:13'),
(4, 4, '11:25:13'),
(5, 5, '12:25:13'),
(6, 6, '12:25:13'),
(7, 7, '13:28:42'),
(8, 8, '13:28:42'),
(9, 9, '14:29:33'),
(10, 10, '14:29:33');

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `id_Joueur` int NOT NULL AUTO_INCREMENT,
  `Numero_de_carte` int DEFAULT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Joueur`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `joueur`
--

INSERT INTO `joueur` (`id_Joueur`, `Numero_de_carte`, `Nom`) VALUES
(1, 120, 'Cyril'),
(2, 121, 'Gasquet'),
(3, 122, 'Magne'),
(4, 123, 'Coudroit'),
(5, 124, 'Revers'),
(6, 125, 'Smash'),
(7, 126, 'Nadal'),
(8, 127, 'Federrer'),
(9, 128, 'Abon'),
(10, 129, 'Rebond');

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

DROP TABLE IF EXISTS `participe`;
CREATE TABLE IF NOT EXISTS `participe` (
  `id_Joueur` int NOT NULL,
  `id_Game` int NOT NULL,
  PRIMARY KEY (`id_Joueur`,`id_Game`),
  KEY `id_Game` (`id_Game`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `se_joue_sur`
--

DROP TABLE IF EXISTS `se_joue_sur`;
CREATE TABLE IF NOT EXISTS `se_joue_sur` (
  `id_Game` int NOT NULL,
  `id_Terrain` int NOT NULL,
  PRIMARY KEY (`id_Game`,`id_Terrain`),
  KEY `id_Terrain` (`id_Terrain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `terrain`
--

DROP TABLE IF EXISTS `terrain`;
CREATE TABLE IF NOT EXISTS `terrain` (
  `id_Terrain` int NOT NULL AUTO_INCREMENT,
  `Numero_de_terrain` int DEFAULT NULL,
  `Surface` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Terrain`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `terrain`
--

INSERT INTO `terrain` (`id_Terrain`, `Numero_de_terrain`, `Surface`) VALUES
(1, 1, 'Terre battue'),
(2, 2, 'Terre battue'),
(3, 3, 'Terre battue'),
(4, 4, 'Terre battue'),
(5, 5, 'Gazon synthétique'),
(6, 6, 'Gazon synthétique'),
(7, 7, 'Gazon synthétique'),
(8, 8, ' Dur asphalte'),
(9, 9, ' Dur asphalte'),
(10, 10, ' Dur asphalte');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
