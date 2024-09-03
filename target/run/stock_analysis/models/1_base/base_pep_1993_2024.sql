
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_pep_1993_2024`
      
    
    

    OPTIONS()
    as (
      select 
  date
  , close_last
  , volume
  , open
  , high
  , low
from `first-project-262802`.`stock`.`pep`
    );
  