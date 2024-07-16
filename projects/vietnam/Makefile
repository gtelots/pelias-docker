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

api-build:
	docker build -t ttungbmt/pelias-api:latest ./api
	docker tag ttungbmt/pelias-api:latest ttungbmt/pelias-api:latest

api-push:
	docker push ttungbmt/pelias-api:latest


