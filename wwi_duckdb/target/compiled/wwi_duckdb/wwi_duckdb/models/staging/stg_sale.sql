with source as (
    select * from "WWI"."main"."Sale"
),
renamed as (
    select
        "Sale Key" AS sale_key,
        "City Key" AS city_key,
        "Customer Key" AS customer_key,
        "Bill To Customer Key" AS bill_to_customer_key,
        "Stock Item Key" AS stock_item_key,
        "Invoice Date Key" AS invoice_date_key,
        "Delivery Date Key" AS delivery_date_key,
        "Salesperson Key" AS salesperson_key,
        "WWI Invoice ID" AS wwi_invoice_id,
        "Description" AS description,
        "Package" AS package,
        "Quantity" AS quantity,
        "Unit Price" AS unit_price,
        "Tax Rate" AS tax_rate,
        "Total Excluding Tax" AS total_excluding_tax,
        "Tax Amount" AS tax_amount,
        "Profit" AS profit,
        "Total Including Tax" AS total_including_tax,
        "Total Dry Items" AS total_dry_items,
        "Total Chiller Items" AS total_chiller_items,
        "Lineage Key" AS lineage_key
    from source
)
select * from renamed