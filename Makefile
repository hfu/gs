
targets = \
	gs.geojson \
	gs_hospitals.geojson \
	gs_schools.geojson \
	gs_UN_facilities.geojson

all: $(targets)

clean:
	rm -rf tmp/opt_shp
	rm -rf tmp/gs_shp
	rm -rf tmp/gs.geojson

tmp/opt_metadata.json:
	curl https://data.humdata.org/dataset/2caf8373-816f-458c-9913-71bddb9cab7c/download_metadata?format=json -o tmp/opt_metadata.json

tmp/opt_shp.zip: tmp/opt_metadata.json
	cat tmp/opt_metadata.json | jq '.resources[] | select(.format | contains("SHP")) | .download_url' | xargs bash -c 'curl -L -o tmp/opt_shp.zip $$0'

tmp/opt_shp: tmp/opt_shp.zip
	mkdir -p tmp/opt_shp
	unzip tmp/opt_shp.zip -d tmp/opt_shp/

tmp/gs_shp: tmp/opt_shp
	mkdir -p tmp/gs_shp
	$(eval SHP_FILE_NAME=$(shell ls -1 tmp/opt_shp | grep adm1 | grep shp | head -n 1))
	ogr2ogr tmp/gs_shp tmp/opt_shp/$(SHP_FILE_NAME) -where "ADM1_EN='Gaza Strip'"

tmp/gs.geojson: tmp/gs_shp
	$(eval SHP_FILE_NAME=$(shell ls -1 tmp/gs_shp | grep adm1 | grep shp | head -n 1))
	ogr2ogr -f GeoJson tmp/gs.geojson tmp/gs_shp/$(SHP_FILE_NAME)

gs.geojson: tmp/gs.geojson
	cat tmp/gs.geojson | jq -c . > gs.geojson

tmp/gs_hospitals.json:
	curl 'https://overpass-api.de/api/interpreter' --data @overpassql/gs_hospitals.overpasssql > $@

gs_hospitals.geojson: tmp/gs_hospitals.json
	osmtogeojson tmp/gs_hospitals.json > $@

tmp/gs_schools.json:
	curl 'https://overpass-api.de/api/interpreter' --data @overpassql/gs_schools.overpasssql > $@

gs_schools.geojson: tmp/gs_schools.json
	osmtogeojson tmp/gs_schools.json > $@

tmp/gs_UN_facilities.json:
	curl 'https://overpass-api.de/api/interpreter' --data @overpassql/gs_UN_facilities.overpasssql > $@

gs_UN_facilities.geojson: tmp/gs_UN_facilities.json
	osmtogeojson tmp/gs_UN_facilities.json > $@
