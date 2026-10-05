# Temple & Webster dbt project

## Requirements

- Python 3.9 or newer
- A Google Cloud project with BigQuery enabled
- Google Cloud CLI, authenticated with Application Default Credentials

## Set up

```sh
python -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
gcloud auth application-default login
mkdir -p ~/.dbt
cp profiles.yml.example ~/.dbt/profiles.yml
```

Set the BigQuery project and, optionally, the target dataset and location:

```sh
export DBT_BIGQUERY_PROJECT="your-gcp-project-id"
export DBT_BIGQUERY_DATASET="dbt_dev"
export DBT_BIGQUERY_LOCATION="US"
```

The configured dataset must exist, and the authenticated identity needs permission to create BigQuery jobs and views in it.

## Verify and run

```sh
dbt debug
dbt build
```

The starter model is in `models/example/`. Models are materialized as views by default. Add source definitions and layered staging, intermediate, and mart models as the warehouse schema becomes available.