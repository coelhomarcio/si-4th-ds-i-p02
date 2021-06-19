create table if not exists Seller
(
	cd_Seller serial primary key,
	nm_Seller varchar(50) not null
);

create table if not exists SellerLog
(
	dt_Log       timestamp default localtimestamp not null,
	ds_SellerLog varchar(8)                       not null,
	cd_Log       int                              not null,
	nm_OldLog    varchar(50),
	nm_NewLog    varchar(50)
);

create table if not exists Customer
(
	cd_Customer    serial primary key,
	nm_Customer    varchar(50)        not null,
	cd_CustomerCpf varchar(11) unique not null
);

create table if not exists CustomerLog
(
	dt_Log         timestamp default localtimestamp not null,
	ds_CustomerLog varchar(8)                       not null,
	cd_Log         int                              not null,
	nm_OldLog      varchar(50),
	nm_NewLog      varchar(50),
	cd_CpfOldLog   varchar(11),
	cd_CpfNewLog   varchar(11)
);

create table if not exists Product
(
	cd_Product serial primary key not null,
	ds_Product varchar(50)        not null,
	qt_Product int                not null,
	vl_Product numeric(9, 2)      not null
);

create table if not exists ProductLog
(
	dt_Log        timestamp default localtimestamp not null,
	ds_ProductLog varchar(9)                       not null,
	cd_Log        int                              not null,
	ds_OldLog     varchar(50),
	ds_NewLog     varchar(50),
	qt_OldLog     int,
	qt_NewLog     int,
	vl_OldLog     numeric(9, 2),
	vl_NewLog     numeric(9, 2)
);

create table if not exists Cart
(
	cd_Cart         serial primary key,
	cd_Seller       int             not null,
	cd_Customer     int             not null,
	nm_SellerCart   varchar(50)     not null,
	nm_CustomerCart varchar(50)     not null,
	cd_ProductCart  int[]           not null,
	ds_ProductCart  varchar(50)[]   not null,
	qt_ProductCart  int[]           not null,
	vl_ProductCart  numeric(9, 2)[] not null,
	constraint fk_Seller foreign key (cd_Seller) references Seller (cd_Seller) on delete set null,
	constraint fk_Customer foreign key (cd_Customer) references Customer (cd_Customer) on delete set null
);
