

  create or replace view `first-project-262802`.`stock_analysis`.`int_stock_analysis_1m`
  OPTIONS()
  as 

with base as 
(
    select 
        * 
    from `first-project-262802`.`stock_analysis`.`stg_polygon_stock_histories_1m`
)

-- , counting_mins_per_day_per_ticker as 
-- (
--     select 
--         symbol
--         , date
--         , minute_in_pre_market_regular_market_post_market_hours
--         , count(*) as minute_count 
--     from base
--     group by all
-- )

-- , validating_mins_per_day_per_ticker as 
-- (
--     select 
--         symbol
--         , date
--         , case when minute_in_pre_market_regular_market_post_market_hours = 'minute_within_pre_market_trading_hours' and ifnull(minute_count,0) = 330 then 1 else NULL end as date_for_ticker_has_all_pre_market_trading_hour_data
--         , case when minute_in_pre_market_regular_market_post_market_hours = 'minute_within_regular_trading_hours' and ifnull(minute_count,0) = 390 then 1 else NULL end as date_for_ticker_has_all_regular_trading_hour_data
--         , case when minute_in_pre_market_regular_market_post_market_hours = 'minute_within_post_market_trading_hours' and ifnull(minute_count,0) = 240 then 1 else NULL end as date_for_ticker_has_all_post_market_trading_hour_data
--     from counting_mins_per_day_per_ticker
-- )

select 
    *
from base
-- left join validating_mins_per_day_per_ticker using (symbol, date);

