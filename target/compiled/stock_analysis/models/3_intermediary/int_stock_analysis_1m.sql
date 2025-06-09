

with base as 
(
    select 
        * 
    from `first-project-262802`.`stock_analysis`.`stg_polygon_stock_histories_1m`
)

-- -- -- got the following from here: https://medium.com/google-cloud/how-to-calculate-technical-indicators-in-bigquery-using-sql-moving-averages-rsi-macd-b58b16e4f52e

, prices AS (
  SELECT 
    symbol,
    date, hour, minute,
    open,
    high,
    low,
    close,
    volume,
    AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS ma7,
    AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS ma30,
    AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 99 PRECEDING AND CURRENT ROW) AS ma100,
    AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 199 PRECEDING AND CURRENT ROW) AS ma200,
    SUM(CASE WHEN close > open THEN close - open ELSE 0 END) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS gain_14,
    SUM(CASE WHEN open > close THEN open - close ELSE NULL END) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 13 PRECEDING AND CURRENT ROW) AS loss_14,
    SUM(CASE WHEN close > open THEN close - open ELSE 0 END) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW) AS gain_24,
    SUM(CASE WHEN open > close THEN open - close ELSE NULL END) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW) AS loss_24,
    MAX(high) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW) AS highest,
    MIN(low) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW) AS lowest,
    (AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) - AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW)) AS macd
  FROM base
)

, indicators AS (
  SELECT 
    symbol,
    close,
    volume,
    date, hour, minute,
    ma7,
    ma30,
    ma100,
    ma200,
    (100 - (100 / (1 + (gain_14 / loss_14)))) AS rsi_14,
    (100 - (100 / (1 + (gain_24 / loss_24)))) AS rsi_24,
    macd,
    (CASE WHEN STDDEV_POP(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW) = 0 THEN NULL ELSE ((close - AVG(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW)) / STDDEV_POP(close) OVER (PARTITION BY symbol ORDER BY date, hour, minute ROWS BETWEEN 23 PRECEDING AND CURRENT ROW)) END) AS bollinger_band
  FROM prices
)

, final_indicator_values as (
SELECT 
  symbol,
--   close,
--   volume,
  date, hour, minute,
  ma7,
  ma30,
  ma100,
  ma200,
  rsi_14,
  rsi_24,
  macd,
  bollinger_band,
  ABS(ma200 - close) ma200_reach,
  ABS(ma100 - close) ma100_reach,
  ABS(ma30 - close) ma30_reach,
  ABS(ma7 - close) ma7_reach
FROM indicators
)


select 
    *
from base
left join final_indicator_values using (symbol, date, hour, minute)