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


    # set languages ..
    if CONTINENT in ('na','ca','ao','aq'):
            lang1="name"
            lang2="name:en"
            lang3="name:es"
            lang4="name:fr"
            lang5="alt_name"
    elif CONTINENT in ('af'):
            lang1="name"
            lang2="name:en"
            lang3="name:es"
            lang4="name:fr"
            lang5="name:ar"              
    elif CONTINENT in ('sa'):
            lang1="name"
            lang2="name:en"
            lang3="name:es"
            lang4="name:fr"
            lang5="name:pt"            
    elif CONTINENT in ('as'):
            lang1="name"
            lang2="name:en"
            lang3="name:ru"
            lang4="name:zh"
            lang5="alt_name"
    elif CONTINENT in ('ru'):
            lang1="name"
            lang2="name:ru"
            lang3="name:en"        
            lang4="official_name"
            lang5="alt_name"
    elif CONTINENT in ('eu'):
            lang1="name"
            lang2="name:en"
            lang3="name:es"
            lang4="name:fr"
            lang5="name:de"
    else:
            lang1="name"
            lang2="name:en"
            lang3="name:es"
            lang4="name:fr"
            lang5="alt_name"

    # iso settings
    if iso[:2] == 'hu':
            lang1="name"
            lang2="name:en"
            lang3="name:hu"
            lang4="official_name"
            lang5="alt_name"
    elif iso[:2] == 'ro':
            lang1="name"
            lang2="name:en"
            lang3="name:ro"
            lang4="name:hu"
            lang5="alt_name"
    elif iso[:2] == 'de':
            lang1="name"
            lang2="name:en"
            lang3="name:de"
            lang4="name:dsb"
            lang5="name:hsb"
    elif iso == 'fr-cor':
            lang1="name"
            lang2="name:en"
            lang3="name:fr"
            lang4="name:co"
            lang5="alt_name"            
    elif iso[:2] == 'fr':
            lang1="name"
            lang2="name:en"
            lang3="name:fr"
            lang4="official_name"
            lang5="alt_name"
    elif iso[:2] == 'md':
            lang1="name"
            lang2="name:en"
            lang3="name:ro"
            lang4="name:ru"
            lang5="alt_name"

    elif iso[:2] == 'ie':
            lang1="name"
            lang2="name:en"
            lang3="name:ga"
            lang4="official_name"
            lang5="alt_name"

    elif iso[:2] == 'sk':
            lang1="name"
            lang2="name:en"
            lang3="name:sk"
            lang4="name:hu"
            lang5="name:cs"

    elif iso[:2] == 'cz':
            lang1="name"
            lang2="name:en"
            lang3="name:cs"
            lang4="name:sk"
            lang5="name:de"

    elif iso in ( 'es-ce','es-ml'):
            lang1="name"
            lang2="name:es"
            lang3="name:ar"
            lang4="name:ber"
            lang5="name:en"
              
    elif iso[:2] == 'es':
            lang1="name"
            lang2="name:es"
            lang3="name:eu"
            lang4="name:ca"
            lang5="name:gl"
            lang6="name:en"

    elif iso[:2] == 'pt':
            lang1="name"
            lang2="name:pt"
            lang3="name:mwl"
            lang4="name:en"
            lang5="name:es"

    elif iso == 'it-88':
            # Sardegna (Sardinia)
            lang1="name"
            lang2="name:it"
            lang3="name:ca"
            lang4="name:co"
            lang5="name:sc"

    elif iso == 'it-32':
            # Trentino-South Tyrol
            lang1="name"
            lang2="name:de"
            lang3="name:it"
            lang4="name:lld"
            lang5="name:en"    

    elif iso[:2] == 'it':
            lang1="name"
            lang2="name:it"
            lang3="name:de"
            lang4="name:fr"
            lang5="name:en"
    elif iso[:2] == 'im':
            # Isle of Man
            lang1="name"
            lang2="name:en"
            lang3="name:gv"
            lang4="name:fr"
            lang5="alt_name"
    elif iso[:2] == 'ir':
            # Iran
            lang1="name"
            lang2="name:fa"
            lang3="name:en"
            lang4="name:fr"
            lang5="alt_name"
    elif iso[:2] == 'in':
            # India
            lang1="name"
            lang2="name:en"
            lang3="name:kn"
            lang4="name:kn:iso15919"            
            lang5="name:ta"
            lang6="name:hi"
            lang7="name:mr"
            lang8="name:ml"
            lang9="name:te"                        

    elif iso[:2] == 'ht':
            # Haiti
            lang1="name"
            lang2="name:ht"
            lang3="name:fr"
            lang4="name:en"
            lang5="alt_name"
            
    elif iso[:2] == 'gr':
            # Greece
            lang1="name"
            lang2="name:el"
            lang3="name:en"
            lang4="int_name"
            lang5="alt_name"
            
    elif iso[:2] == 'fi':
            # Finland
            lang1="name"
            lang2="name:fi"
            lang3="name:sv"
            lang4="name:se"
            lang5="name:sme"
            lang6="name:smn"
            lang7="name:sms"

    elif iso[:2] == 'et':
            # Ethiopia
            lang1="name"
            lang2="name:en"
            lang3="name:am"
            lang4="name:om"
            lang5="name:so"
            lang6="name:ti"
            lang7="name:aa"
            lang8="name:sid"
            lang9="name:wal"            

    elif iso[:2] == 'cn':
            # China
            lang1="name"
            lang2="name:zh"
            lang3="name:zh_pinyin"
            lang4="name:en"
            lang5="alt_name"

    elif iso[:2] == 'bg':
            # Bulgaria
            lang1="name"
            lang2="name:bg"
            lang3="name:en"
            lang4="int_name"
            lang5="alt_name"

    elif iso[:2] == 'be':
            # Belgium
            lang1="name"
            lang2="name:fr"
            lang3="name:nl"
            lang4="name:en"
            lang5="name:de"

    elif iso[:2] == 'by':
            # Belarus
            lang1="name"
            lang2="name:ru"
            lang3="name:be"
            lang4="name:be-tarask"
            lang5="int_name"

    elif iso[:2] == 'au':
            # Australia
            lang1="name"
            lang2="name:en"
            lang3="name:aus"
            lang4="name:xwj"
            lang5="name:nys"

    elif iso[:2] == 'hr':
            # Croatia
            lang1="name"
            lang2="name:hr"
            lang3="name:sr"
            lang4="name:hu"
            lang5="name:en"

    elif iso[:2] == 'il':
            # Israel
            lang1="name"
            lang2="name:en"
            lang3="name:he"
            lang4="name:ar"
            lang5="alt_name"


    elif iso[:2] == 'ja':
            # Japan
            lang1="name"
            lang2="name:en"
            lang3="name:ja"
            lang4="name:ja_rm"
            lang5="name:ja_kana"

    elif iso[:2] in ( 'kp','kr'):
            # Korea ( kp & kr )
            lang1="name"
            lang2="name:en"
            lang3="name:ko"
            lang4="name:ko_rm"
            lang5="name:ko_hanja"

    elif iso[:2] == 'lu':
            # Luxemburg
            lang1="name"
            lang2="name:en"
            lang3="name:fr"
            lang4="name:de"
            lang5="name:lb"

    elif iso[:2] == 'ma':
            # Marocco
            lang1="name"
            lang2="name:ar"
            lang3="name:ber"
            lang4="name:en"
            lang5="name:fr"
            lang6="name:zgh"

    elif iso[:2] == 'nl':
            # Netherlands
            lang1="name"
            lang2="name:en"
            lang3="name:nl"
            lang4="name:fy"
            lang5="name:li"
            lang6="name:nds-nl"

    elif iso[:2] == 'nz':
            # New Zealand
            lang1="name"
            lang2="name:en"
            lang3="name:mi"
            lang4="alt_name"
            lang5="official_name"
            lang6="old_name"

    elif iso[:2] == 'no':
            # Norway
            lang1="name"
            lang2="name:en"
            lang3="name:no"
            lang4="name:nb"
            lang5="name:nn"
            lang6="name:se"
            lang7="name:fkv"
            lang8="name:smj"
            lang9="name:sma"
            lang10="name:sms"            

    elif iso[:2] == 'pl':
            # Poland
            lang1="name"
            lang2="name:en"
            lang3="name:pl"
            lang4="name:be"
            lang5="name:de"
            lang6="old_name"

    elif iso[:2] == 'sr':
            # Serbia
            lang1="name"
            lang2="name:en"
            lang3="name:sr"
            lang4="name:sr-Latn"
            lang5="name:hu"
            lang6="name:sq"

    elif iso[:2] == 'ch':
            # Switzerland
            lang1="name"
            lang2="name:en"
            lang3="name:de"
            lang4="name:fr"
            lang5="name:it"
            lang6="name:gsw"

    elif iso[:2] == 'th':
            # Thailand
            lang1="name"
            lang2="name:en"
            lang3="name:th"
            lang4="name:nod"
            lang5="name:mfa"

    elif iso[:2] == 'tn':
            # Tunesia
            lang1="name"
            lang2="name:ar"
            lang3="name:fr"
            lang4="name:en"
            lang5="alt_name"


    elif iso[:2] == 'ua':
            # Ukraine
            lang1="name"
            lang2="name:uk"
            lang3="name:ru"
            lang4="name:pl"
            lang5="name_en"
            lang6="name:crh"
            lang7="name:hu"

    elif iso[:2] == 'uz':
            # Uzbekistan
            lang1="name"
            lang2="name:uz"
            lang3="name:ru"
            lang4="name:en"
            lang5="name_de"
            lang6="alt_name:uz"
            lang7="alt_name:en"            

    elif iso[:2] == 'bt':
            # Bhutan
            lang1="name"
            lang2="name:en"
            lang3="name:dz"
            lang4="name:ne"
            lang5="name:dzl"
            lang6="name:lif"


    elif iso[:2] == 'np':
            # Nepal
            lang1="name"
            lang2="name:en"
            lang3="name:ne"
            lang4="name:mai"
            lang5="name:bho"

    elif iso[:2] == 'bd':
            # Bangladesh 
            lang1="name"
            lang2="name:en"
            lang3="name:bn"
            lang4="name:ctg"
            lang5="name:syl"


    elif iso[:2] == 'ge':
            # Georgia
            lang1="name"
            lang2="name:en"
            lang3="name:ka"
            lang4="name:ab"
            lang5="name:az"
            lang6="name:ru"

    elif iso[:2] == 'az':
            # Azerbaijan
            lang1="name"
            lang2="name:en"
            lang3="name:az"
            lang4="name:ru"
            lang5="name:hy"
 
    elif iso[:2] == 'vn':
            # Vietnam
            lang1="name"
            lang2="name:en"
            lang3="name:vi"
            lang4="name:fr"
            lang5="name:cn"
 
    elif iso[:2] == 'ee':
            # Estonia
            lang1="name"
            lang2="name:en"
            lang3="name:et"
            lang4="name:ru"
            lang5="name:uk"

    elif iso[:2] == 'lt':
            # Lithuania
            lang1="name"
            lang2="name:en"
            lang3="name:lt"
            lang4="name:ru"
            lang5="name:pl"

    elif iso[:2] == 'lv':
            # Latvia
            lang1="name"
            lang2="name:en"
            lang3="name:lv"
            lang4="name:ru"
            lang5="name:be"

    elif iso[:2] == 'se':
            # Sweden
            lang1="name"
            lang2="name:en"
            lang3="name:sv"
            lang4="name:fi"
            lang5="alt_name"

    elif iso[:2] == 'is':
            # Iceland
            lang1="name"
            lang2="name:en"
            lang3="name:is"
            lang4="official_name"
            lang5="alt_name"


    elif iso[:2] in ( 'ae','ye','sy','sa','qa','om','kw' ):
            # 
            lang1="name"
            lang2="name:ar"
            lang3="name:en"
            lang4="name:fr"
            lang5="alt_name"

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
        lang1=lang1,
        lang2=lang2,
        lang3=lang3,
        lang4=lang4,
        lang5=lang5,
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
