DELIMITER //

CREATE TRIGGER update_inventory_after_order
AFTER INSERT ON ORDER_ITEMS
FOR EACH ROW
BEGIN
    UPDATE INVENTORY
    SET available_quantity = available_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;