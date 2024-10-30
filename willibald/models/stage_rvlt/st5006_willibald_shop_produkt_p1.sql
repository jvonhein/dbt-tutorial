
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_PRODUKT:
  - PRODUKTID
  HK_KATEGORIE:
  - KATID
  LK_PRODUKT_KATEGORIE:
  - PRODUKTID
  - KATID
  DIFF_PRODUKT_PRODUKT_P1_SAT:
    is_hashdiff: true
    columns:
    - BEZEICHNUNG
    - PFLANZABSTAND
    - PFLANZORT
    - TYP
    - UMFANG
  DIFF_PRODUKT_PRODUKT_P1S_SAT:
    is_hashdiff: true
    columns:
    - PREIS
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.produkt'
source_model:
  willibald_shop_p1: produkt

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
