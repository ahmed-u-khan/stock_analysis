select 
    pid
    , color_id
    , color_value
    , dw_insert_timestamp
from {{ source('ruggable', 'raw_rugs_usa_color_map') }}