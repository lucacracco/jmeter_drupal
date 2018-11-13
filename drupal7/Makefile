include .env

default: help

# Include other commands.
include ../docker.mk
include ../jmeter.mk

test: ## Lanch test commands.
	make jmeter-download-binaries
	make docker-build
	make docker-run
	make jmeter-run
	make docker-prune
	make jmeter-clear-report
	make jmeter-remove-binaries

help: ## List of commands
	@eval $$(sed -r -n 's/^([a-zA-Z0-9_-]+):.*?## (.*)$$/printf "\\033[36m%-30s\\033[0m %s\\n" "\1" "\2" ;/; ta; b; :a p' $(MAKEFILE_LIST))

# https://stackoverflow.com/a/6273809/1826109
%:
	@: