IMAGE ?= drupal_test
NAME ?= drupal_test

docker-build: ## Build the image for container.
	@echo "Build image '${NAME}'"
	@docker build -t ${IMAGE} .

docker-run: ## Starting up container for project.
	@echo "Run container '${NAME}'"
	@docker run --name ${NAME} --rm -d -p 80:80 -t $(IMAGE)

docker-prune: ## Stop and prune container for project.
	@echo "Stop container '${NAME}'"
	@docker stop ${NAME}
