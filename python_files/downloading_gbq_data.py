from google.cloud import bigquery



bigquery_project_name = 'first-project-262802'


# bigquery_sql_query = 'SELECT * FROM `first-project-262802.stock_analysis.stock_analysis` limit 10 '
# bigquery_sql_query = "SELECT * FROM `first-project-262802.stock_analysis.stock_analysis_1m` where symbol = 'NVDA' order by 1,2 "
# bigquery_sql_query = "SELECT * FROM `first-project-262802.stock_analysis.stock_analysis_1m` where symbol = 'NVDA' and minute_within_regular_trading_hours = 1 ORDER BY symbol, date, datetime_est"
bigquery_sql_query = "SELECT * FROM `first-project-262802.stock_analysis.stock_analysis_1m` where symbol = 'NVDA' ORDER BY symbol, date, datetime_est"


# file_download_name = 'downloaded_data.csv'
file_download_name = 'nvda_1m.csv'



def read_from_bqtable(bq_projectname, bq_query):
    client = bigquery.Client(bq_projectname)
    bq_data = client.query(bq_query).to_dataframe()
    return bq_data  #return dataframe



try:
    bigQueryTableData_df = read_from_bqtable(bigquery_project_name, bigquery_sql_query)
    print('\nsuccess! results of query downloaded to dataframe\n')
except:
    print('query statement to bgq did not execute')



try:
    bigQueryTableData_df.to_csv(file_download_name)
    print('\nsuccess! results of the query dataframe converted into downloaded csv\n')
except:
    print('unable to convert the results of the query dataframe into a downloaded csv')