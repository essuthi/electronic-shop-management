begin ;

grant all
on products
to mbangue ;


grant select, update(phone, email, address)
on suppliers
to essoh with grant option ;


grant select
on products 
to public ;

commit ;