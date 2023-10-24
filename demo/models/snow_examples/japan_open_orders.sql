{{ config(
    materialized="table",
    schema="fulfillment"
) 
}}

{{ open_urgencies_by_country("JAPAN")}}
