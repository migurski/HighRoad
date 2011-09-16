SFO_LATLON = 37.807613 -122.279891
NYC_LATLON = 40.756749 -73.998284
LON_LATLON = 51.507553 -0.008271
MOS_LATLON = 55.882322 37.724175

all: index.html

index.html: \
	renders/sanfrancisco-10.png renders/sanfrancisco-11.png renders/sanfrancisco-12.png \
	renders/sanfrancisco-13.png renders/sanfrancisco-14.png renders/sanfrancisco-15.png \
	renders/sanfrancisco-16.png renders/sanfrancisco-17.png renders/sanfrancisco-18.png \
	renders/newyork-10.png renders/newyork-11.png renders/newyork-12.png \
	renders/newyork-13.png renders/newyork-14.png renders/newyork-15.png \
	renders/newyork-16.png renders/newyork-17.png renders/newyork-18.png \
	renders/london-10.png renders/london-11.png renders/london-12.png \
	renders/london-13.png renders/london-14.png renders/london-15.png \
	renders/london-16.png renders/london-17.png renders/london-18.png \
	renders/moscow-10.png renders/moscow-11.png renders/moscow-12.png \
	renders/moscow-13.png renders/moscow-14.png renders/moscow-15.png \
	renders/moscow-16.png renders/moscow-17.png renders/moscow-18.png



renders/sanfrancisco-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 10 -d 1024 512 -o $@

renders/sanfrancisco-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 11 -d 1024 512 -o $@

renders/sanfrancisco-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 12 -d 1024 512 -o $@

renders/sanfrancisco-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 13 -d 1024 512 -o $@

renders/sanfrancisco-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 14 -d 1024 512 -o $@

renders/sanfrancisco-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 15 -d 1024 512 -o $@

renders/sanfrancisco-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 16 -d 1024 512 -o $@

renders/sanfrancisco-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 17 -d 1024 512 -o $@

renders/sanfrancisco-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 18 -d 1024 512 -o $@



renders/newyork-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 10 -d 1024 512 -o $@

renders/newyork-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 11 -d 1024 512 -o $@

renders/newyork-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 12 -d 1024 512 -o $@

renders/newyork-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 13 -d 1024 512 -o $@

renders/newyork-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 14 -d 1024 512 -o $@

renders/newyork-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 15 -d 1024 512 -o $@

renders/newyork-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 16 -d 1024 512 -o $@

renders/newyork-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 17 -d 1024 512 -o $@

renders/newyork-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 18 -d 1024 512 -o $@



renders/london-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 10 -d 1024 512 -o $@

renders/london-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 11 -d 1024 512 -o $@

renders/london-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 12 -d 1024 512 -o $@

renders/london-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 13 -d 1024 512 -o $@

renders/london-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 14 -d 1024 512 -o $@

renders/london-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 15 -d 1024 512 -o $@

renders/london-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 16 -d 1024 512 -o $@

renders/london-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 17 -d 1024 512 -o $@

renders/london-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 18 -d 1024 512 -o $@



renders/moscow-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 10 -d 1024 512 -o $@

renders/moscow-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 11 -d 1024 512 -o $@

renders/moscow-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 12 -d 1024 512 -o $@

renders/moscow-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 13 -d 1024 512 -o $@

renders/moscow-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 14 -d 1024 512 -o $@

renders/moscow-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 15 -d 1024 512 -o $@

renders/moscow-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 16 -d 1024 512 -o $@

renders/moscow-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 17 -d 1024 512 -o $@

renders/moscow-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(MOS_LATLON) -z 18 -d 1024 512 -o $@



style.xml: style.mml stylesheet.mss
	cascadenik-compile.py style.mml style.xml

clean:
	rm -f sanfrancisco-*.png
	rm -f newyork-*.png
	rm -f london-*.png
	rm -f moscow-*.png
	rm -f style.xml
