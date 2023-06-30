Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

### Setup DBT with BigQuery

- Create dataset in BigQuery

```console
bq --location=US mk -d
--description "Description of the dataset"
"project_id:yyy_0001_0_dev"
```

- Create BigQuery Table 

```JSON
[
  {
    "name": "ID",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "EventTypeID",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "EventType",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "EntityID",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "JSON",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "lastmodifiedtimestamp",
    "type": "TIMESTAMP",
    "mode": "NULLABLE"
  }
]
```

-- BigQueryTable 

{
    "name": "EventTypeID",
    "type": "INTEGER",
    "mode": "Required"
  },
  {
    "name": "EventTypeName",
    "type": "STRING",
    "mode": "Required"
  },


-- Upload to bigquery

bq load --source_format=CSV --autodetect yyy_0001_0_dev.v1_eventsourcing 

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
