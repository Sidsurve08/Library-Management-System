-- show databases;
-- if Libmngt exists drop database Libmngt; else-- 
create database Libmngt;

use Libmngt; -- for using db--

-- drop table books if exits else --
-- cretae table books --
create table books(
b_no int primary key  not null unique,
b_lic int not null unique,
b_name varchar(30) not null unique,
author_n varchar(40) not null,
b_lang varchar(20) not null,
issue_d date not null,
no_copies int not null, 
publish_d date not null,
publisher varchar(70) not null
);

-- altering table books --
alter table books add b_price integer not null;
alter table books add ver_n integer not null;
alter table books add availability_d date not null;
alter table books drop column availability_d;

-- drop table users if exits --
-- create table users --
create table users(
user_name varchar(50)  not null,
userl_name varchar(50) not null,
user_id int primary key not null unique ,
b_name varchar(30) not null,
foreign key (b_name) references books(b_name),
pay integer not null ,
remain integer ,
modee varchar(40) not null,
issue_d date not null 
 );
 
alter table users add rem_days integer not null ; 
alter table users add fine_days integer not null;
update users set rem_days=2 where user_id=37;
update users set rem_days=4 where user_id=38;
update users set fine_days=2 where user_id=39;
 
 -- drop table staff if exists --
 -- create table staff  --
 create table staff(
 emp_name varchar(40) not null ,
 empl_name varchar(40) not null,
 emp_id integer not null unique primary key,
 emp_role text not null ,
join_date date not null ,
exit_date date not null,
shift varchar(40) not null 
 );
 
-- drop table config if exists--
-- create table config --
create table config(
no_of_days integer not null primary key,
fine bigint not null 
);

-- inserting data into books table --
insert into books values(1,123,'manas','satish','marathi','2023-08-24', 15,'2023-06-23','ruturaj enterprises', 200, 1);
insert into books values(2,124,'vadalvat','rajesh','marathi','2023-08-15', 16,'2023-06-19','rutuja enterprises', 150, 1);
insert into books values(3,125,'waramwar','raj','hindi','2023-07-15', 19,'2023-05-20','sandy enterprises', 300, 1);
insert into books values(4,126,'badal','ratan ','hindi','2023-06-15', 35,'2023-04-20','sandy enterprises', 180, 2);
insert into books values(5,127,'shabdarth','rajiv','hindi','2023-07-14', 19,'2023-05-18','sandy enterprises', 300, 1);

-- inserting data into users table --
insert into users values('ram','verma',35,'manas',200,0,'buy','2023-09-2');
insert into users values('vishesh','verma',38,'vadalvat',100,50,'rent','2023-08-25');
insert into users values('vrat','shyam',36,'waramwar',300,0,'buy','2023-08-2');
insert into users values('vikrant','chaturvedi',37,'badal',100,80,'buy','2023-07-2'); 
insert into users values('ram','verma',39,'shabdarth',200,100,'rent','2023-09-2');

SET sql_mode = no_zero_date;
-- inserting data into staff table--
insert into staff values ('sanika','mohite',1,'head_librarian','2012-9-2','0000-00-00','mor');
insert into staff values ('sagarika','dcruz',2,'deputy_head_librarian','2012-10-5','0000-00-00','mor');
insert into staff values ('vilas','mohite',3,'deputy_head_librarian','2012-9-10','0000-00-00','night');
insert into staff values ('mainsh','shirke',4,'in_charge','2013-7-19','2018-9-2','aftr');
insert into staff values ('sanika','mohite',5,'dep_in_charge(c)','2014-12-8','0000-00-00','eve');
insert into staff values ('rakesh','shitap',6,'sen_emp','2018-8-12-2','0000-00-00','night');

-- inserting data into config --
insert into config values(1,20);
insert into config values(2,30);
insert into config values(3,60);
insert into config values(4,90);
insert into config values(5,120);
insert into config values(6,140);

select * from books;
select user_id,pay,remain,fine_days from users where fine_days=2;
select user_id from users where modee='buy';
select user_id from users where modee='rent';
select user_name from users where b_name IN (select b_name from books where b_lang='marathi');
