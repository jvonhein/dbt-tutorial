with s_bestellung as (
    select * from {{ source ('willibald_shop_p1', 'bestellung')}} 
)
select
    'willibald_shop_bestellung' as MD_RECORD_SOURCE
    , CURRENT_TIMESTAMP as MD_INSERTED_AT
    , 0 as MD_RUN_ID
    , LIB.DV_HASH(a.BESTELLUNGID::text) as HK_BESTELLUNG
    , LIB.DV_HASH(a.KUNDEID::text) as HK_KUNDE
    , LIB.DV_HASH(a.AllgLieferAdrID::text) as HK_LIEFERADRESSE
    , LIB.DV_HASH(a.BESTELLUNGID::text, a.KUNDEID::text) as LK_BESTELLUNG_KUNDE
    , LIB.DV_HASH(a.BESTELLUNGID::text, a.AllgLieferAdrID::text) as LK_BESTELLUNG_LIEFERADRESSE
    , LIB.DV_HASH(a.BESTELLDATUM::text, a.RABATT::text, a.WUNSCHDATUM::text) as DIFF_BESTELLUNG_P1_SAT
    , a.BestellungId
    , a.KundeId
    , a.AllgLieferAdrID as LieferAdrID
    , a.Bestelldatum
    , a.Wunschdatum
    , a.Rabatt
from s_bestellung a