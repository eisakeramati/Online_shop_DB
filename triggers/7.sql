CREATE TRIGGER `hasher` BEFORE INSERT ON `customer`
 FOR EACH ROW SET NEW.password = PASSWORD(NEW.password)