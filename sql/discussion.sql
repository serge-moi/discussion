-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 26 jan. 2020 à 00:33
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `discussion`
--
CREATE DATABASE IF NOT EXISTS `discussion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `discussion`;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(140) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `message`, `id_utilisateur`, `date`) VALUES
(1, 'Coucou c\'est moi', 1, '2020-01-14 00:00:00'),
(2, 'yop', 5, '2020-01-19 00:00:00'),
(3, 'envoie un message', 5, '2020-01-19 00:00:00'),
(4, 'problÃ¨me', 5, '2020-01-19 00:00:00'),
(5, 'hello c\'est serge', 5, '2020-01-20 00:00:00'),
(6, 'c\'est c\'est', 5, '2020-01-20 00:00:00'),
(7, 'c\'est c\'est', 5, '2020-01-20 00:00:00'),
(8, 'coucou c\'est moi c\'est serge', 5, '2020-01-20 00:00:00'),
(9, 'coucou c\'est moi c\'est serge', 5, '2020-01-20 00:00:00'),
(10, 'coucou c\'est moi c\'est serge', 5, '2020-01-20 00:00:00'),
(11, 'coucou c\'est moi c\'est serge', 5, '2020-01-20 00:00:00'),
(12, 'coucou c\'est moi c\'est serge', 5, '2020-01-20 00:00:00'),
(13, 'paul il est nul', 5, '2020-01-20 00:00:00'),
(14, 'paul il est nul', 5, '2020-01-20 00:00:00'),
(15, '', 5, '2020-01-20 00:00:00'),
(16, 'hello nico', 5, '2020-01-20 00:00:00'),
(17, 'coucou nico', 5, '2020-01-20 00:00:00'),
(18, 'zddddddddddddddnsjvrnsrvnvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 5, '2020-01-20 00:00:00'),
(19, 'paul paul paul paul', 5, '2020-01-20 00:00:00'),
(20, 'bonjour je suis paul et oui', 5, '2020-01-20 11:24:54'),
(21, 'allo allo allo alo', 5, '2020-01-20 11:25:01'),
(22, 'coucou\r\n\r\n', 5, '2020-01-24 11:22:21'),
(23, 'coucou nico\r\n', 5, '2020-01-24 11:37:08'),
(24, 'bijour bijour', 5, '2020-01-24 11:41:47'),
(25, 'hello', 5, '2020-01-25 21:52:29'),
(26, 'a', 5, '2020-01-25 22:19:17'),
(27, 'coucou\r\n', 5, '2020-01-25 22:19:51'),
(28, 'coucou', 5, '2020-01-26 01:14:14');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `login`, `password`) VALUES
(1, 'sozar', '$2y$10$Ao4VkuDMFssqscP8OTWbBOB7h.hgCozwFKjExVwV0MF.RJAip8teC'),
(2, 'sozar13', '$2y$10$Qoiu1fb4Ku2jvCy.zi32muYq9YioZympfiLScrX4.SKZhA4okCPEC'),
(3, 'Paul', '$2y$10$DZx4kD8ftkFaczd.yQKE3.45w91LwfK7vLs/oAZRTgQFUGiqTDDLy'),
(4, 'nico123', '$2y$10$ouLSzAg3uei68ApuBSgYRejX5lkMwJ4Z.16PcuTU7MxXmI0eouwLa'),
(5, 'baddaboom', '$2y$10$oT4MlCj0oWDNbb1Ctql8E.HyO21rVWpvphEjDs//5iKjTUR3qqKOu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
