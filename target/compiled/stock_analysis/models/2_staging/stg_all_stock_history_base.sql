

with 

stock as ( select * from `first-project-262802`.`stock_analysis`.`stg_all_stock_history` )

, calendar as ( select * from `first-project-262802`.`stock_analysis`.`stg_calendar` )

, base as 
(
    select 
        *
        , round(((open + close_last + high + low)/4.00),2) as avg_daily_price
    from stock
    left join calendar using (date)
)

select * from base