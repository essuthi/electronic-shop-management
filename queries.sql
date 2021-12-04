begin ;

-- a) Give all products that have already been sold.
select products.p_id, name, prod_date
from products, sales
where products.p_id = sales.p_id ;

select p_id, name, prod_date
from products
where products.p_id in 
	( 
		select p_id
		from sales
	) ;

select p_id, name, prod_date
from products natural join sales ;




-- b) Give the amount of products deliver by each supplier.
select suppliers.name, count(p_id)
from products join suppliers on products.s_id = suppliers.s_id
group by suppliers.name
order by suppliers.name ;





-- c) Give the maximum number of products, greather than 30, of each category.
select brand, max(p_id) as max_num_prod
from products natural join categories
group by brand
having max(p_id) > 30 ;




-- d) Give distinct name, surname, middlename, phone, email, address of employees who have sold at least one item in the shop.
select distinct firstname, surname, middlename, phone, email, address
from employees
where exists
	(
		select *
		from employees natural join sales
	)  
order by firstname, surname, middlename ; 





-- e) Give all products that have not been bought by customer 1 and customer 2.
(select products.p_id, products.name
from products)
except
(select products.p_id, products.name
from products, customers, sales
where products.p_id = sales.p_id and customers.cu_id = sales.cu_id and (firstname = 'custFirstName1' or firstname = 'custFirstName2')
order by products.p_id);

commit ;