{{ config(
    materialized='table',
    description='dim_stock_item production table.'
) }}

with stg_stock_items as (
    select * from {{ ref('stg_stockitem') }}
),

final as (
    select
       stock_item_key,
	wwi_stock_item_id,
	stock_item,
	color,
	selling_package,
	buying_package,
	brand,
	size,
	lead_time_days,
	quantity_per_outer,
	is_chiller_stock,
	barcode,
	tax_rate,
	unit_price,
	recommended_retail_price,
	typical_weight_per_unit,
	photo,
	valid_from,
	valid_to,
	lineage_key
from stg_stock_items
)

select * from final
