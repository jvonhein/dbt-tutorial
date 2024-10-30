{{ config(materialized = 'incremental', unique_key = 'HK_POSITION') }}



{%- set yaml_metadata -%}
source_models:
- name: t5005_willibald_shop_position_p1_stage
  hk_column: HK_POSITION
hashkey: HK_POSITION
business_keys:
- BESTELLUNGID
- POSID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
