
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_info`
      
    
    

    OPTIONS()
    as (
      with 

base as ( select * from `first-project-262802`.`stock_analysis`.`base_all_nasdaq_stock_info` )

select
    distinct 
    *
from base
where index = 0
    );
  