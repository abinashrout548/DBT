{{ config(materialized='incremental', incremental_strategy='append')}}

with flattend_outputs as (
select 
tx.hash_key,
tx.block_number,
tx.bluck_timestamp,
tx.is_coinbase,
f.value:address::string as output_address,
f.value:value::FLOAT as output_value

from {{ ref('stg_btc') }} tx,

LATERAL FLATTEN(input => OUTPUTS) f

where f.value:address is not null

{% if is_incremental() %}

and tx.bluck_timestamp >= (select max(bluck_timestamp) from {{ this }} )

{% endif %}

)
select 
hash_key,
block_number,
bluck_timestamp,
is_coinbase,
output_address,
output_value
from flattend_outputs
