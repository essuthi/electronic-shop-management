begin ;

-- a) Change the address of employeee whose name is empFirstName1 and phone is 09116134406 into the new address 'address6'
update employees
set address = 'address6'
where firstname = 'empFirstName1' and phone = 09116134406 ;


-- b) Decrease the all prices over 50000.0 naira of categories 'itel' and 'samsung' by 5 percent and other by 1000.0 naira.
update categories
set price = case
				when brand = 'itel' then price * 0.95
				when brand = 'samsung' then price * 0.95
			else price - 1000.0
			end ;

-- c) Change into 'big' the status of a customer that bought more than 5 items and less than 10 items.
update customers
set status = 'big'
where cu_id in (select cu_id
				from (select cu_id, count(p_id)
					  from sales 
					  group by cu_id
					  having count(p_id) > 5 and count(p_id) < 10
					  ) as big_custumers
			    ) ;

commit ;