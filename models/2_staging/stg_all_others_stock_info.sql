with 

base as ( select * from {{ ref('base_all_others_stock_info') }} )

select
    distinct 
    *
from base
where index = 0