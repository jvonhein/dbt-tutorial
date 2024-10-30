{{ config(materialized = 'incremental', unique_key = 'HK_PRODUKT') }}



{%- set yaml_metadata -%}
source_models:
- name: st5006_willibald_shop_produkt_p1
  hk_column: HK_PRODUKT
- name: t5005_willibald_shop_position_p1_stage
  hk_column: HK_PRODUKT
hashkey: HK_PRODUKT
business_keys:
- PRODUKTID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
