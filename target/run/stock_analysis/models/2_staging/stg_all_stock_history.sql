
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`stg_all_stock_history`
      
    
    

    OPTIONS()
    as (
      select * from `first-project-262802`.`stock_analysis`.`base_all_nasdaq_stock_history`

union all

select * from `first-project-262802`.`stock_analysis`.`base_all_others_stock_history`
    );
  