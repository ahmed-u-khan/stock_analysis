{{ config(
    tags="3_intermediary" 
) }}

with base as (

    select 
        * except (year_month, day_of_week)
        , year_month
        , day_of_week
        , concat(day_of_week," - ",day_abbrev) as day_of_week_and_name
        , volume as volume_per_day
        , volume / 390.00 as volume_per_minute
        , close_last as close
        , close_last as last
    from {{ ref('int_all_stock_history') }}

)

select 
    symbol
    , year_full
    , * except (year_full,symbol)
from base