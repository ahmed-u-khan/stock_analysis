
  
    

    create or replace table `first-project-262802`.`stock_analysis`.`base_all_others_stock_info`
      
    
    

    OPTIONS()
    as (
      select
    -- int64_field_0
    index
    , address1
    , city
    , state
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
    , auditRisk
    , boardRisk
    , compensationRisk
    , shareHolderRightsRisk
    , overallRisk
    , governanceEpochDate
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
    , dividendRate
    , dividendYield
    , exDividendDate
    , payoutRatio
    , fiveYearAvgDividendYield
    , beta
    , trailingPE
    , forwardPE
    , volume as volume_from_stock_info
    , regularMarketVolume
    , averageVolume
    , averageVolume10days
    , averageDailyVolume10Day
    , bid
    , ask
    , bidSize
    , askSize
    , marketCap
    , fiftyTwoWeekLow
    , fiftyTwoWeekHigh
    , priceToSalesTrailing12Months
    , fiftyDayAverage
    , twoHundredDayAverage
    , trailingAnnualDividendRate
    , trailingAnnualDividendYield
    , currency
    , enterpriseValue
    , profitMargins
    , floatShares
    , sharesOutstanding
    , sharesShort
    , sharesShortPriorMonth
    , sharesShortPreviousMonthDate
    , dateShortInterest
    , sharesPercentSharesOut
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
    , earningsQuarterlyGrowth
    , netIncomeToCommon
    , trailingEps
    , forwardEps
    , pegRatio
    , lastSplitFactor
    , lastSplitDate
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
    , targetHighPrice
    , targetLowPrice
    , targetMeanPrice
    , targetMedianPrice
    , recommendationMean
    , recommendationKey
    , numberOfAnalystOpinions
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
    , freeCashflow
    , operatingCashflow
    , earningsGrowth
    , revenueGrowth
    , grossMargins
    , ebitdaMargins
    , operatingMargins
    , financialCurrency
    , trailingPegRatio
    , address2
    , industrySymbol
    , grossProfits
    , ETL_Date
from `first-project-262802`.`stock`.`all_others_stock_info`
    );
  