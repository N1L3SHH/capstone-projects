WITH raw_events AS (
    SELECT *
    FROM {{ source('thelook_ecommerce', 'events') }}
)

SELECT
    id AS event_id,
    user_id,
    session_id,
    CAST(created_at AS TIMESTAMP) AS event_timestamp,
    event_type,
    traffic_source,
    browser,
    ip_address
FROM raw_events