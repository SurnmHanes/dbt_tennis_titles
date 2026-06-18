WITH base AS (
    
    SELECT DISTINCT 
        Final_Opponent
    FROM 
        {{ ref ('stg_djokovic_titles') }}
),

final AS (
    SELECT 
        farm_fingerprint(Final_Opponent) as opponent_key,
        Final_Opponent
    FROM 
        base
)

SELECT * FROM final