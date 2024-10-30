{{
  config(
    materialized = 'view',
    )
}}

{%- set yaml_metadata -%}
source_model: 
    'willibald_shop_p1': 'wohnort'
ldts: 'NOW()'
rsrc: '!willibald_shop_p1_wohnort'
hashed_columns:
    HK_KUNDE:
        - KundeId
    diff_kunde_wohnort_p1_msat:
        is_hashdiff: true
        columns:
            - von
            - bis 
            - hausnummer
            - ort
            - plz 
            - strasse 
            - adresszusatz 
            - land
multi_active_config: 
    main_hashkey_column: 'HK_KUNDE'
    multi_active_key:
        - von
        - bis 
        - hausnummer
        - ort
        - plz 
        - strasse 
        - adresszusatz 
        - land
{%- endset -%}

{%- set metadata_dict = fromyaml(yaml_metadata) -%}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns')
                        , multi_active_config=metadata_dict.get('multi_active_config')
                        ) }}