rem Create projected Shapefile
ogr2ogr projected.shp -sql ^
 "select name from ne_10m_admin_1_states_provinces_lakes where name in ('Texas','Alaska','Kentucky')" ^
 -s_srs EPSG:4326 -t_srs EPSG:5070 ^
 c:\BoydsGIS\data\ne_10m_admin_1_states_provinces_lakes.shp

rem Use ogr2ogr internal measurement feature
ogr2ogr output.csv -sql ^
 "select name, (OGR_GEOM_AREA/1000000) as sq_km from projected" ^
 projected.shp

rem Delete intermediate files
del projected.*