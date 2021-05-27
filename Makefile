
app_name := app
docker := docker
compile := docker-compose exec app rails assets:precompile
run := docker-compose run 
developer := docker-compose -f ./Docker/docker-compose.yml 
stop ?= (docker ps -aq)

## Docker commands ##

prune:
	$(docker) system prune
uninstall:
	docker stop ($(stop)) 
clean: 
	docker rmi $(IMAGE_NAME):latest || true
	docker rmi $(IMAGE_NAME):$(TAG) || true

## Developer Envaroments ##
build:
	$(developer) build
server:
	$(developer) up -d
up:
	$(developer) up
ps:
	$(developer) ps
down:
	$(developer) down
restart:
	$(developer) restart
bash:
	$(developer) exec web /bin/sh
migrate:
	$(developer) exec web rails db:migrate
logs:
	tail -f ./awesomeapp/log/development.log

