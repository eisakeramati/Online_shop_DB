UPDATE shipping_person
SET `credit` = `credit` + 5*(SELECT product.price FROM order_product NATURAL JOIN product WHERE order_product.productID = new.productID limit 1)*(new.quantity)/100
WHERE shipping_person.ID = (SELECT shipperID FROM shipper_assign_order WHERE shipper_assign_order.orderID = new.orderID)