{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_model: t5007_willibald_shop_vereinspartner_p1_stage
parent_hashkey: HK_VEREINSPARTNER
src_hashdiff: DIFF_VEREINSPARTNER_VEREINSPARTNER_P1_SAT
src_payload:
- RABATT1
- RABATT2
- RABATT3

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey')
                    , src_hashdiff=metadata_dict.get('src_hashdiff')
                    , src_payload=metadata_dict.get('src_payload')
                    , source_model=metadata_dict.get('source_model') ) }}
