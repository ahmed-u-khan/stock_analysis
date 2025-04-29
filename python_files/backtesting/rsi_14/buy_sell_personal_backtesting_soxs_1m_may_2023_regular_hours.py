file_title = 'buy_sell_personal_backtesting_soxs_1m_may_2023_regular_hours'
detailed_csv_name = file_title + '_detailed.csv'
per_trade_summary_csv_name = file_title + '_summary_per_trade.csv'
overall_summary_csv_name = file_title + '_summary_overall.csv'


###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

import pandas as pd
pd.options.display.max_rows = 150
pd.options.mode.chained_assignment = None

import warnings
warnings.filterwarnings("ignore", category=FutureWarning)

import pandasql as ps

import numpy as np

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

ticker_data_csv_df_og = pd.read_csv("soxs_1m_01-may-2023_to_01-june-2023_regular_hours.csv")

analysis_df = ticker_data_csv_df_og.copy(deep=False)
analysis_df = ticker_data_csv_df_og[["datetime_est","close","volume","rsi_14"]]
analysis_df['hour'] = analysis_df['datetime_est'].str.split(' ').str[1].str.split(':').str[0].astype(int)
analysis_df['minute'] = analysis_df['datetime_est'].str.split(' ').str[1].str.split(':').str[1].astype(int)
analysis_df['hour_minute_int'] = analysis_df['hour'] * 100 + analysis_df['minute']
# analysis_df.index = pd.DatetimeIndex(ticker_data_csv_df_og["datetime_est"])


# print("\n\n\n\n ticker_data_csv_df_og \n\n")
# print(ticker_data_csv_df_og.head(150))

# print("\n\n\n\n analysis_df \n\n")
# print(analysis_df.dtypes)
# print("\n\n\n\n analysis_df \n\n")
# print(analysis_df.head(150))
# print("\n\n\n\n analysis_df \n\n")
# print(analysis_df.tail(150))


buy_sell_df = analysis_df.copy(deep=False)

buy_sell_df["should_buy_or_sell"] = ""
buy_sell_df["active_trade"] = ''
buy_sell_df["buy_or_sell"] = ""


for index, row in buy_sell_df.iterrows():
    
    if buy_sell_df["rsi_14"][index] < 30 :
        buy_sell_df["should_buy_or_sell"][index] = "should_buy"
    
    if buy_sell_df["rsi_14"][index] > 70 :
        buy_sell_df["should_buy_or_sell"][index] = "should_sell"

    if buy_sell_df["active_trade"][index] == "" :
        buy_sell_df["active_trade"][index] = 0


    if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 1 :
        buy_sell_df["active_trade"][index] = 1


    if index > 0 :
        if buy_sell_df["rsi_14"][index] >= 30 and buy_sell_df["active_trade"][index-1] == 1 :
            buy_sell_df["active_trade"][index] = 1

    if analysis_df['hour_minute_int'][index] >= 930 and analysis_df['hour_minute_int'][index] <= 1559 : 
        if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 0 :
            buy_sell_df["buy_or_sell"][index] = "buy"
            buy_sell_df["active_trade"][index] = 1

    if index > 0 and analysis_df['hour_minute_int'][index] >= 930 and analysis_df['hour_minute_int'][index] <= 1559 :
        if buy_sell_df["rsi_14"][index] > 70 and buy_sell_df["active_trade"][index-1] == 1 :
            buy_sell_df["buy_or_sell"][index] = "sell"
            buy_sell_df["active_trade"][index] = 0

# for index, row in buy_sell_df.iterrows():
    
#     try:
#         if buy_sell_df["rsi_14"][index] < 30:
#             buy_sell_df["should_buy_or_sell"][index] = "should_buy"
#     except Exception as e:
#         print(f"Error in first RSI check (should_buy): {e}")
    
#     try:
#         if buy_sell_df["rsi_14"][index] > 70:
#             buy_sell_df["should_buy_or_sell"][index] = "should_sell"
#     except Exception as e:
#         print(f"Error in second RSI check (should_sell): {e}")

#     try:
#         if buy_sell_df["active_trade"][index] == "":
#             buy_sell_df["active_trade"][index] = 0
#     except Exception as e:
#         print(f"Error in setting default active_trade: {e}")
    
#     try:
#         if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 1:
#             buy_sell_df["active_trade"][index] = 1
#     except Exception as e:
#         print(f"Error in continuing active trade (RSI < 30): {e}")

#     try:
#         if index > 0:
#             if buy_sell_df["rsi_14"][index] >= 30 and buy_sell_df["active_trade"][index-1] == 1:
#                 buy_sell_df["active_trade"][index] = 1
#     except Exception as e:
#         print(f"Error in continuing active trade (RSI >= 30): {e}")

#     try:
#         if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 0:
#             buy_sell_df["buy_or_sell"][index] = "buy"
#             buy_sell_df["active_trade"][index] = 1
#     except Exception as e:
#         print(f"Error in buy signal: {e}")

#     try:
#       if index > 0 :
#         if buy_sell_df["rsi_14"][index] > 70 and buy_sell_df["active_trade"][index-1] == 1:
#             buy_sell_df["buy_or_sell"][index] = "sell"
#             buy_sell_df["active_trade"][index] = 0
#     except Exception as e:
#         print(f"Error in sell signal: {e}")
    
    

# print("\n\n\n\n buy_sell_df \n\n")
# print(buy_sell_df.head(150))


buy_sell_df.to_csv(detailed_csv_name)

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

summary_statistics_df = buy_sell_df


