-- models/production/fct_city_profit.sql

{{ config(
    materialized='table',
     description="Aggregated profit metrics joined with city dimensions." 
) }}

with sales as (
    select 
        city_key,
        profit
    from {{ ref('stg_sale') }}
),

city as (
    select 
        city_key,
        city as city_name,
        wwi_city_id
    from {{ ref('stg_city') }}
),

aggregated_profit as (
    select
        c.wwi_city_id,    
        c.city_name, 
        count(s.city_key) as total_transactions,
        sum(s.profit) as total_profit,
        avg(s.profit) as average_profit
    from sales s
    inner join city c 
        on s.city_key = c.city_key
    group by 1,2
)

select * from aggregated_profit
