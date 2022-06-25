--CUSTOMER
CREATE TABLE customer (
	customer_id serial primary key,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	email varchar(100) not null,
	phone_number varchar(20) not null,
	password varchar(20) not null
)
INSERT INTO customer(first_name, last_name, email, phone_number, password)
values ('Ikbal Arif', 'Zakariya', 'zakaria_arif@gmail.com', '081243675987', 'ikbalganteng123'),
('Windah', 'Basudara', 'basudara1234@gmail.com', '085764986523', 'bocilkematian123'),
('Shintia', 'Afta', 'SAforever@gmail.com', '081564765987', 'aftabuayadarat456')
select * from customer
select first_name||' '||last_name as nama from customer where (email)='zakaria_arif@gmail.com' and (password)='ikbalganteng123'
drop table customer

--PARIWISATA
Create table pariwisata(
	pariwisata_id serial primary key,
	pariwisata_nama varchar (50) not null unique,
	lokasi varchar (50) not null,
	harga integer not null,
	keterangan text
)
select * from pariwisata
select harga*2 as total_harga from pariwisata where (pariwisata_nama) ilike 'Jatim Park 1'
Select pariwisata_nama from pariwisata
drop table pariwisata
Insert Into pariwisata(pariwisata_nama, harga, keterangan, lokasi)
values ('Jatim Park 1', 200000, 'Wisata Bagus', 'Banyuwangi'),
		('Jatim Park 2', 100000, '', 'Malang'),
		('Jatim Park 3', 150000, '', 'Surabaya'),
		('Jatim Park 4', 850000, '', 'Jember')
Select pariwisata_id, pariwisata_nama, lokasi, harga, keterangan from pariwisata


--METODE PEMBAYARAN
create table metode_pembayaran(
	metode_pembayaran_id serial primary key,
	metode_pembayaran_nama varchar(50)
)
select * from metode_pembayaran
insert into metode_pembayaran (metode_pembayaran_nama)
values ('OVO'), ('Kartu Kredit'), ('GoPay'), ('ShopeePay'), ('Dana')


--PESANAN
create table pesanan(
	pesanan_id serial primary key,
	customer_id int not null,
	pariwisata_id int not null,
	tanggal_tiket date not null,
	tanggal_beli date not null,
	metode_pembayaran_id int not null,
	jumlah_tiket int not null
)
alter table pesanan
add constraint fk_customer_id foreign key (customer_id) references customer(customer_id)
alter table pesanan
add constraint fk_pariwisata_id foreign key (pariwisata_id) references pariwisata(pariwisata_id)
alter table pesanan
add constraint fk_metode_pembayaran_id foreign key (metode_pembayaran_id) references metode_pembayaran(metode_pembayaran_id)

insert into pesanan (customer_id, pariwisata_id, tanggal_tiket, tanggal_beli, metode_pembayaran_id, jumlah_tiket)
values(1, 10, '10-06-2022', '01-06-2022', 1, 4),
	(2, 9, '15-06-2022', '10-06-2022', 3, 2),
	(3, 11, '17-06-2022', '08-06-2022', 4, 2),
	(2, 12, '16-06-2022', '11-06-2022', 2, 4)
select * from pesanan
drop table pesanan

insert into pesanan(customer_id, pariwisata_id, tanggal_tiket, tanggal_beli, metode, jumlah)
values (1, @pariwisata_id, @tanggal_tiket, @tanggal_beli, @metode, @jumlah)
