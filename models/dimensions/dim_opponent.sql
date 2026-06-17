with base as (
    
    select distinct 
        Final_Opponent
    from 
        {{ ref ('stg_djokovic_titles') }}
),

final as (
    select 
        farm_fingerprint(Final_Opponent) as opponent_key,
        Final_Opponent
    from 
        base
)

select * from final