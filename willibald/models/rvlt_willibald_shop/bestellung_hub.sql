{{ config(materialized = 'incremental', unique_key = 'HK_BESTELLUNG') }}



{%- set yaml_metadata -%}
source_models:
- name: t5000_willibald_shop_bestellung_p1_stage
  hk_column: HK_BESTELLUNG
- name: t5005_willibald_shop_position_p1_stage
  hk_column: HK_BESTELLUNG
hashkey: HK_BESTELLUNG
business_keys:
- BESTELLUNGID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
