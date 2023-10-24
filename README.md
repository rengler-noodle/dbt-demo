# dbt-demo

## Setup

Install poetry then `poetry install` to setup virtual environment
Run `poetry shell` to activate virtual environment

Add the following to your `~/.dbt/profiles.yml` (create if needed), and fill out the values. This is for snowflake.

```
demo:
  outputs:
    dev:
      account: 
      database: 
      password: 
      role: 
      schema: 
      threads: 8
      type: snowflake
      user: 
      warehouse: 
  target: dev
```

`cd` into the `demo` directory and run `dbt debug` to make sure connection is working.
