select
    distinct 
    pid
    , color_id
    , color_value
    , dw_insert_timestamp
from {{ ref('base_rugs_usa_color_map') }}