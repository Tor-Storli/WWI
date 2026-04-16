with source as (
    select * from {{ ref('Employee') }}
),
renamed as (
    select
        "Employee Key" AS employee_key,
        "WWI Employee ID" AS wwi_employee_id,
        "Employee" AS employee,
        "Preferred Name" AS preferred_name,
        "Is Salesperson" AS is_salesperson,
        "Photo" AS photo,
        "Valid From" AS valid_from,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key,
        "Valid From" AS valid_from,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key
    from source
)
select * from renamed