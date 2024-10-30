{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_model: t5000_willibald_shop_kunde_p1_stage
parent_hashkey: HK_KUNDE
src_hashdiff: DIFF_KUNDE_KUNDE_P1_SAT
src_payload:
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

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey')
                    , src_hashdiff=metadata_dict.get('src_hashdiff')
                    , src_payload=metadata_dict.get('src_payload')
                    , source_model=metadata_dict.get('source_model') ) }}
