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
-- Base de données : `client_commande`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
CREATE TABLE IF NOT EXISTS `appartient` (
  `id_Produit` int NOT NULL,
  `id_Categorie` int NOT NULL,
  PRIMARY KEY (`id_Produit`,`id_Categorie`),
  KEY `id_Categorie` (`id_Categorie`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_Categorie` int NOT NULL AUTO_INCREMENT,
  `Code_Categorie` int DEFAULT NULL,
  `Designation_Categorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Categorie`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_Categorie`, `Code_Categorie`, `Designation_Categorie`) VALUES
(1, 4520, 'Sport'),
(2, 4521, 'Vetement homme'),
(3, 4522, 'Vetement femme'),
(4, 4523, 'Vetement enfant'),
(5, 4524, 'Boisson'),
(6, 4525, 'Alimentaire perissable'),
(7, 4526, 'alimentaire non-perissable'),
(8, 4527, 'Papeterie'),
(9, 4528, 'Outillage'),
(10, 4529, 'Jardinage');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_Client` int NOT NULL AUTO_INCREMENT,
  `Code_Client` int DEFAULT NULL,
  `Nom_Client` varchar(50) DEFAULT NULL,
  `Adresse_Client` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Client`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_Client`, `Code_Client`, `Nom_Client`, `Adresse_Client`) VALUES
(1, 1220, 'Pigeon', 'Orléans'),
(2, 1221, 'Saisai', 'Saran'),
(3, 1222, 'Poulard', 'Olivet'),
(4, 1223, 'Djameli', 'Orléans'),
(5, 1224, 'Laboucher', 'Artenay'),
(6, 1225, 'Vacher', 'Toulouse'),
(7, 1226, 'Rocher', 'Lyon'),
(8, 1227, 'Bidulle', 'Marseille'),
(9, 1228, 'Ahbon', 'Paris'),
(10, 1229, 'Tulipe', 'Metz');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_Commande` int NOT NULL AUTO_INCREMENT,
  `Numero_de_Commande` int DEFAULT NULL,
  `Dates` date DEFAULT NULL,
  PRIMARY KEY (`id_Commande`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_Commande`, `Numero_de_Commande`, `Dates`) VALUES
(1, 2, '2023-09-05'),
(2, 3, '2023-09-06'),
(3, 4, '2023-09-06'),
(4, 5, '2023-09-07'),
(5, 6, '2023-09-12'),
(6, 7, '2023-09-19'),
(7, 8, '2023-09-22'),
(8, 9, '2023-09-26'),
(9, 10, '2023-09-25'),
(10, 11, '2023-09-26');

-- --------------------------------------------------------

--
-- Structure de la table `concerne`
--

DROP TABLE IF EXISTS `concerne`;
CREATE TABLE IF NOT EXISTS `concerne` (
  `id_Client` int NOT NULL,
  `id_Commande` int NOT NULL,
  PRIMARY KEY (`id_Client`,`id_Commande`),
  KEY `id_Commande` (`id_Commande`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_Four` int NOT NULL AUTO_INCREMENT,
  `Code_Four` int DEFAULT NULL,
  `Nom_Four` varchar(50) DEFAULT NULL,
  `Adresse_Four` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Four`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_Four`, `Code_Four`, `Nom_Four`, `Adresse_Four`) VALUES
(1, 5001, 'Addidas', 'Paris'),
(2, 5002, 'Danone', 'Lorient'),
(3, 5003, 'Quo Vadis', 'Strasbourg'),
(4, 5004, 'Zalando', 'Paris'),
(5, 5005, 'Chanel', 'Paris'),
(6, 5006, 'Jacadi', 'Metz'),
(7, 5007, 'Felco', 'Toulouse'),
(8, 5008, 'Facom', 'Paris'),
(9, 5009, 'Heineken', 'Paris'),
(10, 5010, 'Panzani', 'Paris');

-- --------------------------------------------------------

--
-- Structure de la table `fourni_par`
--

DROP TABLE IF EXISTS `fourni_par`;
CREATE TABLE IF NOT EXISTS `fourni_par` (
  `id_Four` int NOT NULL,
  `id_Commande` int NOT NULL,
  PRIMARY KEY (`id_Four`,`id_Commande`),
  KEY `id_Commande` (`id_Commande`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `porter_sur`
--

DROP TABLE IF EXISTS `porter_sur`;
CREATE TABLE IF NOT EXISTS `porter_sur` (
  `id_Commande` int NOT NULL,
  `id_Produit` int NOT NULL,
  `Quantité` int DEFAULT NULL,
  PRIMARY KEY (`id_Commande`,`id_Produit`),
  KEY `id_Produit` (`id_Produit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `porter_sur`
--

INSERT INTO `porter_sur` (`id_Commande`, `id_Produit`, `Quantité`) VALUES
(0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_Produit` int NOT NULL AUTO_INCREMENT,
  `Reference_produit` varchar(50) DEFAULT NULL,
  `Designation_produit` varchar(50) DEFAULT NULL,
  `Prix` double DEFAULT NULL,
  PRIMARY KEY (`id_Produit`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_Produit`, `Reference_produit`, `Designation_produit`, `Prix`) VALUES
(1, '800', 'Ballon de foot', 10.2),
(2, '801', 'Veste homme', 30.85),
(3, '802', 'Veste femme', 32.74),
(4, '803', 'Robe enfant', 12.45),
(5, '804', 'Bière', 1),
(6, '805', 'Pâte', 0.75),
(7, '806', 'Yaourt', 2.36),
(8, '807', 'Cahier', 1.5),
(9, '808', 'Visseuse', 50.21),
(10, '809', 'Arrosoir', 8.21);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
