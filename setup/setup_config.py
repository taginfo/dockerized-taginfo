from jinja2 import Template
from jinja2 import Environment
from jinja2 import FileSystemLoader

import os.path
import yaml
import psycopg2
import datetime

script_root = os.path.dirname(__file__)

try:
  conn_string="dbname=osm user=osm " 
  conn = psycopg2.connect(conn_string)
except:
  print "Connection to database failed"

CONTINENT = os.environ.get('CONTINENT', 'xx')
DOMAIN    = os.environ.get('DOMAIN',    'dd')


def run_config_gen():
        curiso = conn.cursor()
        try:
          curiso.execute(""" 
              select iso, id, taginfo_scale , name, name_en   from xtaginfo order by iso
          """)
  
          rows = curiso.fetchall()
        except:
          print "Postgresql Query could not be executed"


        for row in rows:
            print "Generating taginfo-config: ", row[0] , row[1], row[2][0] , row[2][1], row[3]," ; ", row[4] 
            createiso_config(row[0],row[2],row[3],row[4] )
   

def createiso_config(iso, mapscale, name , name_en):

    map_width  = int(mapscale[0])
    map_height = int(mapscale[1])  

    map_minx   = float(mapscale[2])
    map_maxx   = float(mapscale[3])   
    map_miny   = float(mapscale[4])
    map_maxy   = float(mapscale[5])

    print "mapdata:", map_width, map_height, map_maxx, map_maxy,map_minx,map_miny , name , name_en 


#def dummy():
    template_name = 'template/taginfo-config.jinja2'
    environment = Environment(loader=FileSystemLoader(script_root))
    template = environment.get_template(template_name)
    tagconf = template.render(
        continent=CONTINENT,
        domain=DOMAIN,
        iso=iso.decode("utf8"),
        map_width=map_width, 
        map_height=map_height, 
        map_maxx=map_maxx, 
        map_maxy=map_maxy,
        map_minx=map_minx,
        map_miny=map_miny, 
        name=name.decode("utf8"), 
        name_en=name_en.decode("utf8"), 
        utcnow=datetime.datetime.utcnow().strftime('%Y-%m-%d:%H:%M').decode("utf8"),
    )
    # print tagconf

    config_directory='/osm/service/'+CONTINENT+'/'+iso+'/'
    if not os.path.exists(config_directory):
         os.makedirs(config_directory)


    fconf = open( config_directory + 'taginfo-config.json', 'w')
    fconf.write(tagconf.encode("utf8"))
    fconf.close()

    #  mapnik.render_to_file(m,'./export/'+iso+'.png', 'png')


run_config_gen()
