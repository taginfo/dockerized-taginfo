﻿;
---
---
---  importand - imposm3 'use_single_id_space' id   to   short notations  
---
---  External variables:
--- ----------------------
---  ISO_FILTER          = SQL filter for generating config files
---  ISO_SERVICE_FILTER  = Generated config files, when Marked  'service' and generate them a service file 
---
---

;;;
\set VERBOSITY terse
;;;
CREATE OR REPLACE FUNCTION imposmid2shortid (id BIGINT ) RETURNS text AS $$
BEGIN
 RETURN CASE
   WHEN  (id >=     0 )               THEN 'n'|| id::text
   WHEN  (id >= -1e17 ) AND (id < 0 ) THEN 'w'|| (abs(id))::text   
   WHEN  (id <  -1e17 )               THEN 'r'|| (abs(id) -1e17)::text   
   ELSE 'error'||id::text
  END;
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT PARALLEL SAFE;

--  imposm3 'use_single_id_space' id   to   osm URL 
CREATE OR REPLACE FUNCTION imposmid2weburl (id BIGINT ) RETURNS text AS $$
BEGIN
 RETURN CASE
   WHEN  (id >=     0 )               THEN format('<a href="http://www.osm.org/node/%1$s">n%1$s</a>'     , id::text )
   WHEN  (id >= -1e17 ) AND (id < 0 ) THEN format('<a href="http://www.osm.org/way/%1$s">w%1$s</a>'      , (abs(id))::text )   
   WHEN  (id <  -1e17 )               THEN format('<a href="http://www.osm.org/relation/%1$s">r%1$s</a>' , (abs(id) -1e17)::text )  
   ELSE 'error_url'||id::text
  END;
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT PARALLEL SAFE;




CREATE OR REPLACE FUNCTION get_xtaginfo(iso text, xmin  numeric, xmax  numeric, ymin  numeric, ymax numeric ) 
      RETURNS numeric[]   AS
$BODY$
DECLARE
    i  integer ;
    xs numeric ;
    ys numeric ; 
    last_ok integer ;
    xd numeric;
    yd numeric;
    zzz numeric;
    xppd numeric;
    yppd numeric;
    moda numeric[] ;
