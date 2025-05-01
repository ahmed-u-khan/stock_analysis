file_title = 'buy_sell_personal_backtesting_1m_consolidated'
consolidated_detailed_csv_name = file_title + '_detailed.csv'
consolidated_per_trade_summary_csv_name = file_title + '_summary_per_trade.csv'
consolidated_overall_summary_csv_name = file_title + '_summary_overall.csv'


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

# from strategy_functions import *

consolidated_detailed_df = pd.DataFrame()
consolidated_summary_per_trade_df = pd.DataFrame()
consolidatedl_summary_overall_df = pd.DataFrame()

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

# ticker_data_csv_df_og = pd.read_csv("nvda_1m_01-may-2023_to_01-june-2023_regular_hours.csv")

def buy_sell_analysis_input_dataset(csv_name) :

    ticker_data_csv_df_og = pd.read_csv(csv_name)

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
    buy_sell_df["buy_int"] = ""
    buy_sell_df["sell_int"] = ""

    return (buy_sell_df)

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################


def trading_strategy_v_shape_and_rsi_30_70(input_df, trading_hours, stategy_name, symbol_name) :

    buy_sell_df = input_df

    for index, row in buy_sell_df.iterrows():
        
        if buy_sell_df["rsi_14"][index] < 30 :
            buy_sell_df["should_buy_or_sell"][index] = "should_buy"
        
        if buy_sell_df["rsi_14"][index] > 70 :
            buy_sell_df["should_buy_or_sell"][index] = "should_sell"

        if buy_sell_df["active_trade"][index] == "" :
            buy_sell_df["active_trade"][index] = 0

        
        if index > 0 :
            if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["active_trade"][index] = 1


        if index > 0 :
            if buy_sell_df["rsi_14"][index] >= 30 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["active_trade"][index] = 1

        if buy_sell_df['hour_minute_int'][index] >= 930 and buy_sell_df['hour_minute_int'][index] <= 1559 : 
            if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 0 :
                if buy_sell_df["close"][index-1] > buy_sell_df["close"][index-2] and buy_sell_df["close"][index-2] < buy_sell_df["close"][index-3] :
                    buy_sell_df["buy_or_sell"][index] = "buy"
                    buy_sell_df["active_trade"][index] = 1
                    buy_sell_df["buy_int"][index] = 1

        if index > 0 and buy_sell_df['hour_minute_int'][index] >= 930 and buy_sell_df['hour_minute_int'][index] <= 1559 :
            if buy_sell_df["rsi_14"][index] > 70 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["buy_or_sell"][index] = "sell"
                buy_sell_df["active_trade"][index] = 0
                buy_sell_df["sell_int"][index] = 1


    # print("\n\n\n\n buy_sell_df \n\n")
    # print(buy_sell_df.head(150))

    buy_sell_df['trading_hours'] = trading_hours
    buy_sell_df['stategy_name'] = stategy_name
    buy_sell_df['symbol_name'] = symbol_name

    global consolidated_detailed_df
    consolidated_detailed_df = pd.concat([consolidated_detailed_df, buy_sell_df], ignore_index=True)
    
    # buy_sell_df.to_csv(symbol_name+"_"+stategy_name+"_"+trading_hours+"_"+"detailed.csv")

    return (buy_sell_df)
    

def trading_strategy_rsi_30_70(input_df, trading_hours, stategy_name, symbol_name) :

    buy_sell_df = input_df

    for index, row in buy_sell_df.iterrows():
        
        if buy_sell_df["rsi_14"][index] < 30 :
            buy_sell_df["should_buy_or_sell"][index] = "should_buy"
        
        if buy_sell_df["rsi_14"][index] > 70 :
            buy_sell_df["should_buy_or_sell"][index] = "should_sell"

        if buy_sell_df["active_trade"][index] == "" :
            buy_sell_df["active_trade"][index] = 0

        
        if index > 0 :
            if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["active_trade"][index] = 1


        if index > 0 :
            if buy_sell_df["rsi_14"][index] >= 30 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["active_trade"][index] = 1

        if buy_sell_df['hour_minute_int'][index] >= 930 and buy_sell_df['hour_minute_int'][index] <= 1559 : 
            if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 0 :
                buy_sell_df["buy_or_sell"][index] = "buy"
                buy_sell_df["active_trade"][index] = 1

        if index > 0 and buy_sell_df['hour_minute_int'][index] >= 930 and buy_sell_df['hour_minute_int'][index] <= 1559 :
            if buy_sell_df["rsi_14"][index] > 70 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["buy_or_sell"][index] = "sell"
                buy_sell_df["active_trade"][index] = 0


    # print("\n\n\n\n buy_sell_df \n\n")
    # print(buy_sell_df.head(150))

    buy_sell_df['trading_hours'] = trading_hours
    buy_sell_df['stategy_name'] = stategy_name
    buy_sell_df['symbol_name'] = symbol_name

    global consolidated_detailed_df
    consolidated_detailed_df = pd.concat([consolidated_detailed_df, buy_sell_df], ignore_index=True)
    
    # buy_sell_df.to_csv(symbol_name+"_"+stategy_name+"_"+trading_hours+"_"+"detailed.csv")

    return (buy_sell_df)
    

