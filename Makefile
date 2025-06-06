#!/usr/bin/make
all: buildout

IMAGE_NAME=smartweb/events:latest

buildout.cfg:
	ln -fs dev.cfg buildout.cfg

bin/buildout: bin/pip buildout.cfg
	bin/uv pip install -r requirements.txt

buildout: bin/instance

bin/instance: bin/buildout
	bin/buildout

bin/pip:
	python3.12 -m venv .
	bin/pip install uv

run: bin/instance
	bin/instance fg

cleanall:
	rm -fr develop-eggs downloads eggs parts .installed.cfg lib lib64 include bin .mr.developer.cfg local/ share/

upgrade-steps:
	bin/instance -O plone run scripts/run_portal_upgrades.py

docker-image: 
	docker build --pull --no-cache -t $(IMAGE_NAME) .

test-image:
	echo "test to do"

lint:
	pre-commit run --all
