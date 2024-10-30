
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_BESTELLUNG:
  - BESTELLUNGID
  HK_KUNDE:
  - KUNDEID
  HK_LIEFERADRESSE:
  - ALLGLIEFERADRID
  LK_BESTELLUNG_KUNDE:
  - BESTELLUNGID
  - KUNDEID
  LK_BESTELLUNG_LIEFERADRESSE:
  - BESTELLUNGID
  - ALLGLIEFERADRID
  DIFF_BESTELLUNG_P1_SAT:
    is_hashdiff: true
    columns:
    - BESTELLDATUM
    - WUNSCHDATUM
    - RABATT
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.bestellung'
source_model:
  willibald_shop_p1: bestellung

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
