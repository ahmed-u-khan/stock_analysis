
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_brk-b_1996_2024`
      
    
    

    OPTIONS()
    as (
      select 
  date
  , close_last
  , adj_close
  , volume
  , open
  , high
  , low
from `first-project-262802`.`stock`.`brk-b`
    );
  