with

spy_2014_2024 as ( select * from {{ ref('stg_spy_2014_2024') }} )


select
    spy_2014_2024.*
from spy_2014_2024