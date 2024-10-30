{{ config(materialized = 'view') }}



{%- set yaml_metadata -%}
sat_v0: vereinspartner_vereinspartner_p1_sat_v0
hashkey: HK_VEREINSPARTNER
hashdiff: DIFF_VEREINSPARTNER_VEREINSPARTNER_P1_SAT
add_is_current_flag: true
include_payload: true

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v1(sat_v0=metadata_dict.get('sat_v0')
                    , hashkey=metadata_dict.get('hashkey')
                    , hashdiff=metadata_dict.get('hashdiff')
                    , include_payload=metadata_dict.get('include_payload')
                    , add_is_current_flag=metadata_dict.get('add_is_current_flag') ) }}
