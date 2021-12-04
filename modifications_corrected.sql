begin ;


--  alterations

alter table sold
rename to sales ;

alter table categories 
rename column name
to brand ;

alter table employees
drop gender ;



-- a) Remove products that where produced on the first of febuary 2018.
--		delete
--		from products
--		where p_id in (select p_id
--					   from sales ) ;
		

-- a) Remove products that where produced on the first of febuary 2018.
--		delete 
--		from products
--		where pro_date = '01-02-2018' ;


insert into products values 
	(1, 1, 1, 'phone', '01-01-2018'),
	(2, 1, 1, 'phone', '01-01-2018'),
	(4, 1, 2, 'phone', '02-01-2018'),
	(5, 1, 3, 'phone', '03-01-2018'),
	(6, 1, 3, 'phone', '03-01-2018'),
	(7, 1, 4, 'phone', '04-01-2018'),
	(8, 1, 4, 'phone', '04-01-2018'),
	(9, 6, 5, 'phone', '05-01-2018'),
	(10, 6, 5, 'phone', '05-01-2018'),
	(11, 2, 1, 'phone', '01-01-2018'),
	(12, 2, 1, 'phone', '01-01-2018'),
	(14, 2, 2, 'phone', '02-01-2018'),
	(15, 2, 3, 'phone', '03-01-2018'),
	(16, 2, 3, 'phone', '03-01-2018'),
	(17, 7, 4, 'phone', '04-01-2018'),
	(18, 7, 4, 'phone', '04-01-2018'),
	(19, 2, 5, 'phone', '05-01-2018'),
	(21, 3, 1, 'phone', '01-02-2018'),
	(22, 3, 1, 'phone', '01-02-2018'),
	(20, 2, 5, 'phone', '05-01-2018'),
	(23, 3, 2, 'phone', '02-02-2018'),
	(24, 3, 2, 'phone', '02-02-2018'),
	(25, 3, 3, 'phone', '03-02-2018'),
	(26, 8, 3, 'phone', '03-02-2018'),
	(27, 8, 4, 'phone', '04-02-2018'),
	(28, 3, 4, 'phone', '04-02-2018'),
	(29, 3, 5, 'phone', '05-02-2018'),
	(30, 3, 5, 'phone', '05-02-2018'),
	(31, 4, 1, 'phone', '01-02-2018'),
	(32, 4, 1, 'phone', '01-02-2018');


	insert into sales values
	(1, 1, 1),
	(2, 1, 2),
	(2, 2, 2),
	(4, 3, 3),
	(5, 3, 4),
	(6, 4, 4),
	(7, 4, 5),
	(8, 5, 4),
	(9, 1, 4),
	(10, 2, 4),
	(11, 3, 1),
	(12, 4, 2),
	(12, 5, 2),
	(14, 1, 3),
	(15, 2, 4),
	(16, 2, 4),
	(17, 3, 5),
	(18, 4, 4),
	(19, 4, 4),
	(20, 5, 1),
	(21, 5, 2),
	(22, 1, 2),
	(23, 1, 3),
	(24, 2, 4),
	(25, 2, 4),
	(26, 3, 5),
	(27, 4, 4),
	(28, 4, 4),
	(29, 1, 1),
	(30, 1, 2);

	
	


	-- a) Change the address of employeee whose name is empFirstName1 and phone is 09116134406 into the new address 'address6'
--		update employeees
--		set address = 'address6'
--		where first_name = 'empFirstName1' and phone = 09116134406 ;

update employees
set address = 'address1'
where firstname = 'empFirstName1' and phone = 09116134406 ;




-- b) Decrease the all prices over 50000.0 naira of categories 'itel' and 'samsung' by 5 percent and other by 1000.0 naira.
--		update categories
--		set price = case
--						when brand = 'itel' then price * 1.05
--						when brand = 'samsung' then price * 1.05
--					else price - 1000.0
--					end ;

update categories
set price = case
				when brand = 'itel' then price / 0.95
				when brand = 'samsung' then price / 0.95
			else price + 1000.0
			end ;




-- c) Change into 'big' the status of a customer that bought more than 5 items and less than 10 items.
--		update customers
--		set status = 'big'
--		where cu_id in (select cu_id
--						from (select cu_id, count(p_id) as big
--							  from sales 
--							  group by cu_id
--							  having big > 5 and big < 10
--							  )
--					    ) as big_custumers ;
update customers
set status = 'small'
where cu_id in (select cu_id
				from (select cu_id, count(p_id)
					  from sales 
					  group by cu_id
					  having count(p_id) > 5 and count(p_id) < 10
					  ) as big_custumers
			    ) ;


-- Deletion of views...
drop view sold_products ;
 
drop view suppliers_amount ;




-- 	Revocation of privileges

revoke all 
on products
from mbangue ;


revoke select, update(phone, email, address)
on suppliers
from essoh ;


revoke select
on products
from public ;

commit ;