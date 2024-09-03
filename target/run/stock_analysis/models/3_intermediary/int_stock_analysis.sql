
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`int_stock_analysis`
      
    
    

    OPTIONS()
    as (
      with

spy as ( select * from `first-project-262802`.`stock_analysis`.`stg_spy_1993_2024` )

, spus as ( select * from `first-project-262802`.`stock_analysis`.`stg_spus_2019_2024` )

select * , 'SPY' as symbol from spy
union all
select * , 'SPUS' as symbol from spus
    );
  