{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_models:
- name: t5000_willibald_shop_bestellung_p1_stage
  rsrc_static: willibald_shop_p1.bestellung_/
tracked_hashkey: LK_BESTELLUNG_LIEFERADRESSE

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.rec_track_sat(tracked_hashkey=metadata_dict.get('tracked_hashkey')
                    , source_models=metadata_dict.get('source_models') ) }}
