# init:
# 	pelias compose pull
# 	pelias elastic start
# 	pelias elastic wait
# 	pelias elastic create
# 	pelias download all
# 	# pelias prepare all
# 	# pelias import all
# 	# pelias compose up

up:
	pelias compose up -d

startup:
	./startup.sh
	pelias compose pull
	pelias elastic start
	pelias elastic wait
	pelias elastic create
	pelias download all

clean:
	pelias compose down -v
	rm -rf ./data

