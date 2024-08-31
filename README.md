# Analytics Engineering Test for Ruggable

## Analytics Engineering related info

### Code

Please see the models section of this repo

### Lineage

![lineage created using dbt docs](https://i.postimg.cc/xjHjpcBZ/dbt-lineage.png)

[Link to Lineage](https://i.postimg.cc/xjHjpcBZ/dbt-lineage.png)

## Insights

### BI Insights

Link to tableau workbook: https://public.tableau.com/app/profile/ahmed.khan1711/viz/Ruggable_17195307205280/ThicknessAvg_PriceMSRPandProfit

### Data Quality

- multiple PIDs in parent table (due to unique url column)

- is the colour accurate in the parent ? 
	- quite a few urls with differing color category ?

- normalized columns names

- added pid column to all tables

- not all variants have a pad_id - about 5.5k variants do not have a pad_id

- about 50k (out of 96703 i.e. 52%) pads' pid is not present in the parent table

- about 25k (out of 38569 i.e. 65%) variants' pid is not present in the parent table

- stock level in the variants table seems to be wierd/wrong/iffy ?

