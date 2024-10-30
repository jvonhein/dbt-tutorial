
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_LIEFERDIENST:
  - LIEFERDIENSTID
  DIFF_LIEFERDIENST_LIEFERDIENST_P1_SAT:
    is_hashdiff: true
    columns:
    - EMAIL
    - FAX
    - HAUSNUMMER
    - LAND
    - NAME
    - ORT
    - PLZ
    - STRASSE
    - TELEFON
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.lieferdienst'
source_model:
  willibald_shop_p1: lieferdienst

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
