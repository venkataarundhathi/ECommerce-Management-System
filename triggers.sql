--1st TRIGGER
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

--2nd TRIGGER

DELIMITER //
CREATE TRIGGER calculate_order_item_subtotal
BEFORE INSERT ON ORDER_ITEMS
FOR EACH ROW
BEGIN
    SET NEW.subtotal = NEW.quantity * NEW.unit_price;
END //
DELIMITER ;
