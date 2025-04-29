from backtesting import Backtest, Strategy
from backtesting.lib import crossover
from backtesting.test import SMA, GOOG
import pandas as pd

class MySMAStrategy(Strategy):

    def init(self):
        price = self.data.Close
        self.ma1 = self.I(SMA, price, 10)
        self.ma2 = self.I(SMA, price, 20)

    def next(self):
        if crossover(self.ma1, self.ma2):
            self.buy()
        elif crossover(self.ma2, self.ma1):
            self.sell()


ticker_data_csv_df_og = pd.read_csv('nvda_1m.csv')
ticker_data_csv_df_og = ticker_data_csv_df_og[(ticker_data_csv_df_og['date'] >= '2023-05-01') & (ticker_data_csv_df_og['date'] <= '2023-06-01')] ### it seems that a one month window is all this can handle !
ticker_data_csv_df = ticker_data_csv_df_og[['datetime_est','open','high','low','close','volume']]
ticker_data_csv_df.index = pd.DatetimeIndex(ticker_data_csv_df_og['datetime_est'])
# ticker_data_csv_df.set_index('datetime_est', inplace=True)
ticker_data_csv_df.rename(columns={'open': 'Open', 'high': 'High', 'low': 'Low', 'close': 'Close', 'volume': 'Volume'}, inplace=True)


# print (ticker_data_csv_df.head())
# print (ticker_data_csv_df.dtypes)

backtest = Backtest(ticker_data_csv_df, MySMAStrategy, commission=0.002, exclusive_orders=True)

stats = backtest.run()

print(stats)

backtest.plot()

