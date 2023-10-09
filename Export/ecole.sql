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
-- Base de données : `ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id_eleve` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `classe` varchar(8) NOT NULL,
  PRIMARY KEY (`id_eleve`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `nom`, `prenom`, `classe`) VALUES
(1, 'Jacquot', 'Michel', '6a'),
(2, 'Renard', 'Michel', '6a'),
(3, 'Wech', 'Cyril', '6a'),
(4, 'Princesse', 'Maddie', '5a'),
(5, 'Bouquet', 'Marie', '5a'),
(6, 'Touje', 'Sylvain', '5a'),
(7, 'Poulard', 'Yasmina', '4a'),
(8, 'Vaine', 'Romain', '4a'),
(9, 'Blotte', 'Karinne', '3a'),
(10, 'Ramet', 'Laurent', '3a'),
(1001, 'Nom1', 'Prenom1', 'cm1'),
(1002, 'Nom2', 'Prenom2', 'cc2'),
(1003, 'Nom3', 'Prenom3', '3ème');

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

DROP TABLE IF EXISTS `prof`;
CREATE TABLE IF NOT EXISTS `prof` (
  `id_prof` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `matiere` varchar(50) NOT NULL,
  PRIMARY KEY (`id_prof`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prof`
--

INSERT INTO `prof` (`id_prof`, `nom`, `prenom`, `matiere`) VALUES
(1, 'Rametton', 'Laurence', 'Anglais'),
(2, 'Laloutte', 'Laurent', 'Francais'),
(3, 'Marmotte', 'Jeanine', 'Anglais'),
(4, 'Toulard', 'Jean', 'Francais'),
(5, 'Blair', 'Laurent', 'Math'),
(6, 'Nora', 'Nadia', 'Math'),
(7, 'Musclor', 'Henri', 'Sport'),
(8, 'Bioman', 'Bernard', 'Sport'),
(9, 'Vieux', 'Nicola', 'Histoire'),
(10, 'Vase', 'Clovis', 'Histoire'),
(11, 'Médecin', 'Jean', 'Philo'),
(13, 'Jaures', 'Jean', 'Anglais'),
(14, 'Curies', 'Marie', 'Math'),
(15, 'Menez', 'Gilles', 'Histoire'),
(16, 'Lahire', 'Philippe', 'Géographie'),
(17, 'Kounalis', 'Emanuel', 'Sport'),
(18, 'Renevier', 'Philippe', 'Chinois'),
(12, 'Barla', 'Chelsea', 'Francais');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
