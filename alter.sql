begin ;

alter table sales
rename to sold ;

alter table categories 
rename column brand
to name ;

alter table employees
add gender varchar check( gender in ('Male', 'Female')) ;

commit ;