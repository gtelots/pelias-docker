init:
	pelias compose pull
	mkdir -p ./data
	pelias elastic start
	pelias elastic wait
	pelias elastic create
	pelias download all
	# pelias prepare all
	# pelias import all
	# pelias compose up

up:
	pelias compose up -d

clean:
	pelias compose down -v
	rm -rf ./data

