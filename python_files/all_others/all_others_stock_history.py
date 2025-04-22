###############################################################################
###############################################################################
###############################################################################

import datetime
import pandas as pd
import yfinance as yf
import yahoo_fin.stock_info as si
# from datetime import date
import datetime
import time





concat_df = pd.DataFrame()

# start = datetime.datetime(1990, 1, 1)
start = datetime.datetime(2024, 9, 1)

def YfinanceData(Symbols):
	
	global concat_df

	for Symbol in Symbols:

		time.sleep(2)

		print('for loop started at '+str(datetime.datetime.now()))
		print(Symbol)

		try:
		
			Yfinance_DataFrame = yf.download(tickers=Symbol, interval='1d', start= start)
			print('Yfinance_DataFrame line started '+str(datetime.datetime.now()))
			
			Yfinance_DataFrame['Symbol'] = Symbol
			
			concat_df = pd.concat([concat_df, Yfinance_DataFrame])
			print('concat line started '+str(datetime.datetime.now()))

		except: 

			print('unable to get stock info for'+Symbol)





all_others = si.tickers_other()
YfinanceData(all_others)
# YfinanceData(['AAPL','SPY']) ### for testing purposes

concat_df = concat_df.reset_index()
concat_df['ETL_Date'] = datetime.datetime.now()

concat_df.to_csv('all_others_stock_history.csv')



###############################################################################
###############################################################################
###############################################################################