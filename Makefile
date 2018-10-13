include .env

default: help

run: ## Run JMeter test
	sh scripts/run-jmeter $(filter-out $@,$(MAKECMDGOALS))

run-docker: ## Run JMeter test
	sh scripts/run-jmeter-docker $(filter-out $@,$(MAKECMDGOALS))

gui: ## Run JMeter in GUI mode.
	sh scripts/jmeter-gui.sh

download-binaries: ## Downlaod Apache JMeter binaries
	sh scripts/jmeter-download-binaries.sh

dowload-docker-image: ## Download last docker justb4/jmeter image
	docker pull justb4/jmeter

help: ## List of commands
	@eval $$(sed -r -n 's/^([a-zA-Z0-9_-]+):.*?## (.*)$$/printf "\\033[36m%-30s\\033[0m %s\\n" "\1" "\2" ;/; ta; b; :a p' $(MAKEFILE_LIST))

# https://stackoverflow.com/a/6273809/1826109
%:
	@: