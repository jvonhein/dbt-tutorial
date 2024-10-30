{{ config(materialized = 'incremental', unique_key = 'LK_VEREINSPARTNER_KUNDE') }}



{%- set yaml_metadata -%}
source_models:
- name: t5007_willibald_shop_vereinspartner_p1_stage
link_hashkey: LK_VEREINSPARTNER_KUNDE
foreign_hashkeys:
- HK_VEREINSPARTNER
- HK_KUNDE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    , foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    , source_models=metadata_dict.get('source_models') ) }}
