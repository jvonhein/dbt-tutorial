
{{ config(materialized='view', schema='stage_rvlt') }}



{%- set yaml_metadata -%}
hashed_columns:
  HK_POSITION:
  - BESTELLUNGID
  - POSID
  HK_BESTELLUNG:
  - BESTELLUNGID
  HK_PRODUKT:
  - PRODUKTID
  HK_LIEFERADRESSE:
  - SPEZLIEFERADRID
  LK_POSITION_BESTELLUNG:
  - BESTELLUNGID
  - POSID
  - BESTELLUNGID
  LK_POSITION_PRODUKT_LIEFERADRESSE:
  - BESTELLUNGID
  - POSID
  - PRODUKTID
  - SPEZLIEFERADRID
  DIFF_POSITION_POSITION_P1_SAT:
    is_hashdiff: true
    columns:
    - MENGE
    - PREIS
ldts: '''2022-03-11''::timestamp'
rsrc: '!willibald_shop_p1.position'
source_model:
  willibald_shop_p1: position

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') )}}
