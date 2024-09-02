select 
  date
  , close_last
  , volume
  , open
  , high
  , low
from {{ source('stock', 'spy_1993_2024') }}
