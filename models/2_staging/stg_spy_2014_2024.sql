select 
    *
from {{ ref('base_spy_2014_2024') }}
left join {{ ref('stg_calendar') }} using (date)