USE ytbench;

SELECT `category`,
        AVG(`price`) as `price_mean`,
        STDDEV(`price`) as `price_standard_deviation` FROM
RANGE(`//home/analytics/items/2024-09/1d/`, `2024-09-01`, `2024-09-30`)
WHERE `category` is not NULL
GROUP BY `category`;
