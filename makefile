# Steps to deploy a2j website content:
# 1. to update html changes in local host 
#       <make local> 

# 2. before updating html changes to production, you must build it first, so local site can be reflect
#    changes made to /var/wwww/yenkha
#       <make build>

# 3. to update html changes in production host
#       <make prod>

start:
	hugo serve

dev:
	npm run dev

build:
	npm run build

prod:
	scp -r ~/proj/lumi/public/* root@yenkha.com:/var/www/lumi
