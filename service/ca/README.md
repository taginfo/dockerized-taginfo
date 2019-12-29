
generated : 2019-12-29:14:52  // template : ./setup/template/readme.jinja2

### Config files for : "central-america"

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
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( central-america )

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
| ag` | make GDNAME=central-america taginfo-ca-ag`  |  Antigua and Barbuda  | Antigua and Barbuda |  "central-america" | 127.0.0.1:18001|  | 
| ai` | make GDNAME=central-america taginfo-ca-ai`  |  Anguilla  | Anguilla |  "central-america" | 127.0.0.1:18002|  | 
| bb` | make GDNAME=central-america taginfo-ca-bb`  |  Barbados  | Barbados |  "central-america" | 127.0.0.1:18003|  | 
| bq` | make GDNAME=central-america taginfo-ca-bq`  |  Caribbean Netherlands  | Caribisch Nederland |  "central-america" | 127.0.0.1:18004|  | 
| bs` | make GDNAME=bahamas taginfo-ca-bs`  |  The Bahamas  | The Bahamas |  "bahamas" | 127.0.0.1:18005|  | 
| bz` | make GDNAME=central-america taginfo-ca-bz`  |  Belize  | Belize |  "central-america" | 127.0.0.1:18006| area_pct==99.3771% | 
| cr` | make GDNAME=central-america taginfo-ca-cr`  |  Costa Rica  | Costa Rica |  "central-america" | 127.0.0.1:18007|  | 
| cu` | make GDNAME=central-america taginfo-ca-cu`  |  Cuba  | Cuba |  "central-america" | 127.0.0.1:18008|  | 
| dm` | make GDNAME=central-america taginfo-ca-dm`  |  Dominica  | Dominica |  "central-america" | 127.0.0.1:18009|  | 
| do` | make GDNAME=central-america taginfo-ca-do`  |  Dominican Republic  | República Dominicana |  "central-america" | 127.0.0.1:18010|  | 
| fr-bl` | make GDNAME=central-america taginfo-ca-fr-bl`  |  Saint Barthélemy  | Saint-Barthélemy |  "central-america" | 127.0.0.1:18011|  | 
| fr-mf` | make GDNAME=central-america taginfo-ca-fr-mf`  |  Saint Martin (France)  | Saint-Martin (France) |  "central-america" | 127.0.0.1:18012|  | 
| fr-mq` | make GDNAME=central-america taginfo-ca-fr-mq`  |  Martinique  | Martinique |  "central-america" | 127.0.0.1:18013|  | 
| gd` | make GDNAME=central-america taginfo-ca-gd`  |  Grenada  | Grenada |  "central-america" | 127.0.0.1:18014|  | 
| gp` | make GDNAME=central-america taginfo-ca-gp`  |  Guadeloupe  | Guadeloupe |  "central-america" | 127.0.0.1:18015|  | 
| gt` | make GDNAME=central-america taginfo-ca-gt`  |  Guatemala  | Guatemala |  "central-america" | 127.0.0.1:18016| area_pct==99.4517% | 
| hn` | make GDNAME=central-america taginfo-ca-hn`  |  Honduras  | Honduras |  "central-america" | 127.0.0.1:18017|  | 
| ht` | make GDNAME=central-america taginfo-ca-ht`  |  Haiti  | Ayiti |  "central-america" | 127.0.0.1:18018|  | 
| jm` | make GDNAME=jamaica taginfo-ca-jm`  |  Jamaica  | Jamaica |  "jamaica" | 127.0.0.1:18019|  | 
| kn` | make GDNAME=central-america taginfo-ca-kn`  |  Saint Kitts and Nevis  | Saint Kitts and Nevis |  "central-america" | 127.0.0.1:18020|  | 
| ky` | make GDNAME=central-america taginfo-ca-ky`  |  Cayman Islands  | Cayman Islands |  "central-america" | 127.0.0.1:18021|  | 
| lc` | make GDNAME=central-america taginfo-ca-lc`  |  Saint Lucia  | Saint Lucia |  "central-america" | 127.0.0.1:18022|  | 
| ms` | make GDNAME=central-america taginfo-ca-ms`  |  Montserrat  | Montserrat |  "central-america" | 127.0.0.1:18023|  | 
| ni` | make GDNAME=central-america taginfo-ca-ni`  |  Nicaragua  | Nicaragua |  "central-america" | 127.0.0.1:18024|  | 
| nl-aw` | make GDNAME=central-america taginfo-ca-nl-aw`  |  Aruba  | Aruba |  "central-america" | 127.0.0.1:18025|  | 
| nl-cw` | make GDNAME=central-america taginfo-ca-nl-cw`  |  Curacao  | Curaçao |  "central-america" | 127.0.0.1:18026|  | 
| nl-sx` | make GDNAME=central-america taginfo-ca-nl-sx`  |  Sint Maarten (Netherlands)  | Sint Maarten (Nederland) |  "central-america" | 127.0.0.1:18027|  | 
| sv` | make GDNAME=central-america taginfo-ca-sv`  |  El Salvador  | El Salvador |  "central-america" | 127.0.0.1:18028|  | 
| tc` | make GDNAME=central-america taginfo-ca-tc`  |  Turks and Caicos Islands  | Turks and Caicos Islands |  "central-america" | 127.0.0.1:18029|  | 
| tt` | make GDNAME=central-america taginfo-ca-tt`  |  Trinidad and Tobago  | Trinidad and Tobago |  "central-america" | 127.0.0.1:18030|  | 
| vc` | make GDNAME=central-america taginfo-ca-vc`  |  Saint Vincent and the Grenadines  | Saint Vincent and the Grenadines |  "central-america" | 127.0.0.1:18031|  | 
| vg` | make GDNAME=central-america taginfo-ca-vg`  |  British Virgin Islands  | British Virgin Islands |  "central-america" | 127.0.0.1:18032|  |   