rem set variables
set states='Kentucky', 'Texas', 'Alaska'
set data=c:\BoydsGIS\data\ne_10m_admin_1_states_provinces_lakes.shp

rem print them to the CLI
echo looking for %states% in %data%

rem Describe data
ogrinfo -so -al ^
 -where "name in (%states%)" ^
 %data%


