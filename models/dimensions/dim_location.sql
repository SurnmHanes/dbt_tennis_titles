with base as (
    
    select distinct 
        Location,
        Country
    from 
        {{ ref ('stg_djokovic_titles') }}
),

final as (
    select 
        farm_fingerprint(Location) as location_key,
        Location,
        Country
    from 
        base
)

select * from final