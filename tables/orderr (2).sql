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
-- Table structure for table `orderr`
--

CREATE TABLE `orderr` (
  `ID` varchar(12) NOT NULL,
  `orderstatus` enum('registered','shipped','completed','rejected') NOT NULL,
  `paymenttype` enum('credit','bank','','') NOT NULL,
  `orderdate` date NOT NULL,
  `address` text NOT NULL,
  `username` varchar(12) NOT NULL,
  `storeID` varchar(12) NOT NULL,
  `orderTime` int(11) NOT NULL,
  `cType` enum('guest','normal','','') NOT NULL,
  `guestID` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderr`
--

INSERT INTO `orderr` (`ID`, `orderstatus`, `paymenttype`, `orderdate`, `address`, `username`, `storeID`, `orderTime`, `cType`, `guestID`) VALUES
('1', 'completed', 'bank', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('10', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's1', 16, 'normal', 'gigihadid'),
('11', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's1', 15, 'normal', 'gigihadid'),
('12', 'rejected', 'bank', '2019-01-08', 'ad1', 'selephone', 's2', 16, 'normal', 'gigihadid'),
('13', 'rejected', 'bank', '2019-01-08', 'ad1', 'selephone', 's2', 14, 'normal', 'gigihadid'),
('14', 'rejected', 'bank', '2019-01-08', 'ad1', 'selephone', 's2', 14, 'normal', 'gigihadid'),
('15', 'completed', 'bank', '2019-01-08', 'ad1', 'selephone', 's2', 16, 'normal', 'gigihadid'),
('16', 'rejected', 'bank', '2019-01-08', 'ad1', 'selephone', 's2', 14, 'normal', 'gigihadid'),
('17', 'rejected', 'bank', '2018-12-12', 'ad1', 'selephone', 's2', 14, 'normal', 'gigihadid'),
('18', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's2', 14, 'normal', 'gigihadid'),
('19', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's2', 14, 'normal', 'gigihadid'),
('2', 'completed', 'bank', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('20', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's2', 14, 'normal', 'gigihadid'),
('21', 'rejected', 'bank', '2018-12-12', 'ad2\r\n', 'timitim', 's2', 16, 'normal', 'gigihadid'),
('22', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's2', 8, 'normal', 'gigihadid'),
('23', 'rejected', 'bank', '2018-12-12', 'ad3', 'ali2', 's2', 12, 'guest', 'gigihadid'),
('24', 'rejected', 'bank', '2018-12-12', 'ad3', 'ali2', 's2', 14, 'guest', 'gigihadid'),
('25', 'rejected', 'credit', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('26', 'completed', 'bank', '2018-12-12', 'ad1', 'selephone', 's2', 14, 'normal', 'gigihadid'),
('27', 'completed', 'credit', '2018-12-12', 'ad4', 'hope', 's1', 16, 'normal', 'gigihadid'),
('28', 'shipped', 'credit', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('29', 'rejected', 'credit', '2019-01-08', 'ad1', 'selephone', 's1', 14, 'normal', 'gigihadid'),
('3', 'rejected', 'bank', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('4', 'rejected', 'bank', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('5', 'rejected', 'bank', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('6', 'rejected', 'bank', '2018-12-12', 'ad1', 'selephone', 's1', 16, 'normal', 'gigihadid'),
('7', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's1', 16, 'normal', 'gigihadid'),
('8', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's1', 16, 'normal', 'gigihadid'),
('9', 'rejected', 'bank', '2018-12-12', 'ad2', 'timitim', 's1', 16, 'normal', 'gigihadid');

--
-- Triggers `orderr`
--
DELIMITER $$
CREATE TRIGGER `check_time` BEFORE INSERT ON `orderr` FOR EACH ROW if new.orderTime > (SELECT closingHour FROM store WHERE store.storeID = new.storeID) then
SET new.orderstatus = 'rejected';
ELSEIF new.orderTime < (SELECT startingHour FROM store WHERE store.storeID = new.storeID) THEN
SET new.orderstatus = 'rejected';
ELSEIF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') > 0 THEN
set new.orderstatus = 'registered';
ELSEIF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') = 0 THEN
SET new.orderstatus = 'rejected';
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logger` BEFORE UPDATE ON `orderr` FOR EACH ROW if new.orderstatus != old.orderstatus THEN
INSERT INTO log_order VALUES(concat(new.ID,' status changed from ',old.orderstatus, ' to ', new.orderstatus, ' ', now()));
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `make_available` AFTER UPDATE ON `orderr` FOR EACH ROW IF old.orderstatus = 'shipped' and new.orderstatus='completed' THEN
UPDATE shipping_person
SET shippingPersonStatus = 'free'
WHERE shipping_person.ID = (SELECT shipperID from shipper_assign_order WHERE orderID = new.ID);
END IF
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `storeID` (`storeID`),
  ADD KEY `username` (`username`),
  ADD KEY `guestID` (`guestID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderr`
--
ALTER TABLE `orderr`
  ADD CONSTRAINT `orderr_ibfk_2` FOREIGN KEY (`storeID`) REFERENCES `store` (`storeID`),
  ADD CONSTRAINT `orderr_ibfk_4` FOREIGN KEY (`username`) REFERENCES `customer` (`username`),
  ADD CONSTRAINT `orderr_ibfk_5` FOREIGN KEY (`guestID`) REFERENCES `guest` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
