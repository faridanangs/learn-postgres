select * from pg_tables where schemaname='public'

-- create table
create table barang 
(
	kode int not null,
	name varchar(100) not null,
	harga int not null default 1000,
	jumlah int not null default 0,
	waktu_dibuat timestamp not null default current_timestamp
);

-- add,delete and rename column
alter table barang
add column description text

alter table barang
drop column description

alter table barang
rename column name to nama;

-- delete table and create new table with value is same
truncate barang;

-- delete table
drop table barang;

-- select all data from barang
select * from barang;

-- create table product
create table products
(
	id varchar(10) not null,
	name varchar(100) not null,
	description text,
	price int not null,
	quantity int not null default 0,
	created_at timestamp not null default current_timestamp
);

-- create data using insert into
insert into products(id, name, price, quantity)
values('P0001', 'Mi Ayam Original', 15000, 100);

insert into products(id, name, description, price, quantity)
values('P0002', 'Mi Ayam Bakso Tahu', 'Mie Ayam Original', 20000, 100);

-- create some data using insert into
insert into products(id, name, price, quantity)
values('P0003', 'Mi Ayam Ceker', 20000, 100),
	('P0004', 'Mi Ayam Spesial', 25000, 100),
	('P0005', 'Mi Ayam Yamin', 15000, 100);

-- add primary key
alter table products
add primary key(id)

-- select all data from products
select * from products;

-- select where clause
select * from products where price = 20000;

-- select column data from products
select id, name, price, quantity from products;

-- create type add and to coluumn in table products
create type PRODUCT_CATEGORY AS ENUM ('Makanan', 'Minuman', 'Lain-Lain');
alter table products
	add column category PRODUCT_CATEGORY

-- update column in table products
update products
	set category = 'Makanan'
	where id = 'P0001';
	
update products
	set category = 'Makanan'
	where id = 'P0002';
	
update products
	set category = 'Makanan'
	where id = 'P0003';	
	
update products
	set category = 'Makanan'
	where id = 'P0004';

-- update some column in table products
update products
	set category = 'Makanan',
	description = 'Mie Ayam + Ceker'
	where id = 'P0005'
	
update products
	set price = price + 5000
	where id = 'P0006'

-- delete data in table
insert into products(id, name, price, description, category)
values('P0009', 'Lolipop', 30000,'Contoh', 'Minuman');
-- if like this all data in products will delete
delete from products;
delete from products where id = 'P0009';

-- Alias
select id as kode, price as harga, description as deskripsi from products;
-- jika ingin nama asnya lebih dari saru maka kita gunakan tanda "aku dia"
select id as "kode barang",
		price as "harga barang",
		description as "deskripsi barang"
		from products;
		
-- alias untuk table, menghindari nama kolom yang sama ketika melakukan relasi table 
select p.id as "kode barang",
		p.price as "harga barang",
		p.description as "deskripsi barang"
		from products as p;


------- where oprator
-- perbandingan
select * from products where price > 24000;
select * from products;
select * from products where price < 15000;
select * from products where category != 'Minuman';

-- or dan and
insert into products(id, name, price, quantity, category)
values('P0006', 'Es teh tawar', 10000, 100, 'Minuman'),
	('P0007', 'Es campur', 20000, 100, 'Minuman'),
	('P0008', 'Es jeruk', 15000, 100, 'Minuman');
-- and
select * from products where category = 'Makanan' and price > 24000;
select * from products where category = 'Minuman' and price > 10000;

-- or
select * from products where category = 'Makanan' or price > 24000;

-- prioritas ()
select * from products where price > 14000 and (category = 'Makanan' or category = 'Minuman');

-- like
select * from products where name ilike '%Bakso%';
select * from products where name like '%Campur%';

-- null oprator
select * from products where description is null;
select * from products where description is not null;

-- between oprator
select * from products where price between 10000 and 15000;
select * from products where price not between 10000 and 15000;

-- in oprator
select * from products where category in ('Makanan');
select * from products where category not in ('Makanan', 'Minuman');

-- order by clause
select * from products order by price asc, id desc;
select * from products order by name asc;

-- limit clause
select * from products where price > 0 order by id asc limit 2;

-- offset clause
select * from products where price > 0 order by id asc limit 2 offset 2;


