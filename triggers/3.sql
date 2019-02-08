CREATE TRIGGER `make_available` AFTER UPDATE ON `orderr`
 FOR EACH ROW IF old.orderstatus = 'shipped' and new.orderstatus='completed' THEN
UPDATE shipping_person
SET shippingPersonStatus = 'free'
WHERE shipping_person.ID = (SELECT shipperID from shipper_assign_order WHERE orderID = new.ID);
END IF