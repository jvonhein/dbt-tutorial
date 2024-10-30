{{ config(materialized = 'incremental', unique_key = 'LK_POSITION_BESTELLUNG') }}



{%- set yaml_metadata -%}
source_models:
- name: t5005_willibald_shop_position_p1_stage
link_hashkey: LK_POSITION_BESTELLUNG
foreign_hashkeys:
- HK_POSITION
- HK_BESTELLUNG

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    , foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    , source_models=metadata_dict.get('source_models') ) }}
