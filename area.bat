rem run program
ogr2ogr --version

rem make variables
set layer=ne_10m_admin_1_states_provinces_lakes
set states=where name in ('Kentucky','Texas','Alaska')
set unit=sq_mi
set factor=2.59e+6
set output=area.csv

rem project layer
ogr2ogr projected.shp -sql "select name from %layer% %states%" ^
 -s_srs EPSG:4326 -t_srs EPSG:5070 ^
 ..\data\%layer%.shp

rem calculate area
ogr2ogr %output% -sql ^
 "select name, (ogr_geom_area/%factor%) as %unit% from projected order by ogr_geom_area desc" ^
 projected.shp

rem clean up by deleting intermidiate layers
del projected.*