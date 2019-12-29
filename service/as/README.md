
generated : 2019-12-29:15:25  // template : ./setup/template/readme.jinja2

### Config files for : "asia"

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
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( asia )

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
| ae` | make GDNAME=gcc-states taginfo-as-ae`  |  United Arab Emirates  | الإمارات العربية المتحدة |  "gcc-states" | 127.0.0.1:14001|  | 
| af` | make GDNAME=asia taginfo-as-af`  |  Afghanistan  | افغانستان |  "asia" | 127.0.0.1:14002|  | 
| am` | make GDNAME=asia taginfo-as-am`  |  Armenia  | Հայաստան |  "asia" | 127.0.0.1:14003|  | 
| az` | make GDNAME=asia taginfo-as-az`  |  Azerbaijan  | Azərbaycan |  "asia" | 127.0.0.1:14004|  | 
| bd` | make GDNAME=asia taginfo-as-bd`  |  Bangladesh  | বাংলাদেশ |  "asia" | 127.0.0.1:14005|  | 
| bh` | make GDNAME=gcc-states taginfo-as-bh`  |  Bahrain  | ‏البحرين‎ |  "gcc-states" | 127.0.0.1:14006|  | 
| bn` | make GDNAME=malaysia-singapore-brunei taginfo-as-bn`  |  Brunei  | Brunei |  "malaysia-singapore-brunei" | 127.0.0.1:14007|  | 
| bt` | make GDNAME=asia taginfo-as-bt`  |  Bhutan  | འབྲུག་ཡུལ་ |  "asia" | 127.0.0.1:14008|  | 
| cn` | make GDNAME=asia taginfo-as-cn`  |  China  | 中国 |  "asia" | 127.0.0.1:14009|  | 
| ge` | make GDNAME=europe taginfo-as-ge`  |  Georgia  | საქართველო |  "europe" | 127.0.0.1:14010|  | 
| id` | make GDNAME=asia taginfo-as-id`  |  Indonesia  | Indonesia |  "asia" | 127.0.0.1:14011|  | 
| il` | make GDNAME=asia taginfo-as-il`  |  Israel  | ישראל |  "asia" | 127.0.0.1:14012|  | 
| in` | make GDNAME=asia taginfo-as-in`  |  India  | India |  "asia" | 127.0.0.1:14013|  | 
| io` | make GDNAME=asia taginfo-as-io`  |  British Indian Ocean Territory  | British Indian Ocean Territory |  "asia" | 127.0.0.1:14014|  | 
| iq` | make GDNAME=asia taginfo-as-iq`  |  Iraq  | العراق |  "asia" | 127.0.0.1:14015|  | 
| ir` | make GDNAME=asia taginfo-as-ir`  |  Iran  | ایران |  "asia" | 127.0.0.1:14016|  | 
| jo` | make GDNAME=asia taginfo-as-jo`  |  Jordan  | الأردن |  "asia" | 127.0.0.1:14017|  | 
| jp` | make GDNAME=japan taginfo-as-jp`  |  Japan  | 日本 |  "japan" | 127.0.0.1:14018|  | 
| kg` | make GDNAME=asia taginfo-as-kg`  |  Kyrgyzstan  | Кыргызстан |  "asia" | 127.0.0.1:14019|  | 
| kh` | make GDNAME=asia taginfo-as-kh`  |  Cambodia  | ព្រះរាជាណាចក្រ​កម្ពុជា |  "asia" | 127.0.0.1:14020|  | 
| kp` | make GDNAME=asia taginfo-as-kp`  |  North Korea  | 조선민주주의인민공화국 |  "asia" | 127.0.0.1:14021|  | 
| kr` | make GDNAME=asia taginfo-as-kr`  |  South Korea  | 대한민국 |  "asia" | 127.0.0.1:14022|  | 
| kw` | make GDNAME=asia taginfo-as-kw`  |  Kuwait  | ‏الكويت‎ |  "asia" | 127.0.0.1:14023|  | 
| kz` | make GDNAME=asia taginfo-as-kz`  |  Kazakhstan  | Казахстан |  "asia" | 127.0.0.1:14024|  | 
| la` | make GDNAME=asia taginfo-as-la`  |  Laos  | ປະເທດລາວ |  "asia" | 127.0.0.1:14025|  | 
| lb` | make GDNAME=asia taginfo-as-lb`  |  Lebanon  | لبنان |  "asia" | 127.0.0.1:14026|  | 
| lk` | make GDNAME=asia taginfo-as-lk`  |  Sri Lanka  | ශ්‍රී ලංකාව இலங்கை |  "asia" | 127.0.0.1:14027|  | 
| mm` | make GDNAME=asia taginfo-as-mm`  |  Myanmar  | မြန်မာ |  "asia" | 127.0.0.1:14028|  | 
| mn` | make GDNAME=asia taginfo-as-mn`  |  Mongolia  | Монгол улс |  "asia" | 127.0.0.1:14029|  | 
| mv` | make GDNAME=maldives taginfo-as-mv`  |  Maldives  | ދިވެހިރާއްޖެ |  "maldives" | 127.0.0.1:14030|  | 
| my` | make GDNAME=asia taginfo-as-my`  |  Malaysia  | Malaysia |  "asia" | 127.0.0.1:14031|  | 
| np` | make GDNAME=asia taginfo-as-np`  |  Nepal  | नेपाल |  "asia" | 127.0.0.1:14032|  | 
| om` | make GDNAME=asia taginfo-as-om`  |  Oman  | عمان |  "asia" | 127.0.0.1:14033|  | 
| ph` | make GDNAME=asia taginfo-as-ph`  |  Philippines  | Philippines |  "asia" | 127.0.0.1:14034|  | 
| pk` | make GDNAME=asia taginfo-as-pk`  |  Pakistan  | پاکستان |  "asia" | 127.0.0.1:14035|  | 
| qa` | make GDNAME=asia taginfo-as-qa`  |  Qatar  | ‏قطر |  "asia" | 127.0.0.1:14036|  | 
| sa` | make GDNAME=asia taginfo-as-sa`  |  Saudi Arabia  | السعودية |  "asia" | 127.0.0.1:14037|  | 
| sg` | make GDNAME=asia taginfo-as-sg`  |  Singapore  | Singapore |  "asia" | 127.0.0.1:14038|  | 
| sy` | make GDNAME=asia taginfo-as-sy`  |  Syria  | سوريا |  "asia" | 127.0.0.1:14039|  | 
| th` | make GDNAME=asia taginfo-as-th`  |  Thailand  | ประเทศไทย |  "asia" | 127.0.0.1:14040|  | 
| tj` | make GDNAME=asia taginfo-as-tj`  |  Tajikistan  | Тоҷикистон |  "asia" | 127.0.0.1:14041|  | 
| tl` | make GDNAME=indonesia taginfo-as-tl`  |  East Timor  | Timór Lorosa'e |  "indonesia" | 127.0.0.1:14042|  | 
| tm` | make GDNAME=asia taginfo-as-tm`  |  Turkmenistan  | Türkmenistan |  "asia" | 127.0.0.1:14043|  | 
| tw` | make GDNAME=asia taginfo-as-tw`  |  Taiwan  | 臺灣 |  "asia" | 127.0.0.1:14044|  | 
| uz` | make GDNAME=asia taginfo-as-uz`  |  Uzbekistan  | Oʻzbekiston |  "asia" | 127.0.0.1:14045|  | 
| vn` | make GDNAME=asia taginfo-as-vn`  |  Vietnam  | Việt Nam |  "asia" | 127.0.0.1:14046|  | 
| ye` | make GDNAME=asia taginfo-as-ye`  |  Yemen  | اليمن |  "asia" | 127.0.0.1:14047| area_pct==99.9880% |   