{{ config(materialized='view') }}

select 
    cast(transaction_id as varchar) as transaction_id,
    cast(transaction_datetime as timestamp) as transaction_datetime,
    cast(from_account as varchar) as from_account,
    cast(to_account as varchar) as to_account,
    cast(transaction_type as varchar) as transaction_type,
    cast(amount as numeric(18,2)) as amount,
    cast(status as varchar) as status,
    cast(channel as varchar) as channel,
    cast(remarks as varchar) as remarks
from {{ ref('transactions') }}