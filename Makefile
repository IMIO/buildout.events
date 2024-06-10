#!/usr/bin/make
all: buildout

IMAGE_NAME=smartweb/events:latest

buildout.cfg:
	ln -fs dev.cfg buildout.cfg

bin/buildout: bin/pip buildout.cfg
	bin/pip install -I -r requirements.txt
	bin/pip install zope.container==4.10
	bin/pip install AccessControl==5.7
	bin/pip install setuptools==69.0.2

buildout: bin/instance

bin/instance: bin/buildout
	bin/buildout

bin/pip:
	python3.8 -m venv .

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
