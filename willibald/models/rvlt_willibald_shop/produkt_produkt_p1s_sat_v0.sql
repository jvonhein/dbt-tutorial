{{ config(materialized = 'incremental') }}



{%- set yaml_metadata -%}
source_model: st5006_willibald_shop_produkt_p1
parent_hashkey: HK_PRODUKT
src_hashdiff: DIFF_PRODUKT_PRODUKT_P1S_SAT
src_payload:
- PREIS

{%- endset -%}



{%- set metadata_dict = fromyaml(yaml_metadata) -%}


{{ datavault4dbt.sat_v0(parent_hashkey=metadata_dict.get('parent_hashkey')
                    , src_hashdiff=metadata_dict.get('src_hashdiff')
                    , src_payload=metadata_dict.get('src_payload')
                    , source_model=metadata_dict.get('source_model') ) }}
