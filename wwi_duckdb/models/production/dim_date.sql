{{ config(
    materialized='table',
     description="dim_date production table." 
) }}

with date as (
  select * from {{ ref('stg_date') }}
)
select
	date,
	day_number,
	"day",
	"month",
	short_month,
	calendar_month_number,
	calendar_month_label,
	calendar_year,
	calendar_year_label,
	fiscal_month_number,
	fiscal_month_label,
	fiscal_year,
	fiscal_year_label,
	iso_week_number
from date
