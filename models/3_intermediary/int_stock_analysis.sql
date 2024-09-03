with

spy as ( select * from {{ ref('stg_spy_1993_2024') }} )

, spus as ( select * from {{ ref('stg_spus_2019_2024') }} )

, aapl as ( select * from {{ ref('stg_aapl_1993_2024') }} )
, abbv as ( select * from {{ ref('stg_abbv_2013_2024') }} )
, adbe as ( select * from {{ ref('stg_adbe_1993_2024') }} )
, amd as ( select * from {{ ref('stg_amd_1993_2024') }} )
, amzn as ( select * from {{ ref('stg_amzn_1997_2024') }} )
, avgo as ( select * from {{ ref('stg_avgo_2009_2024') }} )
, bac as ( select * from {{ ref('stg_bac_1993_2024') }} )
, brk_b as ( select * from {{ ref('stg_brk-b_1996_2024') }} )
, cost as ( select * from {{ ref('stg_cost_1993_2024') }} )
, crm as ( select * from {{ ref('stg_crm_2004_2024') }} )
, cvx as ( select * from {{ ref('stg_cvx_1993_2024') }} )
, goog as ( select * from {{ ref('stg_goog_2004_2024') }} )
, googl as ( select * from {{ ref('stg_googl_2004_2024') }} )
, hd as ( select * from {{ ref('stg_hd_1993_2024') }} )
, jnj as ( select * from {{ ref('stg_jnj_1993_2024') }} )
, jpm as ( select * from {{ ref('stg_jpm_1993_2024') }} )
, ko as ( select * from {{ ref('stg_ko_1993_2024') }} )
, lly as ( select * from {{ ref('stg_lly_1993_2024') }} )
, ma as ( select * from {{ ref('stg_ma_2006_2024') }} )
, meta as ( select * from {{ ref('stg_meta_2012_2024') }} )
, mrk as ( select * from {{ ref('stg_mrk_1993_2024') }} )
, msft as ( select * from {{ ref('stg_msft_1993_2024') }} )
, nflx as ( select * from {{ ref('stg_nflx_1993_2024') }} )
, nvda as ( select * from {{ ref('stg_nvda_1999_2024') }} )
, pep as ( select * from {{ ref('stg_pep_1993_2024') }} )
, pg as ( select * from {{ ref('stg_pg_1993_2024') }} )
, tmo as ( select * from {{ ref('stg_tmo_1993_2024') }} )
, tsla as ( select * from {{ ref('stg_tsla_2010_2024') }} )
, unh as ( select * from {{ ref('stg_unh_1993_2024') }} )
, v as ( select * from {{ ref('stg_v_1993_2024') }} )
, wmt as ( select * from {{ ref('stg_wmt_1993_2024') }} )
, xom as ( select * from {{ ref('stg_xom_1993_2024') }} )


select * , 'SPY' as symbol from spy
union all
select * , 'SPUS' as symbol from spus
union all
select * , 'AAPL' as symbol from aapl
union all
select * , 'ABBV' as symbol from abbv
union all
select * , 'ADBE' as symbol from adbe
union all
select * , 'AMD' as symbol from amd
union all
select * , 'AMZN' as symbol from amzn
union all
select * , 'AVGO' as symbol from avgo
union all
select * , 'BAC' as symbol from bac
union all
select * , 'BRK-B' as symbol from brk_b
union all
select * , 'COST' as symbol from cost
union all
select * , 'CRM' as symbol from crm
union all
select * , 'CVX' as symbol from cvx
union all
select * , 'GOOG' as symbol from goog
union all
select * , 'GOOGL' as symbol from googl
union all
select * , 'HD' as symbol from hd
union all
select * , 'JNJ' as symbol from jnj
union all
select * , 'JPM' as symbol from jpm
union all
select * , 'KO' as symbol from ko
union all
select * , 'LLY' as symbol from lly
union all
select * , 'MA' as symbol from ma
union all
select * , 'META' as symbol from meta
union all
select * , 'MRK' as symbol from mrk
union all
select * , 'MSFT' as symbol from msft
union all
select * , 'NFLX' as symbol from nflx
union all
select * , 'NVDA' as symbol from nvda
union all
select * , 'PEP' as symbol from pep
union all
select * , 'PG' as symbol from pg
union all
select * , 'TMO' as symbol from tmo
union all
select * , 'TSLA' as symbol from tsla
union all
select * , 'UNH' as symbol from unh
union all
select * , 'V' as symbol from v
union all
select * , 'WMT' as symbol from wmt
union all
select * , 'XOM' as symbol from xom



