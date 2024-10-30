{{
  config(
    materialized = 'incremental',
    )
}}

{%- set yaml_metadata -%}
hashkey: 'HK_BESTELLUNG'
business_keys:
    - BestellungId
source_models: dv4dbt_srvlt_willibald_shop_bestellung_p1
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.hub(hashkey=metadata_dict.get('hashkey')
                    , business_keys=metadata_dict.get('business_keys')
                    , source_models=metadata_dict.get('source_models')
                    ) }}