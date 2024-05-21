SELECT 
    *
FROM 
    {{ ref('dim_listing_cleansed') }}
WHERE a < 1
LIMIT 10

-- dbt test --select a