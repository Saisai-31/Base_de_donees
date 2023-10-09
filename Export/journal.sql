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
-- Base de données : `journal`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_Article` int NOT NULL AUTO_INCREMENT,
  `Nom de l'article` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_Sujet` int NOT NULL,
  `id_Journaliste` int NOT NULL,
  PRIMARY KEY (`id_Article`),
  KEY `id_Sujet` (`id_Sujet`),
  KEY `id_Journaliste` (`id_Journaliste`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id_Article`, `Nom de l'article`, `id_Sujet`, `id_Journaliste`) VALUES
(1, 'Mbppe droit au but', 0, 0),
(2, 'LeBron James toujours aussi solide', 0, 0),
(3, 'La Russie interroge ', 0, 0),
(4, 'Que devient le parti communiste Français ?', 0, 0),
(5, 'La révolution Tesla', 0, 0),
(6, 'Un Français en formule 1', 0, 0),
(7, 'Le stade toulousain, champion du monde', 0, 0),
(8, 'Le meilleur jardinier du monde', 0, 0),
(9, 'Omar Sharif nous explique les courses équestres', 0, 0),
(10, 'Orléans rénove sa cathédrale', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `a_travailler_pour`
--

DROP TABLE IF EXISTS `a_travailler_pour`;
CREATE TABLE IF NOT EXISTS `a_travailler_pour` (
  `id_Journaliste` int NOT NULL,
  `id_Journal` int NOT NULL,
  PRIMARY KEY (`id_Journaliste`,`id_Journal`),
  KEY `id_Journal` (`id_Journal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `interview`
--

DROP TABLE IF EXISTS `interview`;
CREATE TABLE IF NOT EXISTS `interview` (
  `id_Journaliste` int NOT NULL AUTO_INCREMENT,
  `id_Personnalite` int NOT NULL,
  PRIMARY KEY (`id_Journaliste`,`id_Personnalite`),
  KEY `id_Personnalite` (`id_Personnalite`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `id_Journal` int NOT NULL AUTO_INCREMENT,
  `Adresse` varchar(50) DEFAULT NULL,
  `Nom du Journal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_Journal`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `journal`
--

INSERT INTO `journal` (`id_Journal`, `Adresse`, `Nom du Journal`) VALUES
(1, 'Paris', 'L\'Equipe'),
(2, 'Paris', 'Le Monde'),
(3, 'Paris', 'Le Figaro'),
(4, 'Paris', 'Libération'),
(5, 'Paris', 'L\'Humanité'),
(6, 'Toulouse', 'La dépêche du Midi'),
(7, 'Orléans', 'La République du Centre'),
(8, 'Toulouse', 'Midi Olympique'),
(9, 'Paris', 'Paris Turf'),
(10, 'Paris', 'Le 10 Sport');

-- --------------------------------------------------------

--
-- Structure de la table `journaliste`
--

DROP TABLE IF EXISTS `journaliste`;
CREATE TABLE IF NOT EXISTS `journaliste` (
  `id_Journaliste` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Date_de_Naissance` date DEFAULT NULL,
  PRIMARY KEY (`id_Journaliste`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `journaliste`
--

INSERT INTO `journaliste` (`id_Journaliste`, `Nom`, `Date_de_Naissance`) VALUES
(1, 'Vachar', '1978-10-11'),
(2, 'Youcef', '0000-00-00'),
(3, 'Lafreitax', '1970-10-04'),
(4, 'Monsour', '1965-09-11'),
(5, 'Yallah', '1962-10-05'),
(6, 'Ballant', '1976-10-27'),
(7, 'Jambon', '1975-10-18'),
(8, 'Choucroutte', '1986-06-21'),
(9, 'Jaillard', '1983-01-12'),
(10, 'Djebali', '1971-05-14');

-- --------------------------------------------------------

--
-- Structure de la table `numero`
--

DROP TABLE IF EXISTS `numero`;
CREATE TABLE IF NOT EXISTS `numero` (
  `id_Numero` int NOT NULL AUTO_INCREMENT,
  `Dates` date DEFAULT NULL,
  `id_Journal` int NOT NULL,
  PRIMARY KEY (`id_Numero`),
  KEY `id_Journal` (`id_Journal`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `numero`
--

INSERT INTO `numero` (`id_Numero`, `Dates`, `id_Journal`) VALUES
(1, '2023-06-14', 0),
(2, '2023-08-09', 0),
(3, '2023-08-24', 0),
(4, '2023-08-27', 0),
(5, '2023-08-30', 0),
(6, '2023-09-08', 0),
(7, '2023-09-11', 0),
(8, '2023-09-14', 0),
(9, '2023-09-29', 0),
(10, '2023-10-02', 0);

-- --------------------------------------------------------

--
-- Structure de la table `parait_dans`
--

DROP TABLE IF EXISTS `parait_dans`;
CREATE TABLE IF NOT EXISTS `parait_dans` (
  `id_Article` int NOT NULL,
  `id_Numero` int NOT NULL,
  PRIMARY KEY (`id_Article`,`id_Numero`),
  KEY `id_Numero` (`id_Numero`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnalite`
--

DROP TABLE IF EXISTS `personnalite`;
CREATE TABLE IF NOT EXISTS `personnalite` (
  `id_Personnalite` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Nation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Personnalite`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `personnalite`
--

INSERT INTO `personnalite` (`id_Personnalite`, `Nom`, `Prenom`, `Nation`) VALUES
(1, 'Mbappe', 'Killian', 'France'),
(2, 'LeBron', 'James', 'Etats-Unis'),
(3, 'Poutine', 'Vladimir', 'Russie'),
(4, 'Roussel', 'Fabien', 'France'),
(5, 'Musk', 'Elon', 'Etats-Unis'),
(6, 'Ocon', 'Esteban', 'France'),
(7, 'Mola', 'Ugo', 'France'),
(8, 'Giustina', 'Gianfranco', 'Italie'),
(9, 'Grouard', 'Serge', 'France'),
(10, 'Sharif', 'Omar', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

DROP TABLE IF EXISTS `sujet`;
CREATE TABLE IF NOT EXISTS `sujet` (
  `id_Sujet` int NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Sujet`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sujet`
--

INSERT INTO `sujet` (`id_Sujet`, `Libelle`) VALUES
(1, 'Sport foot'),
(2, 'Sport équitation '),
(3, 'Information nationale'),
(4, 'Information Régionale'),
(5, 'Géopolitique'),
(6, 'Informatique'),
(7, 'Voiture'),
(8, 'Politique'),
(9, 'Jardinage'),
(10, 'Fait Divers');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
