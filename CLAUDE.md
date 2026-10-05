# Project Guidance

## Project Overview

- This repository contains a dbt project named `temple_and_webster`.
- The configured warehouse adapter is BigQuery.
- Models are organized under `models/`; staging models are views and analytics models are tables by default.
- Follow the modeling conventions in [the analytics naming skill](skills/analytics-naming-standards/SKILL.md).

## Development Workflow

- Read the relevant models, YAML, and project configuration before making changes. Follow existing patterns and keep changes focused.
- Use the project virtual environment and install dependencies with `python -m pip install -r requirements.txt`.
- Configure BigQuery credentials through the local dbt profile and environment variables described in `README.md`. Never commit credentials, tokens, or local profile files.
- Do not assume warehouse schemas or business definitions that are not documented in the project. Ask or leave a clear TODO when required information is missing.

## Validation

- Run `dbt parse` to validate project and model configuration.
- Run `dbt build --select <model_name>` for the changed model and its applicable tests when BigQuery access is configured.
- Run `dbt build` when changes affect multiple models or shared project behavior.
- Report validation that could not be run, including missing credentials or warehouse access.

## Safety

- Avoid unrelated refactors and do not modify generated files under `target/` or installed packages under `dbt_packages/`.
- Do not run destructive warehouse operations, including `--full-refresh` or dropping/replacing production objects, without explicit approval.
- Add or update model documentation and tests when changing model behavior.
