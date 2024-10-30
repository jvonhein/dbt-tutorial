{{ config(materialized = 'incremental', unique_key = 'LK_BESTELLUNG_LIEFERADRESSE') }}



{%- set yaml_metadata -%}
source_models:
- name: t5000_willibald_shop_bestellung_p1_stage
link_hashkey: LK_BESTELLUNG_LIEFERADRESSE
foreign_hashkeys:
- HK_BESTELLUNG
- HK_LIEFERADRESSE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.link(link_hashkey=metadata_dict.get('link_hashkey')
                    , foreign_hashkeys=metadata_dict.get('foreign_hashkeys')
                    , source_models=metadata_dict.get('source_models') ) }}
