select 
  date
  , close_last
  , volume
  , open
  , high
  , low
from {{ source('stock', 'spy_2014_2024') }}
