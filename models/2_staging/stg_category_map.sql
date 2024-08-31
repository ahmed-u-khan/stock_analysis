select
    distinct 
    pid
    , category_id
    , category_value
    , dw_insert_timestamp
from {{ ref('base_rugs_usa_category_map') }}