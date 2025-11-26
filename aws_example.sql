-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2024 at 08:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aws_example`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `category`) VALUES
(1, 'Whole Bean'),
(2, 'Espresso'),
(3, 'Stove Top'),
(4, 'Filter'),
(5, 'Plunger'),
(6, 'Percolator');

-- --------------------------------------------------------

--
-- Table structure for table `coffee`
--

CREATE TABLE `coffee` (
  `coffeeID` int(11) NOT NULL,
  `coffee` varchar(45) DEFAULT NULL,
  `roast` varchar(20) DEFAULT NULL,
  `taste` varchar(15) DEFAULT NULL,
  `weight` smallint(4) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stock` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `image` varchar(45) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `originID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coffee`
--

INSERT INTO `coffee` (`coffeeID`, `coffee`, `roast`, `taste`, `weight`, `description`, `stock`, `price`, `image`, `categoryID`, `originID`) VALUES
(1, 'Dark Roast', 'dark', 'nutty', 1000, 'Our dark roast leaves a rich mouth feel for those wanting that something extra.', 100, 49.95, 'images/coffee-grain-3521754_1920.jpg', 1, 1),
(2, 'Medium Roast', 'medium', 'fruity', 500, 'The medium roast is smooth and well rounded coffee', 100, 42.95, 'images/coffee-7076193_1920.jpg', 1, 3),
(3, 'Dark Roast', 'dark', 'nutty', 250, 'The dark roast leaves a rich mouth feel.', 100, 39.95, 'images/coffee-1885078_1920.jpg', 3, 4),
(4, 'Light Roast', 'light', 'caramelly', 500, 'A light roast for those wanting a more delicate flavour.', 100, 35.95, 'images/coffee-3725877_1920.jpg', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `originID` int(11) NOT NULL,
  `country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`originID`, `country`) VALUES
(1, 'Australia'),
(2, 'Brazil'),
(3, 'Colombia'),
(4, 'Peru'),
(5, 'Costa Rica'),
(6, 'PNG'),
(7, 'Guatemala'),
(8, 'USA'),
(9, 'Canada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `categoryID_UNIQUE` (`categoryID`);

--
-- Indexes for table `coffee`
--
ALTER TABLE `coffee`
  ADD PRIMARY KEY (`coffeeID`,`originID`,`categoryID`),
  ADD UNIQUE KEY `coffeeID_UNIQUE` (`coffeeID`),
  ADD KEY `categoryID_idx` (`categoryID`),
  ADD KEY `originID_idx` (`originID`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`originID`),
  ADD UNIQUE KEY `originID_UNIQUE` (`originID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coffee`
--
ALTER TABLE `coffee`
  MODIFY `coffeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `originID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coffee`
--
ALTER TABLE `coffee`
  ADD CONSTRAINT `categoryID` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `originID` FOREIGN KEY (`originID`) REFERENCES `origin` (`originID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