-- select DISTINCT
SELECT category from products; 
select distinct category from products;

-- Auto increment
create table admin
(
	id serial not null,
	first_name varchar(100) not null,
	last_name varchar(100),
	primary key(id)
);

insert into admin(first_name, last_name)
values ('farid', 'anangs'),
	('wagas', 'tri'),
	('raika', 'aisyah');

-- untuk metihat nilai dari serial saat ini
select currval('admin_id_seq');


-- string function
select id, lower(name), length(name), upper(description) from products;

-- date and time function
select id, extract(year from created_at), extract(month from created_at) from products;

-- control flow case
select id, price, case
	when price <= 15000 then 'Murah'
	when price <= 20000 then 'Mahal'
	else 'Mahal Amat'
	end as "Apakah murah?"
	from products order by price asc;
-- kita masukan data ke dalam description yang ksong
select id, name, case
	when description is null then 'Kosong'
	else description
	end as description
	from products;
select id, description, case
	when description ilike '%original%' then 'Enak Banget'
	else 'Gak Enak'
	end as "Response Penjual"
	from products order by id asc;

-- aggregat function
select count(id) from products;
select avg(price) as "rata-rata harga" from products;
select max(price) as "harga termahal" from products;
select min(price) as "harga termurah" from products;

-- group by clause
select category, count(id) as "total category" from products group by category;
select category,
	avg(price) as "rata-rata harga",
	min(price) as "harga termurah",
	max(price) as "harga termahal"
	from products group by category;
	
-- having clause
select category,
	count(id) as "total category"
	from products group by category
	having count(id) > 3;

select category,
	avg(price) as "rata-rata harga",
	min(price) as "harga termurah",
	max(price) as "harga termahal"
	from products group by category
	having avg(price) >= 15.000;

----- Constraint
---- Unique constraint
create table customer
(
	id serial not null,
	email varchar(100) not null,
	first_name varchar(100) not null,
	last_name varchar(100),
	primary key(id),
	constraint unique_email unique (email)
);

insert into customer (email, first_name, last_name)
	values ('farid@gmail.com', 'farid', 'anangs');

insert into customer (email, first_name, last_name)
	values
	('diana@gmail.com', 'diana', 'milda'),
	('wagas@gmail.com', 'wagas', 'try'),
	('raika@gmail.com', 'raika', 'aisyah');
	
-- add constraint to table;
alter table customer
	add constraint unique_email unique(email);
-- delete constraint to table;
alter table customer
	drop constraint unique_email;

---- Check constraint
-- add constraint check
alter table products
	add constraint price_check check (price > 10000);
alter table products
	add constraint quantity_check check (quantity >= 0);


insert into products (id, name, price, quantity)
	values ('xxxx', 'bakso', 9999, 10);


-- Index
create table sellers
(
	id serial not null,
	name varchar(100) not null,
	email varchar(100) not null,
	primary key(id),
	constraint email_unique unique (email)
);

insert into sellers ( name, email)
	values ('Glery Bakso', 'galery@gmail.com'),
			('Toko tono', 'tono@gmail.com'),
			('Glery budi', 'budi@gmail.com'),
			('Glery agus', 'agus@gmail.com');

select * from sellers where id = 1; -- index
select * from sellers where email = 'tono@gmail.com'; -- index
select * from sellers where id = 1 or name = 'Galery budi'; -- index karna sesuai dengan combinasi indexnya
select * from sellers where name = 'Toko tono' -- bukan index karna belum di baut index yang sendiri kita hanya buat index (name, id) bukan index(name)


-- create index
create index sellers_name_and_id_index on sellers(name, id)

--## aturan penggunaan
-- untuk men-select index, maka index yang kita buat harus sesuai dengan combinasi index yang kita buat
-- Contohnya: ini create index sellers_name_and_id_index on sellers(id,name)
-- Cara memanggilnya: select * from sellers where id = 1 or name = 'usman'; nah ini bisa karna sesuai dengan kombinasi index yang kita buat.

-- delete index
drop index sellers_name_index;


-- full text search
-- Similasi: create index name_index on products using gin(to_tsvector('bahasa_yg_di_dukung', nama_kolomnya));
create index products_name_search on products using gin(to_tsvector('english', name));
drop index products_name_search;

