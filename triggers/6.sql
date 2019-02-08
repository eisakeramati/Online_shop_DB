if new.shippingPersonStatus != old.shippingPersonStatus THEN
INSERT INTO log_shipper VALUES(concat(new.ID,' status changed from ',old.shippingPersonStatus, ' to ', new.shippingPersonStatus,' ', now()));
END IF