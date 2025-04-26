file_title = 'buy_sell_personal_backtesting_nvda_1m_may_2023_regular_hours'
csv_name = file_title + '.csv'

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

import pandas as pd
pd.options.display.max_rows = 150
pd.options.mode.chained_assignment = None

import warnings
warnings.filterwarnings("ignore", category=FutureWarning)


###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

ticker_data_csv_df_og = pd.read_csv("nvda_1m_01-may-2023_to_01-june-2023_regular_hours.csv")

analysis_df = ticker_data_csv_df_og.copy(deep=False)
analysis_df = ticker_data_csv_df_og[["datetime_est","close","volume","rsi_14"]]
# analysis_df.index = pd.DatetimeIndex(ticker_data_csv_df_og["datetime_est"])


# print("\n\n\n\n ticker_data_csv_df_og \n\n")
# print(ticker_data_csv_df_og.head(150))

# print("\n\n\n\n analysis_df \n\n")
# print(analysis_df.head(150))


buy_sell_df = analysis_df.copy(deep=False)

buy_sell_df["should_buy_or_sell"] = ""
buy_sell_df["active_trade"] = ''
buy_sell_df["buy_or_sell"] = ""


for index, row in buy_sell_df.iterrows():
    
    if buy_sell_df["rsi_14"][index] < 30 :
        # buy_sell_df["should_buy_or_sell"][index] = row
        buy_sell_df["should_buy_or_sell"][index] = "should_buy"
    
    if buy_sell_df["rsi_14"][index] > 70 :
        # buy_sell_df["should_buy_or_sell"][index] = row
        buy_sell_df["should_buy_or_sell"][index] = "should_sell"

    if buy_sell_df["active_trade"][index] == "" :
        buy_sell_df["active_trade"][index] = 0

    
    if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 1 :
        # buy_sell_df["should_buy_or_sell"][index] = row
        # buy_sell_df["buy_or_sell"][index] = "buy"
        buy_sell_df["active_trade"][index] = 1


    if index > 0 :
        if buy_sell_df["rsi_14"][index] >= 30 and buy_sell_df["active_trade"][index-1] == 1 :
            # buy_sell_df["should_buy_or_sell"][index] = row
            # buy_sell_df["buy_or_sell"][index] = "buy"
            buy_sell_df["active_trade"][index] = 1


    if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 0 :
        # buy_sell_df["should_buy_or_sell"][index] = row
        buy_sell_df["buy_or_sell"][index] = "buy"
        buy_sell_df["active_trade"][index] = 1

    if buy_sell_df["rsi_14"][index] > 70 and buy_sell_df["active_trade"][index-1] == 1 :
        # buy_sell_df["should_buy_or_sell"][index] = row
        buy_sell_df["buy_or_sell"][index] = "sell"
        buy_sell_df["active_trade"][index] = 0
    
    

print("\n\n\n\n buy_sell_df \n\n")
print(buy_sell_df.head(150))


buy_sell_df.to_csv(csv_name)