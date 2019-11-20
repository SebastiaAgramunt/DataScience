.SILENT:
.DEFAULT_GOAL := help

PROJECT := Data Science Portfolio (Author Sebastia Agramunt)

IMAGE_NAME=datascience
CONTAINER_NAME=notebook
PORT=8888

COLOR_RESET = \033[0m
COLOR_COMMAND = \033[36m
COLOR_YELLOW = \033[33m
COLOR_GREEN = \033[32m
COLOR_RED = \033[31m

## Build docker image
build:
	docker build -t $(IMAGE_NAME) .

## Run docker image on a container
run:
	docker run -d -v $(shell pwd):/home/ -p 8888:8888 --name $(CONTAINER_NAME) -i $(IMAGE_NAME)

## Build docker image and run it in container
build-run: build run

## Stop docker container
stop:
	docker stop $(CONTAINER_NAME)

## Start the docker container
start:
	docker start $(CONTAINER_NAME)

## Stop docker container and remove containers and images
remove: stop
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME)

## Prints help message
help:
	printf "\n${COLOR_YELLOW}${PROJECT}\n------\n${COLOR_RESET}"
	awk '/^[a-zA-Z\-\_0-9\.%]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "${COLOR_COMMAND}$$ make %s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort
	printf "\n"
