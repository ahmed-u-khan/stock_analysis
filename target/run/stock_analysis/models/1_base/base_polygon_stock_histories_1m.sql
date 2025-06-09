

  create or replace view `first-project-262802`.`stock_analysis`.`base_polygon_stock_histories_1m`
  OPTIONS()
  as 


with unioned_data as (

    select * from `first-project-262802`.`stock`.`polygon_all_different_stock_histories_1m_etl_date_2025_04_17`

    union all

    select * from `first-project-262802`.`stock`.`polygon_all_different_stock_histories_1m_elt_date_2025_06_09`

)



select
    datetime_est
    , date(datetime_est) as date
    , time(datetime_est) as time
    , extract (hour from datetime_est ) as hour
    , extract (minute from datetime_est ) as minute
    , open
    , high
    , low
    , close
    , volume
    , transactions
    , vwap
    , date(ETL_Date) as etl_date
    , Symbol as symbol
from unioned_data;

