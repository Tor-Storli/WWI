{{ config(
    materialized='table',
     description="dim_date production table." 
) }}

with employee as (
  select * from {{ ref('stg_employee') }}
)
select
	employee_key,
	wwi_employee_id,
	employee,
	preferred_name,
	is_salesperson,
	photo,
	valid_from,
	valid_to,
	lineage_key,
	valid_to_1,
	lineage_key_1,
	valid_from_1,
	valid_to_2,
	lineage_key_2
from employee