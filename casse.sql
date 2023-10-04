-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 25 jan. 2022 à 01:02
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 7.3.28

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

CREATE TABLE `personne` (
  `NumAch` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Age` int(11) NOT NULL,
  `Ville` varchar(20) NOT NULL,
  `Sexe` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `vente` (
  `DateVente` date NOT NULL,
  `prix` int(11) NOT NULL,
  `NumAch` int(11) NOT NULL,
  `NumVoit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

CREATE TABLE `voiture` (
  `NumVoit` int(11) NOT NULL,
  `Marque` char(10) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `Couleur` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Index pour les tables déchargées
--

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`NumAch`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD KEY `NumAch` (`NumAch`),
  ADD KEY `NumVoit` (`NumVoit`);

--
-- Index pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD PRIMARY KEY (`NumVoit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `NumAch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `voiture`
--
ALTER TABLE `voiture`
  MODIFY `NumVoit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
