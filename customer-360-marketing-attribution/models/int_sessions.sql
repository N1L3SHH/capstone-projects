WITH events AS (
    SELECT * 
    FROM {{ ref('stg_events') }}
),

session_level_data AS (
    SELECT 
        session_id,
        MIN(event_timestamp) AS session_start,
        MAX(event_timestamp) AS session_end,
        MAX(user_id) AS mapped_user_id,
        MAX(traffic_source) AS traffic_source, 
        MAX(browser) AS browser,
        COUNT(event_id) AS total_events
    FROM events
    GROUP BY session_id
)

SELECT * 
FROM session_level_data