
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stock_analysis_1m`
      
    
    

    OPTIONS()
    as (
      


select 
    *
from `first-project-262802`.`stock_analysis`.`stg_polygon_stock_histories_1m`
    );
  