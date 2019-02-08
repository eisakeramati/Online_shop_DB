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
-- Table structure for table `shipping_person`
--

CREATE TABLE `shipping_person` (
  `ID` varchar(12) NOT NULL,
  `storeID` varchar(12) NOT NULL,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `phonenumber` int(8) NOT NULL,
  `credit` int(11) NOT NULL,
  `shippingPersonStatus` enum('free','onDuty','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_person`
--

INSERT INTO `shipping_person` (`ID`, `storeID`, `firstname`, `lastname`, `phonenumber`, `credit`, `shippingPersonStatus`) VALUES
('1', 's1', 'shiper1', 'shiperzade', 56789, 3, 'onDuty'),
('2', 's2', 'shiper2', 'shiperzade', 34567, 2, 'free');

--
-- Triggers `shipping_person`
--
DELIMITER $$
CREATE TRIGGER `logger2` AFTER UPDATE ON `shipping_person` FOR EACH ROW if new.shippingPersonStatus != old.shippingPersonStatus THEN
INSERT INTO log_shipper VALUES(concat(new.ID,' status changed from ',old.shippingPersonStatus, ' to ', new.shippingPersonStatus,' ', now()));
END IF
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shipping_person`
--
ALTER TABLE `shipping_person`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `storeID` (`storeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipping_person`
--
ALTER TABLE `shipping_person`
  ADD CONSTRAINT `shipping_person_ibfk_1` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
