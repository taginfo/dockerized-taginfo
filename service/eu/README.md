
generated : 2019-12-29:15:47  // template : ./setup/template/readme.jinja2

### Config files for : "europe"

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
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( europe )

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
| ad` | make GDNAME=europe taginfo-eu-ad`  |  Andorra  | Andorra |  "europe" | 127.0.0.1:20001|  | 
| al` | make GDNAME=europe taginfo-eu-al`  |  Albania  | Shqipëria |  "europe" | 127.0.0.1:20002|  | 
| at` | make GDNAME=europe taginfo-eu-at`  |  Austria  | Österreich |  "europe" | 127.0.0.1:20003|  | 
| ax` | make GDNAME=finland taginfo-eu-ax`  |  Åland Islands  | Åland |  "finland" | 127.0.0.1:20004|  | 
| ba` | make GDNAME=europe taginfo-eu-ba`  |  Bosnia and Herzegovina  | Bosna i Hercegovina / Босна и Херцеговина |  "europe" | 127.0.0.1:20005|  | 
| be` | make GDNAME=europe taginfo-eu-be`  |  Belgium  | België / Belgique / Belgien |  "europe" | 127.0.0.1:20006|  | 
| bg` | make GDNAME=europe taginfo-eu-bg`  |  Bulgaria  | Бългaрия |  "europe" | 127.0.0.1:20007|  | 
| by` | make GDNAME=belarus taginfo-eu-by`  |  Belarus  | Беларусь |  "belarus" | 127.0.0.1:20008|  | 
| ch` | make GDNAME=europe taginfo-eu-ch`  |  Switzerland  | Schweiz/Suisse/Svizzera/Svizra |  "europe" | 127.0.0.1:20009|  | 
| cy` | make GDNAME=cyprus taginfo-eu-cy`  |  Cyprus  | Κύπρος - Kıbrıs |  "cyprus" | 127.0.0.1:20010|  | 
| cz` | make GDNAME=czech-republic taginfo-eu-cz`  |  Czechia  | Česko |  "czech-republic" | 127.0.0.1:20011|  | 
| de` | make GDNAME=europe taginfo-eu-de`  |  Germany  | Deutschland |  "europe" | 127.0.0.1:20012|  | 
| dk` | make GDNAME=europe taginfo-eu-dk`  |  Denmark  | Danmark |  "europe" | 127.0.0.1:20013|  | 
| ee` | make GDNAME=europe taginfo-eu-ee`  |  Estonia  | Eesti |  "europe" | 127.0.0.1:20014|  | 
| es` | make GDNAME=europe taginfo-eu-es`  |  Spain (except CanaryIsland)  | España (except Canarias) |  "europe" | 127.0.0.1:20015| area_pct==99.9999% | 
| fi` | make GDNAME=europe taginfo-eu-fi`  |  Finland  | Suomi |  "europe" | 127.0.0.1:20016|  | 
| fo` | make GDNAME=europe taginfo-eu-fo`  |  Faroe Islands  | Føroyar |  "europe" | 127.0.0.1:20017|  | 
| fr-metropolitan` | make GDNAME=europe taginfo-eu-fr-metropolitan`  |  Metropolitan France  | France métropolitaine |  "europe" | 127.0.0.1:20018|  | 
| gb` | make GDNAME=europe taginfo-eu-gb`  |  United Kingdom  | United Kingdom |  "europe" | 127.0.0.1:20019|  | 
| ge` | make GDNAME=europe taginfo-eu-ge`  |  Georgia  | საქართველო |  "europe" | 127.0.0.1:20020|  | 
| gg` | make GDNAME=france taginfo-eu-gg`  |  Guernsey  | Guernsey |  "france" | 127.0.0.1:20021|  | 
| gi` | make GDNAME=spain taginfo-eu-gi`  |  Gibraltar  | Gibraltar |  "spain" | 127.0.0.1:20022|  | 
| gr` | make GDNAME=europe taginfo-eu-gr`  |  Greece  | Ελλάδα |  "europe" | 127.0.0.1:20023|  | 
| hr` | make GDNAME=europe taginfo-eu-hr`  |  Croatia  | Hrvatska |  "europe" | 127.0.0.1:20024|  | 
| hu` | make GDNAME=europe taginfo-eu-hu`  |  Hungary  | Magyarország |  "europe" | 127.0.0.1:20025|  | 
| ie` | make GDNAME=ireland-and-northern-ireland taginfo-eu-ie`  |  Ireland  | Ireland |  "ireland-and-northern-ireland" | 127.0.0.1:20026|  | 
| im` | make GDNAME=isle-of-man taginfo-eu-im`  |  Isle of Man  | Isle of Man |  "isle-of-man" | 127.0.0.1:20027|  | 
| is` | make GDNAME=iceland taginfo-eu-is`  |  Iceland  | Ísland |  "iceland" | 127.0.0.1:20028|  | 
| it` | make GDNAME=europe taginfo-eu-it`  |  Italy  | Italia |  "europe" | 127.0.0.1:20029|  | 
| je` | make GDNAME=france taginfo-eu-je`  |  Jersey  | Jersey |  "france" | 127.0.0.1:20030|  | 
| li` | make GDNAME=europe taginfo-eu-li`  |  Liechtenstein  | Liechtenstein |  "europe" | 127.0.0.1:20031|  | 
| lt` | make GDNAME=europe taginfo-eu-lt`  |  Lithuania  | Lietuva |  "europe" | 127.0.0.1:20032|  | 
| lu` | make GDNAME=europe taginfo-eu-lu`  |  Luxembourg  | Lëtzebuerg |  "europe" | 127.0.0.1:20033|  | 
| lv` | make GDNAME=europe taginfo-eu-lv`  |  Latvia  | Latvija |  "europe" | 127.0.0.1:20034|  | 
| mc` | make GDNAME=provence-alpes-cote-d-azur taginfo-eu-mc`  |  Monaco  | Monaco |  "provence-alpes-cote-d-azur" | 127.0.0.1:20035|  | 
| md` | make GDNAME=europe taginfo-eu-md`  |  Moldova  | Moldova |  "europe" | 127.0.0.1:20036|  | 
| me` | make GDNAME=europe taginfo-eu-me`  |  Montenegro  | Crna Gora / Црна Гора |  "europe" | 127.0.0.1:20037|  | 
| mk` | make GDNAME=macedonia taginfo-eu-mk`  |  North Macedonia  | Северна Македонија |  "macedonia" | 127.0.0.1:20038|  | 
| mt` | make GDNAME=europe taginfo-eu-mt`  |  Malta  | Malta |  "europe" | 127.0.0.1:20039|  | 
| nl` | make GDNAME=europe taginfo-eu-nl`  |  Netherlands(Eu)  | Nederland(Eu) |  "europe" | 127.0.0.1:20040|  | 
| no` | make GDNAME=europe taginfo-eu-no`  |  Norway  | Norge |  "europe" | 127.0.0.1:20041| area_pct==99.7957% | 
| pl` | make GDNAME=europe taginfo-eu-pl`  |  Poland  | Polska |  "europe" | 127.0.0.1:20042|  | 
| pt` | make GDNAME=europe taginfo-eu-pt`  |  Portugal  | Portugal |  "europe" | 127.0.0.1:20043|  | 
| ro` | make GDNAME=romania taginfo-eu-ro`  |  Romania  | România |  "romania" | 127.0.0.1:20044|  | 
| rs` | make GDNAME=europe taginfo-eu-rs`  |  Serbia  | Србија |  "europe" | 127.0.0.1:20045|  | 
| se` | make GDNAME=europe taginfo-eu-se`  |  Sweden  | Sverige |  "europe" | 127.0.0.1:20046|  | 
| si` | make GDNAME=europe taginfo-eu-si`  |  Slovenia  | Slovenija |  "europe" | 127.0.0.1:20047|  | 
| sk` | make GDNAME=europe taginfo-eu-sk`  |  Slovakia  | Slovensko |  "europe" | 127.0.0.1:20048|  | 
| sm` | make GDNAME=italy taginfo-eu-sm`  |  San Marino  | San Marino |  "italy" | 127.0.0.1:20049|  | 
| tr` | make GDNAME=europe taginfo-eu-tr`  |  Turkey  | Türkiye |  "europe" | 127.0.0.1:20050|  | 
| ua` | make GDNAME=ukraine taginfo-eu-ua`  |  Ukraine  | Україна |  "ukraine" | 127.0.0.1:20051|  | 
| uk-sba` | make GDNAME=cyprus taginfo-eu-uk-sba`  |  British Sovereign Base Areas  | British Sovereign Base Areas |  "cyprus" | 127.0.0.1:20052|  | 
| va` | make GDNAME=centro taginfo-eu-va`  |  Vatican City  | Civitas Vaticana |  "centro" | 127.0.0.1:20053|  | 
| xk` | make GDNAME=europe taginfo-eu-xk`  |  Kosovo  | Kosova / Kosovo |  "europe" | 127.0.0.1:20054|  |   