def trading_strategy_v_shape(input_df, trading_hours, stategy_name, symbol_name) :

    buy_sell_df = input_df

    for index, row in buy_sell_df.iterrows():
        
        if buy_sell_df["rsi_14"][index] < 30 :
            buy_sell_df["should_buy_or_sell"][index] = "should_buy"
        
        if buy_sell_df["rsi_14"][index] > 70 :
            buy_sell_df["should_buy_or_sell"][index] = "should_sell"

        if buy_sell_df["active_trade"][index] == "" :
            buy_sell_df["active_trade"][index] = 0

        
        if index > 0 :
            if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["active_trade"][index] = 1


        if index > 0 :
            if buy_sell_df["rsi_14"][index] >= 30 and buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["active_trade"][index] = 1

        if buy_sell_df['hour_minute_int'][index] >= 930 and buy_sell_df['hour_minute_int'][index] <= 1559 : 
            # if buy_sell_df["rsi_14"][index] < 30 and buy_sell_df["active_trade"][index-1] == 0 :
            if buy_sell_df["active_trade"][index-1] == 0 :
                if buy_sell_df["close"][index-1] > buy_sell_df["close"][index-2] and buy_sell_df["close"][index-2] < buy_sell_df["close"][index-3] :
                    buy_sell_df["buy_or_sell"][index] = "buy"
                    buy_sell_df["active_trade"][index] = 1
                    buy_sell_df["buy_int"][index] = 1

        if index > 0 and buy_sell_df['hour_minute_int'][index] >= 930 and buy_sell_df['hour_minute_int'][index] <= 1559 :
            # if buy_sell_df["rsi_14"][index] > 70 and buy_sell_df["active_trade"][index-1] == 1 :
            if buy_sell_df["active_trade"][index-1] == 1 :
                buy_sell_df["buy_or_sell"][index] = "sell"
                buy_sell_df["active_trade"][index] = 0
                buy_sell_df["sell_int"][index] = 1


    # print("\n\n\n\n buy_sell_df \n\n")
    # print(buy_sell_df.head(150))

    buy_sell_df['trading_hours'] = trading_hours
    buy_sell_df['stategy_name'] = stategy_name
    buy_sell_df['symbol_name'] = symbol_name

    global consolidated_detailed_df
    consolidated_detailed_df = pd.concat([consolidated_detailed_df, buy_sell_df], ignore_index=True)
    
    # buy_sell_df.to_csv(symbol_name+"_"+stategy_name+"_"+trading_hours+"_"+"detailed.csv")

    return (buy_sell_df)


###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

def per_trade_summary (input_df, trading_hours, stategy_name, symbol_name) :

    summary_statistics_df = input_df


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

    summary_statistics_sql_buy_sell_per_row_output_df['trading_hours'] = trading_hours
    summary_statistics_sql_buy_sell_per_row_output_df['stategy_name'] = stategy_name
    summary_statistics_sql_buy_sell_per_row_output_df['symbol_name'] = symbol_name

    global consolidated_summary_per_trade_df
    consolidated_summary_per_trade_df = pd.concat([consolidated_summary_per_trade_df, summary_statistics_sql_buy_sell_per_row_output_df], ignore_index=True)
    
    # summary_statistics_sql_buy_sell_per_row_output_df.to_csv(symbol_name+"_"+stategy_name+"_"+trading_hours+"_"+"summary_per_trade.csv")

    return (summary_statistics_sql_buy_sell_per_row_output_df)

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

