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
-- Table structure for table `log_order`
--

CREATE TABLE `log_order` (
  `log` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_order`
--

INSERT INTO `log_order` (`log`) VALUES
('15 status changed from shipped to completed'),
('25 status changed from shipped to completed'),
('1 status changed from registered to shipped 2019-01-18 18:34:52'),
('2 status changed from registered to shipped 2019-01-18 18:35:02'),
('3 status changed from registered to rejected 2019-01-18 18:38:26'),
('4 status changed from registered to rejected 2019-01-18 18:38:49'),
('5 status changed from registered to rejected 2019-01-18 18:39:13'),
('6 status changed from registered to rejected 2019-01-18 18:47:55'),
('7 status changed from registered to rejected 2019-01-18 18:48:14'),
('8 status changed from registered to rejected 2019-01-18 18:48:23'),
('9 status changed from registered to rejected 2019-01-18 18:48:36'),
('10 status changed from registered to rejected 2019-01-18 18:49:15'),
('11 status changed from registered to rejected 2019-01-18 18:49:25'),
('12 status changed from registered to rejected 2019-01-18 18:49:41'),
('13 status changed from registered to rejected 2019-01-18 18:50:10'),
('14 status changed from registered to rejected 2019-01-18 18:50:21'),
('15 status changed from registered to rejected 2019-01-18 18:50:33'),
('16 status changed from registered to rejected 2019-01-18 18:50:46'),
('17 status changed from registered to rejected 2019-01-18 18:51:03'),
('18 status changed from registered to rejected 2019-01-18 18:51:17'),
('19 status changed from registered to rejected 2019-01-18 18:51:27'),
('20 status changed from registered to rejected 2019-01-18 18:51:39'),
('21 status changed from registered to rejected 2019-01-18 18:51:50'),
('22 status changed from registered to rejected 2019-01-18 18:52:01'),
('15 status changed from rejected to completed 2019-01-18 23:23:37'),
('1 status changed from shipped to completed 2019-01-19 00:06:43'),
('2 status changed from shipped to completed 2019-01-19 00:22:19'),
('26 status changed from registered to shipped 2019-01-19 00:23:20'),
('27 status changed from registered to shipped 2019-01-19 00:41:27'),
('25 status changed from registered to rejected 2019-01-19 00:55:14'),
('26 status changed from shipped to completed 2019-01-19 01:07:24'),
('28 status changed from registered to shipped 2019-01-19 01:20:54'),
('27 status changed from shipped to completed 2019-01-19 01:31:17'),
('29 status changed from registered to rejected 2019-01-19 01:43:14');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
