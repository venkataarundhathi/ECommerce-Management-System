CREATE OR REPLACE VIEW product_details_view AS
SELECT
    p.product_id,
    p.product_name,
    p.model_number,
    p.price,
    c.category_name
FROM PRODUCT p
JOIN CATEGORY c
ON p.category_id = c.category_id;

CREATE OR REPLACE VIEW product_details_view AS
SELECT
    p.product_id,
    p.product_name,
    p.model_number,
    p.price,
    c.category_name
FROM PRODUCT p
JOIN CATEGORY c
ON p.category_id = c.category_id;

CREATE OR REPLACE VIEW payment_details_view AS
SELECT
    p.payment_id,
    p.order_id,
    o.customer_id,
    p.payment_method,
    p.payment_status,
    p.payment_amount
FROM PAYMENT p
JOIN ORDERS o
ON p.order_id = o.order_id;

CREATE OR REPLACE VIEW inventory_summary_view AS
SELECT
    p.product_id,
    p.product_name,
    i.available_quantity
FROM PRODUCT p
JOIN INVENTORY i
ON p.product_id = i.product_id;