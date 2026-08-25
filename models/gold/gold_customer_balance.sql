{{ config(materialized='table') }}

with credits as (
    select to_account as account_id, sum(amount) as total_credit
    from {{ ref('slv_transactions') }}
    where status = 'SUCCESS'
    group by 1
),
debits as (
    select from_account as account_id, sum(amount) as total_debit
    from {{ ref('slv_transactions') }}
    where status = 'SUCCESS'
    group by 1
)

select 
    c.customer_id,
    c.customer_name,
    c.account_id,
    c.account_type,
    c.opening_balance,
    coalesce(cr.total_credit, 0) as total_credited,
    coalesce(db.total_debit, 0) as total_debited,
    (c.opening_balance + coalesce(cr.total_credit, 0) - coalesce(db.total_debit, 0)) as net_current_balance,
    c.kyc_status
from {{ ref('slv_customers') }} c
left join credits cr on c.account_id = cr.account_id
left join debits db on c.account_id = db.account_id