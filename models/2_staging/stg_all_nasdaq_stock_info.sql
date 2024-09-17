with 

base as ( select * from {{ ref('base_all_nasdaq_stock_info') }} )

select
    distinct 
    *
from base
where index = 0