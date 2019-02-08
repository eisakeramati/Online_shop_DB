-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2019 at 11:38 PM
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
-- Table structure for table `storeproduct`
--

CREATE TABLE `storeproduct` (
  `productID` varchar(12) NOT NULL,
  `storeID` varchar(12) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storeproduct`
--

INSERT INTO `storeproduct` (`productID`, `storeID`, `Quantity`) VALUES
('1', 's1', 5),
('1', 's2', 9),
('2', 's1', 8),
('2', 's2', 9),
('3', 's1', 10),
('3', 's2', 10),
('4', 's1', 10),
('4', 's2', 10),
('5', 's1', 10),
('5', 's2', 10),
('6', 's1', 10),
('7', 's2', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `storeproduct`
--
ALTER TABLE `storeproduct`
  ADD PRIMARY KEY (`productID`,`storeID`),
  ADD KEY `storeID` (`storeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `storeproduct`
--
ALTER TABLE `storeproduct`
  ADD CONSTRAINT `storeproduct_ibfk_1` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`),
  ADD CONSTRAINT `storeproduct_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
