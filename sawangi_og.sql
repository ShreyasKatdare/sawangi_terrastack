WITH dissolved_polygon AS (
    SELECT ST_Union(geom) AS geom
    FROM sawangi_og
)
-- Calculate perimeter of the dissolved polygon
SELECT ST_Perimeter(geom) AS perimeter
FROM dissolved_polygon;
