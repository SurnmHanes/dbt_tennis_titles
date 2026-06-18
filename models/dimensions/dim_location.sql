WITH base AS (
    
    SELECT DISTINCT 
        Location,
        Country
    FROM 
        {{ ref ('stg_djokovic_titles') }}
),

final AS (
    SELECT 
        farm_fingerprint(Location) AS location_key,
        Location,
        Country
    FROM 
        base
)

SELECT * FROM final