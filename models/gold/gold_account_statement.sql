{{ config(materialized='table') }}

select
    c.customer_name,
    t.transaction_id,
    t.transaction_datetime,
    t.amount,
    t.transaction_type
from {{ ref('slv_transactions') }} t
join {{ ref('slv_customers') }} c
on t.from_account = c.account_id