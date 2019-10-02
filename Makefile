
default: help

datascience:  ## Run the datascience notebook with lab enabled
	docker run --rm -it -p 8888:8888 -v "$(shell PWD)":/data -e JUPYTER_ENABLE_LAB=yes jupyter/datascience-notebook

notebook:  ## Run the scipy notebook 
	docker run --rm -it -p 8888:8888 -v "$(shell PWD)":/data jupyter/scipy-notebook

jupyter:  ## Install jupyter locally
  pip3 install jupyter
  jupyter notebook

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[38;5;69m%-30s\033[38;5;38m %s\033[0m\n", $$1, $$2}'
