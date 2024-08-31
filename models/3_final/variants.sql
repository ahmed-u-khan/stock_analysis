with

variant as ( select * from {{ ref('stg_variant') }} )

-- , parent as ( select * from {{ ref('stg_parent') }} )

-- , pads as ( select * from {{ ref('stg_pads_upsell') }} )

select
    distinct
    variant.*
    -- , parent.*
from variant
-- left join parent using (pid)
-- left join variant using (pid)