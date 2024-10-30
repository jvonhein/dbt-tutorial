{{
  config(
    materialized = 'view',
    )
}}

{%- set yaml_metadata -%}
sat_v0: 'dv4dbt_rwshop_bestellung_p1_sat_v0'
hashkey: 'HK_BESTELLUNG'
hashdiff: 'DIFF_BESTELLUNG_P1_SAT'
add_is_current_flag: true
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.sat_v1(sat_v0=metadata_dict.get('sat_v0')
                        , hashkey=metadata_dict.get('hashkey')
                        , hashdiff=metadata_dict.get('hashdiff')
                        , add_is_current_flag=metadata_dict.get('add_is_current_flag')
                    ) }}