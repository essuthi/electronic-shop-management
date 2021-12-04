begin ;

-- a) Change the address of employeee whose name is empFirstName1 and phone is 09116134406 into the new address 'address6'
update employeees
set address = 'address6'
where first_name = 'empFirstName1' and phone = 09116134406 ;



-- b) Give the number of products deliver by each supplier.
select sum(p_id)
from products
group by s_id ;



-- a) Remove products that where produced on the first of febuary 2018.
delete 
from products
where pro_date = '01-02-2020' ;


commit ;