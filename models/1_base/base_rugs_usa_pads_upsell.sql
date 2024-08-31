select 
    size
    , shape
    , price
    , width
    , sqft
    , type
    , stock
    , height
    , variant
    , p_id
    , pad_id
    , dw_insert_timestamp
from {{ source('ruggable', 'raw_rugs_usa_pads_upsell') }}