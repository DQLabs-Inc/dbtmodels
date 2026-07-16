{{
    config(
        materialized='incremental',
        unique_key='ticket_id'
    )
}}

SELECT 
    t.ticket_id,
    t.customer_id,
    t.issue_type,
    t.email,
    t.status
FROM {{ ref('customer_tickets') }} t

{% if is_incremental() %}
WHERE TRY_TO_TIMESTAMP(t.ticket_date) > (SELECT MAX(ticket_date) FROM {{ this }})
{% endif %}
