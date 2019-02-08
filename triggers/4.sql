CREATE TRIGGER `checker` AFTER INSERT ON `order_product`
 FOR EACH ROW IF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') > 0 and (SELECT orderstatus FROM order_product NATURAL JOIN orderr WHERE ID = new.orderID and ID = order_product.orderID) = 'registered' AND (SELECT storeproduct.Quantity FROM order_product JOIN storeproduct JOIN orderr WHERE order_product.productID = storeproduct.productID and orderr.storeID = storeproduct.storeID and orderr.ID = new.orderID and order_product.orderID = orderr.ID)>=new.quantity AND (SELECT paymenttype FROM orderr WHERE orderr.ID = new.orderID)='bank' THEN

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