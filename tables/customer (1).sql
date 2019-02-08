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
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `username` varchar(12) NOT NULL,
  `password` varchar(42) DEFAULT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `postalcode` varchar(16) NOT NULL,
  `sex` enum('male','female','','') NOT NULL,
  `credit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`username`, `password`, `firstname`, `lastname`, `postalcode`, `sex`, `credit`) VALUES
('ali2', '*EE8326FC0570CF3A62B5CEF5A6798965A1CEEF8E', 'ali', 'alivar', '123456', 'male', 234),
('hope', '*9089F400007738E52EA3ED63325D03CF9CB4DDDA', 'hope', 'solo', '56789o', 'female', 5),
('selephone', '*B81B06C93C143E91DB9FBE1071E598C331BB8D0B', 'nastaran', 'nastarani', '123445', 'female', 200),
('timitim', '*E7EFFC9F7320AFAA0D17E10E7A3A0B69A4D9DC7E', 'amin', 'amini', '56789', 'male', 100);

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `hasher` BEFORE INSERT ON `customer` FOR EACH ROW SET NEW.password = PASSWORD(NEW.password)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_customer` BEFORE UPDATE ON `customer` FOR EACH ROW INSERT INTO log VALUES (
OLD.username,
OLD.password,
OLD.firstname,
OLD.lastname,
OLD.postalcode,
OLD.sex,
OLD.credit,
OLD.customerstatus,
NOW(),
'updated')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_customer2` BEFORE DELETE ON `customer` FOR EACH ROW INSERT INTO log VALUES (
OLD.username,
OLD.password,
OLD.firstname,
OLD.lastname,
OLD.postalcode,
OLD.sex,
OLD.credit,
OLD.customerstatus,
NOW(),
'deleted')
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`username`),
  ADD KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
