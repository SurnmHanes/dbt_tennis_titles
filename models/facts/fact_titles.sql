SELECT 
    stg.Title_ID,
    d.date_key,
    t.tournament_key,
    l.location_key,
    s.surface_key,
    a.atp_level_key,
    o.opponent_key,
    stg.Ranking,
    stg.Opponent_Ranking
FROM {{ ref ('stg_djokovic_titles')}} AS stg
INNER JOIN {{ ref('dim_date') }} AS d
    ON d.date_day = stg.date
LEFT JOIN {{ ref('dim_tournament') }} AS t
    ON stg.Tournament = t.Tournament
LEFT JOIN {{ ref('dim_location') }} AS l
    ON stg.Location = l.location
LEFT JOIN {{ ref('dim_surface') }} AS s
    ON stg.Surface = s.surface
LEFT JOIN {{ ref('dim_atp_level') }} AS a
    ON stg.ATP_Level = a.atp_level_raw
LEFT JOIN {{ ref('dim_opponent') }} AS o
    ON stg.Final_Opponent = o.Final_Opponent