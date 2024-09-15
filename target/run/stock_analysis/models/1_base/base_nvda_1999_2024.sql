
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_nvda_1999_2024`
      
    
    

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
from `first-project-262802`.`stock`.`nvda`
    );
  