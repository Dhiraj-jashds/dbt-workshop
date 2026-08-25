{{ config(materialized='table') }}

select 
    customer_id,
    trim(customer_name) as customer_name,
    lower(trim(email)) as email,
    account_id,
    upper(trim(branch)) as branch,
    upper(trim(city)) as city,
    upper(trim(account_type)) as account_type,
    upper(trim(kyc_status)) as kyc_status,
    opening_balance,
    customer_since
from {{ ref('brz_customers') }}