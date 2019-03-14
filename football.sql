-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 14, 2019 at 04:34 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.15-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `clubName` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `city` varchar(35) NOT NULL,
  `founded` int(4) NOT NULL,
  `club_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`clubName`, `nickname`, `city`, `founded`, `club_id`) VALUES
('Arsenal FC', 'The Gunners', 'London', 1886, 1),
('AFC Bournemouth', 'The Cherries', 'Bournemouth', 1899, 2),
('Brighton and Hove Albion FC', 'The Seagulls', 'Brighton', 1901, 3),
('Tottenham Hotspur FC', 'The Spurs', 'London', 1882, 4),
('Watford FC', 'The Hornets', 'London', 1898, 5),
('Chelsea FC', 'The Blues', 'London', 1905, 6),
('MK Dons', 'The Dons', 'London', 2009, 7);

-- --------------------------------------------------------

--
-- Table structure for table `nationMap`
--

CREATE TABLE `nationMap` (
  `country_id` int(10) UNSIGNED NOT NULL,
  `club_id` int(10) UNSIGNED DEFAULT NULL,
  `player_id` int(10) UNSIGNED DEFAULT NULL,
  `natMap_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationMap`
--

INSERT INTO `nationMap` (`country_id`, `club_id`, `player_id`, `natMap_id`) VALUES
(1, 4, 1, 1),
(2, 4, 2, 2),
(2, 6, 3, 3),
(4, 2, 4, 4),
(4, 4, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `nations`
--

CREATE TABLE `nations` (
  `nation` varchar(30) DEFAULT NULL,
  `continent` varchar(20) DEFAULT NULL,
  `fifa_ranking` int(3) DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nations`
--

INSERT INTO `nations` (`nation`, `continent`, `fifa_ranking`, `country_id`) VALUES
('South Korea', 'Asia', 53, 1),
('England', 'Europe', 5, 2),
('Argentina', 'South America', 11, 3),
('France', 'Europe', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `player_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`firstName`, `lastName`, `nationality`, `dob`, `player_id`) VALUES
('Heung-Min', 'Son', 'South Korea', '1992-07-08', 1),
('Harry', 'Kane', 'England', '1993-07-28', 2),
('Ross', 'Barkley', 'England', '1993-12-05', 3),
('Gonzalo', 'Higuain', 'France', '1987-12-10', 4),
('Olivier', 'Giroud', 'France', '1986-09-30', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stadia`
--

CREATE TABLE `stadia` (
  `stadiumName` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `built` int(4) NOT NULL,
  `stadium_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stadia`
--

INSERT INTO `stadia` (`stadiumName`, `capacity`, `built`, `stadium_id`) VALUES
('The Emirates', 60260, 2006, 1),
('Vitality Stadium', 11360, 1910, 2),
('The Amex', 30750, 2011, 3),
('Wembley Stadium', 90000, 2007, 4),
('Vicarage Road', 21577, 1922, 5),
('Stamford Bridge', 41631, 1877, 6),
('Stadium MK', 30500, 2007, 8);

-- --------------------------------------------------------

--
-- Table structure for table `stadiumMap`
--

CREATE TABLE `stadiumMap` (
  `map_id` int(10) UNSIGNED NOT NULL,
  `club_id` int(10) UNSIGNED DEFAULT NULL,
  `stadium_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stadiumMap`
--

INSERT INTO `stadiumMap` (`map_id`, `club_id`, `stadium_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 4, 8),
(6, 5, 5),
(7, 6, 6),
(8, 7, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`);

--
-- Indexes for table `nationMap`
--
ALTER TABLE `nationMap`
  ADD PRIMARY KEY (`natMap_id`);

--
-- Indexes for table `nations`
--
ALTER TABLE `nations`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `stadia`
--
ALTER TABLE `stadia`
  ADD PRIMARY KEY (`stadium_id`);

--
-- Indexes for table `stadiumMap`
--
ALTER TABLE `stadiumMap`
  ADD PRIMARY KEY (`map_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `club_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `nationMap`
--
ALTER TABLE `nationMap`
  MODIFY `natMap_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `nations`
--
ALTER TABLE `nations`
  MODIFY `country_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `stadia`
--
ALTER TABLE `stadia`
  MODIFY `stadium_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `stadiumMap`
--
ALTER TABLE `stadiumMap`
  MODIFY `map_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
