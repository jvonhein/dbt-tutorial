
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_KUNDE:
  - KUNDEID
  DIFF_KUNDE_WOHNORT_P1_SAT:
    is_hashdiff: true
    columns:
    - VON
    - BIS
    - HAUSNUMMER
    - ORT
    - PLZ
    - STRASSE
    - ADRESSZUSATZ
    - LAND
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.wohnort'
source_model:
  willibald_shop_p1: wohnort

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
