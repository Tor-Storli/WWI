{{ config(
    materialized='table',
     description="dim_city production table." 
) }}

with city as (
  select * from {{ ref('stg_city') }}
)
select
	city_key,
	wwi_city_id,
	city,
	state_province,
	country,
	continent,
	sales_territory,
	region,
	subregion,
	"location",
	latest_recorded_population,
	valid_from,
	valid_to,
	lineage_key
FROM city