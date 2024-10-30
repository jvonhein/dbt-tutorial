{{ config(materialized = 'incremental', unique_key = 'HK_KATEGORIE') }}



{%- set yaml_metadata -%}
source_models:
- name: t5001_willibald_shop_kategorie_p1_stage
  hk_column: HK_KATEGORIE_OBERKATEGORIE
  bk_columns:
  - OBERKATID
- name: st5006_willibald_shop_produkt_p1
  hk_column: HK_KATEGORIE
hashkey: HK_KATEGORIE
business_keys:
- KATID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
