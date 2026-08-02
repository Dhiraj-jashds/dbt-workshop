{{ config(materialized='table') }}

select
    customer_id,
    customer_name,
    account_id,
    balance
from {{ ref('slv_customers') }}