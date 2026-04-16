

{{ config(
    materialized='table',
     description="fct_sale production table." 
) }}

with sale as (
  select * from {{ ref('stg_sale') }}
)
select
	sale_key,
	city_key,
	customer_key,
	bill_to_customer_key,
	stock_item_key,
	invoice_date_key,
	delivery_date_key,
	salesperson_key,
	wwi_invoice_id,
	description,
	package,
	quantity,
	unit_price,
	tax_rate,
	total_excluding_tax,
	tax_amount,
	profit,
	total_including_tax,
	total_dry_items,
	total_chiller_items,
	lineage_key
from sale