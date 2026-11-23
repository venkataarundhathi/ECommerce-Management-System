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
 --3rd TRIGGER

DELIMITER //
CREATE TRIGGER check_stock_before_order
BEFORE INSERT ON ORDER_ITEMS
FOR EACH ROW
BEGIN
    DECLARE stock_available INT;

    SELECT available_quantity
    INTO stock_available
    FROM INVENTORY
    WHERE product_id = NEW.product_id;

    IF stock_available IS NULL OR NEW.quantity > stock_available THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock available!';
    END IF;
END //
DELIMITER ;
