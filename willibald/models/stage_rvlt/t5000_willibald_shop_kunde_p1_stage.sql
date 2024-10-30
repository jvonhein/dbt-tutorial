
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_KUNDE:
  - KUNDEID
  HK_VEREINSPARTNER:
  - VEREINSPARTNERID
  LK_KUNDE_VEREINSPARTNER:
  - KUNDEID
  - VEREINSPARTNERID
  DIFF_KUNDE_KUNDE_P1_SAT:
    is_hashdiff: true
    columns:
    - EMAIL
    - GEBURTSDATUM
    - GESCHLECHT
    - GUELTIGBIS
    - KKFIRMA
    - KREDITKARTE
    - MOBIL
    - NAME
    - TELEFON
    - VORNAME
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.kunde'
source_model:
  willibald_shop_p1: kunde

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
