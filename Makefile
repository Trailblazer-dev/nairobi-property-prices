.PHONY: clean data lint requirements sync_data_to_s3 sync_data_from_s3

#################################################################################
# GLOBALS                                                                       #
#################################################################################

PROJECT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PYTHON_INTERPRETER = python

#################################################################################
# COMMANDS                                                                      #
#################################################################################

## Install Python Dependencies
requirements:
	$(PYTHON_INTERPRETER) -m pip install -r requirements.txt

## Extract Dataset
extract_data:
	$(PYTHON_INTERPRETER) src/data/download_dataset.py

## Make Dataset
data: extract_data
	$(PYTHON_INTERPRETER) src/data/make_dataset.py

## Train models
train:
	$(PYTHON_INTERPRETER) src/models/train_model.py

## Run prediction
predict:
	$(PYTHON_INTERPRETER) src/models/predict_model.py

## Delete all compiled Python files
clean:
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete

## Lint using flake8
lint:
	flake8 src

#################################################################################
# PROJECT RULES                                                                 #
#################################################################################

## Set up python interpreter environment
create_environment:
	$(PYTHON_INTERPRETER) -m venv venv
	@echo ">>> New virtualenv created. Activate with:\nsource venv/bin/activate"
