{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_model: t5001_willibald_shop_kategorie_p1_stage
parent_hashkey: HK_KATEGORIE
src_hashdiff: DIFF_KATEGORIE_KATEGORIE_P1_SAT
src_payload:
- NAME

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey')
                    , src_hashdiff=metadata_dict.get('src_hashdiff')
                    , src_payload=metadata_dict.get('src_payload')
                    , source_model=metadata_dict.get('source_model') ) }}
