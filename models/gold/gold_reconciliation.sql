{{ config(materialized='table') }}

select
    date(transaction_datetime) transaction_date,
    sum(amount) total_money_transferred,
    count(*) total_transactions
from {{ ref('slv_transactions') }}
group by 1