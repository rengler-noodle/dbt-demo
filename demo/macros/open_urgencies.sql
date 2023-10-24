{% macro open_urgencies_by_country(country_name) %}

{% set urgencies = ["1-URGENT", "2-HIGH", "3-MEDIUM", "4-NOT SPECIFIED", "5-LOW"] %}
{% set names = {
    "1-URGENT": "urgent", 
    "2-HIGH": "high", 
    "3-MEDIUM": "medium", 
    "4-NOT SPECIFIED": "ns", 
    "5-LOW": "low",
    }
%}

SELECT
    c.c_custkey,
    {% for urgency in urgencies %}
        count(case when o.o_orderpriority = '{{ urgency }}' then o_totalprice end) as {{ names[urgency] }}_amount
        {%- if not loop.last -%} , {% endif %}
    {% endfor %}

FROM {{ ref("customer_nation") }} AS c
JOIN {{ source("starter", "orders") }} AS o
    ON o.o_custkey = c.c_custkey
WHERE c.n_name = '{{ country_name }}'
    AND o.o_orderstatus = 'O'
GROUP BY 1

{% endmacro %}
