BEGIN;

DROP VIEW IF EXISTS planet_osm_line_z15plus_big;
DROP VIEW IF EXISTS planet_osm_line_z15plus_small;
DROP VIEW IF EXISTS planet_osm_line_z15plus;
DROP VIEW IF EXISTS planet_osm_line_z14;
DROP VIEW IF EXISTS planet_osm_line_z13;
DROP VIEW IF EXISTS planet_osm_line_z12;
DROP VIEW IF EXISTS planet_osm_line_z11;
DROP VIEW IF EXISTS planet_osm_line_z10;

DELETE FROM geometry_columns
WHERE f_table_name
   IN ('planet_osm_line_z15plus_big', 'planet_osm_line_z15plus_small',
       'planet_osm_line_z15plus', 'planet_osm_line_z14', 'planet_osm_line_z13',
       'planet_osm_line_z12', 'planet_osm_line_z11', 'planet_osm_line_z10');



CREATE VIEW planet_osm_line_z10 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'trunk') THEN 'highway'
               WHEN highway IN ('primary') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         'no' AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway', 'trunk') THEN 0
               WHEN highway IN ('primary') THEN 1
               WHEN highway IN ('secondary', 'tertiary') THEN 2
               ELSE 99 END) AS priority
  FROM (

      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'trunk')
         OR highway IN ('primary')
         OR highway IN ('secondary')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'trunk')
         OR highway IN ('primary')
         OR highway IN ('secondary')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z11 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'trunk') THEN 'highway'
               WHEN highway IN ('primary') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         'no' AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway', 'trunk') THEN 0
               WHEN highway IN ('primary') THEN 1
               WHEN highway IN ('secondary', 'tertiary') THEN 2
               ELSE 99 END) AS priority
  FROM (

      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'trunk')
         OR highway IN ('primary')
         OR highway IN ('secondary', 'tertiary')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'trunk')
         OR highway IN ('primary')
         OR highway IN ('secondary', 'tertiary')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z12 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link') THEN 'highway'
               WHEN highway IN ('secondary', 'primary') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway', 'trunk') THEN 0
               WHEN highway IN ('secondary', 'primary') THEN 1
               WHEN highway IN ('tertiary', 'residential', 'unclassified', 'road') THEN 2
               WHEN highway LIKE '%_link' THEN 3
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('secondary', 'primary')
         OR highway IN ('tertiary', 'residential', 'unclassified', 'road', 'unclassified')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('secondary', 'primary')
         OR highway IN ('tertiary', 'residential', 'unclassified', 'road', 'unclassified')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z13 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link') THEN 'highway'
               WHEN highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway', 'trunk') THEN 0
               WHEN highway IN ('motorway_link', 'trunk_link') THEN 1
               WHEN highway IN ('primary', 'secondary', 'tertiary') THEN 2
               WHEN highway IN ('primary_link', 'secondary_link') THEN 3
               WHEN highway IN ('residential', 'unclassified', 'road') THEN 4
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z14 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link') THEN 'highway'
               WHEN highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         -- highways still need to be layered on top of everything else at z14
         (CASE WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link') THEN 0
               ELSE 99 END) AS grouping,

         -- explicit layer is the physical layering of under- and overpasses
         (CASE WHEN layer ~ E'^-?[[:digit:]]+(\.[[:digit:]]+)?$' THEN CAST (layer AS FLOAT)
               ELSE 0
               END) AS explicit_layer,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('trunk') THEN 1
               WHEN highway IN ('primary') THEN 2
               WHEN highway IN ('secondary') THEN 3
               WHEN highway IN ('tertiary') THEN 4
               WHEN highway LIKE '%_link' THEN 5
               WHEN highway IN ('residential', 'unclassified', 'road') THEN 6
               WHEN highway IN ('unclassified', 'service', 'minor') THEN 7
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline, 1 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
    
      UNION
      
      SELECT *, 'casing' AS render, 0 AS is_outline, 1 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline, 0 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')

  ) AS roads

-- Large roads are drawn on top of smaller roads.
-- Casings for segments are underneath corresponding inlines.
-- Explicit physical layers are drawn in order.
-- Outlines go behind everything else.
-- Highways are separated from other roads and drawn on top.
--
ORDER BY grouping DESC, is_outline DESC, explicit_layer ASC, is_casing DESC, priority DESC;



CREATE VIEW planet_osm_line_z15plus AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link') THEN 'highway'
               WHEN highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'major_road'
               WHEN highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway') THEN 'path'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         -- explicit layer is the physical layering of under- and overpasses
         (CASE WHEN layer ~ E'^-?[[:digit:]]+(\.[[:digit:]]+)?$' THEN CAST (layer AS FLOAT)
               ELSE 0
               END) AS explicit_layer,

         -- implied layer is guessed based on bridges and tunnels
         (CASE WHEN tunnel in ('yes', 'true') THEN -1
               WHEN bridge in ('yes', 'true') THEN 1
               ELSE 0
               END) AS implied_layer,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('trunk') THEN 1
               WHEN highway IN ('primary') THEN 2
               WHEN highway IN ('secondary') THEN 3
               WHEN highway IN ('tertiary') THEN 4
               WHEN highway LIKE '%_link' THEN 5
               WHEN highway IN ('residential', 'unclassified', 'road') THEN 6
               WHEN highway IN ('unclassified', 'service', 'minor') THEN 7
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline, 1 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
         OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
    
      UNION
      
      SELECT *, 'casing' AS render, 0 AS is_outline, 1 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
         OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline, 0 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link')
         OR highway IN ('primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
         OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')

  ) AS roads

-- Large roads are drawn on top of smaller roads.
-- Casings for segments are underneath corresponding inlines.
-- Implicit physical layers (tunnels, bridges) are drawn in order.
-- Explicit physical layers are drawn in order.
-- Outlines go behind everything else.
--
ORDER BY is_outline DESC, explicit_layer ASC, implied_layer ASC, is_casing DESC, priority DESC;



CREATE VIEW planet_osm_line_z15plus_big AS
  SELECT *
  FROM planet_osm_line_z15plus
  WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link')
     OR highway IN ('secondary', 'secondary_link', 'tertiary', 'tertiary_link')
  ORDER BY priority DESC;



CREATE VIEW planet_osm_line_z15plus_small AS
  SELECT *
  FROM planet_osm_line_z15plus
  WHERE highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
     OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
  ORDER BY priority DESC;



INSERT INTO geometry_columns
(f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, "type")
VALUES
    ('', 'public', 'planet_osm_line_z10', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z11', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z12', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z13', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z14', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z15plus', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z15plus_big', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z15plus_small', 'way', 2, 900913, 'LINESTRING');



COMMIT;
