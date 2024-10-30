
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_KATEGORIE:
  - KATID
  HK_KATEGORIE_OBERKATEGORIE:
  - OBERKATID
  LK_KATEGORIE_KATEGORIE_OBERKATEGORIE:
  - KATID
  - OBERKATID
  DIFF_KATEGORIE_KATEGORIE_P1_SAT:
    is_hashdiff: true
    columns:
    - NAME
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.kategorie'
source_model:
  willibald_shop_p1: kategorie

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
