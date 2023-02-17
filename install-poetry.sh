#!/usr/bin/env bash

# Upgrade pip
python3.10 -m pip install --upgrade pip

# Install poetry.
. .environment
export PIP_USER=false
curl -sSL https://install.python-poetry.org | python3 - --version $POETRY_VERSION
export PATH="/app/.local/bin:$PATH"
export PIP_USER=true

# Check lockfile and environment.
poetry env use system
poetry check
