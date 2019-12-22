

# julia  -- ./taginfo/sources/db/problematic_tags.jl ./data/taginfo-db.db ./download/problematic_tags.xlsx

using SQLite, DataFrames, XLSX

#db = SQLite.DB("./data/taginfo-db.db")
db = SQLite.DB( ARGS[1] )

println("db   = ",ARGS[1])
println("xlsx = ",ARGS[2])

register(db, SQLite.regexp, nargs=2, name="regexp")
problematic_tags = SQLite.Query(db, """
    select *
    from tags
      where key in ('amenity', 'shop', 'leisure', 'man_made', 'tourism'
                     ,'craft','sport','emergency','historic','healthcare', 'military'
                     ,'university', 'club', 'golf' , 'playground'
                     ,'landuse', 'natural', 'waterway', 'waterway:sign', 'seamark:type'
                     ,'power', 'pipeline'
                     ,'aeroway', 'aerialway'
                     ,'boundary', 'place'
                     ,'highway', 'railway'
                     ,'public_transport', 'junction', 'barrier', 'entrance', 'route'
                      --| re-check: ,'building','building:part'
                     ,'building:use'
                -- material related tags:
                     ,'sidewalk'
                     ,'material','smoothness','trail_visibility'
                     ,'roof:material','building:material'
                     ,'roof:shape'                       -- extra valid values!!
                     ,'roof:orientation','roof'
                     ,'mineral'
                -- bycicle related tags:
                     ,'bicycle' ,'cycleway:lane'
                     ,'cycleway','cycleway:foot','cycleway:smoothness'
                     ,'bicycle_parking','service:bicycle:pump'
                -- surface ...  extra valid values!!
                    --# ,'cycleway:right:surface','cycleway:left:surface','cycleway:surface','surface'
                    --# ,'sidewalk:surface'
                -- hiking tags -acces
                     ,'access','footway','sac_scale','service','vehicle'
                     ,'hiking','bridge','crossing','toll'
                     ,'foot','segregated','horse'
                     ,'motor_vehicle','motorcycle','motorcar','moped','snowmobile','goods','bus'
                     ,'boat','canoe','motorboat','ship','agricultural'
                     ,'barrier','fence_type'
                     ,'tunnel','wall'
                     ,'wheelchair','toilets:wheelchair','ramp:wheelchair','toilets','diaper'
                     ,'unisex','male','female','dog'
                     ,'hearing_aids'
                     ,'usage','embankment'
                     ,'shelter'
                -- tourism:
                     ,'information','board_type'
                     ,'drinking_water','pump'
                -- food - restaurant
                     ,'fast_food', 'cuisine','takeaway','smoking'
                     ,'outdoor_seating','oven'
                     ,'diet:vegetarian','diet:vegan','diet:gluten_free'
                     ,'diet:halal','diet:kosher','diet:dairy_free'
                     ,'diet:lactose_free'
                     ,'fair_trade','organic','origin'
                     ,'wifi','internet_access'
                     ,'microbrewery'
                     ,'restaurant'
                     ,'vending','vending_machine'
                -- place_of_worship
                     ,'religion','denomination','church:type'
                -- historic - art
                     ,'stone_type','memorial','memorial:type'
                     ,'ruins','castle_type','tomb','megalith_type'
                     ,'bunker_type','historic:civilization'
                     ,'cemetery','artwork_type'
                     ,'building:architecture'
                -- tower - man-made ...
                     ,'tower:type','tower:construction','building:fireproof'
                     ,'electrified','design','transformer','wires','pole:type','structure'
                     ,'nuclear_explosion:type','generator:method','generator:source','generator:type'
                     ,'substation'
                     ,'operator:type','surveillance'
                     ,'industrial','gas','location'
                -- community
                     ,'community_centre','community_centre:for'
                     ,'club'
                -- natural
                     ,'leaf_type','leaf_cycle','denotation'  
                     ,'natural_protection'
                     ,'intermittent','seasonal'   
                -- other
                     ,'area','type','disused','abandoned','indoor','noname'
                     )

            -- lowcase, underscore, ':','-'  + separators: ';'   '; ' separator
            and (regexp('[^-a-z_:;]', replace(value,'; ','' )))

            -- and not in the wiki
            and ( in_wiki = 0 )
            and ( in_wiki_en = 0)
    ;
    """) |> DataFrame


# workaround: https://github.com/JuliaDatabases/SQLite.jl/issues/147
SQLite.drop!(db, "problematic_tags", ifexists=true)
tablename = problematic_tags |> SQLite.load!(db, "problematic_tags")

SQLite.Query(db, "CREATE INDEX problematic_tags_idx ON problematic_tags (key,value);")
SQLite.Query(db, "ANALYZE problematic_tags;")

XLSX.writetable( ARGS[2], collect(DataFrames.eachcol(problematic_tags)), DataFrames.names(problematic_tags), sheetname="problematic_tags")




# --------------
# value(az + numbers )  
#  'tracktype'
#  'traces'

# only number 
#  admin_level
#  beds