CREATE TRIGGER `logger` BEFORE UPDATE ON `orderr`
 FOR EACH ROW if new.orderstatus != old.orderstatus THEN
INSERT INTO log_order VALUES(concat(new.ID,' status changed from ',old.orderstatus, ' to ', new.orderstatus, ' ', now()));
END IF