CREATE DATABASE gayaAutoDB;

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

CREATE TABLE motor (
	motor_ID INT PRIMARY KEY,
	nomor_polisi CHAR(10),
	nomor_mesin CHAR(17),
	tahun_pembuatan INT,
	seri INT(8),
	masa_stnk DATE,
	tanggal_pembelian DATE
);

ALTER TABLE motor
ADD CONSTRAINT FK_pelanggan_ID
FOREIGN KEY (pelanggan_ID) REFERENCES pelanggan(pelanggan_ID);