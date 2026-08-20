#!/bin/bash
# This script is used to run the evaluation tests for the nwm-eval-mgr project. It builds a Docker image for the project, 
# runs the tests inside a Docker container, and also runs the tests using a local virtual environment.
#
# Usage (run from the root of the nwm-eval-mgr repo):
#   ./utils/run_eval_tests.sh
#
#

# create a temporary directory with random prefix to hold the data and venv directories
TMP_DIR=$(mktemp -d ../temp.XXXX)

# temporarily move data and venv to avoid docker build context issues
if [ -d "data" ]; then
    mv data "$TMP_DIR"/.
fi
if [ -d "venv" ]; then
    mv venv "$TMP_DIR"/.
fi

# remove dangling images and containers to free up space
docker system prune

# build docker image for nwm_eval
docker build --build-arg APP_ROOT=/my-app --tag nwm_eval .

# move data and venv back to original location
if [ -d "$TMP_DIR/data" ]; then
    mv "$TMP_DIR/data" .
fi
if [ -d "$TMP_DIR/venv" ]; then
    mv "$TMP_DIR/venv" .
fi
rm -rf "$TMP_DIR"

# run tests with docker container
docker run -v $(pwd):$(pwd) -v $HOME:$HOME -w $(pwd) nwm_eval verification configs/config_hindcast.yaml
docker run -v $(pwd):$(pwd) -v $HOME:$HOME -w $(pwd) nwm_eval verification configs/config_ngencerf.yaml
docker run -v $(pwd):$(pwd) -v $HOME:$HOME -w $(pwd) nwm_eval verification configs/config_ngensim.yaml

# run tests with local venv
source venv/bin/activate
python -m nwm_eval configs/config_hindcast.yaml
python -m nwm_eval configs/config_ngencerf.yaml
python -m nwm_eval configs/config_ngensim.yaml

echo "All tests passed successfully!"