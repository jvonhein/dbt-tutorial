{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_models:
- name: st5006_willibald_shop_produkt_p1
  rsrc_static: willibald_shop_p1.produkt_/
tracked_hashkey: LK_PRODUKT_KATEGORIE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.rec_track_sat(tracked_hashkey=metadata_dict.get('tracked_hashkey')
                    , source_models=metadata_dict.get('source_models') ) }}