select * from products where name @@ to_tsquery('original');

-- to_tsquery mendukung query (&, |, !) dan '''nsms'''-> untk semua data tanpa use &,|
select * from products where name @@ to_tsquery('!Mi');
select * from products where name @@ to_tsquery('mi & bakso ');
select * from products where name @@ to_tsquery('es | original');
select * from products where name @@ to_tsquery('''mi ayam''');

------ tabel relationship
--- foreign key
create table wishlist 
(
	id serial not null,
	id_product varchar(10) not null, -- harus sama dengan id di products
	description text,
	primary key(id),
	constraint fk_wishlist_product foreign key(id_product) references products(id)
);

-- add foreign key
alter table wishlist
	add constraint fk_wishlist_product foreign key(id_product) references products(id);
	
-- delete foreign key
alter table wishlist
	drop constraint fk_wishlist_product;

-- ini error karna id salah tidak ada di id products
insert into wishlist(id_product, description)
	values ('salah', 'Mi kesukaan');
	
insert into wishlist(id_product, description)
	values ('P0001', 'Mi kesukaan'),
			('P0002', 'Mi ayak cincang'),
			('P0003', 'Es Puter');
-- ini tidak bisa di hapus karna id ini berada di wishlist id_product 
delete from products where id = 'P0001';

--- behavior foreign key
insert into products (id, name, description, price)
	values ('xxx', 'Mi kesukaan', 'mi kesukaan ku ini', 50000);

-- mengubah behavior foreign key dari restrect ke cascade (lebih di recomendasi menggunakan restrect supaya data tetap aman)
alter table wishlist
	add constraint fk_wishlist_product foreign key(id_product) references products(id)
	on update cascade on delete cascade;

insert into wishlist (id_product, description)
	values('xxx', 'hello lol');

--data di dalam wishlish akan ikut terhapus karna kita menggunakan cascade
delete from products where id = 'xxx';


---- Join
select * from wishlist join products on products.id = wishlist.id_product;

-- mengambil data yang kita mau dan menggunakan as
select p.id as "Id Products", p.name as "Product Name", w.description as "Wishlist Description"
	FROM wishlist AS w 
	JOIN products AS p on p.id = w.id_product;


alter table wishlist
	add column id_customer int;
	
alter table wishlist
	add constraint fk_wishlist_customer foreign key (id_customer) references customer(id);


select w.id, p.name, c.email, w.description, p.id, c.id
	from wishlist as w
		join products AS p ON p.id = w.id_product
		join customer AS c ON c.id = w.id_customer;

update wishlist set id_customer = 1 where id = 27;
update wishlist set id_customer = 3 where id = 29;
update wishlist set id_customer = 4 where id = 30;



---- One to One Relatonship
create table wallet
(
	id serial not null,
	id_customer int not null,
	balance int not null default 0,
	primary key(id),
	constraint wallet_customer_unique unique(id_customer),
	constraint fk_wallet_customer foreign key(id_customer) references customer(id)
)

insert into wallet (id_customer, balance)
	values (1, 100000),
			(3, 300000),
			(4, 400000);

select * from customer join wallet as w on w.id_customer = customer.id;


----- One to Many relationship
create table categories
(
	id varchar(100) not null,
	name varchar(100) not null,
	primary key(id)
);

insert into categories (id, name)
	values ('C0001', 'Makanan'),
			('C0002', 'Minuman');

alter table products
	drop column category;
	
alter table products
	add column id_category varchar(10);

update products set id_category='C0001' where name like '%Mi Ayam%';
update products set id_category='C0002' where name like '%Es%';

select p.id, p.name, p.description, p.price, p.quantity, c.name 
	from products as p 
		join categories as c on c.id = p.id_category;

select * from wallet;
select * from wishlist order by id asc;
select * from customer;
select * from sellers;
select * from admin;
select * from products order by id asc; 


---- MAny to Many relationship
create table orders
(
	id serial  not null,
	total int not null,
	order_date timestamp not null default current_timestamp,
	primary key(id)
);


create table orders_detail 
(
	id_product varchar(10) not null,
	id_order int not null,
	price int not null,
	quantity int not null,
	primary key(id_product, id_order)
)

