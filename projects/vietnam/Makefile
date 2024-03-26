startup:
	mkdir -p ./data
	pelias compose pull
	pelias elastic start
	pelias elastic wait
	pelias elastic create
	pelias download all
	pelias prepare all
	pelias import all
	pelias compose up -d

up:
	pelias compose up -d

clean:
	pelias compose down -v
	rm -rf ./data

reimport-csv:
	pelias compose kill elasticsearch
	rm -rf data/elasticsearch
	pelias elastic start
	pelias elastic wait
	pelias elastic create
	pelias import csv
	pelias compose up -d elasticsearch


