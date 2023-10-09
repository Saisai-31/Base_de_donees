-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 09 oct. 2023 à 08:39
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
-- Base de données : `casse`
--

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `NumAch` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) NOT NULL,
  `Age` int NOT NULL,
  `Ville` varchar(20) NOT NULL,
  `Sexe` char(10) NOT NULL,
  PRIMARY KEY (`NumAch`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`NumAch`, `Nom`, `Age`, `Ville`, `Sexe`) VALUES
(1, 'Nestor', 96, 'Paris', 'M'),
(2, 'Irma', 20, 'Lille', 'F'),
(3, 'Henri', 45, 'Paris', 'M'),
(4, 'Josette', 34, 'Lyon', 'F'),
(5, 'Jacques', 50, 'Bordeaux', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `DateVente` date NOT NULL,
  `prix` int NOT NULL,
  `NumAch` int NOT NULL,
  `NumVoit` int NOT NULL,
  KEY `NumAch` (`NumAch`),
  KEY `NumVoit` (`NumVoit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`DateVente`, `prix`, `NumAch`, `NumVoit`) VALUES
('1985-12-03', 10, 1, 1),
('1996-03-30', 70, 2, 4),
('1998-06-14', 30, 4, 1),
('2000-04-02', 45, 5, 2);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `NumVoit` int NOT NULL AUTO_INCREMENT,
  `Marque` char(10) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `Couleur` varchar(15) NOT NULL,
  PRIMARY KEY (`NumVoit`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`NumVoit`, `Marque`, `Type`, `Couleur`) VALUES
(1, 'Peugeot', '405', 'rouge'),
(2, 'Citroen', 'SM', 'Noire'),
(3, 'Opel', 'GT', 'Blanche'),
(4, 'Peugeot', '403', 'Blanche'),
(5, 'Renault', 'Alpine A310', 'Rose'),
(6, 'Renault', 'Alpine A310', 'Rose'),
(7, 'Renault', 'Floride', 'Bleue');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`NumAch`) REFERENCES `personne` (`NumAch`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`NumVoit`) REFERENCES `voiture` (`NumVoit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
