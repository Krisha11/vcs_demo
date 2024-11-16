SELECT
    median(value) as median_value,
    day
FROM
(
    SELECT
        addDays(today(), round(number / 100, 0)) as day,
        randNormal(10, 2) as value
    FROM numbers(1000000)
)
GROUP BY day

