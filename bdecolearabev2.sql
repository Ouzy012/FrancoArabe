-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 09 déc. 2019 à 12:54
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
-- Base de données :  `bdecolearabev2`
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

--
-- Déchargement des données de la table `annee`
--

INSERT INTO `annee` (`annee`) VALUES
('2018-2019'),
('2019-2020');

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

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`nomClasse`) VALUES
('CM2 A');

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

--
-- Déchargement des données de la table `classematiere`
--

INSERT INTO `classematiere` (`nomClasse`, `nomMatiere`, `coef`) VALUES
('CM2 A', 'coran:Arabe', 1),
('CM2 A', 'lecture:Francais', 1);

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

--
-- Déchargement des données de la table `directeur`
--

INSERT INTO `directeur` (`idPersonne`, `loginDir`, `motDePasse`) VALUES
(11, 'ouzy', '1234');

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

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`loginEleve`, `nomClasse`, `nom`, `prenom`, `adresse`, `dateNaissance`, `lieuNaissance`, `telephone`, `loginParent`, `motDePasse`, `moyCompo1FR`, `moyCompo2FR`, `moyCompo3FR`, `moyCompo1AR`, `moyCompo2AR`, `moyCompo3AR`, `moyAnnuelleFR`, `moyAnnuelleAR`, `retards`, `absences`, `annee`) VALUES
('BALS9386', 'CM2 A', 'Balde', 'Souleymane', 'Keur Massar', '2005-04-04', 'Dakar', NULL, 'BALB4397', 'BAL4771', 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('DATI7083', 'CM2 A', 'Datte', 'Ibrahim', 'Geule Tapée', '2005-03-03', 'Rufisque', NULL, 'DATM3339', 'DAT5214', 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('DIAA7853', 'CM2 A', 'Dia', 'Adji', 'Médina', '2005-06-07', 'Dakar', NULL, 'DIAA3530', 'DIA1773', 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('DIOS9871', 'CM2 A', 'Diop', 'Serigne mor', 'Keur Massar', '2005-07-12', 'Rufisque', NULL, 'DIOI6040', 'DIO2739', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('FALC6567', 'CM2 A', 'Fall', 'Cheikh', 'Keur Massar', '2005-01-25', 'Dakar', NULL, 'FALS6152', 'FAL5112', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('FAYM3541', 'CM2 A', 'Faye', 'Malick', 'Pikine', '2005-05-15', 'Touba', NULL, 'FAYB0331', 'FAY3198', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('NDID7878', 'CM2 A', 'Ndiaye', 'Doudou', 'Keur Massar', '2002-05-12', 'Dakar', NULL, 'NDIO3227', 'NDI2248', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2018-2019'),
('NDII6554', 'CM2 A', 'Ndiaye', 'Ismaila', 'Keur Massar', '2005-02-06', 'Dakar', NULL, 'NDIO0835', 'NDI1864', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020'),
('NDIK3288', 'CM2 A', 'Ndiaye', 'Khady', 'Keur Massar', '2005-12-15', 'Dakar', NULL, 'NDIM5018', 'NDI6802', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-2020');

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

--
-- Déchargement des données de la table `eleveannesco`
--

INSERT INTO `eleveannesco` (`annee`, `loginEleve`) VALUES
('2019-2020', 'BALS9386'),
('2019-2020', 'DATI7083'),
('2019-2020', 'DIAA7853'),
('2019-2020', 'DIOS9871'),
('2019-2020', 'FALC6567'),
('2019-2020', 'FAYM3541'),
('2018-2019', 'NDID7878'),
('2019-2020', 'NDII6554'),
('2019-2020', 'NDIK3288');

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

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`loginEleve`, `nomMatiere`, `semestre`, `annee`, `noteComposition`) VALUES
('BALS9386', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('BALS9386', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('BALS9386', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('BALS9386', 'lecture:Francais', '1ère_Composition', '2019-2020', 8),
('BALS9386', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('BALS9386', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('DATI7083', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('DATI7083', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('DATI7083', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('DATI7083', 'lecture:Francais', '1ère_Composition', '2019-2020', 6),
('DATI7083', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('DATI7083', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('DIAA7853', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('DIAA7853', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('DIAA7853', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('DIAA7853', 'lecture:Francais', '1ère_Composition', '2019-2020', 9),
('DIAA7853', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('DIAA7853', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('DIOS9871', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('DIOS9871', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('DIOS9871', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('DIOS9871', 'lecture:Francais', '1ère_Composition', '2019-2020', 5),
('DIOS9871', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('DIOS9871', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('FALC6567', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('FALC6567', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('FALC6567', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('FALC6567', 'lecture:Francais', '1ère_Composition', '2019-2020', 4),
('FALC6567', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('FALC6567', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('FAYM3541', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('FAYM3541', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('FAYM3541', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('FAYM3541', 'lecture:Francais', '1ère_Composition', '2019-2020', 2),
('FAYM3541', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('FAYM3541', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('NDID7878', 'coran:Arabe', '1ère_Composition', '2018-2019', 0),
('NDID7878', 'coran:Arabe', '2eme_Composition', '2018-2019', 0),
('NDID7878', 'coran:Arabe', '3eme_Composition', '2018-2019', 0),
('NDID7878', 'lecture:Francais', '1ère_Composition', '2018-2019', 0),
('NDID7878', 'lecture:Francais', '2eme_Composition', '2018-2019', 0),
('NDID7878', 'lecture:Francais', '3eme_Composition', '2018-2019', 0),
('NDII6554', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('NDII6554', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('NDII6554', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('NDII6554', 'lecture:Francais', '1ère_Composition', '2019-2020', 1),
('NDII6554', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('NDII6554', 'lecture:Francais', '3eme_Composition', '2019-2020', 0),
('NDIK3288', 'coran:Arabe', '1ère_Composition', '2019-2020', 0),
('NDIK3288', 'coran:Arabe', '2eme_Composition', '2019-2020', 0),
('NDIK3288', 'coran:Arabe', '3eme_Composition', '2019-2020', 0),
('NDIK3288', 'lecture:Francais', '1ère_Composition', '2019-2020', 5),
('NDIK3288', 'lecture:Francais', '2eme_Composition', '2019-2020', 0),
('NDIK3288', 'lecture:Francais', '3eme_Composition', '2019-2020', 0);

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

INSERT INTO `matiere` (`nomMatiere`, `nomArabe`) VALUES
('coran:Arabe', 'القرآن الكريم'),
('lecture:Francais', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `mensuel`
--

INSERT INTO `mensuel` (`idMensuel`, `nomClasse`, `login`, `anneeScolaire`, `statutMensuel`, `mois`) VALUES
(31, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Octocre'),
(32, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Novembre'),
(33, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Decembre'),
(34, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Janvier'),
(35, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Fevrier'),
(36, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Mars'),
(37, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Avril'),
(38, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Mai'),
(39, 'CM2 A', 'NDID7878', '2018-2019', '0', 'Juin'),
(40, 'CM2 A', 'NDID7878', '2018-2019', '1', 'Juillet'),
(41, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Octocre'),
(42, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Novembre'),
(43, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Decembre'),
(44, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Janvier'),
(45, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Fevrier'),
(46, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Mars'),
(47, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Avril'),
(48, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Mai'),
(49, 'CM2 A', 'NDIK3288', '2019-2020', '0', 'Juin'),
(50, 'CM2 A', 'NDIK3288', '2019-2020', '1', 'Juillet'),
(51, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Octocre'),
(52, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Novembre'),
(53, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Decembre'),
(54, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Janvier'),
(55, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Fevrier'),
(56, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Mars'),
(57, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Avril'),
(58, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Mai'),
(59, 'CM2 A', 'BALS9386', '2019-2020', '0', 'Juin'),
(60, 'CM2 A', 'BALS9386', '2019-2020', '1', 'Juillet'),
(61, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Octocre'),
(62, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Novembre'),
(63, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Decembre'),
(64, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Janvier'),
(65, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Fevrier'),
(66, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Mars'),
(67, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Avril'),
(68, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Mai'),
(69, 'CM2 A', 'FALC6567', '2019-2020', '0', 'Juin'),
(70, 'CM2 A', 'FALC6567', '2019-2020', '1', 'Juillet'),
(71, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Octocre'),
(72, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Novembre'),
(73, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Decembre'),
(74, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Janvier'),
(75, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Fevrier'),
(76, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Mars'),
(77, 'CM2 A', 'DIAA7853', '2019-2020', '1', 'Avril'),
(78, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Mai'),
(79, 'CM2 A', 'DIAA7853', '2019-2020', '0', 'Juin'),
(80, 'CM2 A', 'DIAA7853', '2019-2020', '1', 'Juillet'),
(81, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Octocre'),
(82, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Novembre'),
(83, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Decembre'),
(84, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Janvier'),
(85, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Fevrier'),
(86, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Mars'),
(87, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Avril'),
(88, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Mai'),
(89, 'CM2 A', 'NDII6554', '2019-2020', '0', 'Juin'),
(90, 'CM2 A', 'NDII6554', '2019-2020', '1', 'Juillet'),
(91, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Octocre'),
(92, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Novembre'),
(93, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Decembre'),
(94, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Janvier'),
(95, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Fevrier'),
(96, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Mars'),
(97, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Avril'),
(98, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Mai'),
(99, 'CM2 A', 'DIOS9871', '2019-2020', '0', 'Juin'),
(100, 'CM2 A', 'DIOS9871', '2019-2020', '1', 'Juillet'),
(101, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Octocre'),
(102, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Novembre'),
(103, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Decembre'),
(104, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Janvier'),
(105, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Fevrier'),
(106, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Mars'),
(107, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Avril'),
(108, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Mai'),
(109, 'CM2 A', 'FAYM3541', '2019-2020', '0', 'Juin'),
(110, 'CM2 A', 'FAYM3541', '2019-2020', '1', 'Juillet'),
(111, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Octocre'),
(112, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Novembre'),
(113, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Decembre'),
(114, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Janvier'),
(115, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Fevrier'),
(116, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Mars'),
(117, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Avril'),
(118, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Mai'),
(119, 'CM2 A', 'DATI7083', '2019-2020', '0', 'Juin'),
(120, 'CM2 A', 'DATI7083', '2019-2020', '1', 'Juillet');

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

--
-- Déchargement des données de la table `parent`
--

INSERT INTO `parent` (`loginParent`, `nom`, `prenom`, `telephone`, `motDePasse`) VALUES
('BALB4397', 'Balde', 'Boubacar', 'nullnull', 'BAL4636'),
('DATM3339', 'Datte', 'Mamadou', 'nullnull', 'DAT3742'),
('DIAA3530', 'Dia', 'Abdoulaye', 'nullnull', 'DIA8398'),
('DIOI6040', 'Diop', 'Ibrahima', 'nullnull', 'DIO1118'),
('FALS6152', 'Fall', 'Sokhna', 'nullnull', 'FAL7000'),
('FAYB0331', 'Faye', 'Boubacar', 'nullnull', 'FAY8955'),
('NDIM5018', 'Ndiaye', 'Mamadou', 'nullnull', 'NDI4952'),
('NDIO0835', 'Ndiaye', 'Ousmane', 'nullnull', 'NDI1461'),
('NDIO3227', 'Ndiaye', 'Ousmane', 'nullnull', 'NDI6133');

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
  `profils` varchar(50) NOT NULL,
  `nomImgPers` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`idPersonne`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`idPersonne`, `nom`, `prenom`, `adresse`, `tel`, `profils`, `nomImgPers`) VALUES
(11, 'Ndiaye', 'Ousmane', 'Dakar', '780128518', 'Directeur', NULL),
(12, 'Sarr', 'Moussa', 'Keur Massar', '773256985', 'Surveillant', NULL),
(13, 'Fall', 'Mamadou', 'Keur Massar', '773698547', '', NULL),
(14, 'Diène', 'Médoune', 'Keur Massar', '301452369', '', NULL),
(15, 'Sarr', 'Mouhamed', 'Keur Massar', '773658855', 'Professeur', NULL);

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

--
-- Déchargement des données de la table `profclasse`
--

INSERT INTO `profclasse` (`idPersonne`, `loginProf`, `nomClasse`, `nomMatiere`, `annee`) VALUES
(13, 'FALM6616', 'CM2 A', 'coran:Arabe', '2018-2019'),
(13, 'FALM6616', 'CM2 A', 'lecture:Francais', '2018-2019'),
(15, 'SARM7061', 'CM2 A', 'lecture:Francais', '2019-2020');

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

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`idPersonne`, `loginProf`, `motDePasse`) VALUES
(13, 'FALM6616', 'FAL9011'),
(15, 'SARM7061', 'SAR6864');

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

--
-- Déchargement des données de la table `profmatiere`
--

INSERT INTO `profmatiere` (`idPersonne`, `loginProf`, `nomMatiere`) VALUES
(13, 'FALM6616', 'coran:Arabe'),
(13, 'FALM6616', 'lecture:Francais'),
(15, 'SARM7061', 'lecture:Francais');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Déchargement des données de la table `surveillant`
--

INSERT INTO `surveillant` (`idPersonne`, `loginSurv`, `motDePasse`) VALUES
(12, 'SARM1709', '1234'),
(14, 'DIÈM7033', 'DIÈ3644');

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
