{{
  config(
    materialized = 'incremental',
    )
}}

{% set yaml_metadata %}
source_model: 'dv4dbt_swshop_wohnort_p1'  
parent_hashkey: 'HK_KUNDE'
src_hashdiff: 'DIFF_KUNDE_WOHNORT_P1_MSAT'
src_ma_key:
    - von
    - bis 
    - hausnummer
    - ort
    - plz 
    - strasse 
    - adresszusatz 
    - land
{% endset %}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.ma_sat_v0(source_model=metadata_dict.get('source_model')
                        , parent_hashkey=metadata_dict.get('parent_hashkey')
                        , src_hashdiff=metadata_dict.get('src_hashdiff')
                        , src_ma_key=metadata_dict.get('src_ma_key'))}}