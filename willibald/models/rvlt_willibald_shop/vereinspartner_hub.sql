{{ config(materialized = 'incremental', unique_key = 'HK_VEREINSPARTNER') }}



{%- set yaml_metadata -%}
source_models:
- name: t5000_willibald_shop_kunde_p1_stage
  hk_column: HK_VEREINSPARTNER
- name: t5007_willibald_shop_vereinspartner_p1_stage
  hk_column: HK_VEREINSPARTNER
hashkey: HK_VEREINSPARTNER
business_keys:
- VEREINSPARTNERID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
