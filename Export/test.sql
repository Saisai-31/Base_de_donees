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
-- Base de données : `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_table`
--

DROP TABLE IF EXISTS `t_table`;
CREATE TABLE IF NOT EXISTS `t_table` (
  `id` int NOT NULL,
  `nom_t` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `age_t` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `t_table`
--

INSERT INTO `t_table` (`id`, `nom_t`, `prenom`, `age_t`) VALUES
(1, 'Capricorne', 'Chèvre', 14),
(2, 'Martin', 'Chameau', 23),
(3, 'Pilo', 'Athos', 75);

-- --------------------------------------------------------

--
-- Structure de la table `t_table2`
--

DROP TABLE IF EXISTS `t_table2`;
CREATE TABLE IF NOT EXISTS `t_table2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_t` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `t_table2`
--

INSERT INTO `t_table2` (`id`, `nom_t`) VALUES
(1, 'Jacques'),
(2, 'Germain'),
(3, 'Francois'),
(4, 'Parfait');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
