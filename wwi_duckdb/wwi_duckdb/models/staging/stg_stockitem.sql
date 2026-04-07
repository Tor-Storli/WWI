with source as (
    select * from {{ ref('StockItem') }}
),
renamed as (
    select
        "Stock Item Key" AS stock_item_key,
        "WWI Stock Item ID" AS wwi_stock_item_id,
        "Stock Item" AS stock_item,
        "Color" AS color,
        "Selling Package" AS selling_package,
        "Buying Package" AS buying_package,
        "Brand" AS brand,
        "Size" AS size,
        "Lead Time Days" AS lead_time_days,
        "Quantity Per Outer" AS quantity_per_outer,
        "Is Chiller Stock" AS is_chiller_stock,
        "Barcode" AS barcode,
        "Tax Rate" AS tax_rate,
        "Unit Price" AS unit_price,
        "Recommended Retail Price" AS recommended_retail_price,
        "Typical Weight Per Unit" AS typical_weight_per_unit,
        "Photo" AS photo,
        "Valid From" AS valid_from,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key
    from source
)
select * from renamed