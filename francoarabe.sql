-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 12 déc. 2019 à 11:53
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `francoarabe`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence`
--

DROP TABLE IF EXISTS `absence`;
CREATE TABLE IF NOT EXISTS `absence` (
  `nomMatiere` varchar(50) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `anneeScolaire` varchar(50) NOT NULL,
  `duree_abs` int(11) DEFAULT NULL,
  `nbre_retard` int(11) DEFAULT NULL,
  `motif` text,
  KEY `ASSOCIATION_3_FK` (`login`,`anneeScolaire`),
  KEY `ASSOCIATION_9_FK` (`nomMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `annee`
--

DROP TABLE IF EXISTS `annee`;
CREATE TABLE IF NOT EXISTS `annee` (
  `anneeScolaire` varchar(50) NOT NULL,
  PRIMARY KEY (`anneeScolaire`),
  UNIQUE KEY `ANNEE_PK` (`anneeScolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `nomClasse` varchar(50) NOT NULL,
  PRIMARY KEY (`nomClasse`),
  UNIQUE KEY `CLASSE_PK` (`nomClasse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classematiere`
--

DROP TABLE IF EXISTS `classematiere`;
CREATE TABLE IF NOT EXISTS `classematiere` (
  `nomMatiere` varchar(50) NOT NULL,
  `nomClasse` varchar(50) NOT NULL,
  `coef` int(11) DEFAULT NULL,
  PRIMARY KEY (`nomMatiere`,`nomClasse`),
  KEY `ASSOCIATION_4_FK` (`nomMatiere`),
  KEY `ASSOCIATION_4_FK2` (`nomClasse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

DROP TABLE IF EXISTS `comptable`;
CREATE TABLE IF NOT EXISTS `comptable` (
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `directeur`
--

DROP TABLE IF EXISTS `directeur`;
CREATE TABLE IF NOT EXISTS `directeur` (
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `directeur`
--

INSERT INTO `directeur` (`login`) VALUES
('ouzy');

-- --------------------------------------------------------

--
-- Structure de la table `edt`
--

DROP TABLE IF EXISTS `edt`;
CREATE TABLE IF NOT EXISTS `edt` (
  `idEDT` int(11) NOT NULL,
  `nomClasse` varchar(254) DEFAULT NULL,
  `nomFichierEDT` varchar(254) DEFAULT NULL,
  `annee` varchar(254) DEFAULT NULL,
  `dateEDT` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idEDT`),
  UNIQUE KEY `EDT_PK` (`idEDT`),
  KEY `ASSOCIATION_11_FK` (`nomClasse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `login` varchar(50) NOT NULL,
  `anneeScolaire` varchar(254) NOT NULL,
  `idInscription` varchar(254) NOT NULL,
  `nomClasse` varchar(254) DEFAULT NULL,
  `Par_login` varchar(254) NOT NULL,
  `dateNaissance` varchar(254) DEFAULT NULL,
  `lieuNaissance` varchar(254) DEFAULT NULL,
  `sexe` varchar(254) DEFAULT NULL,
  `moyComp1FR` float DEFAULT NULL,
  `moyComp2FR` float DEFAULT NULL,
  `moyCompo3FR` float DEFAULT NULL,
  `moyCompo1AR` float DEFAULT NULL,
  `moyCompo2AR` float DEFAULT NULL,
  `moyCompo3AR` float DEFAULT NULL,
  `Retard` int(11) DEFAULT NULL,
  `absence` int(11) DEFAULT NULL,
  PRIMARY KEY (`login`,`anneeScolaire`),
  UNIQUE KEY `ELEVE_PK` (`login`,`anneeScolaire`),
  KEY `ASSOCIATION_1_FK` (`Par_login`),
  KEY `ASSOCIATION_6_FK` (`idInscription`),
  KEY `ASSOCIATION_8_FK` (`nomClasse`),
  KEY `GENERALISATION_5_FK` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `login` varchar(50) NOT NULL,
  `anneeScolaire` varchar(50) NOT NULL,
  `nomMatiere` varchar(50) NOT NULL,
  `semestre` varchar(50) NOT NULL,
  `noteComposition` float DEFAULT NULL,
  PRIMARY KEY (`login`,`anneeScolaire`,`nomMatiere`,`semestre`),
  UNIQUE KEY `EVALUATION_PK` (`login`,`anneeScolaire`,`nomMatiere`,`semestre`),
  KEY `ASSOCIATION_2_FK` (`login`,`anneeScolaire`),
  KEY `ASSOCIATION_2_FK2` (`nomMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fichederenseignement`
--

DROP TABLE IF EXISTS `fichederenseignement`;
CREATE TABLE IF NOT EXISTS `fichederenseignement` (
  `inscription` int(11) DEFAULT NULL,
  `mensualite` int(11) DEFAULT NULL,
  `nomClasse` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `idInscription` int(11) NOT NULL,
  `dateInscription` varchar(254) DEFAULT NULL,
  `statutInscription` int(11) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `reliquat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInscription`),
  UNIQUE KEY `INSCRIPTION_PK` (`idInscription`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `nomMatiere` varchar(50) NOT NULL,
  `nomArabe` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`nomMatiere`),
  UNIQUE KEY `MATIERE_PK` (`nomMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `mensuel`
--

DROP TABLE IF EXISTS `mensuel`;
CREATE TABLE IF NOT EXISTS `mensuel` (
  `idMensuel` int(11) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `anneeScolaire` varchar(254) DEFAULT NULL,
  `statutMensuel` int(11) DEFAULT NULL,
  `dateMensuel` varchar(254) DEFAULT NULL,
  `mois` varchar(254) DEFAULT NULL,
  `montant` int(11) DEFAULT NULL,
  `reliquat` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMensuel`),
  UNIQUE KEY `MENSUEL_PK` (`idMensuel`),
  KEY `ASSOCIATION_7_FK` (`login`,`anneeScolaire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `login` varchar(50) NOT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL,
  `moDePasse` varchar(254) DEFAULT NULL,
  `nomImgPers` varchar(254) DEFAULT NULL,
  `etatPers` int(11) DEFAULT NULL,
  `profil` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `PERSONNE_PK` (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`login`, `nom`, `prenom`, `adresse`, `telephone`, `moDePasse`, `nomImgPers`, `etatPers`, `profil`) VALUES
('ouzy', 'Ndiaye', 'Ousmane', 'Dakar', '780128518', '1234', NULL, 1, 'Directeur');

-- --------------------------------------------------------

--
-- Structure de la table `profclasse`
--

DROP TABLE IF EXISTS `profclasse`;
CREATE TABLE IF NOT EXISTS `profclasse` (
  `login` varchar(50) NOT NULL,
  `nomClasse` varchar(50) NOT NULL,
  `anneeScolaire` int(11) NOT NULL,
  PRIMARY KEY (`login`,`nomClasse`,`anneeScolaire`),
  UNIQUE KEY `PROFCLASSE_PK` (`login`,`nomClasse`,`anneeScolaire`),
  KEY `ASSOCIATION_10_FK` (`login`),
  KEY `ASSOCIATION_10_FK2` (`nomClasse`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `profmatiere`
--

DROP TABLE IF EXISTS `profmatiere`;
CREATE TABLE IF NOT EXISTS `profmatiere` (
  `login` varchar(50) NOT NULL,
  `nomMatiere` varchar(50) NOT NULL,
  PRIMARY KEY (`login`,`nomMatiere`),
  KEY `ASSOCIATION_5_FK` (`login`),
  KEY `ASSOCIATION_5_FK2` (`nomMatiere`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `surveillant`
--

DROP TABLE IF EXISTS `surveillant`;
CREATE TABLE IF NOT EXISTS `surveillant` (
  `login` varchar(50) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
