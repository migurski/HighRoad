High Road
=========

This may be the last OpenStreetMap road query you will ever need.

Between [Mapnik](http://mapnik.org), [Cascadenik](https://github.com/mapnik/Cascadenik/wiki),
and [Carto](http://developmentseed.org/blog/2011/feb/09/introducing-carto-css-map-styling-language/),
you’ve got a few options for rendering [OSM](http://openstreetmap.org) data to tiles.
High Road makes it easier to draw the road bits by hiding complicated PostGIS queries
behind [views](http://www.postgresql.org/docs/8.3/interactive/tutorial-views.html),
so that you can declutter your layer names while ensuring that you’re using the right
selection of roads for each zoom level.

There’s a sample [Cascadenik style](https://github.com/migurski/HighRoad/blob/master/stylesheet.mss)
and [layer file](https://github.com/migurski/HighRoad/blob/master/style.mml), but the real
action is in [views.pgsql](https://github.com/migurski/HighRoad/blob/master/views.pgsql),
where you’ll find a comprehensive set of Postgres views against the usual `planet_osm_line`
table produced by [Osm2pgsql](http://wiki.openstreetmap.org/wiki/Osm2pgsql).

To use High Road, run the source of `views.pgsql` against your existing OSM rendering
database and check out the sample files to understand what each query is doing. 

High Road is made by Michal Migurski, Nathaniel Kelso and Geraldine Sarmiento
of [Stamen Design](http://stamen.com).

Setup
-----

High Road can be applied to an existing OpenStreetMap rendering database
created with osm2pgsql (http://wiki.openstreetmap.org/wiki/Osm2pgsql). Using
the command-line psql utility, you can add High Road views like this:
 
    psql -U username -f high_road_views-setup.pgsql databasename

The views here assume that you've created your database using the default
settings of osm2pgsql, including the prefix of "planet_osm". If you've chosen
a different prefix, you should find every instance of "planet_osm" in the
script below and replace is with your chosen prefix. The typical username 
for OSM databases is `osm` and the typical databasename is `planet_osm`.

More details in the `high_road_views-setup.pgsql` file comments.


Removal, upgrading
------------------

High Road can be removed from an existing OpenStreetMap rendering database. 

NOTE: To upgrade your OSM planet, High Road will need to be removed before OSM import, then setup again after OSM import.

Using the command-line psql utility, you can remove High Road views like this:
 
     psql -U username -f high_road_views-remove.pgsql databasename
 
The views here assume that you've created your database using the default
settings of osm2pgsql, including the prefix of "planet_osm". If you've chosen
a different prefix, you should find every instance of "planet_osm" in the
script below and replace is with your chosen prefix.

This is the same as if you logged into Postgres:

    psql -U username -d databasename
    
And dropped the views manually:

    DROP VIEW planet_osm_line_z15plus CASCADE;
    DROP VIEW planet_osm_line_z14 CASCADE;
    DROP VIEW planet_osm_line_z13 CASCADE;
    DROP VIEW planet_osm_line_z12 CASCADE;
    DROP VIEW planet_osm_line_z11 CASCADE;
    DROP VIEW planet_osm_line_z10 CASCADE;


Details
-------

Taking a cue from Justin O’Bierne’s dearly-departed 41Latitude blog, High Road ensures
that each zoom level contains exactly three distinct levels of road: highways, major
roads, and minor roads, a simplification of OpenStreetMap’s conventional
[six-level hierarchy](http://wiki.openstreetmap.org/wiki/Map_Features#Highway).

At distant zoom levels, local and residential streets are omitted. Bold, simple
highways dominate the map, and the visual layering is categorical to clearly
separate each road type.

![Oakland, z11](https://github.com/migurski/HighRoad/raw/master/renders/sanfrancisco-11.jpg)

Deeper in to the map, local streets and highway ramps start to appear. You begin
to see block-scale details:

![Oakland, z13](https://github.com/migurski/HighRoad/raw/master/renders/sanfrancisco-13.jpg)

At the closest zoom levels, physical layering takes over and you begin to see over-
and underpasses as they exist in the built world:

![Oakland, z15](https://github.com/migurski/HighRoad/raw/master/renders/sanfrancisco-15.jpg)

![Oakland, for real](https://github.com/migurski/HighRoad/raw/master/renders/oakland.jpg)

Elsewhere
---------

A maze of ramps marks the east approach to New York’s
[Lincoln Tunnel](http://maps.google.com/maps?q=new+york+lincoln+tunnel&hl=en&ll=40.757408,-73.996997&spn=0.004575,0.011169&sll=37.0625,-95.677068&sspn=39.099308,58.007813&vpsrc=6&t=h&z=17):

![New York, z16](https://github.com/migurski/HighRoad/raw/master/renders/newyork-16.jpg)

A cloverleaf interchange on Moscow’s
[MKAD](http://en.wikipedia.org/wiki/Moscow_Ring_Road):

![Moscow, z14](https://github.com/migurski/HighRoad/raw/master/renders/moscow-14.jpg)

London’s dense network of trunk roads, centered on
[the Isle of Dogs](http://www.openstreetmap.org/?lat=51.5058&lon=-0.0111&zoom=12&layers=M):

![London, z12](https://github.com/migurski/HighRoad/raw/master/renders/london-12.jpg)
