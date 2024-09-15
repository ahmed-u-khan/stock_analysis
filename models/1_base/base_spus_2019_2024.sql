select 
  date
  , close_last
  , adj_close
  , volume
  , open
  , high
  , low
from {{ source('stock', 'spus_2019_2024') }}
