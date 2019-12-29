
generated : 2019-12-29:15:33  // template : ./setup/template/readme.jinja2

### Config files for : "australia-oceania"

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
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( australia-oceania )

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
| au` | make GDNAME=australia-oceania taginfo-ao-au`  |  Australia  | Australia |  "australia-oceania" | 127.0.0.1:16001|  | 
| cc` | make GDNAME=australia-oceania taginfo-ao-cc`  |  Cocos (Keeling) Islands  | Cocos (Keeling) Islands |  "australia-oceania" | 127.0.0.1:16002|  | 
| cx` | make GDNAME=australia-oceania taginfo-ao-cx`  |  Christmas Island  | Christmas Island |  "australia-oceania" | 127.0.0.1:16003|  | 
| fj` | make GDNAME=australia-oceania taginfo-ao-fj`  |  Fiji  | Viti |  "australia-oceania" | 127.0.0.1:16004|  antimeridian | 
| fm` | make GDNAME=australia-oceania taginfo-ao-fm`  |  Federated States of Micronesia  | Micronesia |  "australia-oceania" | 127.0.0.1:16005|  | 
| fr-nc` | make GDNAME=new-caledonia taginfo-ao-fr-nc`  |  New Caledonia  | Nouvelle-Calédonie |  "new-caledonia" | 127.0.0.1:16006|  | 
| fr-tf` | make GDNAME=australia-oceania taginfo-ao-fr-tf`  |  French Southern and Antarctic Lands  | Terres australes et antarctiques françaises |  "australia-oceania" | 127.0.0.1:16007| area_pct==85.6494% | 
| hm` | make GDNAME=australia-oceania taginfo-ao-hm`  |  Heard Island and McDonald Islands  | Heard Island and McDonald Islands |  "australia-oceania" | 127.0.0.1:16008|  | 
| ki` | make GDNAME=australia-oceania taginfo-ao-ki`  |  Kiribati  | Kiribati |  "australia-oceania" | 127.0.0.1:16009| area_pct==56.8999% antimeridian | 
| mh` | make GDNAME=australia-oceania taginfo-ao-mh`  |  Marshall Islands  | M̧ajeļ |  "australia-oceania" | 127.0.0.1:16010|  | 
| nf` | make GDNAME=australia taginfo-ao-nf`  |  Norfolk Island  | Norfolk Island |  "australia" | 127.0.0.1:16011|  | 
| nr` | make GDNAME=australia-oceania taginfo-ao-nr`  |  Nauru  | Naoero |  "australia-oceania" | 127.0.0.1:16012|  | 
| nz` | make GDNAME=australia-oceania taginfo-ao-nz`  |  New Zealand  | New Zealand / Aotearoa |  "australia-oceania" | 127.0.0.1:16013| area_pct==95.6666% antimeridian | 
| pg` | make GDNAME=papua-new-guinea taginfo-ao-pg`  |  Papua New Guinea  | Papua Niugini |  "papua-new-guinea" | 127.0.0.1:16014|  | 
| pw` | make GDNAME=australia-oceania taginfo-ao-pw`  |  Palau  | Belau |  "australia-oceania" | 127.0.0.1:16015|  | 
| sb` | make GDNAME=australia-oceania taginfo-ao-sb`  |  Solomon Islands  | Solomon Islands |  "australia-oceania" | 127.0.0.1:16016|  | 
| tv` | make GDNAME=australia-oceania taginfo-ao-tv`  |  Tuvalu  | Tuvalu |  "australia-oceania" | 127.0.0.1:16017| area_pct==99.2031% antimeridian | 
| us-gu` | make GDNAME=australia-oceania taginfo-ao-us-gu`  |  Guam  | Guam |  "australia-oceania" | 127.0.0.1:16018|  | 
| us-mp` | make GDNAME=australia-oceania taginfo-ao-us-mp`  |  Northern Mariana Islands  | Northern Mariana Islands |  "australia-oceania" | 127.0.0.1:16019|  | 
| us-um` | make GDNAME=australia-oceania taginfo-ao-us-um`  |  United States of America (Minor Outlying Islands);Wake Island (Disputed area USA-MARSHALL ISLANDS)  | United States of America (Minor Outlying Islands);Wake Island (Disputed area USA-MARSHALL ISLANDS) |  "australia-oceania" | 127.0.0.1:16020|  | 
| vu` | make GDNAME=australia-oceania taginfo-ao-vu`  |  Vanuatu  | Vanuatu |  "australia-oceania" | 127.0.0.1:16021|  |   