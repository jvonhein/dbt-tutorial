{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_model: t5004_willibald_shop_p1_lieferdienst_p1_stage
parent_hashkey: HK_LIEFERDIENST
src_hashdiff: DIFF_LIEFERDIENST_LIEFERDIENST_P1_SAT
src_payload:
- EMAIL
- FAX
- HAUSNUMMER
- LAND
- NAME
- ORT
- PLZ
- STRASSE
- TELEFON

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey')
                    , src_hashdiff=metadata_dict.get('src_hashdiff')
                    , src_payload=metadata_dict.get('src_payload')
                    , source_model=metadata_dict.get('source_model') ) }}
