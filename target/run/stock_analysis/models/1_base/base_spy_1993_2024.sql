
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_spy_1993_2024`
      
    
    

    OPTIONS()
    as (
      select 
  date
  , close_last
  , volume
  , open
  , high
  , low
from `first-project-262802`.`stock`.`spy_1993_2024`
    );
  