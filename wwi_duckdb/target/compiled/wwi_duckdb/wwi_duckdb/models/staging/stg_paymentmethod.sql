with source as (
    select * from "WWI"."main"."PaymentMethod"
),
renamed as (
    select
        "Payment Method Key" AS payment_method_key,
        "WWI Payment Method ID" AS wwi_payment_method_id,
        "Payment Method" AS payment_method,
        "Valid From" AS valid_from,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key
    from source
)
select * from renamed