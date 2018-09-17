timestamp=$(shell date +%Y%m%d%H%M%S)
release=r$(timestamp)
message?=

all: help

help:
	@echo ""
	@echo "raisonances.care - Makefile"
	@echo "==========================="
	@echo "    make init     : initialize project environment (git submodules, bundle...)"
	@echo "    make deploy   : deploy to github pages with commit message"
	@echo "    make help     : display this help message"
	@echo ""

init:
	(cd _site && git submodule init && git submodule update && git checkout master)
	npm install
	bundle install --path vendor/bundle

deploy:
	(cd _site && git pull)
	if [ -f _site/CNAME ]; then mv _site/CNAME CNAME; fi
	rm -rf _site/*
	bundle exec jekyll build
	if [ -f CNAME ]; then mv CNAME _site/CNAME; fi
	(cd _site && git add . && git commit -m "[deploy $(release)] $(message)" && git push)
	git add .
	git commit -m "[deploy $(release)] $(message)"
	git push
