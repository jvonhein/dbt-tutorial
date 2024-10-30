{{ config(materialized='incremental') }}

{%- set yaml_metadata -%}
parent_hashkey: 'HK_BESTELLUNG'
src_hashdiff: 'DIFF_BESTELLUNG_P1_SAT'
src_payload:
    - Bestelldatum
    - Wunschdatum
    - Rabatt
source_model: 'dv4dbt_srvlt_willibald_shop_bestellung_p1'
{%- endset -%}    

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey'),
                        src_hashdiff=metadata_dict.get('src_hashdiff'),
                        source_model=metadata_dict.get('source_model'),
                        src_payload=metadata_dict.get('src_payload')) }}