alter table orders_detail
	add constraint fk_orders_detail_products foreign key(id_product) references products(id);


alter table orders_detail
	add constraint fk_orders_detail_order foreign key(id_order) references orders(id);

insert into orders(total)
	values(1),(1),(1);

insert into orders_detail(id_product, id_order, price, quantity)
	values ('P0001', '1', 10000, 3),
		('P0002', '1', 60000, 4),
		('P0003', '1', 20000, 5);
		
insert into orders_detail(id_product, id_order, price, quantity)
	values ('P0004', '2', 10000,23),
		('P0005', '2', 60000, 1),
		('P0006', '2', 20000, 6);

insert into orders_detail(id_product, id_order, price, quantity)
	values ('P0007', '3', 10000, 13),
		('P0002', '3', 60000, 45),
		('P0005', '3', 20000, 2);
		

select * from products order by id asc ;
select * from orders;
select * from orders_detail;
select id_order as "ID USER", 
	count(id_product) as "Jumlah Product",
	sum(price * quantity) as "Harga Total" 
	from orders_detail group by id_order order by id_order asc;


---- JENIS JENIS JOIN
-- inner join
insert into product

insert into categories(id, name)
	values('C0003', 'Gejet'), ('C0004', 'Laptop'), ('C0005', 'Sayur');

insert into products (id, name, price, quantity)
	values ('X0001', 'bakso 1', 19999, 10),
		('X0002', 'bakso 2', 19999, 10);
		
select * from categories
inner join products on products.id_category = categories.id;

-- left join
select * from categories
left join products on products.id_category = categories.id;

-- rigth join
select * from categories
right join products on products.id_category = categories.id;


-- full join
select * from categories
full join products on products.id_category = categories.id;

select * from categories;
select * from products;



--- subquery di from
select max(harga)
	from (
		select products.price as harga
		from categories join products on products.id_category = categories.id
	)


--- Set Oprator
create table gusetbooks
(
	id serial not null,
	email varchar(100) not null,
	title varchar(1000) not null,
	content text,
	primary key(id)
);

select * from customer;

insert into gusetbooks(email, title, content)
	values('farid@gmail.com', 'feddback farid', 'ini feddback farid'),
			('farid@gmail.com', 'feddback farid', 'ini feddback farid'),
			('diana@gmail.com', 'feddback diana', 'ini feddback diana'),
			('wagas@gmail.com', 'feddback wagas', 'ini feddback wagas'),
			('usman@gmail.com', 'feddback usman', 'ini feddback usman'),
			('usman@gmail.com', 'feddback usman', 'ini feddback usman');

-- UNNION
select distinct email from gusetbooks
union
select distinct email from customer

-- UNNION ALL
select distinct email from gusetbooks
union all
select distinct email from customer

select email, count(email)
	from(
		select email from customer
		union all
		select email from gusetbooks
	) group by email;

-- intersect
select distinct email from gusetbooks
intersect
select distinct email from customer

-- execpt
select distinct email from gusetbooks
except
select distinct email from customer


---- Transaction
-- commit
start transaction;
insert into gusetbooks(email, title, content)
	values(
			'transaction1@gmail.com', 'feddback transaction1', 'ini feddback transaction1'),
			('transaction2@gmail.com', 'feddback transaction2', 'ini feddback transaction2'),
			('transaction3@gmail.com', 'feddback transaction3', 'ini feddback transaction3'),
			('transaction4@gmail.com', 'feddback transaction4', 'ini feddback transaction4'),
			('transaction5@gmail.com', 'feddback transaction5', 'ini feddback transaction5'),
			('transaction6@gmail.com', 'feddback transaction6', 'ini feddback transaction6');

select * from gusetbooks;

-- jika belum di commit datanya hanya bisa di lihat di sini saja tidak bisa di lihat di cmd
commit;

-- rollback
start transaction;
insert into gusetbooks(email, title, content)
	values(
			'transaction1@gmail.com', 'feddback transaction1', 'ini feddback rollback'),
			('transaction2@gmail.com', 'feddback transaction2', 'ini feddback rollback'),
			('transaction3@gmail.com', 'feddback transaction3', 'ini feddback rollback'),
			('transaction4@gmail.com', 'feddback transaction4', 'ini feddback rollback'),
			('transaction5@gmail.com', 'feddback transaction5', 'ini feddback rollback'),
			('transaction6@gmail.com', 'feddback transaction6', 'ini feddback rollback');

