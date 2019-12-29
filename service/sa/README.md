
generated : 2019-12-29:16:02  // template : ./setup/template/readme.jinja2

### Config files for : "south-america"

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
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( south-america )

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
| ar` | make GDNAME=south-america taginfo-sa-ar`  |  Argentina  | Argentina |  "south-america" | 127.0.0.1:26001|  | 
| bo` | make GDNAME=south-america taginfo-sa-bo`  |  Bolivia  | Bolivia |  "south-america" | 127.0.0.1:26002|  | 
| br` | make GDNAME=brazil taginfo-sa-br`  |  Brazil  | Brasil |  "brazil" | 127.0.0.1:26003|  | 
| ck` | make GDNAME=south-america taginfo-sa-ck`  |  Cook Islands  | Kūki 'Āirani |  "south-america" | 127.0.0.1:26004|  | 
| cl` | make GDNAME=chile taginfo-sa-cl`  |  Chile  | Chile |  "chile" | 127.0.0.1:26005|  | 
| co` | make GDNAME=colombia taginfo-sa-co`  |  Colombia  | Colombia |  "colombia" | 127.0.0.1:26006|  | 
| ec` | make GDNAME=south-america taginfo-sa-ec`  |  Ecuador  | Ecuador |  "south-america" | 127.0.0.1:26007|  | 
| fk` | make GDNAME=south-america taginfo-sa-fk`  |  Falkland Islands  | Falkland Islands |  "south-america" | 127.0.0.1:26008|  | 
| fr-cp` | make GDNAME=south-america taginfo-sa-fr-cp`  |  Clipperton Island  | Île de Clipperton |  "south-america" | 127.0.0.1:26009|  | 
| fr-gf` | make GDNAME=south-america taginfo-sa-fr-gf`  |  French Guiana  | Guyane |  "south-america" | 127.0.0.1:26011|  | 
| fr-pf` | make GDNAME=south-america taginfo-sa-fr-pf`  |  French Polynesia  | Polynésie Française |  "south-america" | 127.0.0.1:26012|  | 
| gs` | make GDNAME=south-america taginfo-sa-gs`  |  South Georgia and the South Sandwich Islands  | South Georgia and South Sandwich Islands |  "south-america" | 127.0.0.1:26013|  | 
| gy` | make GDNAME=south-america taginfo-sa-gy`  |  Guyana  | Guyana |  "south-america" | 127.0.0.1:26014|  | 
| nl-aw` | make GDNAME=central-america taginfo-sa-nl-aw`  |  Aruba  | Aruba |  "central-america" | 127.0.0.1:26015|  | 
| nl-cw` | make GDNAME=central-america taginfo-sa-nl-cw`  |  Curacao  | Curaçao |  "central-america" | 127.0.0.1:26016|  | 
| nu` | make GDNAME=south-america taginfo-sa-nu`  |  Niue  | Niuē |  "south-america" | 127.0.0.1:26017|  | 
| pe` | make GDNAME=south-america taginfo-sa-pe`  |  Peru  | Perú |  "south-america" | 127.0.0.1:26018|  | 
| pn` | make GDNAME=south-america taginfo-sa-pn`  |  Pitcairn Islands  | Pitcairn Islands |  "south-america" | 127.0.0.1:26019|  | 
| py` | make GDNAME=paraguay taginfo-sa-py`  |  Paraguay  | Paraguay |  "paraguay" | 127.0.0.1:26020|  | 
| sr` | make GDNAME=south-america taginfo-sa-sr`  |  Suriname  | Suriname |  "south-america" | 127.0.0.1:26021|  | 
| tk` | make GDNAME=south-america taginfo-sa-tk`  |  Tokelau  | Tokelau |  "south-america" | 127.0.0.1:26022|  | 
| to` | make GDNAME=south-america taginfo-sa-to`  |  Tonga  | Tonga |  "south-america" | 127.0.0.1:26023|  | 
| us-as` | make GDNAME=south-america taginfo-sa-us-as`  |  American Samoa  | American Samoa |  "south-america" | 127.0.0.1:26024|  | 
| us-um` | make GDNAME=south-america taginfo-sa-us-um`  |  United States of America (Minor Outlying Islands);Kingman Reef  | United States of America (Minor Outlying Islands);Kingman Reef |  "south-america" | 127.0.0.1:26026|  | 
| uy` | make GDNAME=south-america taginfo-sa-uy`  |  Uruguay  | Uruguay |  "south-america" | 127.0.0.1:26030|  | 
| ve` | make GDNAME=south-america taginfo-sa-ve`  |  Venezuela  | Venezuela |  "south-america" | 127.0.0.1:26031|  | 
| ws` | make GDNAME=south-america taginfo-sa-ws`  |  Samoa  | Sāmoa |  "south-america" | 127.0.0.1:26032|  |   