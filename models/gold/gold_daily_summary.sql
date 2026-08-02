{{ config(materialized='table') }}

select
    date(transaction_datetime) as transaction_date,
    count(*) as total_transactions,
    sum(amount) as total_amount
from {{ ref('slv_transactions') }}

group by 1