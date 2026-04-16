
{{ config(
    materialized='table',
     description="dim_payment_method production table." 
) }}

with paymentmethod as (
  select * from {{ ref('stg_paymentmethod') }}
)
select
	payment_method_key,
	wwi_payment_method_id,
	payment_method,
	valid_from,
	valid_to,
	lineage_key
from paymentmethod