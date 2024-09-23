with

stock_analysis as ( select * except (ETL_Date) from {{ ref('int_all_stock_history') }} )

select
    *
from stock_analysis