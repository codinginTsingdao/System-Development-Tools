#!/usr/bin/env bash
set -e

ruff format --check .
ruff check .
python -m pytest -q
