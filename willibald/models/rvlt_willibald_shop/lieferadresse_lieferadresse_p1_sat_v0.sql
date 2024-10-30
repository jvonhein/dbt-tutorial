{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_model: t5003_willibald_shop_lieferadresse_p1_stage
parent_hashkey: HK_LIEFERADRESSE
src_hashdiff: DIFF_LIEFERADRESSE_LIEFERADRESSE_P1_SAT
src_payload:
- ADRESSZUSATZ
- HAUSNUMMER
- ORT
- PLZ
- STRASSE
- LAND

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey')
                    , src_hashdiff=metadata_dict.get('src_hashdiff')
                    , src_payload=metadata_dict.get('src_payload')
                    , source_model=metadata_dict.get('source_model') ) }}
