select 
  date
  , close_last
  , volume
  , open
  , high
  , low
from {{ source('stock', 'nvda') }}
