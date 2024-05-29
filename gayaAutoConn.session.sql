CREATE DATABASE gayaAutoDB;

USE gayaautodb;
/* Tabel Pelanggan */
CREATE TABLE Pelanggan (
		pelanggan_ID INT PRIMARY KEY,
		nama_pelanggan VARCHAR(40),
		alamat_email VARCHAR(50),
		alamat_pelanggan VARCHAR(50),
		no_hp_pelanggan INT,
		tanggal_lahir_pelanggan DATE
);

ALTER TABLE pelanggan
RENAME column alamt_email TO alamat_email;

ALTER TABLE pelanggan
MODIFY COLUMN 	pelanggan_ID INT;

ALTER TABLE pelanggan
MODIFY COLUMN no_hp_pelanggan INT(12);
	

/*Tabel Admin */
CREATE TABLE Admin (
		admin_ID INT(30) PRIMARY KEY,
		nama_admin VARCHAR(20),
		alamat_admin VARCHAR(50),
		no_hp_admin VARCHAR(20),
		alamat_email VARCHAR(50),
		tanggal_lahir_admin DATE
);

ALTER TABLE ADMIN
MODIFY COLUMN Admin_ID INT auto_increment;

/* Tabel Akun*/
CREATE TABLE Akun (
		akun_ID INT PRIMARY KEY,
		username VARCHAR(40),
		sandi CHAR(255),
		poin INT
);

/*Tabel Bengkel*/
CREATE TABLE Bengkel (
		bengkel_ID INT PRIMARY KEY,
		nama_bengkel VARCHAR(50),
		alamat_bengkel VARCHAR(100)
);

/* Tabel Buat_Akun*/
CREATE TABLE Buat_Akun (
		tanggal_akun_dibuat DATE,
		CONSTRAINT FK_akun FOREIGN KEY (akun_ID) REFERENCES akun(akun_ID),
		CONSTRAINT FK_pelanggan FOREIGN KEY (pelanggan_ID) REFERENCES pelanggan(pelanggan_ID)
);

-- Tabel Motor
CREATE TABLE motor (
	motor_ID INT PRIMARY KEY,
	nomor_polisi CHAR(10),
	nomor_mesin CHAR(17),
	tahun_pembuatan INT,
	seri INT(8),
	masa_stnk DATE,
	tanggal_pembelian DATE
);

-- Menambahkan atribut foreign key di tabel motor
ALTER TABLE motor
ADD pelanggan_ID INT;

ALTER TABLE motor
ADD CONSTRAINT FK_pelanggan_ID
FOREIGN KEY (pelanggan_ID) REFERENCES pelanggan(pelanggan_ID);

-- Tabel order_service
CREATE TABLE order_service (
	order_ID INT PRIMARY KEY,
	kilometer_motor INT,
	jenis_service ENUM('reguler', 'full'),
	keluhan VARCHAR(200),
	status_pemesanan VARCHAR(1),
	jarak_service FLOAT,
	jenis_layanan_service ENUM('home_service', 'shop_service'),
	jadwal_mulai_service DATE,
	hari VARCHAR(1),
	tanggal DATE,
	jam_service TIME,
	estimasi_pembayaran FLOAT
);

-- Menambahkan atribut foreign key di tabel order_service
ALTER TABLE order_service
ADD pelanggan_ID INT;
ALTER TABLE order_service
ADD voucher_ID INT;
ALTER TABLE order_service
ADD admin_ID INT;

ALTER TABLE order_service
ADD CONSTRAINT FK_order_pelanggan_ID
FOREIGN KEY (pelanggan_ID) REFERENCES pelanggan(pelanggan_ID);
ALTER TABLE order_service
ADD CONSTRAINT FK_voucher_ID
FOREIGN KEY (voucher_ID) REFERENCES voucher(voucher_ID);
ALTER TABLE order_service
ADD CONSTRAINT FK_admin_ID
FOREIGN KEY (admin_ID) REFERENCES admin(admin_ID);


-- Tabel offer_service
CREATE TABLE offer_service (
	bengkel_ID INT,
	order_ID INT,
	CONSTRAINT PK_offer_service PRIMARY KEY (bengkel_ID, order_ID)
);

-- Menambahkan atribut foreign key di tabel offer_service
ALTER TABLE offer_service
ADD CONSTRAINT FK_bengkel_ID
FOREIGN KEY (bengkel_ID) REFERENCES bengkel(bengkel_ID);

ALTER TABLE offer_service
ADD CONSTRAINT FK_order_ID
FOREIGN KEY (order_ID) REFERENCES order_service(order_ID);