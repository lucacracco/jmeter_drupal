NAME=drupal7
IMAGE=drupal7

.PHONY: build up stop
default: help

build:
	docker build -t ${IMAGE} .

run: ## Starting up container for project
	docker run --name ${NAME} --rm -d -p 80:80 -t $(IMAGE)

run-test: ## Run testing
	../scripts/run-jmeter.sh -j=drupal7.jmx -b=../apache-jmeter/bin

run-gui: ## Run gui
	../scripts/jmeter-gui.sh -j=drupal7.jmx -b=../apache-jmeter/bin

stop: ## Stop container for project
	docker stop ${NAME}

help: ## List of commands
	@eval $$(sed -r -n 's/^([a-zA-Z0-9_-]+):.*?## (.*)$$/printf "\\033[36m%-30s\\033[0m %s\\n" "\1" "\2" ;/; ta; b; :a p' $(MAKEFILE_LIST))

# https://stackoverflow.com/a/6273809/1826109
%:
	@: