-- Create many tables from banking without using Constraints.

create database BANKING;

use Banking;

-- create tables Branch, Product, Customers, Accounts, Transactions, Employees

select * from Branch;
select * from Product;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Employees;

drop table Branch;
drop table Product;
drop table Customers;
drop table Accounts;
drop table Transactions;
drop table Employees;


create table Branch(
Branch_name varchar(50),
Branch_code char(10),
Location varchar(100) );

select * from Branch;
drop table Branch;

create table Product(
Prod_ID varchar(10),
Prod_Name varchar(20),
Prod_Desc varchar(200) );

select * from Product;
drop table Product;


create table Customers(
Customer_ID varchar(20),
First_Name varchar(40),
Last_Name varchar(40),
Phone_No int,
Address varchar(100),
DOB date,
Is_Active boolean );

select * from Customers;
drop table Customers;

insert into Customers values('C1','Harsh','Chaudhary',999899,'Ghaziabad','2002-05-07',true);

insert into Customers values('C2','Ayush','Sharma',989765,'Noida','1999-06-10',false);

insert into Customers(Customer_ID,First_Name,Last_Name,Is_Active)
values('C3','Anubhav','Sharma',true);


create table Accounts(
Acc_No int,
Acc_Type varchar(30),
Customer_ID varchar(20),
Balance float );

select * from Accounts;
drop table Accounts;

create table Transactions(
Trans_ID int,
Trans_Type varchar(20),
Trans_Date date,
Acc_No int,
Amount float,
Status varchar(10) );

select * from Transactions;
drop table Transactions;

create table Employees(
Emp_ID varchar(20),
First_Name varchar(40),
Last_Name varchar(40),
Salary float,
Branch_Code varchar(10) );

select * from Employees;
drop table Employees;



-- Create many tables from banking while using Constraints.

create database BANKING_2;

use BANKING_2;

-- create tables Branch, Product, Customers, Accounts, Transactions, Employees

select * from Branch;
select * from Product;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Employees;

drop table Branch;
drop table Product;
drop table Customers;
drop table Accounts;
drop table Transactions;
drop table Employees;


create table Branch(
Branch_name varchar(50),
Branch_code char(10),
Location varchar(100) );

select * from Branch;
drop table Branch;

create table Product(
Prod_ID varchar(10),
Prod_Name varchar(20),
Prod_Desc varchar(200) );

select * from Product;
drop table Product;

insert into Product values('P1','Savings',' ');

create table Customers(
Customer_ID varchar(20) primary key, -- Primary key is that coloumn does not have duplicate values.
First_Name varchar(40) not null,
Last_Name varchar(40),
Phone_No int unique, -- Unique key have null values but not Primary key.
Address varchar(100),
DOB date default(2024-08-01),
Gender varchar(1) check(Gender='M' or Gender='F'),
Is_Active varchar(10) check(Is_Active in ('Active','InActive')) );
-- Is_Active boolean ); -- not use in Oracle.

select * from Customers;
drop table Customers;

insert into Customers values('C1','Harsh','Chaudhary',999899,'Ghaziabad','2002-05-07','M','Active');

insert into Customers values('C2','Ayush','Sharma',989765,'Noida','1999-06-10','F','InActive');

insert into Customers(Customer_ID,First_Name,Last_Name,Is_Active)
values('C3','Anubhav','Sharma',true);

commit;
insert into customers
values('c30','ram','das',99987,'chennai','1990-06-07','M','active');

insert into customers
values('c31','rama','das',999837,'chennai','1990-06-07','M','active');

select * from customers;

rollback;

select * from customers;


create table Accounts(
Acc_No int,
Acc_Type varchar(20) references Product(Prod_Name), 
Customer_ID  varchar(30) references Customers(Customer_ID),
Balance float );

select * from Accounts;
drop table Accounts;
insert into Accounts values(12,'Current','c3',10000);
insert into Accounts values(12345,'savings','c10',9000);
insert into Accounts values(1234,'savings','c2',2000);
insert into Accounts values(123,'savings','c2',2000);
select * from Accounts;

CREATE TABLE TRANSACTIONS(
TRNS_ID        INT,
TRNS_TYPE      VARCHAR(20),  
TRNS_DATE      DATE,
ACC_NO         INT,
AMOUNT         FLOAT,
STATUS         VARCHAR(10),
constraint pk_trns primary key(TRNS_ID,TRNS_TYPE),
constraint fk_acc_no  foreign key(ACC_NO) references Accounts(Acc_No)
);







