-- 1. Foreign Key Constraints
-- Rental -> Inventory
ALTER TABLE rental
ADD CONSTRAINT fk_rental_inventory
FOREIGN KEY (inventory_id) 
REFERENCES inventory (inventory_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Payment -> Customer
ALTER TABLE payment
ADD CONSTRAINT fk_payment_customer
FOREIGN KEY (customer_id) 
REFERENCES customer (customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Payment -> Staff
ALTER TABLE payment
ADD CONSTRAINT fk_payment_staff
FOREIGN KEY (staff_id) 
REFERENCES staff (staff_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

-- Rental -> Customer
ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer
FOREIGN KEY (customer_id) 
REFERENCES customer (customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 2. Triggers to maintain data consistency
-- Prevent early return of rental
DELIMITER $$
CREATE TRIGGER prevent_early_return BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
  IF NEW.return_date < NEW.rental_date THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Return date cannot be earlier than rental date';
  END IF;
END$$
DELIMITER ;

-- Automatically update the last_update field in customer table
DELIMITER $$
CREATE TRIGGER update_customer_last_update BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
  SET NEW.last_update = NOW();
END$$
DELIMITER ;
