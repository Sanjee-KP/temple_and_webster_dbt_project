---
name: analytics-naming-standards
description: Apply this project's dbt modeling conventions when creating or refactoring models, SQL, or model YAML, including naming, folder placement, and column documentation.
---

# dbt Model Naming Conventions

## When to use

Use this skill when creating or refactoring SQL models or model YAML in this project, unless the user provides different conventions.

## Conventions

- Staging models use prefix `stg_` and live in `models/staging/`.
- Analytics models use `fct_` for facts and `dim_` for dimensions, and live in `models/analytics/`.
- Columns are snake_case; date and timestamp fields use suffixes such as `_date`, `_timestamp`, or `_datetime` according to their data types.
- Document new columns in the same change as the model update.