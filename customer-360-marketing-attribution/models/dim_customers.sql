WITH users AS (
    SELECT * 
    FROM {{ ref('stg_users') }}
),

sessions AS (
    SELECT * 
    FROM {{ ref('int_sessions') }}
),

customer_metrics AS (
    SELECT
        mapped_user_id AS user_id,
        COUNT(DISTINCT session_id) AS total_visits,
        MIN(session_start) AS first_visit_date,
        SUM(total_events) AS total_clicks_and_actions
    FROM sessions
    WHERE mapped_user_id IS NOT NULL
    GROUP BY mapped_user_id
)

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.age,
    u.country,
    u.account_created_at,
    COALESCE(cm.total_visits, 0) AS total_visits,
    cm.first_visit_date,
    COALESCE(cm.total_clicks_and_actions, 0) AS total_clicks_and_actions
FROM users u
LEFT JOIN customer_metrics cm 
    ON u.user_id = cm.user_id