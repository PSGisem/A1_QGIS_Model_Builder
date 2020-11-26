# Answers to Assignment 1.2

## 1. Preperation
Preperation worked out well.

## 2. GDAL/ORG
### 2.1

Data: gdalinfo n45_e013_1arc_v3.tif
1. Coordinate reference system: EPSG 4326
2. driver: GTiff/GeoTIFF
3. spatial resolution: 3601x1  // Unit Type: m

Data: gdalinfo N45E014.hgt
1. Coordinate reference system: EPSG 4326
2. driver: SRTMHGT/SRTMHGT File Format
3. spatial resolution: 3601x1  // Unit Type: m

### 2.2 Creating a raster mosaik

1. Raster Mosaik .tif
using the command `gdal_merge`
info: https://gdal.org/programs/gdal_merge.html

command: gdal_merge.py -o dem_merge.tif N45E014.hgt n45_e013_1arc_v3.tif

2. Raster mosaik .vrt
using the command `gdalbuildvrt`
info: https://gdal.org/programs/gdalbuildvrt.html

command: gdalbuildvrt -separate dem_built.vrt dem_merge.tif N45E014.hgt

3. Questions:
-- What is the difference between the two output files? 

VRT is a "virtual dataset" that is a mosaic of the list of input GDAL datasets. So it´s not an image or one file, but a collection of different files in a specific order.

In contrast, "gdal_merge" merges the files to one file, so the original files can´t be seperated again easily.

-- What might be an advantage of using `gdalbuildvrt` instead of `gdalmerge`?

The advantage is, that the original files are still available using `gdalbuildvrt`. With `gdalmerge` the original files are "lost"/merged to one. If you don´t have a copy, you can´t access them anymore.

## 3. Creating a GDAL/OGR script  





