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
start = datetime.datetime(2024, 9, 1)

def YfinanceData(Symbols):
	
	global concat_df

	for Symbol in Symbols:
		time.sleep(2)
		Yfinance_DataFrame = yf.download(tickers=Symbol, interval='1d', start= start)
		Yfinance_DataFrame['Symbol'] = Symbol
		concat_df = pd.concat([concat_df, Yfinance_DataFrame])





nasdaq = si.tickers_nasdaq()
YfinanceData(nasdaq)
# YfinanceData(['AAPL','SPY']) ### for testing purposes

concat_df = concat_df.reset_index()
concat_df['ETL_Date'] = date.today()

concat_df.to_csv('all_nasdaq_stock_history.csv')



###############################################################################
###############################################################################
###############################################################################