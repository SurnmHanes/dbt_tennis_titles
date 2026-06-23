WITH date_base AS (

    SELECT
        date_day
    FROM UNNEST( 
        GENERATE_DATE_ARRAY(
            DATE( '2006-01-01'),
            DATE( '2035-12-31'),
            INTERVAL 1 DAY
        )
    ) AS date_day

)
SELECT
    CAST(FORMAT_DATE('%Y%m%d', date_day ) AS INT64) AS date_key,
    date_day,
    EXTRACT(YEAR FROM date_day) AS YEAR,
    EXTRACT(MONTH FROM date_day) AS MONTH,
    FORMAT_DATE('%B', date_day) AS month_name,
    EXTRACT(QUARTER FROM date_day) AS QUARTER,
    EXTRACT(DAY FROM date_day) AS day_of_month,
    FORMAT_DATE('%A', date_day) AS day_name,
    CASE
        WHEN EXTRACT(YEAR FROM date_day) BETWEEN 2000 AND 2009 THEN '00s'
        WHEN EXTRACT(YEAR FROM date_day) BETWEEN 2010 AND 2019 THEN '10s'
        WHEN EXTRACT(YEAR FROM date_day) BETWEEN 2020 AND 2029 THEN '20s'
    END AS decade,
    EXTRACT(YEAR FROM date_day) = EXTRACT(YEAR FROM CURRENT_DATE) AS is_current_year
FROM
    date_base