summary_statistics_sql_buy_sell_row_couples_output_df  = ps.sqldf(
                        """

                            with

                            base as (
                            select
                            *
                            , ( datetime_est || ' / ' || close || ' / ' || buy_or_sell ) as concat_field
                            from summary_statistics_df
                            where buy_or_sell = 'buy' or buy_or_sell = 'sell'
                            )

                            , consolidated as (
                            select
                            distinct
                            concat_field
                            , min(datetime_est) as txn_datetime
                            , min(close) as txn_close
                            from base
                            where concat_field is not null
                            group by 1
                            order by 1
                            )

                            select * from consolidated

                        """
                         )



labels = np.repeat(np.arange(1, len(summary_statistics_sql_buy_sell_row_couples_output_df) // 2 + 1), 2)
if len(summary_statistics_sql_buy_sell_row_couples_output_df) % 2 != 0:
    labels = np.append(labels, labels[-1])
summary_statistics_sql_buy_sell_row_couples_output_df['grouping_column'] = labels

base_labels = np.arange(1, (len(summary_statistics_sql_buy_sell_row_couples_output_df) // 2) + 1)
labels = np.repeat(base_labels, 2).astype(float)
labels[1::2] += 0.1
if len(summary_statistics_sql_buy_sell_row_couples_output_df) % 2 != 0:
    labels = np.append(labels, labels[-1])
summary_statistics_sql_buy_sell_row_couples_output_df['grouping_column_v2'] = labels


# print("\n\n\n\n summary_statistics_sql_buy_sell_row_couples_output_df \n\n")
# print(summary_statistics_sql_buy_sell_row_couples_output_df.head(150))





# Your input DataFrame
df = summary_statistics_sql_buy_sell_row_couples_output_df

# Step 1: Separate buy and sell rows
buy_df = df[df['concat_field'].str.contains('buy')].copy()
sell_df = df[df['concat_field'].str.contains('sell')].copy()

# Step 2: Rename columns for clarity
buy_df = buy_df.rename(columns={
    'txn_datetime': 'txn_datetime_buy',
    'txn_close': 'txn_close_buy'
})

sell_df = sell_df.rename(columns={
    'txn_datetime': 'txn_datetime_sell',
    'txn_close': 'txn_close_sell'
})

# Step 3: Merge buy and sell on 'grouping_column'
merged = pd.merge(
    buy_df[['grouping_column', 'txn_datetime_buy', 'txn_close_buy']],
    sell_df[['grouping_column', 'txn_datetime_sell', 'txn_close_sell']],
    on='grouping_column',
    how='inner'  # only full pairs
)

# Step 4: Sort the final result if needed
merged = merged.sort_values(by='grouping_column').reset_index(drop=True)
merged.rename(columns={'grouping_column': 'trade_count'}, inplace=True)
summary_statistics_sql_buy_sell_per_row_output_df = merged

summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss'] = summary_statistics_sql_buy_sell_per_row_output_df['txn_close_sell'] - summary_statistics_sql_buy_sell_per_row_output_df['txn_close_buy']

summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss_10k'] = summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss']*10000

summary_statistics_sql_buy_sell_per_row_output_df['account_value'] = 10000

new_row = pd.DataFrame({ 'trade_count':0, 'txn_datetime_buy':'1900-01-01 00:00:00.000000 UTC', 'txn_close_buy':0.0000, 'txn_datetime_sell':'1900-01-01 00:00:00.000000 UTC', 'txn_close_sell':0.0000, 'profit_and_loss':0.0000, 'profit_and_loss_10k':0.0000, 'account_value':10000 },index =[0])
summary_statistics_sql_buy_sell_per_row_output_df = pd.concat([new_row, summary_statistics_sql_buy_sell_per_row_output_df]).reset_index(drop = True)

for index, row in summary_statistics_sql_buy_sell_per_row_output_df.iterrows() :

    if index > 0 :
        summary_statistics_sql_buy_sell_per_row_output_df['account_value'][index] = summary_statistics_sql_buy_sell_per_row_output_df['account_value'][index-1] + summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss_10k'][index]
    

# Output
# print("\n\n\n\n summary_statistics_sql_buy_sell_per_row_output_df \n\n")
# print(summary_statistics_sql_buy_sell_per_row_output_df.head(150))

summary_statistics_sql_buy_sell_per_row_output_df.to_csv(per_trade_summary_csv_name)

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

# overall_summary_df = summary_statistics_sql_buy_sell_per_row_output_df

profit_amount = round( summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[-1] - summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[0] )
profit_pct = round( ( ( summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[-1] / summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[0] ) -1 ) * 100 )
buy_and_hold_profit_amount = round( ( summary_statistics_sql_buy_sell_per_row_output_df['txn_close_sell'].iloc[-1] - summary_statistics_sql_buy_sell_per_row_output_df['txn_close_buy'].iloc[1] ) * 10000 )
buy_and_hold_profit_pct = round( ( ( ( buy_and_hold_profit_amount + 10000 ) / 10000 ) - 1 ) * 100 )

# print("\n\n\n\n summary_statioverall_summary_dfstics_sql_buy_sell_per_row_output_df \n\n")
# print(overall_summary_df.head(150))

# overall_summary_df.to_csv(overall_summary_csv_name)



print("###############################################################################################################################################")
print(f"\n\n profit_amount: ${profit_amount:,} \n\n")
print(f"\n\n profit_pct: {profit_pct:}% \n\n")
print(f"\n\n buy_and_hold_profit_amount: ${buy_and_hold_profit_amount:,} \n\n")
print(f"\n\n buy_and_hold_profit_pct: {buy_and_hold_profit_pct:}% \n\n")
print("###############################################################################################################################################")