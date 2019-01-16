:: run program
ogr2ogr --version

:: Create projected GeoJSON and select three states
ogr2ogr -f geojson data/projected.geojson -sql "select name from ne_10m_admin_1_states_provinces_lakes where name in ('Texas','Alaska','Kentucky')" -s_srs EPSG:4326 -t_srs EPSG:5070 data/ne_10m_admin_1_states_provinces_lakes.shp

:: Use ogr2ogr internal measurement feature
ogr2ogr -f CSV measure-states/output.csv -sql "select name, (OGR_GEOM_AREA/1000000) as sq_km from ne_10m_admin_1_states_provinces_lakes" data/projected.geojson