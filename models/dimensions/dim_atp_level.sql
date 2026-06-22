WITH base AS (
    
    SELECT DISTINCT 
        atp_level AS atp_level_raw
    FROM 
        {{ ref ('stg_djokovic_titles') }}
),

final AS (
    SELECT 
        farm_fingerprint(atp_level_raw) as atp_level_key,
        atp_level_raw,
        CASE
            WHEN atp_level_raw = '1000' THEN 'ATP 1000'
            WHEN atp_level_raw = '500' THEN 'ATP 500'
            WHEN atp_level_raw = '250' THEN 'ATP 250'
            WHEN atp_level_raw = 'Finals' THEN 'ATP Finals'
            ELSE atp_level_raw
        END AS atp_level_label
    FROM 
        base
)

SELECT * FROM final