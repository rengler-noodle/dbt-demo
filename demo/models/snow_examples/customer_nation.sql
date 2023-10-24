SELECT * 
FROM {{ source("starter", "customer")}} AS c
JOIN {{ source("starter", "nation") }} as n 
    ON c.c_nationkey = n.n_nationkey
