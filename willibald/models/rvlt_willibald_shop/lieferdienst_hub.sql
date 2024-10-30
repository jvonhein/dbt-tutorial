{{ config(materialized = 'incremental', unique_key = 'HK_LIEFERDIENST') }}



{%- set yaml_metadata -%}
source_models:
- name: t5004_willibald_shop_p1_lieferdienst_p1_stage
  hk_column: HK_LIEFERDIENST
hashkey: HK_LIEFERDIENST
business_keys:
- LIEFERDIENSTID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
