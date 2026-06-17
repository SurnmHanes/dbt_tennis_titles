with base as (
    
    select distinct 
        Tournament
    from 
        {{ ref ('stg_djokovic_titles') }}
),

final as (
    select 
        farm_fingerprint(Tournament) as tournament_key,
        Tournament 
    from 
        base
)

select * from final