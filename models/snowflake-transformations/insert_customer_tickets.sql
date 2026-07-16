{{
    config(
        materialized='incremental',
        unique_key='ticket_id'
    )
}}

SELECT 
    t.ticket_id,
    t.customer_id,
    t.email,
    t.status
FROM {{ ref('customer_tickets') }} t

{% if is_incremental() %}

{% endif %}
