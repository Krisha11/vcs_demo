select  cs_item_sk,
        avg(cs_quantity) agg1,
        avg(cs_list_price) agg2,
        avg(cs_coupon_amt) agg3,
        avg(cs_sales_price) agg4
from `//home/tpcds/big/catalog_sales`
group by cs_item_sk
limit 100;

