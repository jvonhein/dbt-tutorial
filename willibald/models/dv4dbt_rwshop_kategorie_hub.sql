{{
  config(
    materialized = 'incremental',
    unique_key = 'hk_kategorie',
    )
}}


{%- set yaml_metadata -%}
hashkey: 'hk_kategorie'
business_keys:
    - katid
source_models: 
    - name: dv4dbt_swshop_kategorie_p1
    - name: dv4dbt_swshop_kategorie_p1
      hk_column: 'hk_oberkategorie'
      bk_columns: 
        - oberkatid
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models')
                    ) }}