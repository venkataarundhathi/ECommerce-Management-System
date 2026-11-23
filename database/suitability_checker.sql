-- Programming Suitability Check
--(Your Programming query)

SELECT
    p.product_id,
    p.product_name,
    ps.ram_gb,
    ps.storage_gb,
    ps.processor_tier,
    u.activity_name,
    CASE
        WHEN ps.ram_gb >= u.min_ram_gb
         AND ps.storage_gb >= u.min_storage_gb
         AND ps.processor_tier >= u.min_processor_tier
        THEN 'Good Match'

        WHEN
        (ps.ram_gb >= u.min_ram_gb) +
        (ps.storage_gb >= u.min_storage_gb) +
        (ps.processor_tier >= u.min_processor_tier) >= 2
        THEN 'Partial Match'

        ELSE 'Not Recommended'
    END AS suitability
FROM PRODUCT p
JOIN PRODUCT_SPECIFICATION ps
    ON p.product_id = ps.product_id
CROSS JOIN USAGE_ACTIVITY_PROFILE u
WHERE u.activity_name = 'Programming';

-- Gaming Suitability Check
-- (Your Gaming query)

SELECT
    p.product_id,
    p.product_name,
    ps.ram_gb,
    ps.storage_gb,
    ps.processor_tier,
    u.activity_name,
    CASE
        WHEN ps.ram_gb >= u.min_ram_gb
         AND ps.storage_gb >= u.min_storage_gb
         AND ps.processor_tier >= u.min_processor_tier
        THEN 'Good Match'

        WHEN
        (ps.ram_gb >= u.min_ram_gb) +
        (ps.storage_gb >= u.min_storage_gb) +
        (ps.processor_tier >= u.min_processor_tier) >= 2
        THEN 'Partial Match'

        ELSE 'Not Recommended'
    END AS suitability
FROM PRODUCT p
JOIN PRODUCT_SPECIFICATION ps
    ON p.product_id = ps.product_id
CROSS JOIN USAGE_ACTIVITY_PROFILE u
WHERE u.activity_name = 'Gaming';