BEGIN
    moda= ARRAY [
                 0.000,0.001,0.002,0.003,0.004,0.005,0.006,0.007,0.008,0.009
                ,0.010,0.011,0.012,0.013,0.014,0.015,0.016,0.017,0.018,0.019
                ,0.020,0.021,0.022,0.023,0.024,0.025,0.026,0.027,0.028,0.029
                ,0.030,0.031,0.032,0.033,0.034,0.035,0.036,0.037,0.038,0.039
                ,0.040,0.041,0.042,0.043,0.044,0.045,0.046,0.047,0.048,0.049
                ,0.050,0.051,0.052,0.053,0.054,0.055,0.056,0.057,0.058,0.059
                ,0.060,0.061,0.062,0.063,0.064,0.065,0.066,0.067,0.068,0.069
                ,0.070,0.071,0.072,0.073,0.074,0.075,0.076,0.077,0.078,0.079
                ,0.080,0.081,0.082,0.083,0.084,0.085,0.086,0.087,0.088,0.089
                ,0.090,0.091,0.092,0.093,0.094,0.095,0.096,0.097,0.098,0.099 
                
                ,0.100,0.101,0.102,0.103,0.104,0.105,0.106,0.107,0.108,0.109
                ,0.110,0.111,0.112,0.113,0.114,0.115,0.116,0.117,0.118,0.119
                ,0.120,0.121,0.122,0.123,0.124,0.125,0.126,0.127,0.128,0.129
                ,0.130,0.131,0.132,0.133,0.134,0.135,0.136,0.137,0.138,0.139
                ,0.140,0.141,0.142,0.143,0.144,0.145,0.146,0.147,0.148,0.149
                ,0.150,0.151,0.152,0.153,0.154,0.155,0.156,0.157,0.158,0.159
                ,0.160,0.161,0.162,0.163,0.164,0.165,0.166,0.167,0.168,0.169
                ,0.170,0.171,0.172,0.173,0.174,0.175,0.176,0.177,0.178,0.179
                ,0.180,0.181,0.182,0.183,0.184,0.185,0.186,0.187,0.188,0.189
                ,0.190,0.191,0.192,0.193,0.194,0.195,0.196,0.197,0.198,0.199 

                ,0.200,0.201,0.202,0.203,0.204,0.205,0.206,0.207,0.208,0.209
                ,0.210,0.211,0.212,0.213,0.214,0.215,0.216,0.217,0.218,0.219
                ,0.220,0.221,0.222,0.223,0.224,0.225,0.226,0.227,0.228,0.229
                ,0.230,0.231,0.232,0.233,0.234,0.235,0.236,0.237,0.238,0.239
                ,0.240,0.241,0.242,0.243,0.244,0.245,0.246,0.247,0.248,0.249
                ,0.250,0.251,0.252,0.253,0.254,0.255,0.256,0.257,0.258,0.259
                ,0.260,0.261,0.262,0.263,0.264,0.265,0.266,0.267,0.268,0.269
                ,0.270,0.271,0.272,0.273,0.274,0.275,0.276,0.277,0.278,0.279
                ,0.280,0.281,0.282,0.283,0.284,0.285,0.286,0.287,0.288,0.289
                ,0.290,0.291,0.292,0.293,0.294,0.295,0.296,0.297,0.298,0.299  

                ,0.300,0.301,0.302,0.303,0.304,0.305,0.306,0.307,0.308,0.309
                ,0.310,0.311,0.312,0.313,0.314,0.315,0.316,0.317,0.318,0.319
                ,0.320,0.321,0.322,0.323,0.324,0.325,0.326,0.327,0.328,0.329
                ,0.330,0.331,0.332,0.333,0.334,0.335,0.336,0.337,0.338,0.339
                ,0.340,0.341,0.342,0.343,0.344,0.345,0.346,0.347,0.348,0.349
                ,0.350,0.351,0.352,0.353,0.354,0.355,0.356,0.357,0.358,0.359
                ,0.360,0.361,0.362,0.363,0.364,0.365,0.366,0.367,0.368,0.369
                ,0.370,0.371,0.372,0.373,0.374,0.375,0.376,0.377,0.378,0.379
                ,0.380,0.381,0.382,0.383,0.384,0.385,0.386,0.387,0.388,0.389
                ,0.390,0.391,0.392,0.393,0.394,0.395,0.396,0.397,0.398,0.399 

                ,0.400,0.401,0.402,0.403,0.404,0.405,0.406,0.407,0.408,0.409
                ,0.410,0.411,0.412,0.413,0.414,0.415,0.416,0.417,0.418,0.419
                ,0.420,0.421,0.422,0.423,0.424,0.425,0.426,0.427,0.428,0.429
                ,0.430,0.431,0.432,0.433,0.434,0.435,0.436,0.437,0.438,0.439
                ,0.440,0.441,0.442,0.443,0.444,0.445,0.446,0.447,0.448,0.449
                ,0.450,0.451,0.452,0.453,0.454,0.455,0.456,0.457,0.458,0.459
                ,0.460,0.461,0.462,0.463,0.464,0.465,0.466,0.467,0.468,0.469
                ,0.470,0.471,0.472,0.473,0.474,0.475,0.476,0.477,0.478,0.479
                ,0.480,0.481,0.482,0.483,0.484,0.485,0.486,0.487,0.488,0.489
                ,0.490,0.491,0.492,0.493,0.494,0.495,0.496,0.497,0.498,0.499 

                ,0.500,0.501,0.502,0.503,0.504,0.505,0.506,0.507,0.508,0.509
                ,0.510,0.511,0.512,0.513,0.514,0.515,0.516,0.517,0.518,0.519
                ,0.520,0.521,0.522,0.523,0.524,0.525,0.526,0.527,0.528,0.529
                ,0.530,0.531,0.532,0.533,0.534,0.535,0.536,0.537,0.538,0.539
                ,0.540,0.541,0.542,0.543,0.544,0.545,0.546,0.547,0.548,0.549
                ,0.550,0.551,0.552,0.553,0.554,0.555,0.556,0.557,0.558,0.559
                ,0.560,0.561,0.562,0.563,0.564,0.565,0.566,0.567,0.568,0.569
                ,0.570,0.571,0.572,0.573,0.574,0.575,0.576,0.577,0.578,0.579
                ,0.580,0.581,0.582,0.583,0.584,0.585,0.586,0.587,0.588,0.589
                ,0.590,0.591,0.592,0.593,0.594,0.595,0.596,0.597,0.598,0.599 

                ];
    last_ok =0 ;
    xd = xmax-xmin;  
    yd = ymax-ymin; 
    FOR i IN 1..30000 LOOP
        xs = i * xd ;
        ys = i * yd ;

        IF  xs * ys  >= ( 255*255) THEN

        FOR ri IN REVERSE i..0 LOOP
           FOREACH  yppd IN ARRAY moda LOOP
             FOREACH  xppd IN ARRAY moda  LOOP
                 
                  xs=ri* (xd+   xppd ) ;
                  ys=ri* (yd+   yppd ) ; 

                  IF     
                             xs=round(xs) 
                         and ys=round(ys) 
                         and (  xs * ys ) <= (255*255) 
                         and xs>0 
                         and ys>0
                         THEN
                         RAISE NOTICE 'OK   R# = %, % , % , % ,% ,%', iso, ri , xs, ys,  xppd, yppd ; 

                        -- Reverse Antimeridian shift.
                         IF xmax+xppd > 180 THEN
                            xmax= xmax -180;
                            xmin= xmin -180;
                            RAISE NOTICE 'Reversed# = %, % , % , % ,% ,%', iso, ri , xs, ys,  xppd, yppd ; 

                            IF xmin <  -180  THEN
                                RAISE NOTICE 'ERROR: XMIN < -180# = %, % , % , % ,% ,%', iso, ri , xs, ys,  xppd, yppd ; 
                            END IF ;
                         END IF ;
                         RETURN  ARRAY[ round(xs) , round(ys) , xmin, xmax+xppd , ymin, ymax+yppd ] ;
                   END IF;               
             END LOOP;
           END LOOP ;
        END LOOP;   
        
        RETURN ARRAY[-2,0,0,0,0,0];

           
        END IF;

        
        IF  xs * ys  >= ( 255*255) 
        THEN  
           RETURN ARRAY[0,0,0,0,0,0]  ;
        END IF;   
        
    END LOOP;
       
    RETURN ARRAY[-1,0,0,0,0,0]  ;
