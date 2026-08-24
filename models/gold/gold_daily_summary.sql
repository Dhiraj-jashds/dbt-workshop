{{ config(materialized='table') }}

select 
    transaction_date,
    channel,
    count(distinct transaction_id) as total_transactions,
    sum(case when status = 'SUCCESS' then 1 else 0 end) as successful_transactions,
    sum(case when status = 'FAILED' then 1 else 0 end) as failed_transactions,
    sum(case when status = 'SUCCESS' then amount else 0 end) as total_volume_amount,
    avg(case when status = 'SUCCESS' then amount else null end) as average_transaction_value
from {{ ref('slv_transactions') }}
group by 1, 2