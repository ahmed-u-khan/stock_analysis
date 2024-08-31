select 
    pid
    , category_id
    , category_value
    , dw_insert_timestamp
from {{ source('ruggable', 'raw_rugs_usa_category_map') }}