{{ config(materialized='table') }}

select
    customer_id,
    upper(customer_name) as customer_name,
    lower(email) as email,
    account_id,
    branch,
    city,
    account_type,
    kyc_status,
    balance,
    as_of_date
from {{ ref('brz_customers') }}