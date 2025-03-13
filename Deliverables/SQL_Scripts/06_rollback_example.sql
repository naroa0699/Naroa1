DELIMITER $$

CREATE PROCEDURE rent_movie(IN inventory_id INT, IN customer_id INT, IN staff_id INT)
BEGIN
    DECLARE available_stock INT;

    
    START TRANSACTION;
    
    
    SELECT COUNT(*) INTO available_stock
    FROM inventory 
    WHERE inventory_id = inventory_id AND status = 'in_stock';

    
    IF available_stock > 0 THEN
        
        INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id)
        VALUES (NOW(), inventory_id, customer_id, NULL, staff_id);
        
        
        UPDATE inventory
        SET status = 'rented', last_update = NOW()
        WHERE inventory_id = inventory_id;
        
        
        COMMIT;
    ELSE
        
        ROLLBACK;
        
        
        SELECT 'La película no está disponible para alquiler' AS mensaje;
    END IF;
END$$

DELIMITER ;
