-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2017 at 04:36 PM
-- Server version: 5.7.12-log
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ambulanta`
--
CREATE DATABASE IF NOT EXISTS `ambulanta` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ambulanta`;

-- --------------------------------------------------------

--
-- Table structure for table `dijagnoze`
--

DROP TABLE IF EXISTS `dijagnoze`;
CREATE TABLE IF NOT EXISTS `dijagnoze` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kod` varchar(10) DEFAULT NULL,
  `Dijagnoza` varchar(300) DEFAULT NULL,
  `Datum` varchar(20) DEFAULT NULL,
  `Zdravstveni_broj_pa` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Zdravstveni_broj_pa` (`Zdravstveni_broj_pa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lijekovi`
--

DROP TABLE IF EXISTS `lijekovi`;
CREATE TABLE IF NOT EXISTS `lijekovi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Ime` varchar(30) DEFAULT NULL,
  `Doza` varchar(3) DEFAULT NULL,
  `Datum` varchar(20) DEFAULT NULL,
  `Zdravstveni_broj_p` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Zdravstveni_broj_p` (`Zdravstveni_broj_p`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pacijenti`
--

DROP TABLE IF EXISTS `pacijenti`;
CREATE TABLE IF NOT EXISTS `pacijenti` (
  `Ime` varchar(20) DEFAULT NULL,
  `Prezime` varchar(20) DEFAULT NULL,
  `Dat_rod` varchar(20) DEFAULT NULL,
  `Zdravstveni_broj` char(7) NOT NULL,
  `Kontakt` varchar(15) DEFAULT NULL,
  `Spol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Zdravstveni_broj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uputnice`
--

DROP TABLE IF EXISTS `uputnice`;
CREATE TABLE IF NOT EXISTS `uputnice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Kod` varchar(10) DEFAULT NULL,
  `Za` varchar(50) DEFAULT NULL,
  `Datum` varchar(20) DEFAULT NULL,
  `Zdravstveni_broj_pac` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Zdravstveni_broj_pac` (`Zdravstveni_broj_pac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

DROP TABLE IF EXISTS `zaposlenici`;
CREATE TABLE IF NOT EXISTS `zaposlenici` (
  `kor_ime` varchar(15) NOT NULL,
  `lozinka` varchar(15) DEFAULT NULL,
  `razina` varchar(15) DEFAULT 'LijecnikSestra',
  `Ime` varchar(25) DEFAULT NULL,
  `Prezime` varchar(25) DEFAULT NULL,
  `Dat_rod` varchar(25) DEFAULT NULL,
  `Broj` varchar(25) DEFAULT NULL,
  `Kontakt` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`kor_ime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dijagnoze`
--
ALTER TABLE `dijagnoze`
  ADD CONSTRAINT `dijagnoze_ibfk_1` FOREIGN KEY (`Zdravstveni_broj_pa`) REFERENCES `pacijenti` (`Zdravstveni_broj`) ON DELETE CASCADE;

--
-- Constraints for table `lijekovi`
--
ALTER TABLE `lijekovi`
  ADD CONSTRAINT `lijekovi_ibfk_1` FOREIGN KEY (`Zdravstveni_broj_p`) REFERENCES `pacijenti` (`Zdravstveni_broj`) ON DELETE CASCADE;

--
-- Constraints for table `uputnice`
--
ALTER TABLE `uputnice`
  ADD CONSTRAINT `uputnice_ibfk_1` FOREIGN KEY (`Zdravstveni_broj_pac`) REFERENCES `pacijenti` (`Zdravstveni_broj`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
