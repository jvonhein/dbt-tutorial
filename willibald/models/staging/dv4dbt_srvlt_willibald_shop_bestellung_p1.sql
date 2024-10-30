{{ config(materialized='view')}}

{%- set yaml_metadata -%}
source_model: 
    'willibald_shop_p1': 'bestellung'
ldts: 'NOW()'
rsrc: '!willibald_shop_p1_bestellung'
hashed_columns:
    HK_BESTELLUNG:
        - BestellungId
    HK_KUNDE:
        - KundeId
    HK_LIEFERADRESSE:
        - AllgLieferAdrID
    LK_BESTELLUNG_KUNDE:
        - BestellungId
        - KundeId
    LK_BESTELLUNG_LIEFERADRESSE:
        - BestellungId
        - AllgLieferAdrID
    DIFF_BESTELLUNG_P1_SAT:
        is_hashdiff: true
        columns:
            - Bestelldatum
            - Wunschdatum
            - Rabatt
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) -%}

{%- set source_model = metadata_dict.get('source_model') -%}
{%- set ldts = metadata_dict.get('ldts') -%}
{%- set rsrc = metadata_dict.get('rsrc') -%}
{%- set hashed_columns = metadata_dict.get('hashed_columns') -%}

{{ datavault4dbt.stage(source_model=source_model
                    , ldts=ldts
                    , rsrc=rsrc
                    , hashed_columns=hashed_columns) }}