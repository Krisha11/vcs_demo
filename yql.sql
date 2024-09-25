select  item.i_item_id,
        avg(cs_quantity) agg1,
        avg(cs_list_price) agg2,
        avg(cs_coupon_amt) agg3,
        avg(cs_sales_price) agg4
from `//home/tpcds/big/catalog_sales` as catalog_sales
cross join `//home/tpcds/big/item` as item
where cs_item_sk = i_item_sk
group by item.i_item_id
limit 100;