END
$BODY$
LANGUAGE 'plpgsql' IMMUTABLE STRICT PARALLEL SAFE ;



DROP TABLE IF EXISTS  osm_admin2_continent_all ;
CREATE TABLE          osm_admin2_continent_all as
select a.*   
    ,st_area( ST_Intersection(  c.wkb_geometry  ,   a.geometry )) / st_area(  a.geometry )  as area_pct
    ,case 
            when a.iso3166_2!=''  then lower(a.iso3166_2) 
                                  else lower(a.iso3166_1)
            end   
            as iso
from KMLX_CONTINENT as c,
        osm_admin   as a
where 
        ( length(a.iso3166_1) = 2  or length(a.iso3166_2) > 3 )
    and 
        ST_Contains (c.wkb_geometry , St_PointOnSurface( a.geometry ))
;;

DROP TABLE IF EXISTS  osm_admin2_continent ;
CREATE TABLE          osm_admin2_continent as
select * 
from osm_admin2_continent_all   
  :ISO_FILTER
order by iso
;;    

\d+ osm_admin2_continent;
update osm_admin2_continent set name_en=name  where name_en='' ;


select count(*) as iso_admin_numbers from osm_admin2_continent;


DROP TABLE IF EXISTS iso_gdname CASCADE;
CREATE TABLE iso_gdname as
SELECT distinct on (t.iso) 
       t.iso, t."name" as iso_name , g."name" as gdname, st_area(g.wkb_geometry) as area
FROM osm_admin2_continent  as t
    ,gkml                  as g
where
     ST_Contains (   g.wkb_geometry  ,  t.geometry   )
order by t.iso, area NULLS LAST
;


Drop table IF EXISTS xtaginfo CASCADE;
create table xtaginfo as
with pdata as
(
    select distinct on (osm.iso) 
         osm.iso 
        ,name
        ,name_en
        ,id
        ,area_pct
        ,iso_gdname.gdname    as gdname
        ,imposmid2shortid(id) as osmid
        ,admin_level 
        ,row_number() OVER ( ORDER BY osm.iso ) as port_order 
        ,st_xmax( geometry)  - st_xmin( geometry)  as dx 
        ,wikidata
        ,wikipedia
        ,flag
        ,geometry
        ,st_area(geometry) as iso_area
        ,case when  (  :ISO_SERVICE_FILTER  )  then 'yes'
                                               else ''
         end as service     
    from osm_admin2_continent as osm
    left join iso_gdname on osm.iso=iso_gdname.iso
    ORDER BY osm.iso, iso_area DESC NULLS LAST
)
, normal_data as
(
    Select  
       *
       ,round ( (st_xmin( geometry) -  0.0051)::numeric, 2 ) as txmin
       ,round ( (st_xmax( geometry) +  0.0051)::numeric, 2 ) as txmax
       ,round ( (st_ymin( geometry) -  0.0051)::numeric, 2 ) as tymin
       ,round ( (st_ymax( geometry) +  0.0051)::numeric, 2 ) as tymax
       ,'normal'::text as ttype
       from pdata 
       where dx < 200 
       )
, antimerdian_data as
(
    Select  
       *
       ,round ( (st_xmin( ST_ShiftLongitude(geometry)) -  0.0051)::numeric, 2 ) as txmin
       ,round ( (st_xmax( ST_ShiftLongitude(geometry)) +  0.0051)::numeric, 2 ) as txmax
       ,round ( (st_ymin( ST_ShiftLongitude(geometry)) -  0.0051)::numeric, 2 ) as tymin
       ,round ( (st_ymax( ST_ShiftLongitude(geometry)) +  0.0051)::numeric, 2 ) as tymax
       ,'shifted'::text as ttype
       from pdata 
       where dx >= 200 
       )
       select * , get_xtaginfo(iso,txmin , txmax , tymin , tymax )  as taginfo_scale   from  normal_data       
union  select * , get_xtaginfo(iso,txmin , txmax , tymin , tymax )  as taginfo_scale   from  antimerdian_data
order by iso 
;


select iso, taginfo_scale,ttype, area_pct,  service  from xtaginfo order by iso ; 

