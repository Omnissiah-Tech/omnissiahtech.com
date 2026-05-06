.DEFAULT_GOAL := help
.PHONY: help install serve build clean

help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install gems into vendor/bundle
	bundle config set --local path vendor/bundle
	bundle install

serve: ## Run local preview at http://localhost:4000 (with livereload)
	bundle exec jekyll serve --livereload

build: ## Build site to _site/
	bundle exec jekyll build

clean: ## Remove generated _site/ and Jekyll cache
	rm -rf _site .jekyll-cache
