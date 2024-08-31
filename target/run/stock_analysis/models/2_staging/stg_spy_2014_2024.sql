
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_spy_2014_2024`
      
    
    

    OPTIONS()
    as (
      select 
    *
from `first-project-262802`.`stock_analysis`.`base_spy_2014_2024`
left join `first-project-262802`.`stock_analysis`.`stg_calendar` using (date)
    );
  