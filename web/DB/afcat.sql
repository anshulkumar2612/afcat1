-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 20, 2018 at 12:38 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `afcat`
--

-- --------------------------------------------------------

--
-- Table structure for table `afcatregister`
--

CREATE TABLE IF NOT EXISTS `afcatregister` (
  `rid` int(2) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `faname` varchar(100) DEFAULT NULL,
  `mname` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `sslc` int(2) DEFAULT NULL,
  `puc` int(2) DEFAULT NULL,
  `qal` varchar(20) DEFAULT NULL,
  `clname` varchar(50) DEFAULT NULL,
  `entry` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `afcatregister`
--

INSERT INTO `afcatregister` (`rid`, `userName`, `gender`, `dob`, `faname`, `mname`, `email`, `sslc`, `puc`, `qal`, `clname`, `entry`) VALUES
(6, 'Anshul Kumar', 'male', '1997-03-27', 'Aranjay Kumar', 'Sumitra', 'kumaranshul2612@gmail.com', 95, 88, 'B.tech', 'Reva University', 'Pilot(SSC), Aeronautical Engineer(PC), ');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `uname`, `pwd`, `completed`) VALUES
(1, 'anshul', 'anshul', 1),
(7, 'anshu', 'asd', 0),
(8, 'kittu', 'kittu', 0),
(9, 'guru', 'asd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loginbit`
--

CREATE TABLE IF NOT EXISTS `loginbit` (
  `completed` tinyint(1) DEFAULT NULL,
  `uid` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginbit`
--

