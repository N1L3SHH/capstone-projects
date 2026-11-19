WITH raw_users AS (
    SELECT *
    FROM {{ source('thelook_ecommerce', 'users') }}
)

SELECT
    id AS user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    country,
    CAST(created_at AS TIMESTAMP) AS account_created_at
FROM raw_users