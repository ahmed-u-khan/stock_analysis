
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_calendar`
      
    
    

    OPTIONS()
    as (
      

with 

base_calendar as (select * from `first-project-262802`.`stock_analysis`.`base_calendar` )

, adding_month_start_and_end as 
(
    select
        *
        , case when day_of_date = 1 then TRUE else FALSE end as is_month_start
        , case 
            when ( month_full = 'January' or month_full =  'March' or month_full = 'May' or month_full = 'July'or month_full = 'August' or month_full = 'October' or month_full = 'December') and day_of_date = 31 then TRUE 
            when ( month_full = 'April' or month_full =  'June' or month_full = 'September' or month_full = 'November' ) and day_of_date = 30 then TRUE 
            when month_full = 'February' and ( day_of_date = 28 or day_of_date = 29 ) then TRUE 
            else FALSE 
        end as is_month_end   
    from base_calendar
)

, adding_quarter_start_and_end as 
(
    select
        *
        , case 
            when ( month_full = 'January' or month_full =  'April' or month_full = 'July' or month_full = 'October') and is_month_start = TRUE then TRUE
            else False
        end as is_quarter_start
        , case 
            when ( month_full = 'March' or month_full =  'June' or month_full = 'September' or month_full = 'December') and is_month_end = TRUE then TRUE
            else False
        end as is_quarter_end    
    from adding_month_start_and_end
)

, adding_week_start_and_end as 
(
    select
        *
        , case 
            when day_of_week = 1 then TRUE
            else False
        end as is_week_start
        , case 
            when day_of_week = 7 then TRUE
            else False
        end as is_week_end
        , case 
            when day_of_week = 1 then TRUE
            else False
        end as is_typical_trading_week_start
        , case 
            when day_of_week = 5 then TRUE
            else False
        end as is_typical_trading_week_end
    from adding_quarter_start_and_end
)

, base as (select * from adding_week_start_and_end )

, adding_first_working_day_of_year as 
(
    select
        TRUE as is_first_working_day_of_year
        , *
    from base
    where is_workday = 1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date ORDER BY date asc) = 1
)

, adding_last_working_day_of_year as 
(
    select
        TRUE as is_last_working_day_of_year
        , *
    from base
    where is_workday = 1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date ORDER BY date desc) = 1
)

, adding_first_working_day_of_month as 
(
    select
        TRUE as is_first_working_day_of_month 
        , *
    from base
    where is_workday = 1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_of_date ORDER BY date asc) = 1
)

, adding_last_working_day_of_month as 
(
    select
        TRUE as is_last_working_day_of_month 
        , *
    from base
    where is_workday = 1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_of_date ORDER BY date desc) = 1
)

, adding_first_working_day_of_week as 
(
    select
        TRUE as is_first_working_day_of_week
        , *
    from base
    where is_workday = 1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_of_date, week_of_month ORDER BY date asc) = 1
)

, adding_last_working_day_of_week as 
(
    select
        TRUE as is_last_working_day_of_week
        , *
    from base
    where is_workday = 1
    QUALIFY ROW_NUMBER() OVER (PARTITION BY year_of_date, month_of_date, week_of_month ORDER BY date desc) = 1
)


select 
    base.*

    , concat(base.year_full,'-',base.week_number) as year_week
    , concat(base.year_full,'-',base.month_abbrev,'-',base.week_number) as year_month_week
    , concat(base.year_full,'-',base.month_abbrev) as year_month

    , case when adding_first_working_day_of_year.is_first_working_day_of_year = TRUE then TRUE else FALSE end as is_first_working_day_of_year
    , case when adding_last_working_day_of_year.is_last_working_day_of_year = TRUE then TRUE else FALSE end as is_last_working_day_of_year 
    
    , case when adding_first_working_day_of_month.is_first_working_day_of_month = TRUE then TRUE else FALSE end as is_first_working_day_of_month
    , case when adding_last_working_day_of_month.is_last_working_day_of_month = TRUE then TRUE else FALSE end as is_last_working_day_of_month
    
    , case when adding_first_working_day_of_week.is_first_working_day_of_week = TRUE then TRUE else FALSE end as is_first_working_day_of_week
    , case when adding_last_working_day_of_week.is_last_working_day_of_week = TRUE then TRUE else FALSE end as is_last_working_day_of_week

from base
left join adding_first_working_day_of_year using (date)
left join adding_last_working_day_of_year using (date)
left join adding_first_working_day_of_month using (date)
left join adding_last_working_day_of_month using (date)
left join adding_first_working_day_of_week using (date)
left join adding_last_working_day_of_week using (date)
    );
  