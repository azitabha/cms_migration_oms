use Escrow_tp;
create table Order_new like `Order`;
insert Order_new select * from `Order`;
alter table Order_new change nid nid varchar(20) not null default '0';
update Escrow_tp.Order_new o inner join tradusclub.PRODUCTID_NID_MAPPING p on o.nid=p.nid and o.AuctionId=p.seller_sku set o.nid = p.product_id where p.product_id is not null;
rename table `Order` to Order_old;
rename table `Order_new` to Order;

