with

pads as ( select * from {{ ref('stg_pads_upsell') }} )

-- , parent as ( select * from {{ ref('stg_parent') }} )

-- , variant as ( select * from {{ ref('stg_variant') }} )

select
    distinct
    pads.*
    -- , 
from pads
-- left join parent using (pid)
-- left join variant using (pid)