{{
  config(
    materialized = 'incremental',
    unique_key = 'LK_BESTELLUNG_KUNDE',
    )
}}

{%- set yaml_metadata -%}
link_hashkey: 'LK_BESTELLUNG_KUNDE'
foreign_hashkeys:
    - 'HK_BESTELLUNG'
    - 'HK_KUNDE'
source_models: dv4dbt_srvlt_willibald_shop_bestellung_p1
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    ,foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    ,source_models=metadata_dict.get('source_models'))}}
