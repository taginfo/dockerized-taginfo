


DROP TABLE IF EXISTS xtaginfo;

CREATE TABLE xtaginfo (
	"name" varchar NULL,
	name_en varchar NULL,
	iso text NULL,
	id int8 NULL,
	gdname text NULL,
	osmid text NULL,
	admin_level int4 NULL,
	dx float8 NULL,
	wikidata varchar NULL,
	wikipedia varchar NULL,
	flag varchar NULL,
	port_order int8 NULL,
	geometry geometry NULL,
	txmin numeric NULL,
	txmax numeric NULL,
	tymin numeric NULL,
	tymax numeric NULL,
	ttype text NULL,
	area_pct numeric ,
	service text,
	taginfo_scale numeric[] NULL
);


INSERT INTO xtaginfo
     ("name",       name_en    ,gdname,  iso,  port_order , area_pct, ttype,service, taginfo_scale, id  ) VALUES
     ('Antarctica', 'Antarctica','antarctica', 'aq', 1,  1.0, 'normal', 'yes',   '{360,30,-180,180,-90,-60 }',    0   ) ;


\d+ xtaginfo

\x
select * from xtaginfo ;
