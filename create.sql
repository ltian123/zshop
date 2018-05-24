drop database if exists nmms;
create database nmms;
use nmms;

create table sys_user(
	user_id int primary key auto_increment,
	user_name varchar(20),
	login_name varchar(20),
	password varchar(50),
	phone varchar(20),
	address varchar(30),
	is_valid int,
	regist_date datetime
)engine=Innodb default charset=utf8;

create table sys_staff (
  staff_id int primary key AUTO_INCREMENT,
  staff_name varchar(50),
  login_name varchar(50),
  password varchar(50),
  phone varchar(50),
  email varchar(100),
  dept_id int,
  role varchar(10),
  is_valid int,
  create_date datetime,
  create_staff_id int(8)
)engine=Innodb default charset=utf8;
insert into sys_staff values(1,'管理员','admin','ISMvKXpXpadDiUoOSoAfww==','88888888','123456@itany.com',null,1001,1,null,null);

create table sys_dept (
  dept_id int primary key AUTO_INCREMENT,
  dept_name varchar(50),
  dept_no varchar(20),
  father_dept_id int,
  remark varchar(1024),
  create_date datetime,
  create_staff_id int,
  is_valid int
)engine=Innodb default charset=utf8;


create table sys_attache(
	attache_id int primary key auto_increment,
	file_type varchar(10),
	file_path varchar(100),
	create_date datetime,
	user_id int
)engine=Innodb default charset=utf8;

create table sys_product_type(
	id int primary key auto_increment,
	name varchar(20),
	status int
)engine=Innodb default charset=utf8;

create table sys_product(
	product_id int primary key auto_increment,
	product_no varchar(20),
	name varchar(20),
	price double,
	image varchar(20),
	product_type_id int
)engine=Innodb default charset=utf8;
alter table sys_product modify image varchar(200);


create table sys_order(
	id int primary key auto_increment,
	no varchar(30),
	price double,
	user_id int
)engine=Innodb default charset=utf8;

create table sys_item(
	id int primary key auto_increment,
	product_id int,
	num int,
	order_id int,
	price double
)engine=Innodb default charset=utf8;



create table sys_sequence(
	id int primary key auto_increment,
	name varchar(20),
	value varchar(20)
)engine=Innodb default charset=utf8;

