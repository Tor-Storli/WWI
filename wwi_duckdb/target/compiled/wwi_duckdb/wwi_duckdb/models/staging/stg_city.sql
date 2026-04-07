with source as (
    select * from "WWI"."main"."City"
),

renamed as (
    select
        "City Key" AS city_key,
        "WWI City ID" AS wwi_city_id,
        "City" AS city,
        "State Province" AS state_province,
        "Country" AS country,
        "Continent" AS continent,
        "Sales Territory" AS sales_territory,
        "Region" AS region,
        "Subregion" AS subregion,
        "Location" AS location,
        "Latest Recorded Population" AS latest_recorded_population,
        "Valid From" AS valid_from,
        "Valid To" AS valid_to,
        "Lineage Key" AS lineage_key
    from source
)
select * from renamed