{{ config(materialized='view') }}

select *
from {{ ref('customers_day1') }}