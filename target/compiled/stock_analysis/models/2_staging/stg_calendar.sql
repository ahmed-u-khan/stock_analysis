with 

base_calendar as (select * from `first-project-262802`.`stock_analysis`.`base_calendar` )

, adding_month_start_and_end as 
(
    select
        *
        , case when day_of_date = 1 then TRUE else FALSE end as month_start
        , case 
            when ( month_full = 'January' or month_full =  'March' or month_full = 'May' or month_full = 'July'or month_full = 'August' or month_full = 'October' or month_full = 'December') and day_of_date = 31 then TRUE 
            when ( month_full = 'April' or month_full =  'June' or month_full = 'September' or month_full = 'November' ) and day_of_date = 30 then TRUE 
            when month_full = 'February' and ( day_of_date = 28 or day_of_date = 29 ) then TRUE 
            else FALSE 
        end as month_end   
    from base_calendar
)

, adding_quarter_start_and_end as 
(
    select
        *
        , case 
        when ( month_full = 'January' or month_full =  'April' or month_full = 'July' or month_full = 'October') and month_start = TRUE then TRUE
        else False
        end as quarter_start
        , case 
        when ( month_full = 'March' or month_full =  'June' or month_full = 'September' or month_full = 'December') and month_end = TRUE then TRUE
        else False
        end as quarter_end    
    from adding_month_start_and_end
)

, adding_week_start_and_end as 
(
    select
        *
        , case 
        when day_of_week = 1 then TRUE
        else False
        end as week_start
        , case 
        when day_of_week = 7 then TRUE
        else False
        end as week_end
        , case 
        when day_of_week = 1 then TRUE
        else False
        end as typical_trading_week_start
        , case 
        when day_of_week = 5 then TRUE
        else False
        end as typical_trading_week_end
    from adding_quarter_start_and_end
)

select * from adding_week_start_and_end