select * from gusetbooks;

-- jika di rollback maka data yang sudah kita buat akan di batalkan di save di database
rollback;



---- Locking
select * from products;

-- locking record
start transaction;
update products 
	set description = 'Mie Ayama Original'
	where id = 'P0001';
-- hasil update ini hanya bisa di lihat di sini saja, di cmd tidak bisa
-- ketika kitaa melakukan manupulasi data di cmd maka dia akan menunggu sampai proses transaction ini di commit/rollback

commit;

-- Locking record manual
start transaction;
select * from products where id = 'P0001' for update;
-- ketika kitaa melakukan manupulasi data di cmd maka dia akan menunggu sampai proses transaction ini di commit/rollback
-- setelah seperti ini kita bebbas mau ngapain aja

update products 
	set price = 30000
	where id = 'P0001';

commit;


-- DeadLock
start transaction;

select * from products where id = 'P0001' for update; -- 1. di jalankan di sini


select * from products where id = 'P0002' for update; -- 2. di jalankan di cmd

select * from products where id = 'P0002' for update; -- 3. ketika kode ini saya jalankan di sini maka dia akan menuggu sampai data di cmd di commit/rolbacl

select * from products where id = 'P0001' for update; -- 4. ketika kode ini saya jalankan di cmd maka dia akan menuggu sampai data di sini di commit/rolbacl

													  -- 5. maka akan terjadi rollback karna dia saling menunggu

rollback;


-- Schema
select current_schema;
-- add schema
create schema contoh;
-- delete
drop schema contoh;
-- move schema
set search_path to contoh;
show search_path;

-- melihat table di scema product kita gunakan nama_schema.nama_tabel
select * from public.products;

create table products
(
	id serial not null,
	name varchar(100) not null,
	primary key(id)
)

set search_path to public;

insert into contoh.products(name)
	values('Ipon'),('boboa');

select * from contoh.products;


-- user root
-- create user
create role anangs;
create role usman;

-- delete user
drop role usman;
drop role anangs;

-- menambah option di user
alter role anangs login password 'rahasia';
alter role usman login password 'rahasia';


-- add and delete hak user access
-- db dengan nama anangs dan password rahasia yang sudah kita buat tidak dapat mengakses 
-- delete karna kita tidak menambahkannya di grant
grant insert, update, select on all tables in schema public to anangs;

-- db dengan nama usman dan password rahasia yang sudah kita buat tidak dapat mengakses 
-- delete karna kita tidak menambahkannya di grant dan dia hanya bisa mengakses tabel customer
grant insert, update, select on customer to usman;

-- jika kita paksa untuk mendelete maka dia akan eror
-- Like: blajar=> delete from products where id = 'P0001'; 
-- ERROR:  permission denied for table products

grant usage,update, select on gusetbooks_id_seq to anangs;











-------- LATIHAN ONE TO MANY RALATIONSHIP
-- CREATE TABEL USER
create table users
(
	id serial not null,
	user_name varchar(30) not null,
	email varchar(50) not null,
	primary key(id),
	constraint users_email_unique unique(email)
)


insert into users(user_name, email)
	values('farid', 'farid1@gmail.com'),
			('wagas', 'wagas@gmail.com'),
			('diana', 'diana@gmail.com'),
			('raika', 'raika@gmail.com');


-- CREATE TABEL DOMPET
create table dompets
(
	id varchar(10) not null,
	saldo int not null
)

insert into dompets(id, saldo)
	values('D0001', 100000),
			('D0002', 10000000),
			('D0003', 200000),
			('D0004', 9000000);

alter table dompets
	add primary key(id);

-- CREATE TABLE ADDRESSES
create table addresses
(
	id varchar(10) not null,
	negara varchar(50) not null,
	provinsi varchar(50) not null,
	kabupaten varchar(50) not null,
	kecamatan varchar(50) not null,
	desa varchar(50) not null,
	jalan varchar(50) not null
)

