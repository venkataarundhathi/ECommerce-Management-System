--1ST AND 2ND PROCEDURES
DELIMITER //

CREATE PROCEDURE get_customer_orders(IN cust_id INT)
BEGIN
    SELECT order_id, order_date, total_amount, order_status
    FROM ORDERS
    WHERE customer_id = cust_id;
END //

CREATE PROCEDURE get_product_details(IN prod_id INT)
BEGIN
    SELECT
        p.product_id,
        p.product_name,
        c.category_name,
        p.price
    FROM PRODUCT p
    INNER JOIN CATEGORY c
    ON p.category_id = c.category_id
    WHERE p.product_id = prod_id;
END //

DELIMITER ;

--3RD PROCEDURE

SHOW CREATE PROCEDURE check_product_suitability;