{{ config(materialized='view') }}

select *
from {{ ref('transactions_day1') }}