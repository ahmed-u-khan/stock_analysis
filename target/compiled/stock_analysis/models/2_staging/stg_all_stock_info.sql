-- select * from `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_info`

-- union all

-- select * from `first-project-262802`.`stock_analysis`.`stg_all_others_stock_info`




    

        (
            select
                cast('''`first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_info`''' as string) as _dbt_source_relation,

                
                    cast(`index` as INT64) as `index` ,
                    cast(`address1` as STRING) as `address1` ,
                    cast(`address2` as STRING) as `address2` ,
                    cast(`city` as STRING) as `city` ,
                    cast(`zip` as STRING) as `zip` ,
                    cast(`country` as STRING) as `country` ,
                    cast(`phone` as STRING) as `phone` ,
                    cast(`fax` as STRING) as `fax` ,
                    cast(`website` as STRING) as `website` ,
                    cast(`industry` as STRING) as `industry` ,
                    cast(`industryKey` as STRING) as `industryKey` ,
                    cast(`industryDisp` as STRING) as `industryDisp` ,
                    cast(`sector` as STRING) as `sector` ,
                    cast(`sectorKey` as STRING) as `sectorKey` ,
                    cast(`sectorDisp` as STRING) as `sectorDisp` ,
                    cast(`longBusinessSummary` as STRING) as `longBusinessSummary` ,
                    cast(`fullTimeEmployees` as FLOAT64) as `fullTimeEmployees` ,
                    cast(`companyOfficers` as STRING) as `companyOfficers` ,
                    cast(`compensationAsOfEpochDate` as FLOAT64) as `compensationAsOfEpochDate` ,
                    cast(`irWebsite` as STRING) as `irWebsite` ,
                    cast(`maxAge` as INT64) as `maxAge` ,
                    cast(`priceHint` as INT64) as `priceHint` ,
                    cast(`previousClose` as FLOAT64) as `previousClose` ,
                    cast(`open_price_from_stock_info` as FLOAT64) as `open_price_from_stock_info` ,
                    cast(`dayLow` as FLOAT64) as `dayLow` ,
                    cast(`dayHigh` as FLOAT64) as `dayHigh` ,
                    cast(`regularMarketPreviousClose` as FLOAT64) as `regularMarketPreviousClose` ,
                    cast(`regularMarketOpen` as FLOAT64) as `regularMarketOpen` ,
                    cast(`regularMarketDayLow` as FLOAT64) as `regularMarketDayLow` ,
                    cast(`regularMarketDayHigh` as FLOAT64) as `regularMarketDayHigh` ,
                    cast(`exDividendDate` as FLOAT64) as `exDividendDate` ,
                    cast(`beta` as FLOAT64) as `beta` ,
                    cast(`forwardPE` as FLOAT64) as `forwardPE` ,
                    cast(`volume_from_stock_info` as FLOAT64) as `volume_from_stock_info` ,
                    cast(`regularMarketVolume` as FLOAT64) as `regularMarketVolume` ,
                    cast(`averageVolume` as FLOAT64) as `averageVolume` ,
                    cast(`averageVolume10days` as FLOAT64) as `averageVolume10days` ,
                    cast(`averageDailyVolume10Day` as FLOAT64) as `averageDailyVolume10Day` ,
                    cast(`marketCap` as FLOAT64) as `marketCap` ,
                    cast(`fiftyTwoWeekLow` as FLOAT64) as `fiftyTwoWeekLow` ,
                    cast(`fiftyTwoWeekHigh` as FLOAT64) as `fiftyTwoWeekHigh` ,
                    cast(`priceToSalesTrailing12Months` as FLOAT64) as `priceToSalesTrailing12Months` ,
                    cast(`fiftyDayAverage` as FLOAT64) as `fiftyDayAverage` ,
                    cast(`twoHundredDayAverage` as FLOAT64) as `twoHundredDayAverage` ,
                    cast(`currency` as STRING) as `currency` ,
                    cast(`enterpriseValue` as FLOAT64) as `enterpriseValue` ,
                    cast(`profitMargins` as FLOAT64) as `profitMargins` ,
                    cast(`floatShares` as FLOAT64) as `floatShares` ,
                    cast(`sharesOutstanding` as FLOAT64) as `sharesOutstanding` ,
                    cast(`sharesShort` as FLOAT64) as `sharesShort` ,
                    cast(`sharesShortPriorMonth` as FLOAT64) as `sharesShortPriorMonth` ,
                    cast(`sharesShortPreviousMonthDate` as FLOAT64) as `sharesShortPreviousMonthDate` ,
                    cast(`dateShortInterest` as FLOAT64) as `dateShortInterest` ,
                    cast(`heldPercentInsiders` as FLOAT64) as `heldPercentInsiders` ,
                    cast(`heldPercentInstitutions` as FLOAT64) as `heldPercentInstitutions` ,
                    cast(`shortRatio` as FLOAT64) as `shortRatio` ,
                    cast(`shortPercentOfFloat` as FLOAT64) as `shortPercentOfFloat` ,
                    cast(`impliedSharesOutstanding` as FLOAT64) as `impliedSharesOutstanding` ,
                    cast(`bookValue` as FLOAT64) as `bookValue` ,
                    cast(`priceToBook` as FLOAT64) as `priceToBook` ,
                    cast(`lastFiscalYearEnd` as FLOAT64) as `lastFiscalYearEnd` ,
                    cast(`nextFiscalYearEnd` as FLOAT64) as `nextFiscalYearEnd` ,
                    cast(`mostRecentQuarter` as FLOAT64) as `mostRecentQuarter` ,
                    cast(`netIncomeToCommon` as FLOAT64) as `netIncomeToCommon` ,
                    cast(`trailingEps` as FLOAT64) as `trailingEps` ,
                    cast(`forwardEps` as FLOAT64) as `forwardEps` ,
                    cast(`enterpriseToRevenue` as FLOAT64) as `enterpriseToRevenue` ,
                    cast(`enterpriseToEbitda` as FLOAT64) as `enterpriseToEbitda` ,
                    cast(`lastDividendValue` as FLOAT64) as `lastDividendValue` ,
                    cast(`lastDividendDate` as FLOAT64) as `lastDividendDate` ,
                    cast(`exchange` as STRING) as `exchange` ,
                    cast(`quoteType` as STRING) as `quoteType` ,
                    cast(`symbol` as STRING) as `symbol` ,
                    cast(`underlyingSymbol` as STRING) as `underlyingSymbol` ,
                    cast(`shortName` as STRING) as `shortName` ,
                    cast(`longName` as STRING) as `longName` ,
                    cast(`firstTradeDateEpochUtc` as FLOAT64) as `firstTradeDateEpochUtc` ,
                    cast(`timeZoneFullName` as STRING) as `timeZoneFullName` ,
                    cast(`timeZoneShortName` as STRING) as `timeZoneShortName` ,
                    cast(`uuid` as STRING) as `uuid` ,
                    cast(`messageBoardId` as STRING) as `messageBoardId` ,
                    cast(`gmtOffSetMilliseconds` as INT64) as `gmtOffSetMilliseconds` ,
                    cast(`currentPrice` as FLOAT64) as `currentPrice` ,
                    cast(`recommendationMean` as FLOAT64) as `recommendationMean` ,
                    cast(`recommendationKey` as STRING) as `recommendationKey` ,
                    cast(`totalCash` as FLOAT64) as `totalCash` ,
                    cast(`totalCashPerShare` as FLOAT64) as `totalCashPerShare` ,
                    cast(`ebitda` as FLOAT64) as `ebitda` ,
                    cast(`totalDebt` as FLOAT64) as `totalDebt` ,
                    cast(`quickRatio` as FLOAT64) as `quickRatio` ,
                    cast(`currentRatio` as FLOAT64) as `currentRatio` ,
                    cast(`totalRevenue` as FLOAT64) as `totalRevenue` ,
                    cast(`debtToEquity` as FLOAT64) as `debtToEquity` ,
                    cast(`revenuePerShare` as FLOAT64) as `revenuePerShare` ,
                    cast(`returnOnAssets` as FLOAT64) as `returnOnAssets` ,
                    cast(`returnOnEquity` as FLOAT64) as `returnOnEquity` ,
                    cast(`revenueGrowth` as FLOAT64) as `revenueGrowth` ,
                    cast(`grossMargins` as FLOAT64) as `grossMargins` ,
                    cast(`ebitdaMargins` as FLOAT64) as `ebitdaMargins` ,
                    cast(`operatingMargins` as FLOAT64) as `operatingMargins` ,
                    cast(`financialCurrency` as STRING) as `financialCurrency` ,
                    cast(`trailingPegRatio` as FLOAT64) as `trailingPegRatio` ,
                    cast(`state` as STRING) as `state` ,
                    cast(`auditRisk` as FLOAT64) as `auditRisk` ,
                    cast(`boardRisk` as FLOAT64) as `boardRisk` ,
                    cast(`compensationRisk` as FLOAT64) as `compensationRisk` ,
                    cast(`shareHolderRightsRisk` as FLOAT64) as `shareHolderRightsRisk` ,
                    cast(`overallRisk` as FLOAT64) as `overallRisk` ,
                    cast(`governanceEpochDate` as FLOAT64) as `governanceEpochDate` ,
                    cast(`bid` as FLOAT64) as `bid` ,
                    cast(`ask` as FLOAT64) as `ask` ,
                    cast(`bidSize` as FLOAT64) as `bidSize` ,
                    cast(`askSize` as FLOAT64) as `askSize` ,
                    cast(`sharesPercentSharesOut` as FLOAT64) as `sharesPercentSharesOut` ,
                    cast(`lastSplitFactor` as STRING) as `lastSplitFactor` ,
                    cast(`lastSplitDate` as FLOAT64) as `lastSplitDate` ,
                    cast(`targetHighPrice` as FLOAT64) as `targetHighPrice` ,
                    cast(`targetLowPrice` as FLOAT64) as `targetLowPrice` ,
                    cast(`targetMeanPrice` as FLOAT64) as `targetMeanPrice` ,
                    cast(`targetMedianPrice` as FLOAT64) as `targetMedianPrice` ,
                    cast(`numberOfAnalystOpinions` as FLOAT64) as `numberOfAnalystOpinions` ,
                    cast(`freeCashflow` as FLOAT64) as `freeCashflow` ,
                    cast(`operatingCashflow` as FLOAT64) as `operatingCashflow` ,
                    cast(`fiveYearAvgDividendYield` as FLOAT64) as `fiveYearAvgDividendYield` ,
                    cast(`earningsQuarterlyGrowth` as FLOAT64) as `earningsQuarterlyGrowth` ,
                    cast(`pegRatio` as FLOAT64) as `pegRatio` ,
                    cast(`earningsGrowth` as FLOAT64) as `earningsGrowth` ,
                    cast(`dividendRate` as FLOAT64) as `dividendRate` ,
                    cast(`dividendYield` as FLOAT64) as `dividendYield` ,
                    cast(`payoutRatio` as FLOAT64) as `payoutRatio` ,
                    cast(`trailingAnnualDividendRate` as FLOAT64) as `trailingAnnualDividendRate` ,
                    cast(`trailingAnnualDividendYield` as FLOAT64) as `trailingAnnualDividendYield` ,
                    cast(`trailingPE` as FLOAT64) as `trailingPE` ,
                    cast(`grossProfits` as STRING) as `grossProfits` ,
                    cast(`ETL_Date` as DATE) as `ETL_Date` ,
                    cast(null as STRING) as `industrySymbol` 

            from `first-project-262802`.`stock_analysis`.`stg_all_nasdaq_stock_info`

            
        )

        union all
        

        (
            select
                cast('''`first-project-262802`.`stock_analysis`.`stg_all_others_stock_info`''' as string) as _dbt_source_relation,

                
                    cast(`index` as INT64) as `index` ,
                    cast(`address1` as STRING) as `address1` ,
                    cast(`address2` as STRING) as `address2` ,
                    cast(`city` as STRING) as `city` ,
                    cast(`zip` as STRING) as `zip` ,
                    cast(`country` as STRING) as `country` ,
                    cast(`phone` as STRING) as `phone` ,
                    cast(`fax` as STRING) as `fax` ,
                    cast(`website` as STRING) as `website` ,
                    cast(`industry` as STRING) as `industry` ,
                    cast(`industryKey` as STRING) as `industryKey` ,
                    cast(`industryDisp` as STRING) as `industryDisp` ,
                    cast(`sector` as STRING) as `sector` ,
                    cast(`sectorKey` as STRING) as `sectorKey` ,
                    cast(`sectorDisp` as STRING) as `sectorDisp` ,
                    cast(`longBusinessSummary` as STRING) as `longBusinessSummary` ,
                    cast(`fullTimeEmployees` as FLOAT64) as `fullTimeEmployees` ,
                    cast(`companyOfficers` as STRING) as `companyOfficers` ,
                    cast(`compensationAsOfEpochDate` as FLOAT64) as `compensationAsOfEpochDate` ,
                    cast(`irWebsite` as STRING) as `irWebsite` ,
                    cast(`maxAge` as INT64) as `maxAge` ,
                    cast(`priceHint` as INT64) as `priceHint` ,
                    cast(`previousClose` as FLOAT64) as `previousClose` ,
                    cast(`open_price_from_stock_info` as FLOAT64) as `open_price_from_stock_info` ,
                    cast(`dayLow` as FLOAT64) as `dayLow` ,
                    cast(`dayHigh` as FLOAT64) as `dayHigh` ,
                    cast(`regularMarketPreviousClose` as FLOAT64) as `regularMarketPreviousClose` ,
                    cast(`regularMarketOpen` as FLOAT64) as `regularMarketOpen` ,
                    cast(`regularMarketDayLow` as FLOAT64) as `regularMarketDayLow` ,
                    cast(`regularMarketDayHigh` as FLOAT64) as `regularMarketDayHigh` ,
                    cast(`exDividendDate` as FLOAT64) as `exDividendDate` ,
                    cast(`beta` as FLOAT64) as `beta` ,
                    cast(`forwardPE` as FLOAT64) as `forwardPE` ,
                    cast(`volume_from_stock_info` as FLOAT64) as `volume_from_stock_info` ,
                    cast(`regularMarketVolume` as FLOAT64) as `regularMarketVolume` ,
                    cast(`averageVolume` as FLOAT64) as `averageVolume` ,
                    cast(`averageVolume10days` as FLOAT64) as `averageVolume10days` ,
                    cast(`averageDailyVolume10Day` as FLOAT64) as `averageDailyVolume10Day` ,
                    cast(`marketCap` as FLOAT64) as `marketCap` ,
                    cast(`fiftyTwoWeekLow` as FLOAT64) as `fiftyTwoWeekLow` ,
                    cast(`fiftyTwoWeekHigh` as FLOAT64) as `fiftyTwoWeekHigh` ,
                    cast(`priceToSalesTrailing12Months` as FLOAT64) as `priceToSalesTrailing12Months` ,
                    cast(`fiftyDayAverage` as FLOAT64) as `fiftyDayAverage` ,
                    cast(`twoHundredDayAverage` as FLOAT64) as `twoHundredDayAverage` ,
                    cast(`currency` as STRING) as `currency` ,
                    cast(`enterpriseValue` as FLOAT64) as `enterpriseValue` ,
                    cast(`profitMargins` as FLOAT64) as `profitMargins` ,
                    cast(`floatShares` as FLOAT64) as `floatShares` ,
                    cast(`sharesOutstanding` as FLOAT64) as `sharesOutstanding` ,
                    cast(`sharesShort` as FLOAT64) as `sharesShort` ,
                    cast(`sharesShortPriorMonth` as FLOAT64) as `sharesShortPriorMonth` ,
                    cast(`sharesShortPreviousMonthDate` as FLOAT64) as `sharesShortPreviousMonthDate` ,
                    cast(`dateShortInterest` as FLOAT64) as `dateShortInterest` ,
                    cast(`heldPercentInsiders` as FLOAT64) as `heldPercentInsiders` ,
                    cast(`heldPercentInstitutions` as FLOAT64) as `heldPercentInstitutions` ,
                    cast(`shortRatio` as FLOAT64) as `shortRatio` ,
                    cast(`shortPercentOfFloat` as FLOAT64) as `shortPercentOfFloat` ,
                    cast(`impliedSharesOutstanding` as FLOAT64) as `impliedSharesOutstanding` ,
                    cast(`bookValue` as FLOAT64) as `bookValue` ,
                    cast(`priceToBook` as FLOAT64) as `priceToBook` ,
                    cast(`lastFiscalYearEnd` as FLOAT64) as `lastFiscalYearEnd` ,
                    cast(`nextFiscalYearEnd` as FLOAT64) as `nextFiscalYearEnd` ,
                    cast(`mostRecentQuarter` as FLOAT64) as `mostRecentQuarter` ,
                    cast(`netIncomeToCommon` as FLOAT64) as `netIncomeToCommon` ,
                    cast(`trailingEps` as FLOAT64) as `trailingEps` ,
                    cast(`forwardEps` as FLOAT64) as `forwardEps` ,
                    cast(`enterpriseToRevenue` as FLOAT64) as `enterpriseToRevenue` ,
                    cast(`enterpriseToEbitda` as FLOAT64) as `enterpriseToEbitda` ,
                    cast(`lastDividendValue` as FLOAT64) as `lastDividendValue` ,
                    cast(`lastDividendDate` as FLOAT64) as `lastDividendDate` ,
                    cast(`exchange` as STRING) as `exchange` ,
                    cast(`quoteType` as STRING) as `quoteType` ,
                    cast(`symbol` as STRING) as `symbol` ,
                    cast(`underlyingSymbol` as STRING) as `underlyingSymbol` ,
                    cast(`shortName` as STRING) as `shortName` ,
                    cast(`longName` as STRING) as `longName` ,
                    cast(`firstTradeDateEpochUtc` as FLOAT64) as `firstTradeDateEpochUtc` ,
                    cast(`timeZoneFullName` as STRING) as `timeZoneFullName` ,
                    cast(`timeZoneShortName` as STRING) as `timeZoneShortName` ,
                    cast(`uuid` as STRING) as `uuid` ,
                    cast(`messageBoardId` as STRING) as `messageBoardId` ,
                    cast(`gmtOffSetMilliseconds` as INT64) as `gmtOffSetMilliseconds` ,
                    cast(`currentPrice` as FLOAT64) as `currentPrice` ,
                    cast(`recommendationMean` as FLOAT64) as `recommendationMean` ,
                    cast(`recommendationKey` as STRING) as `recommendationKey` ,
                    cast(`totalCash` as FLOAT64) as `totalCash` ,
                    cast(`totalCashPerShare` as FLOAT64) as `totalCashPerShare` ,
                    cast(`ebitda` as FLOAT64) as `ebitda` ,
                    cast(`totalDebt` as FLOAT64) as `totalDebt` ,
                    cast(`quickRatio` as FLOAT64) as `quickRatio` ,
                    cast(`currentRatio` as FLOAT64) as `currentRatio` ,
                    cast(`totalRevenue` as FLOAT64) as `totalRevenue` ,
                    cast(`debtToEquity` as FLOAT64) as `debtToEquity` ,
                    cast(`revenuePerShare` as FLOAT64) as `revenuePerShare` ,
                    cast(`returnOnAssets` as FLOAT64) as `returnOnAssets` ,
                    cast(`returnOnEquity` as FLOAT64) as `returnOnEquity` ,
                    cast(`revenueGrowth` as FLOAT64) as `revenueGrowth` ,
                    cast(`grossMargins` as FLOAT64) as `grossMargins` ,
                    cast(`ebitdaMargins` as FLOAT64) as `ebitdaMargins` ,
                    cast(`operatingMargins` as FLOAT64) as `operatingMargins` ,
                    cast(`financialCurrency` as STRING) as `financialCurrency` ,
                    cast(`trailingPegRatio` as FLOAT64) as `trailingPegRatio` ,
                    cast(`state` as STRING) as `state` ,
                    cast(`auditRisk` as FLOAT64) as `auditRisk` ,
                    cast(`boardRisk` as FLOAT64) as `boardRisk` ,
                    cast(`compensationRisk` as FLOAT64) as `compensationRisk` ,
                    cast(`shareHolderRightsRisk` as FLOAT64) as `shareHolderRightsRisk` ,
                    cast(`overallRisk` as FLOAT64) as `overallRisk` ,
                    cast(`governanceEpochDate` as FLOAT64) as `governanceEpochDate` ,
                    cast(`bid` as FLOAT64) as `bid` ,
                    cast(`ask` as FLOAT64) as `ask` ,
                    cast(`bidSize` as FLOAT64) as `bidSize` ,
                    cast(`askSize` as FLOAT64) as `askSize` ,
                    cast(`sharesPercentSharesOut` as FLOAT64) as `sharesPercentSharesOut` ,
                    cast(`lastSplitFactor` as STRING) as `lastSplitFactor` ,
                    cast(`lastSplitDate` as FLOAT64) as `lastSplitDate` ,
                    cast(`targetHighPrice` as FLOAT64) as `targetHighPrice` ,
                    cast(`targetLowPrice` as FLOAT64) as `targetLowPrice` ,
                    cast(`targetMeanPrice` as FLOAT64) as `targetMeanPrice` ,
                    cast(`targetMedianPrice` as FLOAT64) as `targetMedianPrice` ,
                    cast(`numberOfAnalystOpinions` as FLOAT64) as `numberOfAnalystOpinions` ,
                    cast(`freeCashflow` as FLOAT64) as `freeCashflow` ,
                    cast(`operatingCashflow` as FLOAT64) as `operatingCashflow` ,
                    cast(`fiveYearAvgDividendYield` as FLOAT64) as `fiveYearAvgDividendYield` ,
                    cast(`earningsQuarterlyGrowth` as FLOAT64) as `earningsQuarterlyGrowth` ,
                    cast(`pegRatio` as FLOAT64) as `pegRatio` ,
                    cast(`earningsGrowth` as FLOAT64) as `earningsGrowth` ,
                    cast(`dividendRate` as FLOAT64) as `dividendRate` ,
                    cast(`dividendYield` as FLOAT64) as `dividendYield` ,
                    cast(`payoutRatio` as FLOAT64) as `payoutRatio` ,
                    cast(`trailingAnnualDividendRate` as FLOAT64) as `trailingAnnualDividendRate` ,
                    cast(`trailingAnnualDividendYield` as FLOAT64) as `trailingAnnualDividendYield` ,
                    cast(`trailingPE` as FLOAT64) as `trailingPE` ,
                    cast(`grossProfits` as STRING) as `grossProfits` ,
                    cast(`ETL_Date` as DATE) as `ETL_Date` ,
                    cast(`industrySymbol` as STRING) as `industrySymbol` 

            from `first-project-262802`.`stock_analysis`.`stg_all_others_stock_info`

            
        )

        