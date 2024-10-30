
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_LIEFERADRESSE:
  - LIEFERADRID
  HK_KUNDE:
  - KUNDEID
  LK_LIEFERADRESSE_KUNDE:
  - LIEFERADRID
  - KUNDEID
  DIFF_LIEFERADRESSE_LIEFERADRESSE_P1_SAT:
    is_hashdiff: true
    columns:
    - ADRESSZUSATZ
    - HAUSNUMMER
    - ORT
    - PLZ
    - STRASSE
    - LAND
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.lieferadresse'
source_model:
  willibald_shop_p1: lieferadresse

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
