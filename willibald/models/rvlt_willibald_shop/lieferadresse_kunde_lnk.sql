{{ config(materialized = 'incremental', unique_key = 'LK_LIEFERADRESSE_KUNDE') }}



{%- set yaml_metadata -%}
source_models:
- name: t5003_willibald_shop_lieferadresse_p1_stage
link_hashkey: LK_LIEFERADRESSE_KUNDE
foreign_hashkeys:
- HK_LIEFERADRESSE
- HK_KUNDE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    , foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    , source_models=metadata_dict.get('source_models') ) }}
