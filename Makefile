SHELL := /bin/bash

setup:
	virtualenv -p python3 env;
	# Start a single shell for doing stuff in virtualenv
	( \
		source env/bin/activate; \
	  pip install -r dotdrop/requirements.txt; \
  	./dotdrop/bootstrap.sh; \
	)
