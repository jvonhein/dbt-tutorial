{{
  config(
    materialized = 'view',
    )
}}

{% set yaml_metadata %}
source_model: 
    'willibald_shop_p1': 'kategorie'
ldts: ''
rsrc: '!willibald_shop_p1_kategorie'
hashed_columns:
    hk_kategorie:
        - katid
    hk_oberkategorie:
        - oberkatid
    lk_kategorie_oberkategorie:
        - katid
        - oberkatid
    diff_kategorie_p1_sat:
        is_hashdiff: true
        columns:
            - name
{% endset %}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ datavault4dbt.stage(source_model=metadata_dict.get('source_model')
                        , ldts=metadata_dict.get('ldts')
                        , rsrc=metadata_dict.get('rsrc')
                        , hashed_columns=metadata_dict.get('hashed_columns') 
) }}