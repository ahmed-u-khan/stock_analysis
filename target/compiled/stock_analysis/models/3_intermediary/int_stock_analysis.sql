with

spy as ( select * except (adj_close) from `first-project-262802`.`stock_analysis`.`stg_spy_1993_2024` )
, spus as ( select * except (adj_close) from `first-project-262802`.`stock_analysis`.`stg_spus_2019_2024` )
, hlal as ( select * except (adj_close) from `first-project-262802`.`stock_analysis`.`stg_hlal_2019_2024` )

, nasdaq as ( select * except (adj_close) from `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_history` )




select * , 'SPY' as symbol from spy
union all
select * , 'SPUS' as symbol from spus
union all
select * , 'HLAL' as symbol from hlal
union all

select * except (symbol), symbol from nasdaq