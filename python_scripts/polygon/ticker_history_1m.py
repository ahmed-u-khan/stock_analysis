import pandas as pd
import datetime
from datetime import date
import time
from polygon import RESTClient

client = RESTClient("ffdtwIaT6iV0OmmjFJtkZY7AOp4mLcDB")

########################################################################
########################################################################
########################################################################
#                       MAY 1 2023 to JUN 30 2023                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2023-05-01",
    "2023-06-30",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2023-05-01_to_2023-06-30.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       JUL 1 2023 to AUG 31 2023                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2023-07-01",
    "2023-08-31",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2023-07-01_to_2023-08-31.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       SEP 1 2023 to OCT 31 2023                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2023-09-01",
    "2023-10-31",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2023-09-01_to_2023-10-31.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       NOV 1 2023 to DEC 31 2023                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2023-11-01",
    "2023-12-31",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2023-11-01_to_2023-12-31.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       JAN 1 2024 to FEB 29 2024                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2024-01-01",
    "2024-02-29",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2024-01-01_to_2024-02-29.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       MAR 1 2024 to APR 30 2024                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2024-03-01",
    "2024-04-30",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2024-03-01_to_2024-04-30.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       MAY 1 2024 to JUN 30 2024                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2024-05-01",
    "2024-06-30",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2024-05-01_to_2024-06-30.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       JUL 1 2024 to AUG 31 2024                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2024-07-01",
    "2024-08-31",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2024-07-01_to_2024-08-31.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       SEP 1 2024 to OCT 31 2024                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2024-09-01",
    "2024-10-31",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2024-09-01_to_2024-10-31.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       NOV 1 2024 to DEC 31 2024                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2024-11-01",
    "2024-12-31",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2024-11-01_to_2024-12-31.csv')


time.sleep(13)


########################################################################
########################################################################
########################################################################
#                       JAN 1 2025 to FEB 28 2025                      #
########################################################################

aggs = []
for a in client.list_aggs(
    "SQQQ",
    1,
    "minute",
    "2025-01-01",
    "2025-02-28",
    adjusted="true",
    sort="asc",
    limit=50000,
):
    aggs.append(a)

# print(aggs)

data = []

for agg in aggs :
    data.append({

                "datetime_unix" : agg.timestamp
                , "open" : agg.open
                , "low" : agg.low
                , "high" : agg.high
                , "close" : agg.close
                , "volume" : agg.volume
                , "transactions" : agg.transactions
                , "vwap" : agg.vwap
                , "otc" : agg.otc

                })


result_df = pd.DataFrame(data)
result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
result_df['ETL_Date'] = date.today()
result_df['Symbol'] = 'SQQQ'
result_df.to_csv('SQQQ_1m_2025-01-01_to_2025-02-28.csv')


# time.sleep(13)


# ########################################################################
# ########################################################################
# ########################################################################
# #                       MAR 1 2025 to APR 30 2025                      #
# ########################################################################

# aggs = []
# for a in client.list_aggs(
#     "SQQQ",
#     1,
#     "minute",
#     "2025-03-01",
#     "2025-04-30",
#     adjusted="true",
#     sort="asc",
#     limit=50000,
# ):
#     aggs.append(a)

# # print(aggs)

# data = []

# for agg in aggs :
#     data.append({

#                 "datetime_unix" : agg.timestamp
#                 , "open" : agg.open
#                 , "low" : agg.low
#                 , "high" : agg.high
#                 , "close" : agg.close
#                 , "volume" : agg.volume
#                 , "transactions" : agg.transactions
#                 , "vwap" : agg.vwap
#                 , "otc" : agg.otc

#                 })


# result_df = pd.DataFrame(data)
# result_df['datetime_utc'] = pd.to_datetime(result_df['datetime_unix'], unit='ms')
# result_df['datetime_est'] = result_df['datetime_utc'] - pd.Timedelta(hours=4)
# result_df['ETL_Date'] = date.today()
# result_df['Symbol'] = 'SQQQ'
# result_df.to_csv('SQQQ_1m_2025-03-01_to_2025-04-30.csv')


