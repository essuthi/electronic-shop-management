begin ;
--  alterations

alter table sold
rename to sales ;

alter table categories 
rename column name
to brand ;

alter table employees
drop gender ;

commit ;