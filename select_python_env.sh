#!/bin/bash

VIRTUALENV_DIR=./.venv/
ENV_NAME=$(basename $1)

source_env() {
  source $VIRTUALENV_DIR/bin/activate
  export PYTHONPATH=$VIRTUALENV_DIR/bin/python
}

if [[ -f $VIRTUALENV_DIR/bin/activate ]]; then
  source_env
else
  echo "No valid environment $ENV_NAME found."
  echo "Creating.."
  virtualenv -p $(which python3.6) .venv/ --prompt='($ENV_NAME)'
  source_env
fi
