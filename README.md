Welcome to tw-campaign-finance

### Getting started

Install dbt:

```
python3 -m venv venv
source venv/bin/activate
source venv/bin/activate

pip install dbt-duckdb
```

### Using the project

Download the incomes & expenditures csv from: https://g0v.hackmd.io/gGGUBDEXQOKGL_feUpPekg

Try running the following commands:
- dbt seed
- dbt run
- dbt test

The resulting parquet files will be available under `target/`.

###

See also `vgplot/` directory for yaml spec for interactive exploration with [mosaic](https://uwdata.github.io/mosaic/)

### License

MIT
