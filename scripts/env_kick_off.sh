#!/bin/bash

# Check if conda is initialized
if ! command -v conda &> /dev/null; then
  echo "Error: Conda is not installed or not initialized. Run 'conda init' and restart your terminal."
  exit 1
fi

# Check if a name argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <environment_name>"
  exit 1
fi

ENV_NAME="$1"

# Check if the environment already exists
if conda env list | grep -q "^$ENV_NAME[[:space:]]"; then
  echo "Error: Environment '$ENV_NAME' already exists."
  exit 1
fi

# Create and activate the conda environment
conda create --name "$ENV_NAME" python=3.10 -y
conda activate "$ENV_NAME"

# Optimize conda configuration and install packages
conda config --set solver libmamba
conda install -c conda-forge pyspark delta-spark ipykernel -y

