# Steps to deploy a2j website content:
# 1. to update html changes in local host 
#       <make local> 

# 2. before updating html changes to production, you must build it first, so local site can be reflect
#    changes made to /var/wwww/yenkha
#       <make build>

# 3. to update html changes in production host
#       <make prod>

# start:
# 	hugo serve

# dev:
# 	npm run dev

# build:
# 	npm run build

# prod:
# 	scp -r ~/proj/lumi/public/* root@yenkha.com:/var/www/lumi

# Makefile for Hugo project

# Variables
PROD_URL = https://yenkha.com
HUGO = hugo
HUGO_SERVER = $(HUGO) server
HUGO_BUILD = $(HUGO)
HUGO_PROD = $(HUGO) --baseURL=$(PROD_URL)

# Targets
all: build

server:
	$(HUGO_SERVER) -D -F --navigateToChanged

build:
	$(HUGO_BUILD)

# deletes old local files before deploying to remote server
clean:
	rm -rf public/*

# rynsc -avz --delete ~/proj/lumi/public/

# this deletes old files
# rynsc cp -r ~/proj/lumi/public/* root@yenkha.com:/var/www/lumi

# this doesn't delete old files: 
# scp -r ~/proj/lumi/public/* root@yenkha.com:/var/www/lumi
deploy: # use rsync to delete
	rynsc cp -r ~/proj/lumi/public/* root@yenkha.com:/var/www/lumi
	 

.PHONY: all server build clean