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

def YfinanceData(Symbols):

	print('function started')
	
	global concat_df

	for Symbol in Symbols:

		time.sleep(10)
		print('\nfor loop started\n')
		print(Symbol)

		try:

			Yfinance_DataFrame = pd.DataFrame.from_dict(yf.Ticker(Symbol).info)		
			print('\nYfinance_DataFrame line started\n')

			concat_df = pd.concat([concat_df, Yfinance_DataFrame])
			print('\nconcat line started\n')

			print('\nsuccesfully able to get stock info for '+Symbol)

		except: 

			print('\nunable to get stock info for '+Symbol)





nasdaq = si.tickers_nasdaq()
YfinanceData(nasdaq)

concat_df = concat_df.reset_index()
concat_df['ETL_Date'] = date.today()

concat_df.to_csv('all_nasdaq_stock_info.csv')

###############################################################################
###############################################################################
###############################################################################