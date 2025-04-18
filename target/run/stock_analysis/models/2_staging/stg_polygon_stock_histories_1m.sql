

  create or replace view `first-project-262802`.`stock_analysis`.`stg_polygon_stock_histories_1m`
  OPTIONS()
  as 

with 

stock as ( select * from `first-project-262802`.`stock_analysis`.`base_polygon_stock_histories_1m` )

, calendar as ( select * from `first-project-262802`.`stock_analysis`.`stg_calendar` )

, base as 
(
    select 
        *
        , round(((open + close + high + low)/4.00),2) as avg_minute_price
    from stock
    left join calendar using (date)
)

select * from base;

