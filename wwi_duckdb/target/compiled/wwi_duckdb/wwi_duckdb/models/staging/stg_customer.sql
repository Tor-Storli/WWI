with source as (
    select * from "WWI"."main"."Customer"
),

renamed as (
    select
        "Customer Key" AS customer_key,
        "WWI Customer ID" AS wwi_customer_id,
        "Customer" AS customer,
        "Bill To Customer" AS bill_to_customer,
        "Category" AS category,
        "Buying Group" AS buying_group,
        "Primary Contact" AS primary_contact,
        "Postal Code" AS postal_code,
        "Valid From" AS valid_from,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key
    from source

)
select * from renamed