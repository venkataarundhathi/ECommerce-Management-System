DELIMITER //

CREATE PROCEDURE check_product_suitability()
BEGIN

    SELECT
        c.check_id,
        p.product_name,
        u.activity_name,
        c.user_budget,
        p.price,

        CASE
            WHEN ps.ram_gb < u.min_ram_gb
              OR ps.storage_gb < u.min_storage_gb
              OR ps.processor_tier < u.min_processor_tier
              OR p.price > c.user_budget
              OR (
                  p.product_name NOT IN ('Desktop', 'Television')
                  AND ps.battery_hours < u.min_battery_hours
              )
            THEN 'Not Suitable'

            WHEN ps.ram_gb >= u.rec_ram_gb
            THEN 'Good Match'

            ELSE 'Partial Match'
        END AS suitability_result

    FROM PRODUCT_SUITABILITY_CHECK c

    JOIN PRODUCT p
        ON c.product_id = p.product_id

    JOIN PRODUCT_SPECIFICATION ps
        ON c.product_id = ps.product_id

    JOIN USAGE_ACTIVITY_PROFILE u
        ON c.profile_id = u.profile_id;

END //

DELIMITER ;