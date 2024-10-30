
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_VEREINSPARTNER:
  - VEREINSPARTNERID
  HK_KUNDE:
  - KUNDEIDVEREIN
  LK_VEREINSPARTNER_KUNDE:
  - VEREINSPARTNERID
  - KUNDEIDVEREIN
  DIFF_VEREINSPARTNER_VEREINSPARTNER_P1_SAT:
    is_hashdiff: true
    columns:
    - RABATT1
    - RABATT2
    - RABATT3
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.vereinspartner'
source_model:
  willibald_shop_p1: vereinspartner

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
