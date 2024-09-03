with

spy as ( select * from {{ ref('stg_spy_1993_2024') }} )

, spus as ( select * from {{ ref('stg_spus_2019_2024') }} )

select * , 'SPY' as symbol from spy
union all
select * , 'SPUS' as symbol from spus


