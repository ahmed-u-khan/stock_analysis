{{ dbt_utils.union_relations(

    relations=[ref('stg_all_nasdaq_stock_info'), ref('stg_all_others_stock_info')]

) }}