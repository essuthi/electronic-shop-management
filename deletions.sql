begin ;

-- a) Remove products that where produced on the first of febuary 2018.
delete 
from products
where prod_date = '01-02-2018' ;

-- b) Remove all products that are sold already
delete
from products
where p_id in (select p_id
			   from sales
			  ) ;

commit ;