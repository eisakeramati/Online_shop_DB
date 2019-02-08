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
-- Table structure for table `log_shipper`
--

CREATE TABLE `log_shipper` (
  `log` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_shipper`
--

INSERT INTO `log_shipper` (`log`) VALUES
('90 status changed from onDuty to free'),
('1 status changed from free to onDuty 2019-01-18 18:34:52'),
('2 status changed from free to onDuty 2019-01-18 18:35:02'),
('1 status changed from onDuty to free 2019-01-19 00:06:43'),
('2 status changed from onDuty to free 2019-01-19 00:22:19'),
('1 status changed from free to onDuty 2019-01-19 00:23:20'),
('2 status changed from free to onDuty 2019-01-19 00:41:27'),
('1 status changed from onDuty to free 2019-01-19 01:07:24'),
('1 status changed from free to onDuty 2019-01-19 01:20:54'),
('2 status changed from onDuty to free 2019-01-19 01:31:17');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
