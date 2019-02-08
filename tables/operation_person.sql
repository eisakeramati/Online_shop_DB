-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2019 at 11:37 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbfinalproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `operation_person`
--

CREATE TABLE `operation_person` (
  `ID` varchar(12) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `storeID` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operation_person`
--

INSERT INTO `operation_person` (`ID`, `firstname`, `lastname`, `storeID`) VALUES
('op1', 'aliop1', 'aliop1L', 's1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `operation_person`
--
ALTER TABLE `operation_person`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `storeID` (`storeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `operation_person`
--
ALTER TABLE `operation_person`
  ADD CONSTRAINT `operation_person_ibfk_1` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
