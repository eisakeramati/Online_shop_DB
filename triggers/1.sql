CREATE TRIGGER `check_time` BEFORE INSERT ON `orderr`
 FOR EACH ROW if new.orderTime > (SELECT closingHour FROM store WHERE store.storeID = new.storeID) then
SET new.orderstatus = 'rejected';
ELSEIF new.orderTime < (SELECT startingHour FROM store WHERE store.storeID = new.storeID) THEN
SET new.orderstatus = 'rejected';
ELSEIF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') > 0 THEN
set new.orderstatus = 'registered';
ELSEIF (SELECT COUNT(shippingPersonStatus) FROM shipping_person WHERE shippingPersonStatus = 'free') = 0 THEN
SET new.orderstatus = 'rejected';
END IF