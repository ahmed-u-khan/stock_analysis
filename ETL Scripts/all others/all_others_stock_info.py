###############################################################################
###############################################################################
###############################################################################

import datetime
import pandas as pd
import yfinance as yf
import yahoo_fin.stock_info as si
from datetime import date





concat_df = pd.DataFrame()

def YfinanceData(Symbols):

	print('function started')
	
	global concat_df

	for Symbol in Symbols:

		print('for loop started')
		print(Symbol)

		try:

			Yfinance_DataFrame = pd.DataFrame.from_dict(yf.Ticker(Symbol).info)		
			print('Yfinance_DataFrame line started')

			concat_df = pd.concat([concat_df, Yfinance_DataFrame])
			print('concat line started')

		except: 

			print('unable to get stock info for'+Symbol)





all_others = si.tickers_other()
YfinanceData(all_others)

concat_df = concat_df.reset_index()
concat_df['ETL_Date'] = date.today()

concat_df.to_csv('all_others_stock_info.csv')

###############################################################################
###############################################################################
###############################################################################

# print(yf.Ticker('SPY').info) ## for testing