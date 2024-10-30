{{ config(materialized = 'incremental', unique_key = 'LK_PRODUKT_KATEGORIE') }}



{%- set yaml_metadata -%}
source_models:
- name: st5006_willibald_shop_produkt_p1
link_hashkey: LK_PRODUKT_KATEGORIE
foreign_hashkeys:
- HK_PRODUKT
- HK_KATEGORIE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    , foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    , source_models=metadata_dict.get('source_models') ) }}
