# nwm-eval-mgr

## Name
NWM/NextGen Evaluation Manager

## Description
A standalone Python library for conducting evaluation/verification for NWM/NextGen simulations, hindcasts, and forecasts.

## Installation

Create a virtual environment and install directly from GitHub:

```bash

cd [VENV_ROOT]
/usr/bin/python3.11 -m venv venv
source venv/bin/activate
pip install --upgrade pip

pip install "git+https://github.com/NGWPC/nwm-eval-mgr.git@development"
```
Where `[VENV_ROOT]` is the path to the directory where you want to create the virtual environment.

### Usage

1) set up configuration yaml file

Follow one of the following sample config files (nwm-eval-mgr/configs) to set up the configurations for your evaluation/verification application:
- `config_ngencerf.yaml`: ngenCERF-based single-location single-forecast verification
- `config_hindcast.yaml`: ngenCERF-based single-location multiple-hindcast verification
- `config_nwm.yaml`: NWM v30 operational forecasts verification
- `config_ngensim.yaml`: large-scale NGEN simulation evaluation (e.g., from regionalized simulations for a VPU)
- `config_template.yaml`: a template config file containing all possible configuration options generated from the pydantic schema, which can be used as a reference for setting up your own config file.

For detailed instructions on how to set up the configuration file, please refer to the [Configuration](https://ngwpc.github.io/nwm-eval-mgr/config.html) page.

1) run evaluation/verification

```bash
python -m nwm_eval_mgr <path-to-config-file>
```
Example:

```bash
python -m nwm_eval_mgr configs/config_hindcast.yaml
```

## Docker container

### Requirements

To build and run nwm-eval-mgr, you will need the following software installed and running on your system:
- Docker Engine

You will also need the following data:
- a GitLab Personal Access Token (PAT)

### Build

To build the nwm-eval-mgr container, execute the following command:
```
GITLAB_TOKEN=$(cat ~/.gitlab_token) docker build --secret id=GITLAB_TOKEN,env=GITLAB_TOKEN --tag=nwm-eval-mgr .
```

### Running

To run the nwm-eval-mgr applicaton, execute the following command:
```
docker run nwm-eval-mgr
```

This will print a usage statement for the container:
```
Usage: run-nwm-eval-mgr.sh <command> <config_file> [stdout_file]


COMMAND:
  verification          Run verification script.

CONFIG_FILE: Path to the config yaml file for a verification run.
STDOUT_FILE (optional): Path to the stdout file where the script's console output will be saved.

Examples:
  run-nwm-eval-mgr.sh verification test_data/verf_config.yaml
  run-nwm-eval-mgr.sh verification test_data/verf_config.yaml /path/to/output/nwm-eval-mgr.log
```

The path provided for any files should match the path within the container, as well as the paths inside your configuration file.
