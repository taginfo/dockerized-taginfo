from jinja2 import Template
from jinja2 import Environment
from jinja2 import FileSystemLoader

import os
import sys
import yaml
import psycopg2
import datetime

reload(sys)
sys.setdefaultencoding('utf-8')


script_root = os.path.dirname(__file__)

try:
  conn_string="dbname=osm user=osm "
  conn = psycopg2.connect(conn_string)
except:
  print "Connection to database failed"
  sys.exit()

CONTINENT       = os.environ.get('CONTINENT',  'xx')
CONTINENT_LONG  = os.environ.get('CONTINENT_LONG',  'xx_l')
START_PORT      = int( os.environ.get('START_PORT', '2000') )
DOMAIN          = os.environ.get('DOMAIN',    'dd')


def run_config_gen():
        curiso = conn.cursor()
        try:
          curiso.execute("""
                select
                  iso
                , name_en
                , name
                , gdname
                , port_order
                , ((area_pct*100)::numeric(8,4))::text                      as area_pct
                , case when ttype='shifted' then 'antimeridian' else '' end as antimeridian
                , service
                from xtaginfo order by iso, name_en;
          """)
          rows = curiso.fetchall()
        except:
          print "Postgresql Query could not be executed"
          sys.exit()

        items = []
        items_tagservice = []

        for row in rows:
            if row[3]=='':
                gdvname=CONTINENT_LONG
            elif row[3] is None:
                gdvname=CONTINENT_LONG
            else:
                gdvname=row[3]

            tcomment=''
            if row[5] != '100.0000':
                tcomment+=  ( 'area_pct=='+ row[5]+'%' )

            if row[6] !='':
                tcomment+=' antimeridian'

            an_item = dict(iso=row[0], name_en=row[1], name=row[2], gdname=gdvname, port_order= START_PORT + row[4] , comment=tcomment , service=row[7] )
            items.append(an_item)

            if row[7]=='yes':
                items_tagservice.append(an_item)      

        if len(items)>0:
            gentemplate(items, 'template/docker-compose.jinja2',        '/osm/service/'+ CONTINENT +'/' ,   'docker-compose.yml'   )
            gentemplate(items, 'template/docker-compose-job.jinja2',    '/osm/service/'+ CONTINENT +'/' ,   'docker-compose-job.yml'   )
            gentemplate(items, 'template/docker-compose-proxy.jinja2',  '/osm/service/'+ CONTINENT +'/' ,   'docker-compose-proxy.yml'   )

            gentemplate(items, 'template/readme.jinja2',                '/osm/service/'+ CONTINENT +'/' ,   'README.md'   )
            gentemplate(items, 'template/Makefile.jinja2',              '/osm/service/'+ CONTINENT +'/' ,   'Makefile'   )

            gentemplate(items,            'template/job.sh.jinja2',                '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_job.sh.txt'   )
            gentemplate(items,            'template/job_test.sh.jinja2',           '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_job_test.sh.txt'   )

            gentemplate(items,            'template/service_create.sh.jinja2',     '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_create.sh.txt'   )
            gentemplate(items,            'template/service_up.sh.jinja2',         '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_up.sh.txt'   )
            gentemplate(items,            'template/service_rm.sh.jinja2',         '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_rm.sh.txt'   )
            gentemplate(items,            'template/service_down.sh.jinja2',       '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_down.sh.txt'   )
            gentemplate(items,            'template/service_restart.sh.jinja2',    '/osm/service/'+ CONTINENT +'/' ,   'config_all_service_restart.sh.txt'   )

            gentemplate(items_tagservice, 'template/job.sh.jinja2',                '/osm/service/'+ CONTINENT +'/' ,   'service_job.sh')
            gentemplate(items_tagservice, 'template/job_test.sh.jinja2',           '/osm/service/'+ CONTINENT +'/' ,   'service_job_test.sh')

            gentemplate(items_tagservice, 'template/service_create.sh.jinja2',     '/osm/service/'+ CONTINENT +'/' ,   'service_create.sh'   )
            gentemplate(items_tagservice, 'template/service_up.sh.jinja2',         '/osm/service/'+ CONTINENT +'/' ,   'service_up.sh'   )
            gentemplate(items_tagservice, 'template/service_rm.sh.jinja2',         '/osm/service/'+ CONTINENT +'/' ,   'service_rm.sh'   )
            gentemplate(items_tagservice, 'template/service_down.sh.jinja2',       '/osm/service/'+ CONTINENT +'/' ,   'service_down.sh'   )
            gentemplate(items_tagservice, 'template/service_restart.sh.jinja2',    '/osm/service/'+ CONTINENT +'/' ,   'service_restart.sh'   )

            gentemplate(items_tagservice, 'template/index.md.jinja2',              '/osm/service/'+ CONTINENT +'/' ,   'service_index.md'   )

        else:
            print " Empy / bad  SQL query -  check !!!"

        #print items


def gentemplate(items, template_name,  out_file_dir, out_file_name ):

    # template_name = 'template/docker-compose.jinja2'
    environment = Environment(loader=FileSystemLoader(script_root))
    template = environment.get_template(template_name)
    tagconf = template.render(
        items=items,
        continent=CONTINENT,
        continent_long=CONTINENT_LONG,
        domain=DOMAIN,
        utcnow=datetime.datetime.utcnow().strftime('%Y-%m-%d:%H:%M').decode("utf8"),

    )
    # print tagconf.encode('utf-8')
    # dockerconfig_directory='/osm/service/'+ CONTINENT +'/'
    if not os.path.exists( out_file_dir  ):
         os.makedirs( out_file_dir )

    fconf = open(  out_file_dir + out_file_name , 'w')
    fconf.write(tagconf.encode("utf8"))
    fconf.close()

run_config_gen()


