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
action is in [views.pgsql](https://github.com/migurski/HighRoad/blob/master/views.pgsql).

Details
-------

Taking a cue from Justin O’Bierne’s dearly-departed 41Latitude blog, High Road ensures
that each zoom level contains exactly three distinct levels of road: highways, major
roads, and minor roads, a simplification of OpenStreetMap’s conventional
[six-level hierarchy](http://wiki.openstreetmap.org/wiki/Map_Features#Highway).

At distant zoom levels, local and residential streets are omitted. Bold, simple
highways dominate the map, and the visual layering is categorical to clearly
separate each road type.

![Oakland, z11](https://github.com/migurski/HighRoad/raw/master/renders/sanfrancisco-11.png)

Deeper in to the map, local streets and highway ramps start to appear. You begin
to see block-scale details:

![Oakland, z13](https://github.com/migurski/HighRoad/raw/master/renders/sanfrancisco-13.png)

At the closest zoom levels, physical layering takes over and you begin to see over-
and underpasses as they exist in the built world:

![Oakland, z15](https://github.com/migurski/HighRoad/raw/master/renders/sanfrancisco-15.png)

![Oakland, for real](https://github.com/migurski/HighRoad/raw/master/renders/oakland.jpg)

Elsewhere
---------

A maze of ramps marks the east approach to New York’s
[Lincoln Tunnel](http://maps.google.com/maps?q=new+york+lincoln+tunnel&hl=en&ll=40.757408,-73.996997&spn=0.004575,0.011169&sll=37.0625,-95.677068&sspn=39.099308,58.007813&vpsrc=6&t=h&z=17):

![New York, z16](https://github.com/migurski/HighRoad/raw/master/renders/newyork-16.png)

A cloverleaf interchange on Moscow’s
[MKAD](http://en.wikipedia.org/wiki/Moscow_Ring_Road):

![Moscow, z14](https://github.com/migurski/HighRoad/raw/master/renders/london-14.png)

London’s dense network of trunk roads, centered on
[the Isle of Dogs](http://www.openstreetmap.org/?lat=51.5058&lon=-0.0111&zoom=12&layers=M):

![London, z12](https://github.com/migurski/HighRoad/raw/master/renders/london-12.png)
