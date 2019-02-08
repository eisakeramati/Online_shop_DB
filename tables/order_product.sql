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
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `orderID` varchar(12) NOT NULL,
  `productID` varchar(12) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`orderID`, `productID`, `Quantity`) VALUES
('1', '1', 1),
('10', '4', 1),
('11', '6', 1),
('12', '1', 1),
('13', '2', 1),
('14', '3', 1),
('15', '4', 1),
('16', '5', 1),
('17', '7', 1),
('18', '1', 1),
('19', '2', 1),
('2', '2', 1),
('20', '3', 1),
('21', '5', 1),
('22', '7', 1),
('23', '1', 1),
('24', '2', 1),
('25', '1', 2),
('26', '2', 1),
('27', '1', 2),
('28', '1', 2),
('29', '4', 1000),
('3', '3', 1),
('4', '4', 1),
('5', '5', 1),
('6', '6', 1),
('7', '1', 1),
('8', '2', 1),
('9', '3', 1);

--
-- Triggers `order_product`
--
DELIMITER $$
CREATE TRIGGER `checker` AFTER INSERT ON `order_product` FOR EACH ROW IF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') > 0 and (SELECT orderstatus FROM order_product NATURAL JOIN orderr WHERE ID = new.orderID and ID = order_product.orderID) = 'registered' AND (SELECT storeproduct.Quantity FROM order_product JOIN storeproduct JOIN orderr WHERE order_product.productID = storeproduct.productID and orderr.storeID = storeproduct.storeID and orderr.ID = new.orderID and order_product.orderID = orderr.ID)>=new.quantity AND (SELECT paymenttype FROM orderr WHERE orderr.ID = new.orderID)='bank' THEN

UPDATE orderr
SET orderstatus= 'shipped'
WHERE ID = new.orderID;

UPDATE storeproduct
SET storeproduct.quantity = storeproduct.Quantity - new.quantity
WHERE storeproduct.productID = new.productID AND storeproduct.storeID = (SELECT storeID FROM orderr WHERE orderr.ID = new.productID);

INSERT INTO shipper_assign_order VALUES(new.orderID, (SELECT ID FROM shipping_person WHERE shippingPersonStatus = 'free' limit 1));


UPDATE shipping_person
SET `credit` = `credit` + 5*(SELECT product.price FROM order_product NATURAL JOIN product WHERE order_product.productID = new.productID limit 1)*(new.quantity)/100
WHERE shipping_person.ID = (SELECT shipperID FROM shipper_assign_order WHERE shipper_assign_order.orderID = new.orderID);

UPDATE `shipping_person`
SET `shippingPersonStatus` = 'onDuty'
WHERE shippingPersonStatus = 'free' LIMIT 1;

ELSEIF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') > 0 and (SELECT orderstatus FROM order_product NATURAL JOIN orderr WHERE ID = new.orderID and ID = order_product.orderID) = 'registered' AND (SELECT storeproduct.Quantity FROM order_product JOIN storeproduct JOIN orderr WHERE order_product.productID = storeproduct.productID and orderr.storeID = storeproduct.storeID and orderr.ID = new.orderID and order_product.orderID = orderr.ID)>=new.quantity AND (SELECT paymenttype FROM orderr WHERE orderr.ID = new.orderID)='credit' AND (SELECT credit FROM customer JOIN orderr WHERE customer.username = orderr.username AND orderr.ID = new.orderID)>=(SELECT price FROM product WHERE product.ID = new.productID)*new.Quantity THEN

UPDATE customer
SET `credit` = `credit` - (SELECT product.price FROM order_product NATURAL JOIN product WHERE order_product.productID = new.productID limit 1)*(new.quantity)
WHERE customer.username = (SELECT username FROM orderr WHERE orderr.ID = new.orderID);


UPDATE orderr
SET orderstatus= 'shipped'
WHERE ID = new.orderID;

UPDATE storeproduct
SET storeproduct.quantity = storeproduct.Quantity - new.quantity
WHERE storeproduct.productID = new.productID AND storeproduct.storeID = (SELECT storeID FROM orderr WHERE orderr.ID = new.productID);

INSERT INTO shipper_assign_order VALUES(new.orderID, (SELECT ID FROM shipping_person WHERE shippingPersonStatus = 'free' limit 1));


UPDATE shipping_person
SET `credit` = `credit` + 5*(SELECT product.price FROM order_product NATURAL JOIN product WHERE order_product.productID = new.productID limit 1)*(new.quantity)/100
WHERE shipping_person.ID = (SELECT shipperID FROM shipper_assign_order WHERE shipper_assign_order.orderID = new.orderID);

UPDATE `shipping_person`
SET `shippingPersonStatus` = 'onDuty'
WHERE shippingPersonStatus = 'free' LIMIT 1;


ELSEIF (SELECT credit FROM customer JOIN orderr WHERE customer.username = orderr.username AND orderr.ID = new.orderID) < (SELECT price FROM product WHERE product.ID = new.productID)*new.Quantity THEN

INSERT INTO conversation VALUES(concat(new.orderID, ' no enough credit'));
UPDATE orderr
SET orderstatus= 'rejected'
WHERE ID = new.orderID;

ELSEIF (SELECT storeproduct.Quantity FROM order_product JOIN storeproduct JOIN orderr WHERE order_product.productID = storeproduct.productID and orderr.storeID = storeproduct.storeID and orderr.ID = new.orderID and order_product.orderID = orderr.ID)<new.quantity THEN
INSERT INTO conversation VALUES(concat(new.orderID, ' no product available'));
UPDATE orderr
SET orderstatus= 'rejected'
WHERE ID = new.orderID;

ELSE
INSERT INTO conversation VALUES(concat(new.orderID, ' no delivery person available'));
UPDATE orderr
SET orderstatus= 'rejected'
WHERE ID = new.orderID;
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `credit_manager` BEFORE INSERT ON `order_product` FOR EACH ROW UPDATE shipping_person
SET `credit` = `credit` + 5*(SELECT product.price FROM order_product NATURAL JOIN product WHERE order_product.productID = new.productID limit 1)*(new.quantity)/100
WHERE shipping_person.ID = (SELECT shipperID FROM shipper_assign_order WHERE shipper_assign_order.orderID = new.orderID)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`orderID`) USING BTREE,
  ADD KEY `productID` (`productID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orderr` (`ID`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
