WITH sessions AS (
    SELECT *
    FROM {{ ref('int_sessions') }}
),

channel_metrics AS (
    SELECT
        traffic_source,
        COUNT(DISTINCT session_id) AS total_sessions,
        COUNT(DISTINCT mapped_user_id) AS total_acquired_customers,
        SUM(total_events) AS total_engagement_clicks
    FROM sessions
    WHERE traffic_source IS NOT NULL
    GROUP BY traffic_source
)

SELECT *
FROM channel_metrics
ORDER BY total_acquired_customers DESC
