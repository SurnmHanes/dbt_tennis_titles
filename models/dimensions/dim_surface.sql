WITH base AS (
    
    SELECT DISTINCT 
        Surface
    FROM 
        {{ ref ('stg_djokovic_titles') }}
),

final AS (
    SELECT 
        farm_fingerprint(surface) as surface_key,
        Surface 
    FROM 
        base
)

SELECT * FROM final