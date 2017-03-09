-- phpMyAdmin SQL Dump
-- version 4.3.8deb0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 08, 2017 at 11:45 PM
-- Server version: 5.5.54-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nyepesi`
--

-- --------------------------------------------------------

--
-- Table structure for table `registerAgent_registeragent`
--

CREATE TABLE IF NOT EXISTS `registerAgent_registeragent` (
  `id` int(11) NOT NULL,
  `F_Name` varchar(250) NOT NULL,
  `L_Name` varchar(250) NOT NULL,
  `Phonenumber_id` int(11) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `County` varchar(250) NOT NULL,
  `Constituency` varchar(250) NOT NULL,
  `Locality` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `registerAgent_registeragent`
--
ALTER TABLE `registerAgent_registeragent`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `registerAgent_registeragent_Phonenumber_id_b1c10b48_uniq` (`Phonenumber_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registerAgent_registeragent`
--
ALTER TABLE `registerAgent_registeragent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
