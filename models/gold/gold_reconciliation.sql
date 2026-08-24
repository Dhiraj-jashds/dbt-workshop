{{ config(materialized='table') }}

select 
    transaction_date,
    sum(amount) as total_outflow_debit,
    sum(amount) as total_inflow_credit,
    (sum(amount) - sum(amount)) as reconciliation_difference
from {{ ref('slv_transactions') }}
where status = 'SUCCESS'
group by 1