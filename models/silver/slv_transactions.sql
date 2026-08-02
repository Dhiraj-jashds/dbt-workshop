{{ config(materialized='table') }}

select
    transaction_id,
    cast(transaction_datetime as timestamp) as transaction_datetime,
    from_account,
    to_account,
    upper(transaction_type) as transaction_type,
    amount,
    status,
    channel
from {{ ref('brz_transactions') }}
where amount > 0