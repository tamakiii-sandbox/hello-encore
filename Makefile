.PHONY: help setup build server clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	vendor \
	node_modules \
	build

build: Dockerfile
	docker-compose build

server:
	symfony server:start --port=80

vendor:
	docker-compose run --rm php composer install

node_modules:
	npm install --dev

clean:
	docker-compose down -v
	-rm -rf vendor
