
default: help

build:  ## Build the GitPod.io docker image
	docker buildx build --tag frenchben/gitpod-notebook -f .gitpod/Dockerfile .gitpod

datascience:  ## Run the datascience notebook with lab enabled
	docker run --rm -it -p 8888:8888 -v "$(shell PWD)":/home/jovyan/work -e JUPYTER_ENABLE_LAB=yes jupyter/datascience-notebook

notebook:  ## Run the scipy notebook 
	docker run --rm -it -p 8888:8888 -v "$(shell PWD)":/home/jovyan/work jupyter/scipy-notebook

jupyter:  ## Run jupyter locally
  jupyter notebook --ip=0.0.0.0

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[38;5;69m%-30s\033[38;5;38m %s\033[0m\n", $$1, $$2}'
