SELECT
    Title_ID,
    Date,
    Tournament,
    Location,
    Country,
    Surface,
    ATP_Level,
    Final_Opponent,
    Ranking,
    Opponent_Ranking
FROM {{ source('titles_data', 'raw_titles') }}