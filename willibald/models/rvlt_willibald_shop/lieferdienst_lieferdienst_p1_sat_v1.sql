{{ config(materialized = 'view') }}



{%- set yaml_metadata -%}
sat_v0: lieferdienst_lieferdienst_p1_sat_v0
hashkey: HK_LIEFERDIENST
hashdiff: DIFF_LIEFERDIENST_LIEFERDIENST_P1_SAT
add_is_current_flag: true
include_payload: true

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v1(sat_v0=metadata_dict.get('sat_v0')
                    , hashkey=metadata_dict.get('hashkey')
                    , hashdiff=metadata_dict.get('hashdiff')
                    , include_payload=metadata_dict.get('include_payload')
                    , add_is_current_flag=metadata_dict.get('add_is_current_flag') ) }}