insert into addresses(id, negara, provinsi, kabupaten, kecamatan, desa, jalan)
	values('A0001', 'indonesia', 'ntb', 'lobar', 'gunungsari', 'sesela', 'sudirman'),
			('A0002', 'indonesia', 'ntb', 'lobar', 'gunungsari', 'ransel', 'yahni'),
			('A0003', 'indonesia', 'ntb', 'lobar', 'gunungsari', 'sesela', 'soekarno'),
			('A0004', 'indonesia', 'ntb', 'lobar', 'gunungsari', 'sesela', 'palapa');

alter table addresses
	add primary key(id);

-- execute one to many relation
-- dompets
alter table users
	add column id_dompet varchar(10);

update users set id_dompet = 'D0004' where id = 4;

alter table users
	add constraint fk_users_dompet foreign key(id_dompet) references dompets(id);

select * from users as u
	join dompets as d on u.id_dompet = d.id;

-- addresess
alter table users
	add column id_address varchar(10);
	
update users set id_address = 'A0001' where id = 1;

alter table users
	add constraint fk_users_address foreign key(id_address) references addresses(id);
	
	
-- memanggil data hasil relasi menggunakan select dan jooin.
select u.id, u.user_name, u.email, d.saldo, a.negara, a.provinsi, a.kabupaten, a.kecamatan, a.desa, a.jalan
	from users as u
		join dompets as d on u.id_dompet = d.id
		join addresses as a on u.id_address = a.id;
	

select * from dompets order by id asc;
select * from addresses order by id asc;
select * from users order by id asc;



---- Latihan Many to Many relationship
create table pembeli_akun
(
	id serial not null,
	name varchar(30) not null,
	saldo int not null,
	primary key(id)
)

insert into pembeli_akun(name, saldo)
	values
		('farid', 20000),
		('diana', 50000),
		('wagas', 10000);
		   
		   
create table akun_game
(
	id varchar(10) not null,
	name varchar(30) not null,
	email varchar(30) not null,
	password varchar(30) not null,
	primary key(id),
	constraint akun_game_email_unique unique(email)
)

insert into akun_game(id, name, email, password)
	values
		('AG0001', 'ff', 'frefi@gmail.com', 'frefire123'),
		('AG0002', 'ml', 'molej@gmail.com', 'molej123'),
		('AG0003', 'pubg', 'pubg@gmail.com', 'pubg1234');

create table penjual_akun
(
	id serial not null,
	name varchar(30) not null,
	id_akun varchar(10),
	primary key(id),
	constraint fk_penjual_akun_akun_game foreign key(id_akun) references akun_game(id)
)

insert into penjual_akun(name, id_akun)
	values
		('usman', 'AG0001'),
		('amar', 'AG0002'),
		('luki', 'AG0003');

create table admin_akun
(
	id serial not null,
	id_pembeli_akun int not null,
	id_penjual_akun int not null,
	primary key(id),
	constraint fk_admin_akun_pembeli_akun foreign key(id_pembeli_akun) references pembeli_akun(id),
	constraint fk_admin_akun_penjual_akun foreign key(id_penjual_akun) references penjual_akun(id)
);

-- fari beli 3 akun
insert into admin_akun(id_pembeli_akun, id_penjual_akun)
	values
		(1, 1),
		(1, 2),
		(1,3);

-- diana beli 2 akun
insert into admin_akun(id_pembeli_akun, id_penjual_akun)
	values
		(2,1),
		(2,3);

-- umar jual 3 akun
insert into admin_akun(id_pembeli_akun, id_penjual_akun)
	values
		(1,2),
		(2,2),
		(3, 2);


SELECT a.id_pembeli_akun, a.id_penjual_akun, seller.name, buyer.name, buyer.saldo from admin_akun as a
		JOIN penjual_akun AS seller ON seller.id = a.id_penjual_akun
		JOIN pembeli_akun AS buyer ON buyer.id = a.id_pembeli_akun
		GROUP BY a.id_pembeli_akun, a.id, seller.name, buyer.name, buyer.saldo
		ORDER BY a.id ASC;


select * from admin_akun;
select * from penjual_akun;
select * from pembeli_akun;
	

	
-- restore database
create database blajar_restore;

	
	
	
	

	
	