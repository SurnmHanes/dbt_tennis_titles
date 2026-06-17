with base as (
    
    select distinct 
        Surface
    from 
        {{ ref ('stg_djokovic_titles') }}
),

final as (
    select 
        farm_fingerprint(surface) as surface_key,
        Surface 
    from 
        base
)

select * from final