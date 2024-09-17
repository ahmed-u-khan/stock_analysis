
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_all_nasdaq_stock_info`
      
    
    

    OPTIONS()
    as (
      select
    -- int64_field_0
    index
    , address1
    , address2
    , city
    , zip
    , country
    , phone
    , fax
    , website
    , industry
    , industryKey
    , industryDisp
    , sector
    , sectorKey
    , sectorDisp
    , longBusinessSummary
    , fullTimeEmployees
    , companyOfficers
    , compensationAsOfEpochDate
    , irWebsite
    , maxAge
    , priceHint
    , previousClose
    , open as open_price_from_stock_info
    , dayLow
    , dayHigh
    , regularMarketPreviousClose
    , regularMarketOpen
    , regularMarketDayLow
    , regularMarketDayHigh
    , exDividendDate
    , beta
    , forwardPE
    , volume as volume_from_stock_info
    , regularMarketVolume
    , averageVolume
    , averageVolume10days
    , averageDailyVolume10Day
    , marketCap
    , fiftyTwoWeekLow
    , fiftyTwoWeekHigh
    , priceToSalesTrailing12Months
    , fiftyDayAverage
    , twoHundredDayAverage
    , currency
    , enterpriseValue
    , profitMargins
    , floatShares
    , sharesOutstanding
    , sharesShort
    , sharesShortPriorMonth
    , sharesShortPreviousMonthDate
    , dateShortInterest
    , heldPercentInsiders
    , heldPercentInstitutions
    , shortRatio
    , shortPercentOfFloat
    , impliedSharesOutstanding
    , bookValue
    , priceToBook
    , lastFiscalYearEnd
    , nextFiscalYearEnd
    , mostRecentQuarter
    , netIncomeToCommon
    , trailingEps
    , forwardEps
    , enterpriseToRevenue
    , enterpriseToEbitda
    -- , 52WeekChange
    -- , SandP52WeekChange
    , lastDividendValue
    , lastDividendDate
    , exchange
    , quoteType
    , symbol
    , underlyingSymbol
    , shortName
    , longName
    , firstTradeDateEpochUtc
    , timeZoneFullName
    , timeZoneShortName
    , uuid
    , messageBoardId
    , gmtOffSetMilliseconds
    , currentPrice
    , recommendationMean
    , recommendationKey
    , totalCash
    , totalCashPerShare
    , ebitda
    , totalDebt
    , quickRatio
    , currentRatio
    , totalRevenue
    , debtToEquity
    , revenuePerShare
    , returnOnAssets
    , returnOnEquity
    , revenueGrowth
    , grossMargins
    , ebitdaMargins
    , operatingMargins
    , financialCurrency
    , trailingPegRatio
    , state
    , auditRisk
    , boardRisk
    , compensationRisk
    , shareHolderRightsRisk
    , overallRisk
    , governanceEpochDate
    , bid
    , ask
    , bidSize
    , askSize
    , sharesPercentSharesOut
    , lastSplitFactor
    , lastSplitDate
    , targetHighPrice
    , targetLowPrice
    , targetMeanPrice
    , targetMedianPrice
    , numberOfAnalystOpinions
    , freeCashflow
    , operatingCashflow
    , fiveYearAvgDividendYield
    , earningsQuarterlyGrowth
    , pegRatio
    , earningsGrowth
    , dividendRate
    , dividendYield
    , payoutRatio
    , trailingAnnualDividendRate
    , trailingAnnualDividendYield
    , trailingPE
    , grossProfits
    , ETL_Date
from `first-project-262802`.`stock`.`all_nasdaq_stock_info`
    );
  