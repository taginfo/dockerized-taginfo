import mapnik
import cairo 
import psycopg2
import os
import sys
from shutil import copyfile

try:
  conn_string="dbname=osm user=osm " 
  conn = psycopg2.connect(conn_string)
except:
  print("Connection to database failed")


CONTINENT = os.environ.get('CONTINENT', 'xx')
DOMAIN    = os.environ.get('DOMAIN',    'dd')


def run_background_map_gen():
        curiso = conn.cursor()
        try:
          curiso.execute(""" 
              select iso, id, taginfo_scale , name , name_en  from xtaginfo order by iso;
          """)
  
          rows = curiso.fetchall()
        except:
          print("Postgresql Query could not be executed - setup_map.py")
          sys.exit(1)

        for row in rows:
            print( "Generating background map: ", row[0] , row[1], row[2][0] , row[2][1] , row[3])
            createisomap(row[0],row[2],row[3],row[4] )



def createisomap(iso, mapscale, name , name_en ):

    map_width  = int(mapscale[0])
    map_height = int(mapscale[1])  


    map_minx   = float(mapscale[2])
    map_maxx   = float(mapscale[3])   
    map_miny   = float(mapscale[4])
    map_maxy   = float(mapscale[5])

    print("mapdata:", map_width, map_height, map_maxx, map_maxy,map_minx,map_miny )


    geojsonfile='/osm/service/'+CONTINENT+'/'+iso+'/poly/osm.geojson'

    m = mapnik.Map( map_width ,map_height ) # create a map with a given width and height in pixels
    # note: m.srs will default to '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'
    # the 'map.srs' is the target projection of the map and can be whatever you wish 
    m.background = mapnik.Color('#000000') # set background colour to 'steelblue'.  

    s = mapnik.Style() # style object to hold rules
    r = mapnik.Rule() # rule object to hold symbolizers
    # to fill a polygon we create a PolygonSymbolizer

    psymbolizer = mapnik.PolygonSymbolizer()
    #psymbolizer.fill = mapnik.Color('#f2eff9')
    psymbolizer.fill = mapnik.Color('#000000')
    r.symbols.append(psymbolizer)

    lsymbolizer = mapnik.LineSymbolizer()
    #lsymbolizer.stroke = mapnik.Color('rgb(50%,50%,50%)')
    lsymbolizer.stroke = mapnik.Color('#FFA500') 
    lsymbolizer.stroke_width = 0.8
    r.symbols.append(lsymbolizer)

    s.rules.append(r) # now add the rule to the style and we're done

    m.append_style('My Style',s) # Styles are given names only as they are applied to the map

    ds = mapnik.Ogr(file=geojsonfile  , layer_by_index=0 )
    print(ds)

    ds.envelope()

    layer = mapnik.Layer('world') # new layer called 'world' (we could name it anything)
    # note: layer.srs will default to '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'

    layer.datasource = ds
    layer.styles.append('My Style')

    m.layers.append(layer)

    bbox = mapnik.Box2d( map_maxx, map_maxy, map_minx, map_miny )
    m.zoom_to_box(bbox)

    # Write the data to a png image called world.png the current directory
    
    img_directory='/osm/service/'+CONTINENT+'/'+iso+'/img/'
    if not os.path.exists(img_directory):
       os.makedirs(img_directory)

    os.system("rm -f "+ img_directory + "*" )
    
    mapnik.render_to_file(m,img_directory+'dbackground0.png', 'png')


    gdalw1='gdalwarp    -te {} {} {} {}  -ts {} {} '.format(map_minx,map_miny,map_maxx,map_maxy,map_width,map_height)
    # NE1_HR_LC_SR_W_DR.tif
    gdalw2=' -of GTiff   /osm/ne/ne.tif {}  '.format( img_directory + 'nebackground.geotif' )

    print("gdalw:" , gdalw1, gdalw2 )
    
    os.system(gdalw1+gdalw2)

    os.system('gdal_translate -of PNG  {} {} '.format( img_directory + 'nebackground.geotif',  img_directory + 'nebackground.png') )

    os.system('convert   {} -transparent Black {} '.format(  img_directory + 'dbackground0.png' , img_directory + 'tdbackground.png' ) )
    os.system('composite {} -compose over   {} {} '.format(  img_directory + 'tdbackground.png' , img_directory + 'nebackground.png',  img_directory + 'dbackground.png') )



    ######################  flag ##################################

    im_cmd1=r'convert /osm/setup/osmlogo.png -font DejaVu-Serif -fill darkblue  -pointsize 34 -gravity center -draw "text 16,-18'
    im_cmd2=r" '."+iso[:2]+"' "
    im_cmd3=r'"  ' + img_directory+'dflag.png'

    os.system(im_cmd1+im_cmd2+im_cmd3)


    ####################  Logo #####################################

    surface = cairo.ImageSurface(cairo.FORMAT_ARGB32, 448, 98)
    ctx = cairo.Context (surface)
    ctx.select_font_face("Courier", cairo.FONT_SLANT_NORMAL,   cairo.FONT_WEIGHT_BOLD)

    ctx.set_font_size(42) 
    ctx.move_to(2, 50)
    ctx.set_source_rgb(0.0, 0.0, 0.15) 
    ctx.show_text('Taginfo-'+CONTINENT+'-'+iso)
    
    ctx.select_font_face('Sans') 
    if   len(name_en) > 26 :
           ctx.set_font_size(20)
    elif len(name_en) > 18 :
           ctx.set_font_size(26)
    else:
           ctx.set_font_size(30)

    ctx.move_to(1, 90) 
    ctx.set_source_rgb(0.0, 0.0, 0.35) 
    ctx.show_text( name_en )

    # finish up
    ctx.stroke() 
    surface.write_to_png(img_directory+'dlogo.png') 


run_background_map_gen()
