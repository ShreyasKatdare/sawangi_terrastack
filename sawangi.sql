CREATE EXTENSION postgis;
--Just checking the data
SELECT * FROM sawangi;

--Question 2
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sawangi';

--Question 3.1
--5 Hectare = 50000 sqm
SELECT COUNT(*) AS num_polygons
FROM sawangi
WHERE ST_Area(geom) > 50000;

--Question 3.2
SELECT COUNT(*) AS num_null_pins
FROM sawangi
WHERE pin IS NULL;

--Perimeter before deleting
SELECT SUM(ST_Perimeter(geom)) AS perimeter
FROM sawangi;
DELETE FROM sawangi
WHERE pin IS NULL;
SELECT COUNT(*) AS num_plots_remaining
FROM sawangi

--Perimeter after deleting
SELECT SUM(ST_Perimeter(geom)) AS perimeter_after_delete
FROM sawangi;

WITH dissolved_polygon AS (
    SELECT ST_Union(geom) AS geom
    FROM sawangi
)
-- Calculate perimeter of the dissolved polygon
SELECT ST_Perimeter(geom) AS perimeter
FROM dissolved_polygon;
