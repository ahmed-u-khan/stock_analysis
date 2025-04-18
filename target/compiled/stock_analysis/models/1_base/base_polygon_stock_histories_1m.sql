

select
    date(datetime_est) as date
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
from `first-project-262802`.`stock`.`polygon_all_different_stock_histories_1m`