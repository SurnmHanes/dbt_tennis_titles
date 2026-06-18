WITH base AS (
    
    SELECT DISTINCT 
        Tournament
    FROM 
        {{ ref ('stg_djokovic_titles') }}
),

final AS (
    SELECT 
        farm_fingerprint(Tournament) as tournament_key,
        Tournament 
    FROM 
        base
)

SELECT * FROM final