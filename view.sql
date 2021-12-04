begin ;

-- a) View for products that have already been sold.
create view sold_products as
	select products.p_id, name, prod_date
	from products, sales
	where products.p_id = sales.p_id ;

-- b) View of the amount of products deliver by each supplier.
create view suppliers_amount as 
	select sum(p_id)
	from products
	group by s_id ;

commit ;