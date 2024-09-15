select 
  date
  , close_last
  , adj_close
  , volume
  , open
  , high
  , low
from {{ source('stock', 'spy_1993_2024') }}
