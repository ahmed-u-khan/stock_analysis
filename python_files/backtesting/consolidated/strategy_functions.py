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