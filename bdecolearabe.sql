-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 29 juil. 2019 à 18:05
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

drop database bdecolearabe;
create database bdecolearabe;
  use bdecolearabe;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bdecolearabe`
--

-- --------------------------------------------------------

--
-- Structure de la table `annee`
--

DROP TABLE IF EXISTS `annee`;
CREATE TABLE IF NOT EXISTS `annee` (
  `annee` varchar(254) NOT NULL,
  PRIMARY KEY (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

DROP TABLE IF EXISTS `classe`;
CREATE TABLE IF NOT EXISTS `classe` (
  `nomClasse` varchar(254) NOT NULL,
  PRIMARY KEY (`nomClasse`),
  KEY `AK_Identifiant_1` (`nomClasse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `classematiere`
--

DROP TABLE IF EXISTS `classematiere`;
CREATE TABLE IF NOT EXISTS `classematiere` (
  `nomClasse` varchar(254) NOT NULL,
  `nomMatiere` varchar(254) NOT NULL,
  `coef` int(11) DEFAULT '0',
  PRIMARY KEY (`nomClasse`,`nomMatiere`),
  KEY `FK_classeMatiere1` (`nomMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `directeur`
--

DROP TABLE IF EXISTS `directeur`;
CREATE TABLE IF NOT EXISTS `directeur` (
  `idPersonne` int(11) NOT NULL,
  `loginDir` varchar(254) NOT NULL DEFAULT '',
  `motDePasse` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idPersonne`,`loginDir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `loginEleve` varchar(254) NOT NULL,
  `nomClasse` varchar(254) DEFAULT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `dateNaissance` varchar(254) DEFAULT NULL,
  `lieuNaissance` varchar(254) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `loginParent` varchar(254) NOT NULL,
  `motDePasse` varchar(254) DEFAULT NULL,
  `moyCompo1FR` float DEFAULT '0',
  `moyCompo2FR` float DEFAULT '0',
  `moyCompo3FR` float DEFAULT '0',
  `moyCompo1AR` float DEFAULT '0',
  `moyCompo2AR` float DEFAULT '0',
  `moyCompo3AR` float DEFAULT '0',
  `moyAnnuelleFR` float DEFAULT '0',
  `moyAnnuelleAR` float DEFAULT '0',
  `retards` int(11) DEFAULT '0',
  `absences` int(11) DEFAULT '0',
  `annee` varchar(254) NOT NULL DEFAULT '',
  PRIMARY KEY (`loginEleve`,`annee`),
  KEY `FK_association2` (`nomClasse`),
  KEY `FK_associationE` (`loginParent`),
  KEY `FK_associationA` (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `eleveannesco`
--

DROP TABLE IF EXISTS `eleveannesco`;
CREATE TABLE IF NOT EXISTS `eleveannesco` (
  `annee` varchar(254) NOT NULL,
  `loginEleve` varchar(254) NOT NULL,
  PRIMARY KEY (`annee`,`loginEleve`),
  KEY `FK_eleveAnneSco2` (`loginEleve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `loginEleve` varchar(254) NOT NULL,
  `nomMatiere` varchar(254) NOT NULL,
  `semestre` varchar(254) NOT NULL,
  `annee` varchar(254) NOT NULL,
  `noteComposition` float DEFAULT '0',
  PRIMARY KEY (`loginEleve`,`nomMatiere`,`semestre`,`annee`),
  KEY `FK_evoluation2` (`nomMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `nomMatiere` varchar(254) NOT NULL,
  `nomArabe` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`nomMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `matiere`
--
-- --------------------------------------------------------

--
-- Structure de la table `mensuel`
--

DROP TABLE IF EXISTS `mensuel`;
CREATE TABLE IF NOT EXISTS `mensuel` (
  `idMensuel` int(11) NOT NULL AUTO_INCREMENT,
  `nomClasse` varchar(20) NOT NULL,
  `login` varchar(256) NOT NULL,
  `anneeScolaire` varchar(10) NOT NULL,
  `statutMensuel` varchar(1) NOT NULL,
  `mois` varchar(20) NOT NULL,
  PRIMARY KEY (`idMensuel`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `loginParent` varchar(254) NOT NULL DEFAULT '',
  `nom` varchar(254) NOT NULL,
  `prenom` varchar(254) NOT NULL,
  `telephone` varchar(9) NOT NULL,
  `motDePasse` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`loginParent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `idPersonne` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `tel` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `profclasse`
--

DROP TABLE IF EXISTS `profclasse`;
CREATE TABLE IF NOT EXISTS `profclasse` (
  `idPersonne` int(11) NOT NULL,
  `loginProf` varchar(254) NOT NULL,
  `nomClasse` varchar(254) NOT NULL,
  `nomMatiere` varchar(254) NOT NULL,
  `annee` varchar(254) NOT NULL,
  PRIMARY KEY (`idPersonne`,`loginProf`,`nomClasse`,`annee`,`nomMatiere`),
  KEY `FK_profClasse1` (`nomClasse`),
  KEY `FK_profClasse3` (`nomMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `idPersonne` int(11) NOT NULL,
  `loginProf` varchar(254) NOT NULL,
  `motDePasse` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idPersonne`,`loginProf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `profmatiere`
--

DROP TABLE IF EXISTS `profmatiere`;
CREATE TABLE IF NOT EXISTS `profmatiere` (
  `idPersonne` int(11) NOT NULL,
  `loginProf` varchar(254) NOT NULL,
  `nomMatiere` varchar(254) NOT NULL,
  PRIMARY KEY (`idPersonne`,`loginProf`,`nomMatiere`),
  KEY `FK_profMatiere1` (`nomMatiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `idReclam` int(11) NOT NULL AUTO_INCREMENT,
  `loginEleve` varchar(254) NOT NULL,
  `loginProf` varchar(254) NOT NULL,
  `enTete` varchar(254) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `date` varchar(254) DEFAULT NULL,
  `reponse` int(11) DEFAULT NULL,
  `lue` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReclam`),
  KEY `FK_association12` (`loginEleve`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `surveillant`
--

DROP TABLE IF EXISTS `surveillant`;
CREATE TABLE IF NOT EXISTS `surveillant` (
  `idPersonne` int(11) NOT NULL,
  `loginSurv` varchar(254) NOT NULL DEFAULT '',
  `motDePasse` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idPersonne`,`loginSurv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classematiere`
--
ALTER TABLE `classematiere`
  ADD CONSTRAINT `FK_classeMatiere1` FOREIGN KEY (`nomMatiere`) REFERENCES `matiere` (`nomMatiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_classeMatiere2` FOREIGN KEY (`nomClasse`) REFERENCES `classe` (`nomClasse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `directeur`
--
ALTER TABLE `directeur`
  ADD CONSTRAINT `FK_Generalisation_2` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `FK_association2` FOREIGN KEY (`nomClasse`) REFERENCES `classe` (`nomClasse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_associationA` FOREIGN KEY (`annee`) REFERENCES `annee` (`annee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_associationE` FOREIGN KEY (`loginParent`) REFERENCES `parent` (`loginParent`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `eleveannesco`
--
ALTER TABLE `eleveannesco`
  ADD CONSTRAINT `FK_eleveAnneSco1` FOREIGN KEY (`annee`) REFERENCES `annee` (`annee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_eleveAnneSco2` FOREIGN KEY (`loginEleve`) REFERENCES `eleve` (`loginEleve`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `FK_evoluation1` FOREIGN KEY (`loginEleve`) REFERENCES `eleve` (`loginEleve`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_evoluation2` FOREIGN KEY (`nomMatiere`) REFERENCES `matiere` (`nomMatiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `profclasse`
--
ALTER TABLE `profclasse`
  ADD CONSTRAINT `FK_profClasse1` FOREIGN KEY (`nomClasse`) REFERENCES `classe` (`nomClasse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profClasse2` FOREIGN KEY (`idPersonne`,`loginProf`) REFERENCES `professeur` (`idPersonne`, `loginProf`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profClasse3` FOREIGN KEY (`nomMatiere`) REFERENCES `matiere` (`nomMatiere`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `FK_Generalisation_4` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `profmatiere`
--
ALTER TABLE `profmatiere`
  ADD CONSTRAINT `FK_profMatiere1` FOREIGN KEY (`nomMatiere`) REFERENCES `matiere` (`nomMatiere`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profMatiere2` FOREIGN KEY (`idPersonne`,`loginProf`) REFERENCES `professeur` (`idPersonne`, `loginProf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `surveillant`
--
ALTER TABLE `surveillant`
  ADD CONSTRAINT `surveillant_ibfk_1` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
