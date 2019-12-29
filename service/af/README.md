
generated : 2019-12-29:15:08  // template : ./setup/template/readme.jinja2

### Config files for : "africa"

Experimental version!

System requirements:
* docker-compose: `1.18+`   https://github.com/docker/compose/releases  ( Compose file format >= 3.5)
* docker engine : `17.06.0+`
* developed & tested on Linux  ( ubuntu ) 
* git, make, bash


| fields           | description                                                                                  | 
|------------------| ---------------------------------------------------------------------------------------------| 
| iso              | based on osm data: [ISO3166-1](https://taginfo.openstreetmap.org/keys/ISO3166-1#values) ,  [ISO3166-2](https://taginfo.openstreetmap.org/keys/ISO3166-2) |
| start command    | How to run your area , after you can check your result in the browser - see 'external_port'  |
| name_en          | OSM Admin are  - key:name_en                                                                 |
| name             | OSM Admin are  - key:name                                                                    |
| geofabrik source | minimal geofabrik download area , this is ='SHORTNAME' used by [julien-noblet/download-geofabrik tool](https://github.com/julien-noblet/download-geofabrik)  |
| external port    | external port attached to this container                                                      | 
| comment          | sometimes the config is not perfect yet, see "known problems": antimeridian, area_pct |

service name conventions
* taginfo-`$continent`-`$iso`
  * continent - is a 2 letter abreviation 

Known problems:
* antimeridian : taginfo map is not correct, need more debug 
        * see more https://en.wikipedia.org/wiki/180th_meridian
* area_pct     : geofabrik continent polygon not contain 100% of iso area ,  borders sometimes change
    * be careful, the taginfo statistics is not correct!
* Overpass external link is 99% ok,  but sometimes not working
    * 'Antarctica' : [https://github.com/drolbr/Overpass-API/issues/421 

FAQ:
* I don't see my country area: 
  *  check your area keys: ( `admin_level`=1,2,3,4,5,6 and `boundary`=`administrative` )
     * [ISO3166-1](https://taginfo.openstreetmap.org/keys/ISO3166-1#values) 
     * [ISO3166-2](https://taginfo.openstreetmap.org/keys/ISO3166-2)
   * or the admin border relation was broken when this config generated , sorry  
* Smaller Geofabrik area exist for my country
   * sometimes the osm admin borders is changing, and very hard to keep in sync with geofabrik extracts
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( africa )

Customisation:
* taginfo customised for smaller extracts - showing data problems on the long tails
* you can modify the  GDNAME="..." value for smaller extracts (download-geofabrik-id)
* ....

License:
* Config files derived from OpenStreetMap data ( ODBL )
* Program code : GPL3

Credits:
* OpenStreetMap contributors and community
* [Geofabrik](https://www.geofabrik.de), for the free download service https://www.geofabrik.de/data/download.html
* https://github.com/taginfo/taginfo author and [contributors](https://github.com/taginfo/taginfo/graphs/contributors)
* https://github.com/julien-noblet/download-geofabrik
* https://github.com/osmcode/osmium-tool
* https://github.com/omniscale/imposm3  
* NaturalEarth data : http://www.naturalearthdata.com/ 
* and other Open Source projects ( linux, posgis, postgresql, osgeo, python, docker, etc )


Be careful!
* This is an experimental software, test on a new VPS 
* Check the size of 'geofabrik source' ,  sometimes it is huge > 1 Gb !  ( like  continents )
* This code expecting minimal docker and linux knowledge.
 
| iso           |start command           | name_en        | name        |  geofabrik source |  external port |  comment |      
|---------------|------------------------|----------------|-------------|-------------------|----------------|----------|
| ao` | make GDNAME=angola taginfo-af-ao`  |  Angola  | Angola |  "angola" | 127.0.0.1:11001|  | 
| bf` | make GDNAME=africa taginfo-af-bf`  |  Burkina Faso  | Burkina Faso |  "africa" | 127.0.0.1:11002|  | 
| bi` | make GDNAME=africa taginfo-af-bi`  |  Burundi  | Burundi |  "africa" | 127.0.0.1:11003|  | 
| bj` | make GDNAME=benin taginfo-af-bj`  |  Benin  | Bénin |  "benin" | 127.0.0.1:11004|  | 
| bv` | make GDNAME=africa taginfo-af-bv`  |  Bouvet Island  | Bouvetøya |  "africa" | 127.0.0.1:11005|  | 
| bw` | make GDNAME=africa taginfo-af-bw`  |  Botswana  | Botswana |  "africa" | 127.0.0.1:11006|  | 
| cd` | make GDNAME=africa taginfo-af-cd`  |  Democratic Republic of the Congo  | République démocratique du Congo |  "africa" | 127.0.0.1:11007|  | 
| cf` | make GDNAME=central-african-republic taginfo-af-cf`  |  Central African Republic  | Ködörösêse tî Bêafrîka - République Centrafricaine |  "central-african-republic" | 127.0.0.1:11008|  | 
| cg` | make GDNAME=africa taginfo-af-cg`  |  Congo-Brazzaville  | Congo |  "africa" | 127.0.0.1:11009|  | 
| ci` | make GDNAME=africa taginfo-af-ci`  |  Côte d'Ivoire  | Côte d’Ivoire |  "africa" | 127.0.0.1:11010|  | 
| cm` | make GDNAME=africa taginfo-af-cm`  |  Cameroon  | Cameroun |  "africa" | 127.0.0.1:11011|  | 
| cv` | make GDNAME=cape-verde taginfo-af-cv`  |  Cape Verde  | Cabo Verde |  "cape-verde" | 127.0.0.1:11012|  | 
| dj` | make GDNAME=djibouti taginfo-af-dj`  |  Djibouti  | Djibouti جيبوتي |  "djibouti" | 127.0.0.1:11013|  | 
| dz` | make GDNAME=africa taginfo-af-dz`  |  Algeria  | الجزائر |  "africa" | 127.0.0.1:11014|  | 
| eg` | make GDNAME=africa taginfo-af-eg`  |  Egypt  | مصر |  "africa" | 127.0.0.1:11015| area_pct==99.9997% | 
| er` | make GDNAME=eritrea taginfo-af-er`  |  Eritrea  | ኤርትራ إرتريا |  "eritrea" | 127.0.0.1:11016|  | 
| es-ce` | make GDNAME=spain taginfo-af-es-ce`  |  Ceuta  | Ceuta |  "spain" | 127.0.0.1:11017|  | 
| es-cn` | make GDNAME=canary-islands taginfo-af-es-cn`  |  Canary Islands  | Canarias |  "canary-islands" | 127.0.0.1:11018|  | 
| es-gc` | make GDNAME=canary-islands taginfo-af-es-gc`  |  Las Palmas  | Las Palmas |  "canary-islands" | 127.0.0.1:11019|  | 
| es-ml` | make GDNAME=spain taginfo-af-es-ml`  |  Melilla  | Melilla |  "spain" | 127.0.0.1:11020|  | 
| es-tf` | make GDNAME=canary-islands taginfo-af-es-tf`  |  Santa Cruz de Tenerife  | Santa Cruz de Tenerife |  "canary-islands" | 127.0.0.1:11021|  | 
| et` | make GDNAME=africa taginfo-af-et`  |  Ethiopia  | ኢትዮጵያ |  "africa" | 127.0.0.1:11022|  | 
| fr-may` | make GDNAME=mayotte taginfo-af-fr-may`  |  Mayotte  | Mayotte |  "mayotte" | 127.0.0.1:11023|  | 
| fr-yt` | make GDNAME=mayotte taginfo-af-fr-yt`  |  Mayotte  | Mayotte |  "mayotte" | 127.0.0.1:11024|  | 
| ga` | make GDNAME=gabon taginfo-af-ga`  |  Gabon  | Gabon |  "gabon" | 127.0.0.1:11025|  | 
| gh` | make GDNAME=africa taginfo-af-gh`  |  Ghana  | Ghana |  "africa" | 127.0.0.1:11026|  | 
| gm` | make GDNAME=senegal-and-gambia taginfo-af-gm`  |  The Gambia  | Gambia |  "senegal-and-gambia" | 127.0.0.1:11027|  | 
| gn` | make GDNAME=africa taginfo-af-gn`  |  Guinea  | Guinée |  "africa" | 127.0.0.1:11028|  | 
| gq` | make GDNAME=africa taginfo-af-gq`  |  Equatorial Guinea  | Guinea Ecuatorial |  "africa" | 127.0.0.1:11029|  | 
| gw` | make GDNAME=africa taginfo-af-gw`  |  Guinea-Bissau  | Guiné-Bissau |  "africa" | 127.0.0.1:11030|  | 
| ke` | make GDNAME=africa taginfo-af-ke`  |  Kenya  | Kenya |  "africa" | 127.0.0.1:11031|  | 
| km` | make GDNAME=comores taginfo-af-km`  |  Comoros  | Comores Komori جزر القمر |  "comores" | 127.0.0.1:11032|  | 
| lr` | make GDNAME=liberia taginfo-af-lr`  |  Liberia  | Liberia |  "liberia" | 127.0.0.1:11033|  | 
| ls` | make GDNAME=africa taginfo-af-ls`  |  Lesotho  | Lesotho |  "africa" | 127.0.0.1:11034|  | 
| ly` | make GDNAME=africa taginfo-af-ly`  |  Libya  | ليبيا |  "africa" | 127.0.0.1:11035|  | 
| ma` | make GDNAME=africa taginfo-af-ma`  |  Morocco  | Maroc ⵍⵎⵖⵔⵉⴱ المغرب |  "africa" | 127.0.0.1:11036|  | 
| mg` | make GDNAME=africa taginfo-af-mg`  |  Madagascar  | Madagasikara |  "africa" | 127.0.0.1:11037|  | 
| ml` | make GDNAME=mali taginfo-af-ml`  |  Mali  | Mali |  "mali" | 127.0.0.1:11038|  | 
| mr` | make GDNAME=africa taginfo-af-mr`  |  Mauritania  | موريتانيا |  "africa" | 127.0.0.1:11039|  | 
| mu` | make GDNAME=mauritius taginfo-af-mu`  |  Mauritius  | Mauritius |  "mauritius" | 127.0.0.1:11040|  | 
| mw` | make GDNAME=africa taginfo-af-mw`  |  Malawi  | Malawi |  "africa" | 127.0.0.1:11041|  | 
| mz` | make GDNAME=africa taginfo-af-mz`  |  Mozambique  | Moçambique |  "africa" | 127.0.0.1:11042|  | 
| na` | make GDNAME=namibia taginfo-af-na`  |  Namibia  | Namibia |  "namibia" | 127.0.0.1:11043|  | 
| ne` | make GDNAME=africa taginfo-af-ne`  |  Niger  | Niger |  "africa" | 127.0.0.1:11044|  | 
| ng` | make GDNAME=africa taginfo-af-ng`  |  Nigeria  | Nigeria |  "africa" | 127.0.0.1:11045|  | 
| re` | make GDNAME=reunion taginfo-af-re`  |  Réunion  | La Réunion |  "reunion" | 127.0.0.1:11046|  | 
| rw` | make GDNAME=rwanda taginfo-af-rw`  |  Rwanda  | Rwanda |  "rwanda" | 127.0.0.1:11047|  | 
| sc` | make GDNAME=seychelles taginfo-af-sc`  |  Seychelles  | Sesel |  "seychelles" | 127.0.0.1:11048|  | 
| sd` | make GDNAME=sudan taginfo-af-sd`  |  Sudan  | السودان |  "sudan" | 127.0.0.1:11049|  | 
| sh` | make GDNAME=saint-helena-ascension-and-tristan-da-cunha taginfo-af-sh`  |  Saint Helena, Ascension and Tristan da Cunha  | Saint Helena, Ascension and Tristan da Cunha |  "saint-helena-ascension-and-tristan-da-cunha" | 127.0.0.1:11050|  | 
| sl` | make GDNAME=africa taginfo-af-sl`  |  Sierra Leone  | Sierra Leone |  "africa" | 127.0.0.1:11051|  | 
| sn` | make GDNAME=africa taginfo-af-sn`  |  Senegal  | Sénégal |  "africa" | 127.0.0.1:11052|  | 
| so` | make GDNAME=somalia taginfo-af-so`  |  Somalia  | Soomaaliya الصومال |  "somalia" | 127.0.0.1:11053|  | 
| ss` | make GDNAME=africa taginfo-af-ss`  |  South Sudan  | South Sudan |  "africa" | 127.0.0.1:11054|  | 
| st` | make GDNAME=sao-tome-and-principe taginfo-af-st`  |  São Tomé and Príncipe  | São Tomé e Príncipe |  "sao-tome-and-principe" | 127.0.0.1:11055|  | 
| sz` | make GDNAME=swaziland taginfo-af-sz`  |  Eswatini  | eSwatini |  "swaziland" | 127.0.0.1:11056|  | 
| td` | make GDNAME=chad taginfo-af-td`  |  Chad  | Tchad تشاد |  "chad" | 127.0.0.1:11057|  | 
| tg` | make GDNAME=africa taginfo-af-tg`  |  Togo  | Togo |  "africa" | 127.0.0.1:11058|  | 
| tn` | make GDNAME=africa taginfo-af-tn`  |  Tunisia  | تونس |  "africa" | 127.0.0.1:11059| area_pct==99.3483% | 
| tz` | make GDNAME=africa taginfo-af-tz`  |  Tanzania  | Tanzania |  "africa" | 127.0.0.1:11060|  | 
| ug` | make GDNAME=africa taginfo-af-ug`  |  Uganda  | Uganda |  "africa" | 127.0.0.1:11061|  | 
| yt` | make GDNAME=africa taginfo-af-yt`  |  Mayotte  | Mayotte |  "africa" | 127.0.0.1:11062|  | 
| za` | make GDNAME=africa taginfo-af-za`  |  South Africa  | South Africa |  "africa" | 127.0.0.1:11063|  | 
| zm` | make GDNAME=africa taginfo-af-zm`  |  Zambia  | Zambia |  "africa" | 127.0.0.1:11064|  | 
| zw` | make GDNAME=africa taginfo-af-zw`  |  Zimbabwe  | Zimbabwe |  "africa" | 127.0.0.1:11065|  |   