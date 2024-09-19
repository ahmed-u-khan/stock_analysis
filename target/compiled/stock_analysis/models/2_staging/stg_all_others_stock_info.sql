with 

base as ( select * from `first-project-262802`.`stock_analysis`.`base_all_others_stock_info` )

select
    distinct 
    *
from base
where index = 0