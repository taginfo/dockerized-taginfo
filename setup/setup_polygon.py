# -*- coding: utf-8 -*-
#description     :  
#author          :  
#date            :  
#version         :  0.1
#usage           :  python setup_polygon.py
#==============================================================================

import psycopg2
import os
import sys
import os, atexit
import re

try:
  conn_string="dbname=osm user=osm " 
  conn = psycopg2.connect(conn_string)
except:
  print("Connection to database failed")
  sys.exit(1)


CONTINENT = os.environ.get('CONTINENT', 'xx')
DOMAIN    = os.environ.get('DOMAIN',    'dd')


def qiso():

        curiso = conn.cursor()
        try:
          curiso.execute(""" 
              select iso, id, imposmid2shortid(id) as osmium_id from xtaginfo order by iso;
          """)
          rows = curiso.fetchall()

        except:
          print("Postgresql Query could not be executed - setup_polygon.py")
          sys.exit(1)

        for row in rows:
                print("processing: ", row[0] , row[1])
                createisopoly(row[0],row[1],row[2] )




def show(f,s):
    f.write ( s )
    f.write ( '\n' )

def write_polygon(f, wkt, p):

        match = re.search("^\(\((?P<pdata>.*)\)\)$", wkt)
        pdata = match.group("pdata")
        rings = re.split("\),\(", pdata)

        first_ring = True
        for ring in rings:
                coords = re.split(",", ring)

                p = p + 1
                if first_ring:
                        f.write(str(p) + "\n")
                        first_ring = False
                else:
                        f.write("!" + str(p) + "\n")

                for coord in coords:
                        ords = coord.split()
                        f.write("\t%E\t%E\n" % (float(ords[0]), float(ords[1])))

                f.write("END\n")

        return p

def write_multipolygon(f, wkt):

        match = re.search("^MULTIPOLYGON\((?P<mpdata>.*)\)$", wkt)

        if match:
                mpdata = match.group("mpdata")
                polygons = re.split("(?<=\)\)),(?=\(\()", mpdata)

                p = 0
                for polygon in polygons:
                        p = write_polygon(f, polygon, p)

                return

        match = re.search("^POLYGON(?P<pdata>.*)$", wkt)
        if match:
                pdata = match.group("pdata")
                write_polygon(f, pdata, 0)





def createisopoly(iso,id,osmium_id):

        cur = conn.cursor()
        try:
                cur.execute("""
                  select ST_AsText(
                  (SELECT   st_transform( st_buffer( geometry, 0.01) , 4326 )  
                    from xtaginfo  where id = {0}  ))
                """.format(id))

                data_tuples = []
                for row in cur:
                        data_tuples.append(row)

        except:
                print("Query could not be executed")

        print("createisopoly:",iso,id,osmium_id)

        results = data_tuples 

        wkt = results[0][0]

        img_directory='/osm/service/'+CONTINENT+'/'+iso+'/img/'
        if not os.path.exists(img_directory):
            os.makedirs(img_directory)

        data_directory='/osm/service/'+CONTINENT+'/'+iso+'/data/'
        if not os.path.exists(data_directory):
            os.makedirs(data_directory)

        sources_directory='/osm/service/'+CONTINENT+'/'+iso+'/sources/'
        if not os.path.exists(sources_directory):
            os.makedirs(sources_directory)

        download_directory='/osm/service/'+CONTINENT+'/'+iso+'/download/'
        if not os.path.exists(download_directory):
            os.makedirs(download_directory)

        input_directory='/osm/service/'+CONTINENT+'/'+iso+'/input/'
        if not os.path.exists(input_directory):
            os.makedirs(input_directory)

        joblog_directory='/osm/service/'+CONTINENT+'/'+iso+'/joblog/'
        if not os.path.exists(joblog_directory):
            os.makedirs(joblog_directory)

        poly_directory='/osm/service/'+CONTINENT+'/'+iso+'/poly/'
        if not os.path.exists(poly_directory):
            os.makedirs(poly_directory)

        fpoly = open( poly_directory+'osm.poly', 'w')
        show(fpoly,u"polygon")
        write_multipolygon(fpoly, wkt)
        show(fpoly,u"END")
        fpoly.close()



        #export Geojson
        #ogr2ogr -f "GeoJson" out.geojson PG:"host=$PGHOST dbname=$PGDATABASE user=$PGUSER password=$PGPASSWORD"   -sql "SELECT iso,name_en,name, geometry from xtaginfo where iso='ao' "
        #  
        cmdexpr1 =r'ogr2ogr -f "GeoJson" {} PG:"host=$PGHOST dbname=$PGDATABASE user=$PGUSER password=$PGPASSWORD" '.format(poly_directory+'osm.geojson')
        cmdexpr2 ='''   -sql "SELECT iso,name_en,name, St_transform(geometry,4326) as geom from xtaginfo where iso='{}'"   '''.format(iso)

        os.system(cmdexpr1+cmdexpr2 )

        osm_poly_filename='/osm/service/'+CONTINENT+'/'+iso+'/poly/poly.osm.pbf'
        osm_poly_cmd ='/osm/sh/osm_getpolygon.sh '+osm_poly_filename+'  '+osmium_id 

        print( 'executing: '+ osm_poly_cmd)
        os.system( osm_poly_cmd )

qiso()
