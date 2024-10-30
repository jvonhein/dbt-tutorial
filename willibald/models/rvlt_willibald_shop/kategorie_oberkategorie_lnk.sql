{{ config(materialized = 'incremental', unique_key = 'LK_KATEGORIE_KATEGORIE_OBERKATEGORIE') }}



{%- set yaml_metadata -%}
source_models:
- name: t5001_willibald_shop_kategorie_p1_stage
link_hashkey: LK_KATEGORIE_KATEGORIE_OBERKATEGORIE
foreign_hashkeys:
- HK_KATEGORIE
- HK_KATEGORIE_OBERKATEGORIE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    , foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    , source_models=metadata_dict.get('source_models') ) }}
