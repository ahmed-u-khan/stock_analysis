###############################################################################
###############################################################################
###############################################################################

import datetime
import pandas as pd
import yfinance as yf
import yahoo_fin.stock_info as si
from datetime import date
import time




concat_df = pd.DataFrame()

# start = datetime.datetime(1990, 1, 1)
# start = datetime.datetime(2024, 9, 1)
# start = datetime.datetime(2025, 4, 14)
start = datetime.datetime(2025, 4, 9)

def YfinanceData(Symbols):
	
	global concat_df

	for Symbol in Symbols:
		time.sleep(2)
		# Yfinance_DataFrame = yf.download(tickers=Symbol, interval='1d', start= start)
		Yfinance_DataFrame = yf.download(tickers=Symbol, interval='1m', start= start)
		Yfinance_DataFrame['Symbol'] = Symbol
		concat_df = pd.concat([concat_df, Yfinance_DataFrame])





# nasdaq = si.tickers_nasdaq()
# YfinanceData(nasdaq)
# YfinanceData(['AAPL','SPY']) ### for testing purposes
# YfinanceData(['SQQQ','FNGD','TQQQ','TSLL','TSLA','FNGU','FNGA','NVD','SOXS','NVDX','TSLA','NVDA','TSLZ','QQQ','SPY','INTC','SQQQ','SOXL','QLD','TSLQ','TQQQ','SDS','SBUX','TSLS','AMZN','ERIC','AAPL','TSLL','SCHD'])
YfinanceData(
				[
					 'AAPL'
					 ,'AMZN'
					 ,'ERIC'
					 ,'FNGA'
					 ,'FNGD'
					 ,'FNGU'
					 ,'INTC'
					 ,'NVD'
					 ,'NVDA'
					 ,'NVDX'
					 ,'QLD'
					 ,'QQQ'
					 ,'SBUX'
					 ,'SCHD'
					 ,'SDS'
					 ,'SOXL'
					 ,'SOXS'
					 ,'SPY'
					 ,'SQQQ'
					 ,'TQQQ'
					 ,'TSLA'
					 ,'TSLL'
					 ,'TSLQ'
					 ,'TSLS'
					 ,'TSLZ'
				]
			)


concat_df = concat_df.reset_index()
concat_df['ETL_Date'] = date.today()

concat_df.to_csv('ticker_history_1m.csv')



###############################################################################
###############################################################################
###############################################################################