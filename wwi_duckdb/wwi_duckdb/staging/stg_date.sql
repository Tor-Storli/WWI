with source as (
    select * from {{ ref('Date') }}
),
renamed as (
    select
        "Date" AS date,
        "Day Number" AS day_number,
        "Day" AS day,
        "Month" AS month,
        "Short Month" AS short_month,
        "Calendar Month Number" AS calendar_month_number,
        "Calendar Month Label" AS calendar_month_label,
        "Calendar Year" AS calendar_year,
        "Calendar Year Label" AS calendar_year_label,
        "Fiscal Month Number" AS fiscal_month_number,
        "Fiscal Month Label" AS fiscal_month_label,
        "Fiscal Year" AS fiscal_year,
        "Fiscal Year Label" AS fiscal_year_label,
        "ISO Week Number" AS iso_week_number
    from source
)
select * from renamed