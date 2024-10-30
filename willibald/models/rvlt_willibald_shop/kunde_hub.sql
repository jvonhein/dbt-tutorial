{{ config(materialized = 'incremental', unique_key = 'HK_KUNDE') }}



{%- set yaml_metadata -%}
source_models:
- name: t5000_willibald_shop_bestellung_p1_stage
  hk_column: HK_KUNDE
- name: t5000_willibald_shop_kunde_p1_stage
  hk_column: HK_KUNDE
- name: t5003_willibald_shop_lieferadresse_p1_stage
  hk_column: HK_KUNDE
- name: t5007_willibald_shop_vereinspartner_p1_stage
  hk_column: HK_KUNDE
  bk_columns:
  - KUNDEIDVEREIN
- name: t5008_willibald_shop_wohnort_p1_stage
  hk_column: HK_KUNDE
hashkey: HK_KUNDE
business_keys:
- KUNDEID

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models') ) }}
