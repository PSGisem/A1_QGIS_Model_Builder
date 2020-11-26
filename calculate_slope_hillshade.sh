#!/bin/sh

ogr2ogr -f "ESRI Shapefile" koper.shp -where NAME_2 gadm36_SVN.gpkg gadm36_SVN_2
# koper.shp aus gadm36_SVN.gpkg erstellen

# Verify that the resulting koper.shp file contains exactly one feature by executing the command
ogrinfo koper.shp koper -so

gdalwarp -cutline koper.shp -crop_to_cutline -t_srs EPSG:32632 dem_merge.tif dem_merge_newcrs.tif
# ##clip + Transformation of the koper.shp EPSG:XY to koper.shp in ESPG:32632
# dem\_merge.tif -- dem_merge_new_crs.tif

# $ gdalwarp -cutline koper.shp -crop_to_cutline -t_srs EPSG:32632 dem_merge.tif dem_merge_newcrs.tif
# ERROR 1: Did not get any cutline features.


gdaldem slope dem_merge_newcrs.tif dem_merge_newcrs_slope.tif
# https://gdal.org/programs/gdaldem.html?highlight=slope
# dem_slope.tif

gdaldem hillshade dem_merge_newcrs_slope.tif dem_merge_newcrs_slope_hillshade.tif
# https://gdal.org/programs/gdaldem.html?highlight=hillshade



