{{ config(
    materialized='table',
     description="dim_customer production table." 
) }}

with customer as (
  select * from {{ ref('stg_customer') }}
)

select
	customer_key,
	wwi_customer_id,
	customer,
	bill_to_customer,
	category,
	buying_group,
	primary_contact,
	postal_code,
	valid_from,
	valid_to,
	lineage_key
FROM customer