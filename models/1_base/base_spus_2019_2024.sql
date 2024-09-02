select 
  date
  , close_last
  , volume
  , open
  , high
  , low
from {{ source('stock', 'spus_2019_2024') }}
