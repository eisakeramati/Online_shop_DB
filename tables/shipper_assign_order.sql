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
-- Table structure for table `shipper_assign_order`
--

CREATE TABLE `shipper_assign_order` (
  `orderID` varchar(12) NOT NULL,
  `shipperID` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipper_assign_order`
--

INSERT INTO `shipper_assign_order` (`orderID`, `shipperID`) VALUES
('1', '1'),
('15', '1'),
('2', '2'),
('26', '1'),
('27', '2'),
('28', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shipper_assign_order`
--
ALTER TABLE `shipper_assign_order`
  ADD PRIMARY KEY (`orderID`,`shipperID`),
  ADD KEY `shipperID` (`shipperID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipper_assign_order`
--
ALTER TABLE `shipper_assign_order`
  ADD CONSTRAINT `shipper_assign_order_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orderr` (`ID`),
  ADD CONSTRAINT `shipper_assign_order_ibfk_2` FOREIGN KEY (`shipperID`) REFERENCES `shipping_person` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
