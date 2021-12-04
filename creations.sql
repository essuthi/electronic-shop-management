begin;

create table categories
	(
		ca_id int,
		brand varchar not null,
		mark varchar not null,
		price real not null,
		primary key (ca_id)
	);
create table suppliers
	(
		s_id int,
		name varchar not null,
		phone bigint not null,
		email varchar not null,
		address varchar,
		primary key (s_id)
	);


	create table products
	( 
		p_id int,
		ca_id int,
		s_id int,
		name varchar not null,
		prod_date date,
		primary key (p_id),
		foreign key (ca_id) references categories,
		foreign key (s_id) references suppliers
	);


create table customers
	(
		cu_id int,
		firstname varchar not null,
		middlename varchar not null,
		surname varchar,
		phone bigint not null,
		email varchar not null,
		status varchar,
		primary key (cu_id),
		check (status in ('small', 'big', 'super'))

	);
create table employees
	(
		e_id int,
		firstname varchar not null,
		middlename varchar not null,
		surname varchar,
		bith_date date not null,
		type varchar not null,
		phone bigint not null,
		email varchar not null,
		address varchar,
		primary key (e_id)
	);
create table sales
	(
		p_id int,
		cu_id int,
		e_id int,
		primary key (p_id,cu_id,e_id),
		foreign key (p_id) references products on delete cascade on update cascade,
		foreign key (cu_id) references customers on delete cascade on update cascade,
		foreign key (e_id) references employees on delete cascade on update cascade
	);

	commit ;