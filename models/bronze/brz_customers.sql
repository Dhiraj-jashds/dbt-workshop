{{ config(materialized='view') }}

select 
    cast(as_of_date as date) as as_of_date,
    cast(customer_id as varchar) as customer_id,
    cast(customer_name as varchar) as customer_name,
    cast(email as varchar) as email,
    cast(account_id as varchar) as account_id,
    cast(branch as varchar) as branch,
    cast(city as varchar) as city,
    cast(account_type as varchar) as account_type,
    cast(kyc_status as varchar) as kyc_status,
    cast(balance as numeric(18,2)) as opening_balance,
    cast(customer_since as date) as customer_since
from {{ ref('customers') }}