RENDERS = renders/
CITY_A = $(RENDERS)sanfrancisco
CITY_B = $(RENDERS)newyork
CITY_C = $(RENDERS)london
CITY_D = $(RENDERS)moscow
LOCATION_A = 37.807613 -122.279891
LOCATION_B = 40.756749 -73.998284
LOCATION_C = 51.507553 -0.008271
LOCATION_D = 55.882322 37.724175
ZOOMS = 10 11 12 13 14 15 16 17 18

SIZE = 1024 512

all: high-zoom-cities.html

high-zoom-cities.html: \
	$(ZOOMS:%=$(CITY_A)-%.png) \
	$(ZOOMS:%=$(CITY_B)-%.png) \
	$(ZOOMS:%=$(CITY_C)-%.png) \
	$(ZOOMS:%=$(CITY_D)-%.png)

$(CITY_A)-%.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LOCATION_A) -z $* -d $(SIZE) -o $@

$(CITY_B)-%.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LOCATION_B) -z $* -d $(SIZE) -o $@

$(CITY_C)-%.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LOCATION_C) -z $* -d $(SIZE) -o $@

$(CITY_D)-%.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LOCATION_D) -z $* -d $(SIZE) -o $@


style.xml: style.mml stylesheet.mss views.pgsql Makefile
	cascadenik-compile.py style.mml style.xml
	psql -U osm planet_osm < views.pgsql

clean:
	rm -f $(CITY_A)-*.png
	rm -f $(CITY_B)-*.png
	rm -f $(CITY_C)-*.png
	rm -f $(CITY_D)-*.png
	rm -f style.xml
	rm -f style-fg.xml
	rm -f style-bg.xml

