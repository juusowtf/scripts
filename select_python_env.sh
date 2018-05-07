#!/bin/bash

VIRTUALENV_DIR=./.venv
ARG_DIR="${1:-$(pwd)/..}"
ENV_NAME=$(basename "$(dirname $ARG_DIR)")

source_env() {
  source $VIRTUALENV_DIR/bin/activate
  export PYTHONPATH=$VIRTUALENV_DIR/bin/python
}

if [[ -f $VIRTUALENV_DIR/bin/activate ]]; then
  source_env
else
  echo "No valid environment $ENV_NAME found."
  echo "Creating.."
  virtualenv -p $(which python3.6) $VIRTUALENV_DIR/ --prompt="($ENV_NAME)"
  source_env
fi
