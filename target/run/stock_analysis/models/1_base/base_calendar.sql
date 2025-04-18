

  create or replace view `first-project-262802`.`stock_analysis`.`base_calendar`
  OPTIONS()
  as 

select 
    is_workday
    , is_holiday
    , is_holiday_leave
    , a_date
    , a_date as date
    , extract(year from a_date) as year_of_date
    , extract(month from a_date) as month_of_date
    , extract(day from a_date) as day_of_date
    , day_full
    , day_full_capital_case
    , day_full_lower_case
    , day_abbrev
    , is_weekday
    , is_weekday_by_regex
    , day_of_week
    , day_of_month
    , day_of_year
    , week_of_month
    -- , format_date('%W', a_date) as week_number
    , CAST(format_date('%W', a_date) AS INT64) as week_number
    , trim(month_full) as month_full
    , lower(trim(month_full)) as month_full_lower_case
    , month_abbrev
    , month_number
    , quarter
    , year_short
    , year_full
    , fiscal_quarter
    , fiscal_year
    , fiscal_year_full
    , tomorrow
    , one_week_later
    , one_month_later
    , three_months_later
    , one_year_later
from `first-project-262802`.`stock`.`400_years_of_generated_dates_and_holidays`;

