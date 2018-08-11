# Dockerizing Taginfo [![Build Status](https://secure.travis-ci.org/taginfo/dockerized-taginfo.png)](https://travis-ci.org/taginfo/dockerized-taginfo)

Work in progress ..

# Generating full config files

* Download `planet.osm.pbf` and move to ->  `/import_admin/planet.osm.pbf`
* `make naturalearth` : Download naturalEarth raster files
* `make init`
    * import OSM admin areas to PostGIS
    * Download Geofabrik polygons and import to PostGIS
* `make genservices`  for generating all services!


### Services

...

Test service: used only for minimal travis testing

geofabrik continent | short continent code | first port |
--------------------|----|-------|
  central-america   | zz | 30000 |

### System requirements:
* docker-compose: `1.18+`   https://github.com/docker/compose/releases  ( Compose file format >= 3.5)
* docker engine : `18.06.0-ce+`
* developed & tested on Linux  ( ubuntu )
* git, make, bash


### service name conventions
* taginfo-`$continent`-`$iso`
  * short continent code:  - is a 2 letter abbreviation

### Known problems:

* antimeridian : taginfo map is not correct, need more debug
        * see more https://en.wikipedia.org/wiki/180th_meridian
* area_pct     : geofabrik continent polygon not contain 100% of iso area ,  borders sometimes change
    * be careful, the taginfo statistics is not correct!
* Overpass external link is 99% ok,  but sometimes not working
    * 'Antarctica' : [https://github.com/drolbr/Overpass-API/issues/421

### FAQ:

* I don't see my country area:
  *  check your area keys: ( `admin_level`=1,2,3,4,5,6 and `boundary`=`administrative` )
     * [ISO3166-1](https://taginfo.openstreetmap.org/keys/ISO3166-1#values)
     * [ISO3166-2](https://taginfo.openstreetmap.org/keys/ISO3166-2)
   * or the admin border relation was broken when this config generated , sorry
* Smaller Geofabrik area exist for my country
   * sometimes the osm admin borders is changing, and very hard to keep in sync with geofabrik extracts
   * this version is expect 100% inside the country polygon, if not -> fallback the continent ( {{continent_long}} )

### Taginfo customisations:

* taginfo customized for smaller extracts - showing data problems on the long tails
* ....

### License:

* Config files derived from OpenStreetMap data ( ODBL )
* Program code, taginfo customisations : GPL3
* [Hugo-material-docs theme](https://github.com/digitalcraftsman/hugo-material-docs): MIT License
### Credits:

* OpenStreetMap contributors and community
* [Geofabrik](https://www.geofabrik.de), for the free download service https://www.geofabrik.de/data/download.html
* https://github.com/taginfo/taginfo author and [contributors](https://github.com/taginfo/taginfo/graphs/contributors)
* https://github.com/julien-noblet/download-geofabrik
* https://github.com/osmcode/osmium-tool
* https://github.com/omniscale/imposm3
* NaturalEarth data : http://www.naturalearthdata.com/
* and other Open Source projects ( linux, posgis, postgresql, osgeo, python, docker, hugo, caddy, nginx-proxy, etc )

### Be careful!

* This is an experimental software, test on a new VPS
* Check the size of 'geofabrik source' ,  sometimes it is huge > 1 Gb !  ( like  continents )
* This code expecting minimal docker and linux knowledge.


### Testing:

see [.travis.yml](https://github.com/taginfo/dockerized-taginfo/blob/master/.travis.yml) file!

command:
* `make test`
    *  `make build`   - build 2 docker images
            *  for processing the osm data:    `taginfo_job`
            *  for viewing the taginfo result: `taginfo_view`
    *  `make testdatainit` -  install  minimal `planet.osm.pbf` and naturalEarth raster data from ./testdata directory
    *  `make init`   -
        * filter  OSM  PLANET file for admin data
        * Import OSM admin polygons
        * Download all Geofabrik Polygons (kml)
            * for calculating minimal osm extract
        * Import Geofabrik polygons to Postgis
    *  `make ca-zz-genservices`
        * Generate  `./service/zz`  test config files
    *  `make ca-zz-test`
        *  Run `./service/zz` :  processing central-america ;  and start and stop `zz` services
    *  `make peakcheck`
        *  Check Taginfo processing Peak memory from the logs.