def overall_summary (input_df, trading_hours, stategy_name, symbol_name) :

    summary_statistics_sql_buy_sell_per_row_output_df = input_df

    profit_amount = round( summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[-1] - summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[0] )
    profit_pct = round( ( ( summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[-1] / summary_statistics_sql_buy_sell_per_row_output_df['account_value'].iloc[0] ) -1 ) * 100 )
    buy_and_hold_profit_amount = round( ( summary_statistics_sql_buy_sell_per_row_output_df['txn_close_sell'].iloc[-1] - summary_statistics_sql_buy_sell_per_row_output_df['txn_close_buy'].iloc[1] ) * 10000 )
    buy_and_hold_profit_pct = round( ( ( ( buy_and_hold_profit_amount + 10000 ) / 10000 ) - 1 ) * 100 )

    number_of_trades = (summary_statistics_sql_buy_sell_per_row_output_df['trade_count'] > 0).sum()
    number_of_trades_won = (summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss'] > 0).sum()
    number_of_trades_tied = (summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss'] == 0).sum()
    number_of_trades_lost = (summary_statistics_sql_buy_sell_per_row_output_df['profit_and_loss'] < 0).sum()
    trade_win_pct = round( ( ( number_of_trades_won / number_of_trades ) * 100.0 ) )

    # print("###############################################################################################################################################")
    # print(f"\n\n profit_amount: ${profit_amount:,} \n\n")
    # print(f"\n\n profit_pct: {profit_pct:}% \n\n")
    # print(f"\n\n buy_and_hold_profit_amount: ${buy_and_hold_profit_amount:,} \n\n")
    # print(f"\n\n buy_and_hold_profit_pct: {buy_and_hold_profit_pct:}% \n\n")
    # print(f"\n\n number_of_trades: {number_of_trades:} \n\n")
    # print(f"\n\n number_of_trades_won: {number_of_trades_won:} \n\n")
    # print(f"\n\n number_of_trades_tied: {number_of_trades_tied:} \n\n")
    # print(f"\n\n number_of_trades_lost: {number_of_trades_lost:} \n\n")
    # print(f"\n\n trade_win_pct: {trade_win_pct:}% \n\n")
    # print("###############################################################################################################################################")

    metrics = {
        "profit_amount": profit_amount,
        "profit_pct": profit_pct,
        "buy_and_hold_profit_amount": buy_and_hold_profit_amount,
        "buy_and_hold_profit_pct": buy_and_hold_profit_pct,
        "number_of_trades": number_of_trades,
        "number_of_trades_won": number_of_trades_won,
        "number_of_trades_tied": number_of_trades_tied,
        "number_of_trades_lost": number_of_trades_lost,
        "trade_win_pct": trade_win_pct
    }

    overall_summary_df = pd.DataFrame([metrics])
    # print("\n\n\n\n overall_summary_df \n\n")
    # print(overall_summary_df.head(150))

    overall_summary_df['trading_hours'] = trading_hours
    overall_summary_df['stategy_name'] = stategy_name
    overall_summary_df['symbol_name'] = symbol_name

    global consolidatedl_summary_overall_df
    consolidatedl_summary_overall_df = pd.concat([consolidatedl_summary_overall_df, overall_summary_df], ignore_index=True)
    
    # overall_summary_df.to_csv(symbol_name+"_"+stategy_name+"_"+trading_hours+"_"+"summary_overall.csv")

    return (overall_summary_df)

###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

def execute_testing_strategy_v_shape_and_rsi_30_70 (csv_name,trading_hours,stategy_name, symbol_name ):

    trading_strategy_df = trading_strategy_v_shape_and_rsi_30_70(input_df = buy_sell_analysis_input_dataset(csv_name), trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)
    
    per_trade_summary_df = per_trade_summary(input_df = trading_strategy_df, trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)
    
    overall_summary_df = overall_summary(input_df = per_trade_summary_df, trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)


def execute_testing_strategy_rsi_30_70 (csv_name,trading_hours,stategy_name, symbol_name ):

    trading_strategy_df = trading_strategy_rsi_30_70(input_df = buy_sell_analysis_input_dataset(csv_name), trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)
    
    per_trade_summary_df = per_trade_summary(input_df = trading_strategy_df, trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)
    
    overall_summary_df = overall_summary(input_df = per_trade_summary_df, trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)


def execute_testing_strategy_v_shape (csv_name,trading_hours,stategy_name, symbol_name ):

    trading_strategy_df = trading_strategy_v_shape(input_df = buy_sell_analysis_input_dataset(csv_name), trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)
    
    per_trade_summary_df = per_trade_summary(input_df = trading_strategy_df, trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)
    
    overall_summary_df = overall_summary(input_df = per_trade_summary_df, trading_hours = trading_hours, stategy_name = stategy_name, symbol_name = symbol_name)



###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################

# if __name__ == "__main__":
    
execute_testing_strategy_v_shape_and_rsi_30_70 (csv_name = "nvda_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'v_shape_and_rsi_30_70', symbol_name = 'NVDA' )
execute_testing_strategy_v_shape_and_rsi_30_70 (csv_name = "spy_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'v_shape_and_rsi_30_70', symbol_name = 'SPY' )
execute_testing_strategy_v_shape_and_rsi_30_70 (csv_name = "soxs_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'v_shape_and_rsi_30_70', symbol_name = 'SOXS' )

execute_testing_strategy_rsi_30_70 (csv_name = "nvda_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'rsi_30_70', symbol_name = 'NVDA' )
execute_testing_strategy_rsi_30_70 (csv_name = "spy_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'rsi_30_70', symbol_name = 'SPY' )
execute_testing_strategy_rsi_30_70 (csv_name = "soxs_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'rsi_30_70', symbol_name = 'SOXS' )

execute_testing_strategy_v_shape (csv_name = "nvda_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'v_shape', symbol_name = 'NVDA' )
execute_testing_strategy_v_shape (csv_name = "spy_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'v_shape', symbol_name = 'SPY' )
execute_testing_strategy_v_shape (csv_name = "soxs_1m_01-may-2023_to_01-june-2023_regular_hours.csv", trading_hours = 'regular_trading_hours', stategy_name = 'v_shape', symbol_name = 'SOXS' )

consolidated_detailed_df.to_csv(consolidated_detailed_csv_name)
consolidated_summary_per_trade_df.to_csv(consolidated_per_trade_summary_csv_name)
consolidatedl_summary_overall_df.to_csv(consolidated_overall_summary_csv_name)