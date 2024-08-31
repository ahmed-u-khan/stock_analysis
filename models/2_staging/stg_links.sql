select
    base_url
    , page_links
    , card_links
    , rtrim(ARRAY_REVERSE(SPLIT(card_links,'/'))[SAFE_OFFSET(0)],'-P.html') as pid
    , request_time_stamp
    , dw_insert_timestamp
from {{ ref('base_rugs_usa_links') }}
