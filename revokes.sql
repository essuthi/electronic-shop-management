begin ;

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