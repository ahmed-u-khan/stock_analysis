with

parent as ( 
    select 
        distinct
        pid
        , product_type_id
        , name
        -- , url
        , origin
        , thickness
        , material
        , weave
        , weave_feature
        , color
        , brand
        , image_name
        , image_type
        , internal_name
        , category
        , min_price
        , max_price
        , availability
        , aggregate
        , clearance
        , long_description
        , shopbyroom
        , dw_insert_timestamp
        -- , inferred_colour_from_url
    from {{ ref('stg_parent') }} 
)

-- , pads as ( select * from {{ ref('stg_pads_upsell') }} )

-- , variant as ( select * from {{ ref('stg_variant') }} )

select
    parent.*
    -- , 
from parent
-- left join pads using (pid)
-- left join variant using (pid)