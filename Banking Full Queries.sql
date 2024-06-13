 -- Create database using below command:
CREATE DATABASE BANKING;

use Banking;

-- Connect to BANKING database and create below tables.

-- BANKING Dataset
-- Customers
-- Accounts
-- Products - car loan, house loan, fixed deposit, saving account
-- Employees
-- Transactions - type of trns, amt, date,
-- Branch 

create table customers
(
    first_name  varchar(20) not null,
    last_name   varchar(20) not null,
    id     int primary key,
    acc_no      int references accounts(acc_no),
    dob         date,
    address     varchar(200), 
    def char(1) );
    -- phone       bigint

drop table customers;
select * from customers;

alter table customers rename column id to cust_id;
alter table customers rename to customers_new;
alter table customers_new rename to customers;
-- alter table customers alter column phone bigint;
alter table customers add phone bigint;
alter table customers drop column def;

-- rename column 
-- rename table name
-- modify a data type
-- add a column
-- remove a column

drop table customers;


-- ASSIGNMENTS:
-- Create the following 5 tables.
-- Have appropriate columns and data types and also try to have these tables related to one another.


------ session 2 ---------

-- DB_NAME : BANKING

SELECT * FROM BRANCH;
SELECT * FROM PRODUCTS;
SELECT * FROM CUSTOMERS;
SELECT * FROM ACCOUNTS;
SELECT * FROM TRANSACTIONS;
SELECT * FROM EMPLOYEES;

DROP TABLE EMPLOYEES;
DROP TABLE BRANCH;
DROP TABLE PRODUCTS cascade;
DROP TABLE TRANSACTIONS;
DROP TABLE ACCOUNTS;
DROP TABLE CUSTOMERS;


CREATE TABLE BRANCH
(
	BRANCH_NAME	 	VARCHAR(50),
	BRANCH_CODE		VARCHAR(10),
	LOCATION		VARCHAR(100)
);

CREATE TABLE PRODUCTS
(
	PROD_ID	 		VARCHAR(10),
	PROD_NAME		VARCHAR(20) unique,
	PROD_DESC		VARCHAR(200)
);

insert into products values ('P1','Savings','');
rollback;
commit;

drop table customers cascade;
rollback;

CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID		VARCHAR(20) primary key,
	FIRST_NAME		VARCHAR(40) not null,
	LAST_NAME		VARCHAR(40) ,
	PHONE_NO		INT unique,
	ADDRESS			VARCHAR(100),
	DOB				DATE,
	IS_ACTIVE		varchar(10) check (IS_ACTIVE in ('active', 'inactive'))
);

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C1', 'Mohan', 'Kumar', 990045, 'Bangalore', '1990-05-07', 'active');

insert into customers
values ('C2', 'James', 'Xavier', null, 'Chennai', '1995-05-07', 'active');

insert into customers (customer_id, first_name, last_name, is_active)
values ('C3', 'Mohan', 'Kumar', 'active');

insert into customers (customer_id, first_name, last_name, is_active)
values ('C4', 'David', null, 'active');

insert into customers (customer_id, first_name, last_name, is_active)
values ('C20', 'Stephen', null, 'active');

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C5', 'Adil', null, 99001122, 'Bangalore', '1990-05-07', 'active');

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C6', 'Ali', null, 990011223, 'Bangalore', '1990-05-07', 'active');

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C7', 'TFQ', null, 990011233, 'Bangalore', '1990-05-07', 'active');

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C8', 'Libinus', '', 990012299, 'Bangalore', '1990-05-07', 'active');


-- alter table customers alter column phone_no  bigint;





select * from CUSTOMERS;
commit;

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C30', 'Shiva', '', 99001100, 'Bangalore', '1990-05-07', 'active');

insert into customers (customer_id, first_name, last_name, phone_no, address, dob, is_active)
values ('C31', 'Vikram', '', 99001200, 'Bangalore', '1990-05-07', 'active');

rollback;

create table test(name varchar(10));





select * from information_schema.tables where table_schema in ('public', 'dev');

select * from products;



drop TABLE ACCOUNTS cascade;

CREATE TABLE ACCOUNTS
(
	ACC_NO			INT primary key,
	ACC_TYPE		VARCHAR(30) references products(prod_name),
	CUST_ID			VARCHAR(20) references customers(customer_id),
	BALANCE			FLOAT
);

insert into accounts values (12345, 'Savings', 'C1', 9000);
insert into accounts values (1234, 'Savings', 'C2', 2000);
insert into accounts values (1234567, 'Savings', 'C20', 2000);

select * from accounts;

commit;
rollback;


drop TABLE TRANSACTIONS;
CREATE TABLE TRANSACTIONS
(
	TRNS_ID			INT ,
	TRNS_TYPE		VARCHAR(20) ,
	TRNS_DATE		DATE,
	ACC_NO			INT ,
	AMOUNT			FLOAT,
	STATUS			VARCHAR(10) default 'Success',
    constraint pk_trns primary key(trns_id,TRNS_TYPE),
    constraint fk_acc_no foreign key(acc_no) references accounts(acc_no)
);

insert into TRANSACTIONS values (1,'Online Payment', current_date, 1234567, 100, 'Success');

insert into TRANSACTIONS values (1,'Withdrawal', current_date, 12345, 50, 'Success');

insert into TRANSACTIONS values (1,'test', current_date, 1234, 50, 'Success');

insert into TRANSACTIONS values (1,'Atm Withdrawal', current_date, 1234, 50, 'Success');
select * from accounts;

insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_no, amount, status)
values (2,'Online Payment', current_date, 12345, 100, 'Failre');

insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_no, amount)
values (3,'Online Payment', current_date, 12345, 100);

insert into TRANSACTIONS (trns_id, trns_type, trns_date, acc_no, amount, status )
values (4,'Online Payment', current_date, 12345, 100, default);


commit;

select * from TRANSACTIONS;


CREATE TABLE EMPLOYEES
(
	EMP_ID			VARCHAR(20),
	FIRST_NAME		VARCHAR(40),
	LAST_NAME		VARCHAR(40),
	SALARY			FLOAT ,
	BRANCH_CODE		VARCHAR(10)
);


----   session 3 notes ------

select * from information_schema.tables where table_schema='public';

select * from products;
insert into products values ('P2', 'Loan', null);

drop TABLE ACCOUNTS cascade;
CREATE TABLE ACCOUNTS
(
	ACC_NO			INT ,
	ACC_TYPE		VARCHAR(30) references products(prod_name),
	CUST_ID			VARCHAR(20) references customers(customer_id),
	BALANCE			FLOAT,
    constraint pk_acc primary key (acc_no, acc_type)
);

insert into accounts values (12345, 'Savings', 'C1', 9000);
insert into accounts values (1234, 'Savings', 'C2', 2000);
insert into accounts values (1234567, 'Savings', 'C20', 2000);
insert into accounts values (123456, 'Loan', 'C1', 9000);
select * from accounts;

drop TABLE TRANSACTIONS;
CREATE TABLE TRANSACTIONS
(
	TRNS_ID			INT generated by default as identity ,
	TRNS_TYPE		VARCHAR(20) ,
	TRNS_DATE		DATE,
	ACC_NO			INT ,
    acc_type        VARCHAR(30),
	AMOUNT			FLOAT,
	STATUS			VARCHAR(10) default 'Success',
    constraint pk_trns primary key(trns_id,TRNS_TYPE),
    constraint fk_acc_no foreign key(acc_no,acc_type) references accounts(acc_no,acc_type)
);

-- insert into TRANSACTIONS values (1,'Online Payment', current_date, 12345,'Savings', 100, 'Success');
-- insert into TRANSACTIONS values (1,'Withdrawal', current_date, 12345,'Savings', 50, 'Failure');
-- insert into TRANSACTIONS values (1,'test', current_date, 12345,'Savings', 50, default);
-- insert into TRANSACTIONS values (2,'test', current_date, 12345,'Savings', 555, default);
-- insert into TRANSACTIONS values (3,'test', current_date, 12345,'Loan', 333, default);
select * from TRANSACTIONS;

insert into TRANSACTIONS (trns_type,TRNS_DATE,acc_no,acc_type,amount,status)
values ('Online Payment', current_date, 12345,'Savings', 100, 'Success');

insert into TRANSACTIONS (trns_type,TRNS_DATE,acc_no,acc_type,amount,status)
values ('Online Payment', current_date, 12345,'Loan', 500, 'Failure');

insert into TRANSACTIONS (trns_type,TRNS_DATE,acc_no,acc_type,amount,status)
values ('Online Payment', current_date, 12345,'Loan', 200, default);

select * from TRANSACTIONS;



create table test (id serial, name varchar);
insert into test (name) values ('TFQ');
select * from test;


-- Syntax for MSSQL:
create table test (id int primary key identity(1,1), name varchar(20));
insert into test (name) values ('TFQ');

select * from test;


-- UPDATE DML command
select * from TRANSACTIONS;

update transactions
set amount = 999, trns_date = to_date('01-01-2020', 'dd-mm-yyyy')
where trns_id = 1;

rollback;
commit;


-- DELETE command:
select * from TRANSACTIONS;

delete from transactions;

delete from transactions
where trns_id = 1;

rollback; -- similar to undo. Removes the uncommitted transactions from the current session.

commit; -- permanently saves the changes to the DB.


-- TRUNCATE DDL command:
truncate table transactions;


-- SAVEPOINT command:
select * from TRANSACTIONS;
select * from accounts;

insert into TRANSACTIONS (trns_type,TRNS_DATE,acc_no,acc_type,amount,status)
values ('Online Payment', current_date, 12345,'Savings', 100, 'Success');

insert into TRANSACTIONS (trns_type,TRNS_DATE,acc_no,acc_type,amount,status)
values ('Online Payment', current_date, 12345,'Loan', 500, 'Failure');

savepoint after_2_trns;

insert into TRANSACTIONS (trns_type,TRNS_DATE,acc_no,acc_type,amount,status)
values ('Online Payment', current_date, 12345,'Loan', 200, default);

savepoint after_all_trns;

insert into accounts values (999, 'Savings', 'C1', 9000);

savepoint after_del_acc;

insert into accounts values (888, 'Savings', 'C1', 9000);

rollback;
commit;
rollback to after_all_trns;
rollback to after_2_trns;




-- MERGE command in Oracle
DROP TABLE EMPLOYEES;

CREATE TABLE EMPLOYEES
(
	EMP_ID			VARCHAR(20),
	FIRST_NAME		VARCHAR(40),
	LAST_NAME		VARCHAR(40),
	SALARY			FLOAT ,
	BRANCH_CODE		VARCHAR(10)
);

insert into employees values ('E1', 'Mohan', 'Kumar', 500, null);
insert into employees values ('E2', 'James', 'Xavier', 200, null);
insert into employees values ('E3', 'David', 'Smith', 300, null);
insert into employees values ('E4', 'Ali', 'Abdaal', 400, null);

create table emp_history as
select * from employees where 1=2;

select * from employees;
select * from emp_history;

merge into emp_history h
using employees e on (e.emp_id = h.emp_id)
when matched then
    update set h.salary = e.salary
    where h.salary <> e.salary
when not matched then
    insert (emp_id, first_name, last_name, salary,branch_code)
    values (e.emp_id, e.first_name, e.last_name, e.salary, e.branch_code);


update employees
set salary = 999
where emp_id = 'E1';



---    session 4 notes   -----
create role accenture ;

select * from customers;

create view vw_customers
as
select customer_id, first_name, last_name from customers;


select * from vw_customers;

grant all on vw_customers to accenture;

revoke select on vw_customers from accenture;



-- BASIC SQL QUERIES:

select * from BRANCH;
select * from CUSTOMERS;
select * from ACCOUNTS;
select * from TRANSACTIONS;
select * from EMPLOYEES;

-- select -- list all the columns / *
-- from -- tables
-- where -- filter conditions

-- 1) write a query to fetch trns_id, trns date, amount for online payment trns only.

select t.trns_id, t.trns_date, t.amount trns_amount
from transactions t
where trns_type = 'online payment';

-- 2) write a query to fetch employee name and salary whose salary is greater than 50000 and who belong to BR1

select  first_name, last_name, salary
from employees
where salary > 50000
and branch_code = 'BR1';

select * -- first_name, last_name, salary
from employees
where salary > 50000
or branch_code = 'BR1';


-- true and true --> true
-- true and false --> false
-- false and true --> false
-- false and false --> false

-- true or true --> true
-- true or false --> true
-- false or true --> true
-- false or false --> false


select * -- first_name, last_name, salary
from employees
where salary > 50000
and branch_code = 'BR1'
and salary < 60000;


select * -- first_name, last_name, salary
from employees
where salary > 50000
or branch_code = 'BR1'
or salary < 60000;


select * -- first_name, last_name, salary
from employees
where salary > 50000
and (branch_code = 'BR1'
    or salary < 60000);

select * -- first_name, last_name, salary
from employees
where salary > 50000
and branch_code = 'BR1'
    or salary < 60000;


-- 3) fetch employees whose first name starts with J or whose salary is greater than 70000.
select *
from employees
where first_name like 'J%'
or salary > 70000;


select *
from employees
where first_name not like 'J%'
or salary > 70000;


-- 4) fetch accounts with balance in between 3000 to 5000
select *
from ACCOUNTS
where balance between 3000 and 5000;


select *
from ACCOUNTS
where balance >= 3000 and balance <= 5000; 


-- 5) find if a given number is even or odd ? Given numbers are 432, 77

select case when 432 % 2 = 1
                then 'Odd Number'
            else 'Even Number'
       end as odd_or_even ;

select case when 77 % 2 = 1
                then 'Odd Number'
			else 'Even Number'
       end as odd_or_even ;


-- 6) find customer who did not provide a phone no.
select *
from customers
where phone_no is null;


-- 7) Find all the different type of transaction.
select distinct trns_type, trns_date
from transactions;


-- 8) sort the employee data as per first name and highest dob.

select * from CUSTOMERS
order by first_name , dob desc;


select * from ACCOUNTS
order by acc_type , balance desc;

-- 9) Fetch the first 5 trns

select * from transactions -- postgresql, mysql
limit 2;

-- select top 5 * from transactions; -- mssql

-- select * from transactions where row <= 5; -- oracle

-- select * from transactions fetch next 5 records only; -- oracle



-- Assignments for Session 5:

-- 1) Fetch all transaction data.

select * from transactions;

-- 2) Fetch account_number and acc type from all accounts.

select acc_no,acc_type
from accounts as A
where exists (
            select acc_no
            from transactions as T
            where A.acc_no=T.acc_no);

-- 3) Fetch customer id and name of all active customers.
-- 4) Fetch customer id and name of all active customers who were born after 2000.
-- 5) Find employees whose salary ranges from 50k to 70k
-- 6) Find customers who have not provided basic information such as address or phone number.
-- 7) Find customers having "oo" in their name.
-- 8) Identify the total no of wire transfer transactions.
-- 9) Identify the unique transaction type.
-- 10) Fetch the first 5 transactions
-- 11) Fetch the inactive customers name, phone no, address and dob. Display the the oldest customer first.
-- 12) Find the customers who are from either "77 Lien Park", "337 Westend Park" or "9 Troy Plaza".
-- 13) Fetch all customers who have "Park" or "Plaza" in their address.


---    session 5th notes -----
-- Using BANKING dataset:

select * from BRANCH;
select * from CUSTOMERS;
select * from ACCOUNTS;
select * from TRANSACTIONS;
select * from EMPLOYEES;

8) Identify the total no of wire transfer transactions.

window functions
aggregate functions -- sum, avg, min, max, count
in build functions - date functions, string functions, etc etc

select count(*), sum(amount), avg(amount), min(trns_date), max(trns_date)
from transactions
where trns_type = 'wire transfer';

select count(*)
from transactions
where trns_type <> 'wire transfer'; -- we can also use != to represent NOT EQUAL TO

select count(*), count(1), count(1234446), count('XYZ'), count(phone_no), count(customer_id)
from customers ;

select count(distinct is_active)
from customers ;

select count(*)
from transactions
where trns_type <> 'wire transfer'
or 1 = 2;


14) Find employees working in Mumbai

select * from EMPLOYEES
where branch_code = 'BR2';

select * from branch where branch_name = 'Mumbai';

-- INNER JOIN

select e.*, b.*
from employees e
inner join branch b on b.branch_code = e.branch_code
where b.branch_name = 'Mumbai';

select e.*, b.*
from employees e
inner join branch b on b.branch_code = e.branch_code and b.branch_name = 'Mumbai';

/*
select e.*, b.*
from employees e
inner join branch b on e.emp_id = b.branch_code;
*/


15) Find total no of successful transactions that belong to inactive customers. ---

select * from CUSTOMERS;
select * from transactions;
select * from accounts;

select count(*)
from customers c
join accounts a on a.cust_id = c.customer_id
join transactions t on t.acc_number = a.account_number
where t.status = 'Success'
and c.is_active = 'false';

/* does not work due to order of the tables
select count(*)
from transactions t
join accounts a on a.cust_id = c.customer_id
join customers c on t.acc_number = a.account_number
where t.status = 'Success'
and c.is_active = 'false'; */


16) Categorise employees based on their salary.
[Below 50k is Low salary, between 50k to 70 is medium salary, above 70k is high salary.]

select  (first_name || ' ' || last_name) as full_name
, case when salary < 50000 then 'Low Salary'
       when salary between 50000 and 70000 then 'Medium Salary'
       when salary > 70000 then 'High Salary'
       else 'STRANGE'
  end as categories
from employees;


select 'tech' || ' ' || 'TFQ' as name;
select concat('tech', 'TFQ', ' ', 'YouTUBE') as name;



17) Find the total balance of all savings account.

select sum(balance)
from accounts
where acc_type = 'Saving'


18) Display the total account balance in all the Loan and saving accounts.

SELECT sum (balance)
from accounts
WHERE acc_type = 'Loan' or acc_type = 'Saving';

SELECT sum (balance)
from accounts
WHERE acc_type  in ('Loan', 'Saving') ;



-- Using Sales Order Dataset:

select * from Sales_order;
select * from Customers;
select * from Products;

1) Fetch all the small shipped orders from August 2003 till the end of year 2003.

select *
from sales_order
where deal_size = 'Small'
and month_id >= 8
and year_id = 2003;

select *
from sales_order
where deal_size = 'Small'
and order_date between to_date('01-08-2003', 'dd-mm-yyyy') and  to_date('31-12-2003', 'dd-mm-yyyy')

select *
from sales_order
where deal_size = 'Small'
and month_id between 8 and 11
and year_id = 2003;


2) Find all the orders which do not belong to customers from USA and are still in process.

select * from Customers where country <> 'USA';
select * from sales_order where status = 'In Process';

select *
from Customers C
JOIN sales_order s on s.customer = c.customer_id
where c.country <> 'USA'
and s.status = 'In Process';


-- Assignemts for Session 6:
3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
5) Find customers whose phone number does not have any space.
6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
7) Find orders which sold the product for price higher than its original price.
8) Find the average sales order price
9) Count total no of orders.
10) Find the total quantity sold.
11) Fetch the first order date and the last order date.


---  session 7 notes ------
/* START: How to Find the constraints in tables */

-- Microsoft SQL Server
SELECT TABLE_NAME,
       CONSTRAINT_TYPE,CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME=’student’;

Reference URL: https://learnsql.com/cookbook/how-to-find-the-name-of-a-constraint-in-sql-server/


-- Oracle:
SELECT *
  FROM user_cons_columns
 WHERE table_name = '<your table name>';


-- PostgreSQL:
SELECT conname, contype
FROM pg_catalog.pg_constraint
JOIN pg_class t ON t.oid = c.conrelid
WHERE t.relname ='student';


-- MySQL:
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'yourTableName';

/* END: How to Find the constraints in tables */




-- Solution to Assignments from Session 6:

3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
        select *
        from Sales_order s
        join products p on p.product_code=s.product
        where p.product_line in ('Planes', 'Ships', 'Trains')
        and s.deal_size not in ('Shipped', 'In Process', 'Resolved');
4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
        select *
        from Customers
        where phone like '%+%' or phone like '%(%' or phone like '%)%';
5) Find customers whose phone number does not have any space.
        select *
        from Customers
        where phone not like '% %';
6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
        select *
        from Sales_order
        where order_date between to_date('01-02-2003', 'dd-mm-yyyy') and to_date('31-05-2003', 'dd-mm-yyyy')
        and quantity_ordered % 2 = 0;
7) Find orders which sold the product for price higher than its original price.
        select s.order_number, s.price_each, p.price, p.product_line, p.product_code
        from Sales_order s
        join products p on p.product_code=s.product
        where s.price_each > p.price;

8) Find the average sales order price
        select round(avg(sales)::decimal,2) as avg_sales
        from Sales_order;
9) Count total no of orders.
        select count(1) as total_orders from Sales_order;
10) Find the total quantity sold.
        select sum(quantity_ordered) as total_items_sold from Sales_order;
11) Fetch the first order date and the last order date.
        select min(order_date) first_order_date, max(order_date) last_order_date
        from sales_order;



-- GROUP BY & HAVING clause

select * from Sales_order;
select * from Customers;
select * from Products;

select product_line
from products
group by product_line;

select product_line, count(1)
from products
group by product_line;

select count(1)
from products;


select product_code, count(1)
from products
group by product_code;


select country ,count(1)
from Customers
group by country;


select country,city from  Customers where country = 'Spain';


select country , max(city), MIN(CITY)
from Customers
where country = 'Spain'
group by country;


select country , count(1)
from Customers
where country = 'Spain'
group by country;

select country, city from Customers where country = 'Spain';

select country,city, max(state) , count(1)
from Customers
where country = 'Spain'
group by country, city;

select country , max(city), MIN(CITY)
from Customers
where country = 'Spain'
group by country, city;

select country , max(city), MIN(CITY)
from Customers
where country = 'Spain'
group by country, city;

select count(1)
from Customers
where country = 'Spain'
group by country, city;

-- rules for Group by
1) column list in GROUP by and SELECT should match
2) Any additional column in select clause must be within the aggregate functions.
3) select clause only has aggregate functions
4) group by columns should either be present in select clause as standalone columns or within the aggregate functions.


select count(1)
from products;

select count(1)
from products
group by product_line;


-- fetch all product categories who have more than 20 vehicles under them
select product_line, count(1)
from products
group by product_line
having count(1) > 20;


-- fetch all product categories who have less than 20 vehicles under them. Do not consider Trains
select product_line, count(1) -- 3
from products  -- 1
where product_line <> 'Trains' -- 2
group by product_line -- 4
having count(1) < 20 -- 5
order by 1 -- 6
limit 2; -- 7


select product_line --, count(1)
from products
where product_line <> 'Trains'
group by product_line
having count(1) > 20




-- Difference in HAVING and where

-- Display the total salary given to all employees. Display it only if it is greater than 5000.
select sum(salary)
FROM Employees
Having sum(salary) >5000;

select sum(salary)
FROM Employees
where salary >5000;


-- Fetch the total salary earned in each branch. Display only total salary is greater than 5000.
select sum(salary)
FROM Employees
group by branch_code
Having sum(salary) >5000


select * from Employees;


--- session 8 notes ----
select * from customers;
select * from products;
select * from sales_order;

1) Find the average sales order price based on deal size
select deal_size, round(avg(sales)::decimal,2) avg_sales
from sales_order
group by deal_size;

select deal_size, round(avg(cast(sales as decimal)),2) avg_sales
from sales_order
group by deal_size;


2) Find total no of orders per each day. Sort data based on highest orders.

select order_date,count(1) as num_orders
from sales_order
group by order_date
order by 2 desc;

select order_date,count(1) as num_orders
from sales_order
group by order_date
order by count(1) desc;

select order_date,count(1) as num_orders
from sales_order
group by order_date
order by num_orders desc;



3) Display the total sales figure for each quarter. Represent each quarter with their respective period.

select case when qtr_id = 1 then 'Jan-Mar'
            when qtr_id = 2 then 'Apr-Jun'
            when qtr_id = 3 then 'Jul-Sep'
            when qtr_id = 4 then 'Oct-Dec'
            else 'Invalid Quarter'
       end as quarter
, round(sum(sales::decimal),2) total_sales
from sales_order
group by qtr_id;





4) Identify how many cars, Motorcycles, trains and ships are available in the inventory.
Treat all type of cars as just "Cars".

-- Solution 1:
select product_line, count(1)
from (
        select case when product_line in ('Classic Cars', 'Vintage Cars') then 'Cars'
                    else product_line
               end as product_line
        from products
        where product_line in ('Classic Cars', 'Vintage Cars', 'Motorcycles', 'Trains', 'Ships')
    )
group by product_line;


Solution 2:

select case when product_line in ('Classic Cars', 'Vintage Cars') then 'Cars'
            else product_line
       end as product_line
, count(1)
from products
where product_line in ('Classic Cars', 'Vintage Cars', 'Motorcycles', 'Trains', 'Ships')
group by case when product_line in ('Classic Cars', 'Vintage Cars') then 'Cars'
            else product_line
       end ;

select case when product_line in ('Classic Cars', 'Vintage Cars') then 'Cars'
            else product_line
       end as new_product_line
, count(1)
from products
where product_line in ('Classic Cars', 'Vintage Cars', 'Motorcycles', 'Trains', 'Ships')
group by new_product_line;


Solution 3:

select product_line, count(1)
from products
where product_line in ('Motorcycles', 'Trains', 'Ships')
group by product_line
union all
select 'Cars' as prod, count(1)
from products
where product_line in ('Classic Cars', 'Vintage Cars');





select 'Mohan'
union all
select 'Mohan'
union all
select 'James';


(select 'Mohan'
union
select 'James')

except
select 'James';



-- Solutions from learners;
select product_line, count(product_line) as product_line_count
from products group by product_line having product_line in ('Motorcycles', 'Classic Cars', 'Trains', 'Ships')

select product_line,count(1) from Products
where PRODUCT_LINE like '%Car%' or PRODUCT_LINE like '%Motorcycle%' or PRODUCT_LINE like '%Trains%'
group by product_line

select product_line, count(1) from products
where upper(product_line) like '%CARS%' or upper(product_line) = 'MOTORCYCLES' or upper(product_line) = 'TRAINS' OR upper(product_line) = 'SHIPS'
GROUP BY PRODUCT_LINE;

HEm: pretty correct
SELECT CASE WHEN PRODUCT_LINE LIKE '%Cars%' THEN 'Cars' ELSE PRODUCT_LINE END AS TYPE
, COUNT(1)
FROM PRODUCTS
GROUP BY CASE WHEN PRODUCT_LINE LIKE '%Cars%' THEN 'Cars' ELSE PRODUCT_LINE END



-- create table test("first name" varchar(20)); -- allowed in sql but not recommended. DO not have space in your column name.


-->
5) Identify the vehicles in the inventory which are short in number.
Shortage of vehicle is considered when there are less than 10 vehicles.


select product_line , count(1)
from products
group by product_line
having count(1) < 10;



-- Assignments:
6) Find the countries which have purchased more than 10 motorcycles.
7) Find the orders where the sales amount is incorrect.
8) Fetch the total sales done for each day.
9) Fetch the top 3 months which have been doing the lowest sales.



---    session 9 notes ----
-- Assignments & solutions from Session 8:
6) Find the countries which have purchased more than 10 motorcycles.
    select p.product_line, c.country, count(1)
    from Sales_order s
    join products p on p.product_code = s.product
    join customers c on c.customer_id = s.customer
    where p.product_line = 'Motorcycles'
    group by p.product_line, c.country
    having count(1) > 10
    order by 3 desc;
7) Find the orders where the sales amount is incorrect.
    select *
    from Sales_order
    where (quantity_ordered*price_each)::decimal <> sales ;
8) Fetch the total sales done for each day.
    select order_date, sum(sales)::decimal as sales
    from Sales_order
    group by order_date
    order by 2 desc;
9) Fetch the top 3 months which have been doing the lowest sales.
    select to_char(order_date, 'Mon'), sum(sales)::decimal as sales
    from Sales_order
    group by to_char(order_date, 'Mon')
    order by 2
    limit 3;


-- SESSION 9 STARTS here:

-- Order of execution in SQL:
SELECT      -- 6
FROM        -- 1
JOIN        -- 2
WHERE       -- 3
GROUP BY    -- 4
HAVING      -- 5
ORDER BY    -- 7
LIMIT       -- 8


-- SUBQUERY: Subquery is a query inside a query. Also referred to as inner query.
Types of subquery:
-- Scalar subquery
    --> Returns 1 row and 1 column
-- Multirow subquery:
    --> a) Returns multiple rows and 1 column
    --> b) Returns multiple rows and multiple column
-- Correlated subquery
    --> a subquery which depends on the outer query.

select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

1) Fetch paintings that are priced higher than the average painting price.

select *
from paintings
where listed_price > (select avg(listed_price) from paintings);

-- Select * from paintings having listed_price > avg(listed_price); -- WRONG SYNTAX

2) Fetch all collectors who purchased paintings.

select *
from collectors
where id in (select collector_id from sales);

select distinct c.*
from collectors c
join sales s on s.collector_id = c.id


3) Fetch the total amount of sales for each artist who has sold at least one painting.
Display artist name and total sales amount

select a.*, x.total_amt
from artists a
join  (select artist_id, sum(sales_price) total_amt
       from sales s
       group by artist_id) x
    on x.artist_id = a.id;

select artist_id, a.first_name, a.last_name, sum(sales_price), count(1)
from sales s
join artists a on a.id = s.artist_id
group by artist_id, a.first_name, a.last_name;


4) Fetch the total amount of sales for each artist who has sold either 1 or 2 paintings only.
Display also the no of paintings sold.

select artist_id, a.first_name, a.last_name, sum(sales_price), count(1)
from sales s
join artists a on a.id = s.artist_id
group by artist_id, a.first_name, a.last_name
having count(1) between 1 and 2;

-- Solution from learners:
Hem
SELECT ARTIST_ID, A.FIRST_NAME, A.LAST_NAME, SUM(SALES_PRICE) AS "Total Sales", COUNT(1) AS "Paintings Sold"
FROM SALES S
INNER JOIN ARTISTS A ON A.ID = S.ARTIST_ID
GROUP BY ARTIST_ID, A.FIRST_NAME, A.LAST_NAME HAVING COUNT(1) IN ('1', '2')

Leigh
select concat(first_name,' ', last_name) as artist, sum(sales_price),count(painting_id) as no_paintings
from artists as art
right join sales on artist_id = art.id
group by artist having count(painting_id) in (1,2);

select concat(first_name,' ', last_name) as artist, sum(sales_price),count(painting_id) as no_paintings
from artists as art
right join sales on artist_id = art.id
group by first_name,last_name having count(painting_id) in (1,2)


jay -- wrong
select sum(sales_price), first_name, last_name
from artists join sales on artists.id = sales.artist_id
where sales between 1 and 2 group by first_name,last_name;

Adam
select a.artist_id, sum(sales_price)
from sales
join ( select artist_id from sales group by artist_id having count(1) in (1,2) ) a
    on sales.artist_id = a.artist_id group by a.artist_id

Prashanth
Select a.first_name,a.Last_name,x.total_amount
From artists a
Join (select artist_id,Sum(sales_price) total_amount
      From sales s Group by artist_id Having count(sales_price) between 1 and 2) x
        On a.id=x.artist_id

Brent
select s.artist_id, a.first_name, a.last_name,sum(sales_price), count(*)
from sales s
join artists a on a.id=s.artist_id
group by s.artist_id, a.first_name, a.last_name having count(*) in (1,2)



5) Find the names of the artists who had zero sales.

select *
from artists a
where not exists (select 1 from sales s
                  where s.artist_id = a.id);

select *
from artists a
where id not in (select artist_id from sales s );



6) Suppose you insert the below 2 records to the artists table. Write a query to identify the duplicate artists.
    insert into artists values (5,'Kate','Smith');
    insert into artists values (6,'Natali','Wein');

    select * from artists;

    select first_name, last_name, count(1)
    from artists
    group by first_name, last_name
    having count(1) > 1;


ASSIGNMENTS:
7) How would you delete the duplicate records in artists table?
8) For each collector, calculate the number of paintings purchased



--    session 10th notes   ---

select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

6) Suppose you insert the below 2 records to the artists table. Write a query to identify the duplicate artists.
    insert into artists values (5,'Kate','Smith');
    insert into artists values (6,'Natali','Wein');

    select * from artists;

    select first_name, last_name, count(1)
    from artists
    group by first_name, last_name
    having count(1) > 1;

7) How would you delete the duplicate records in artists table?

   select a.*, a.ctid from artists a;

   -- This works for all
   delete from artists
   where ctid in (
                   select max(ctid)
                   from artists
                   group by first_name, last_name
                   having count(1) > 1);

   -- If multiple duplicate records then use below query.
   delete from artists
   where ctid not in (
                   select min(ctid)
                   from artists
                   group by first_name, last_name);

   -- This query works if the table already has a unique column (like id in this case)
   delete from artists
   where id in (
                   select max(id)
                   from artists
                   group by first_name, last_name
                   having count(1) > 1);


-- In Oracle:
   delete from artists
   where rowid in (
                   select max(rowid)
                   from artists
                   group by first_name, last_name
                   having count(1) > 1);

-- in MySQL:
-- Using self join
delete a from artists a
join artists b
where a.id > b.id
and a.first_name = b.first_name
and a.last_name = b.last_name;


-- using window function: -- creates Windows/Partitions
select *
, row_number() over()  as single_part
, row_number() over(partition by first_name order by first_name)  as rn_with_partitions
from artists;

delete from artists
where id in (select id
            from (select *
                , row_number() over(partition by first_name, last_name )  as rn
                from artists) x
            where rn > 1);


-- explanation for why we cannot use rn inside subquery:
select * from (
                select *
                , row_number() over(partition by first_name, last_name )  as rn
                from artists ) x
where rn > 1;


-- Imagine a table with 1M records and 10k duplicate records. How to delete faster?
    insert into artists values (2,'Kate','Smith');
    insert into artists values (3,'Natali','Wein');
-- Option 1:
select * from artists; -- 6 records
select * from artists_bkp; -- 4 records

create table artists_bkp as
select distinct * from artists;

truncate table artists;

insert into artists
select * from artists_bkp;

drop table artists_bkp;


-- Option 2: -- Not recomended in production or dev environment (if table is used by other ppl)

create table artists_bkp as
select distinct * from artists;

drop table artists;
alter table artists_bkp rename to artists;





-- JOINS
INNER JOIN / JOIN
LEFT OUTER JOIN / LEFT JOIN
RIGHT OUTER JOIN / RIGHT JOIN
FULL OUTER JOIN / FULL JOIN
NATURAL JOIN
CROSS JOIN
SELF JOIN

INNER JOIN --> Returns matching records
LEFT JOIN  --> INNER JOIN + Returns records present only in LEFT table (based on the join condition).
RIGHT JOIN --> INNER JOIN + Returns records present only in RIGHT table (based on the join condition).
FULL JOIN  --> INNER JOIN + LEFT JOIN + RIGHT JOIN

-- New Painting dataset for JOINS
select * from paintings;
select * from artists;
select * from collectors;
select * from sales;


1) Fetch names of all the artists along with their painting name.
    If an artist does not have a painting yet, display as "NA"

select a.id,concat(a.first_name, ' ', a.last_name) as artist_name
, p.name as painting_name
from artists a join paintings p on p.artist_id = a.id


select a.id,concat(a.first_name, ' ', a.last_name) as artist_name
, case when p.name is null
            then 'NA'
       else p.name
  end as painting_name
from artists a left join paintings p on p.artist_id = a.id;


select a.id,concat(a.first_name, ' ', a.last_name) as artist_name
, coalesce(p.name, 'NA') as painting_name
from artists a left join paintings p on p.artist_id = a.id


-- Alternate functions for coalesce in other RDBMS is:
-- Oracle --> NVL, NVL2, coalesce
-- MySQL --> ifnull
-- MSSQL --> COALESCE

-- mentioning tables in the left of join and the right of join clause matters. -- below returns wrong data.
select a.id,concat(a.first_name, ' ', a.last_name) as artist_name
, case when p.name is null
            then 'NA'
       else p.name
  end as painting_name
from paintings p left join artists a on p.artist_id = a.id



--  session 11th notes ---

select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

2) Find collectors who did not purchase any paintings.

select c.*
from sales s
right join collectors c on c.id = s.collector_id
where s.id is null;


3) Find how much each artist made from sales. And how many paintings did they sell.

select first_name, sum(sales_price) , count(1)
from sales s
join (select first_name,id from artists) a on a.id = s.artist_id
group by first_name ;


4) Display all the available paintings and all the artist. If a painting was sold then mark them as "Sold".
    and if more than 1 painting of an artist was sold then display a "**" beside their name.

select p.name as painting_name
, concat(a.first_name, ' ', a.last_name, case when x.no_of_paintings > 1 then ' **' end ) as artist_name
, case when s.id is not null then 'SOLD' end as sold_or_not
from paintings p
full join artists a on a.id = p.artist_id
left join sales s on s.painting_id = p.id
left join (select artist_id, count(*) as no_of_paintings
           from sales group by artist_id) x on x.artist_id = a.id;




5) Using a NATURAL join for Question #3:

    --3) Find how much each artist made from sales. And how many paintings did they sell.
    select first_name, sum(sales_price) , count(1)
    from sales s
    join artists a on a.id = s.artist_id
    group by first_name ;


    select first_name, sum(sales_price) , count(1)
    from sales s
    natural join artists a
    group by first_name ;

    -- alter table artists rename column id to artist_id;
    -- alter table artists rename column artist_id to id;


6) Using CROSS Join:

    select p.name as painting_name, a.first_name
    from paintings p
    cross join (select * from artists where first_name='Kate') a ;

    table 1     table 2
    row 1       row 1
    row 2       row 2
    row 3       row 3

-- Non ANSI way of joining tables.
select * from paintings,sales;

-- ANSI way of joining tables.
select * from paintings cross join sales;




-- JOINS Testing:

create table table_1
(id int);

create table table_2
(id int);

insert into table_1 values (1),(1),(1),(2),(3),(3),(3);
insert into table_2 values (1),(1),(2),(2),(4),(null);

select * from table_1;
select * from table_2;

Questions.
select *
from table_1 t1
join table_2 t2 on t1.id = t2.id;

select *
from table_1 t1
left join table_2 t2 on t1.id = t2.id;

select *
from table_1 t1
right join table_2 t2 on t1.id = t2.id;

select *
from table_1 t1
full join table_2 t2 on t1.id = t2.id;

select *
from table_1 t1
NATURAL join table_2 t2;

select *
from table_1 t1
cross join table_2 t2;

-- session 12th notes ----


-- Solution 2 for Query #4 from previous session (session 11)
/* 4) Display all the available paintings and all the artist. If a painting was sold then mark them as "Sold".
    and if more than 1 painting of an artist was sold then display a "**" beside their name. */
-- Replacing FULL join with LEFT, RIGHT and UNION.

with cte as
	(select p.id as painting_id, a.id as artist_id, p.name as painting_name, concat(a.first_name, ' ', a.last_name) as artist_name
	from paintings p
	left join artists a on a.id = p.artist_id
	union
	select p.id as painting_id, a.id as artist_id, p.name as painting_name, concat(a.first_name, ' ', a.last_name) as artist_name
	from paintings p
	right join artists a on a.id = p.artist_id)
select painting_name
, concat(cte.artist_name, case when x.no_of_paintings > 1 then ' **' end ) as artist_name
, case when s.id is not null then 'SOLD' end as sold_or_not
from cte
left join sales s on s.painting_id = cte.painting_id
left join (select artist_id, count(*) as no_of_paintings
           from sales group by artist_id) x on x.artist_id = cte.artist_id;



-- Here Starts Session 12 Notes:

select * from sales_order;
select * from customers;
select * from products;

-- WITH clause in SQL. Also referred to as CTE (Common Table Expression)

1) Find the most profitable orders. Most profitable orders are those
whose sale price exceeded the average sale price for each city and whose deal size was not small.

-- Solution 1: Using WITH clause
with avg_sales_per_city as
    (select c.city, avg(sales) as avg_sales
    from sales_order s
    join customers c on c.customer_id = s.customer
    group by c.city)
select s.*
from sales_order s
join customers c on c.customer_id = s.customer
join avg_sales_per_city av on av.city = c.city
where s.sales > av.avg_sales
and s.deal_size <> 'Small';

-- Solution 2: Using Correlated subquery
select s.*
from sales_order s
join customers c on c.customer_id = s.customer
where s.sales > (select avg(sales)
                from sales_order s2
                join customers c2 on c2.customer_id = s2.customer
                 where c2.city = c.city
                group by c.city)
and s.deal_size <> 'Small';


-- Alternate question:
1 b) Find the most profitable orders. Most profitable orders are those
whose sale price exceeded the average sale price and whose deal size was not small

select s.*
from sales_order s
join customers c on c.customer_id = s.customer
where s.sales > (select avg(sales)
                from sales_order s2)
and s.deal_size <> 'Small';




2) Find the difference in average sales for each month of 2003 and 2004.

-- Solution 1: Using multiple WITH clause temp tables.
with yr_2003 as
        (select year_id, to_char(order_date, 'MON') as mon, avg(sales) as avg_sales
        from sales_order s
        where year_id = 2003
        group by year_id, to_char(order_date, 'MON')),
    yr_2004 as
        (select year_id, to_char(order_date, 'MON') as mon, avg(sales) as avg_sales
        from sales_order s
        where year_id = 2004
        group by year_id, to_char(order_date, 'MON'))
select Y03.mon, abs(Y03.avg_sales - Y04.avg_sales) as diff
from yr_2003 Y03
join yr_2004 Y04 on Y03.mon = Y04.mon;


-- Solution 2: using SELF join.
with cte as
    (select year_id, to_char(order_date, 'MON') as mon, avg(sales) as avg_sales
    from sales_order s
    where year_id in (2003, 2004)
    group by year_id, to_char(order_date, 'MON'))
select Y03.mon, abs(Y03.avg_sales - Y04.avg_sales) as diff
from cte Y03
join cte Y04 on Y03.mon = Y04.mon
where Y03.year_id = 2003
and Y04.year_id = 2004;



3) SELF Join: Find the employee and their managers.

-- New table to explain self join
drop table employee_master;
create table employee_master
(
    id          int,
    name        varchar(40),
    salary      int,
    manager_id  int
);

insert into employee_master values (1	,'John Smith',	10000,	3);
insert into employee_master values (2	,'Jane Anderson',	12000,	3);
insert into employee_master values (3	,'Tom Lanon',	15000,	4);
insert into employee_master values (4	,'Anne Connor',	20000,	null);
insert into employee_master values (5	,'Jeremy York',	9000,	1);

select * from employee_master;

-- SELF Join is when you join a table to itself.

select EMP.name as Employee_Name, MNG.name as Manager_Name
from employee_master EMP
left join employee_master MNG on EMP.manager_id = MNG.id

"John Smith"	    "Tom Lanon"
"Jane Anderson"	    "Tom Lanon"
"Tom Lanon"	        "Anne Connor"
"Jeremy York"	    "John Smith"



-- ASSIGNMENT QUERIES STARTS HERE
4)
/* Find the popularity percentage for each user on Meta/Facebook.
The popularity percentage is defined as the total number of friends the user has divided by the
total number of users on the platform, then converted into a percentage by multiplying by 100.
Output each user along with their popularity percentage. Order records in ascending order by user id.
*/
-- Dataset
drop table facebook_friends;
create table facebook_friends
    (
        user1       int,
        user2       int
    );
insert into facebook_friends values (2,1);
insert into facebook_friends values (1,3);
insert into facebook_friends values (4,1);
insert into facebook_friends values (1,5);
insert into facebook_friends values (1,6);
insert into facebook_friends values (2,6);
insert into facebook_friends values (7,2);
insert into facebook_friends values (8,3);
insert into facebook_friends values (3,9);
commit;



5) User Email Labels

/* Find the number of emails received by each user under each built-in email label.
 The email labels are: 'Promotion', 'Social', and 'Shopping'. Output the user along with the number of promotion, social, and shopping mails count,.
*/
-- Dataset
drop table google_gmail_emails;
create table google_gmail_emails
    (
        id          int,
        from_user   varchar(100),
        to_user     varchar(100),
        days        int
    );
drop table google_gmail_labels;
create table google_gmail_labels
    (
        email_id    int,
        label       varchar(50)
    );
insert into google_gmail_emails values (0           ,'6edf0be4b2267df1fa',          '75d295377a46f83236'          ,10);
insert into google_gmail_emails values (1           ,'6edf0be4b2267df1fa',          '32ded68d89443e808'          ,6);
insert into google_gmail_emails values (2           ,'6edf0be4b2267df1fa',          '55e60cfcc9dc49c17e'          ,10);
insert into google_gmail_emails values (3           ,'6edf0be4b2267df1fa',          'e0e0defbb9ec47f6f7'          ,6);
insert into google_gmail_emails values (4           ,'6edf0be4b2267df1fa',          '47be2887786891367e'          ,1);
insert into google_gmail_emails values (5           ,'6edf0be4b2267df1fa',          '2813e59cf6c1ff698e'          ,6);
insert into google_gmail_emails values (6           ,'6edf0be4b2267df1fa',          'a84065b7933ad01019'          ,8);
insert into google_gmail_emails values (7           ,'6edf0be4b2267df1fa',          '850badf89ed8f06854'          ,1);
insert into google_gmail_emails values (8           ,'6edf0be4b2267df1fa',          '6b503743a13d778200'          ,1);
insert into google_gmail_emails values (9           ,'6edf0be4b2267df1fa',          'd63386c884aeb9f71d'          ,3);
insert into google_gmail_emails values (10          ,'6edf0be4b2267df1fa',          '5b8754928306a18b68'          ,2);
insert into google_gmail_emails values (11          ,'6edf0be4b2267df1fa',          '6edf0be4b2267df1fa'          ,8);
insert into google_gmail_emails values (12          ,'6edf0be4b2267df1fa',          '406539987dd9b679c0'          ,9);
insert into google_gmail_emails values (13          ,'6edf0be4b2267df1fa',          '114bafadff2d882864'          ,5);
insert into google_gmail_emails values (14          ,'6edf0be4b2267df1fa',          '157e3e9278e32aba3e'          ,2);
insert into google_gmail_emails values (15          ,'75d295377a46f83236',          '75d295377a46f83236'          ,6);
insert into google_gmail_emails values (16          ,'75d295377a46f83236',          'd63386c884aeb9f71d'          ,8);
insert into google_gmail_emails values (17          ,'75d295377a46f83236',          '55e60cfcc9dc49c17e'          ,3);
insert into google_gmail_emails values (18          ,'75d295377a46f83236',          '47be2887786891367e'          ,10);
insert into google_gmail_emails values (19          ,'75d295377a46f83236',          '5b8754928306a18b68'          ,10);
insert into google_gmail_emails values (20          ,'75d295377a46f83236',          '850badf89ed8f06854'          ,7);
insert into google_gmail_emails values (21          ,'75d295377a46f83236',          '5eff3a5bfc0687351e'          ,2);
insert into google_gmail_emails values (22          ,'75d295377a46f83236',          '5dc768b2f067c56f77'          ,8);
insert into google_gmail_emails values (23          ,'75d295377a46f83236',          '114bafadff2d882864'          ,3);
insert into google_gmail_emails values (24          ,'75d295377a46f83236',          'e0e0defbb9ec47f6f7'          ,3);
insert into google_gmail_emails values (25          ,'75d295377a46f83236',          '7cfe354d9a64bf8173'          ,10);
insert into google_gmail_emails values (26          ,'5dc768b2f067c56f77',          '114bafadff2d882864'          ,3);
insert into google_gmail_emails values (27          ,'5dc768b2f067c56f77',          '2813e59cf6c1ff698e'          ,5);
insert into google_gmail_emails values (28          ,'5dc768b2f067c56f77',          '91f59516cb9dee1e88'          ,6);
insert into google_gmail_emails values (29          ,'5dc768b2f067c56f77',          '5b8754928306a18b68'          ,6);
insert into google_gmail_emails values (30          ,'5dc768b2f067c56f77',          '6b503743a13d778200'          ,5);
insert into google_gmail_emails values (31          ,'5dc768b2f067c56f77',          'aa0bd72b729fab6e9e'          ,10);
insert into google_gmail_emails values (32          ,'5dc768b2f067c56f77',          '850badf89ed8f06854'          ,1);
insert into google_gmail_emails values (33          ,'5dc768b2f067c56f77',          '406539987dd9b679c0'          ,7);
insert into google_gmail_emails values (34          ,'5dc768b2f067c56f77',          '75d295377a46f83236'          ,2);
insert into google_gmail_emails values (35          ,'5dc768b2f067c56f77',          'd63386c884aeb9f71d'          ,8);
insert into google_gmail_emails values (36          ,'5dc768b2f067c56f77',          'ef5fe98c6b9f313075'          ,9);
insert into google_gmail_emails values (37          ,'32ded68d89443e808',          '55e60cfcc9dc49c17e'          ,10);
insert into google_gmail_emails values (38          ,'32ded68d89443e808',          'e0e0defbb9ec47f6f7'          ,6);
insert into google_gmail_emails values (39          ,'32ded68d89443e808',          '850badf89ed8f06854'          ,4);
insert into google_gmail_emails values (40          ,'32ded68d89443e808',          '5eff3a5bfc0687351e'          ,8);
insert into google_gmail_emails values (41          ,'32ded68d89443e808',          '8bba390b53976da0cd'          ,6);
insert into google_gmail_emails values (42          ,'32ded68d89443e808',          '91f59516cb9dee1e88'          ,1);
insert into google_gmail_emails values (43          ,'32ded68d89443e808',          '6edf0be4b2267df1fa'          ,7);
insert into google_gmail_emails values (44          ,'32ded68d89443e808',          'd63386c884aeb9f71d'          ,3);
insert into google_gmail_emails values (45          ,'32ded68d89443e808',          '32ded68d89443e808'          ,7);
insert into google_gmail_emails values (46          ,'32ded68d89443e808',          '5dc768b2f067c56f77'          ,9);
insert into google_gmail_emails values (47          ,'32ded68d89443e808',          '406539987dd9b679c0'          ,3);
insert into google_gmail_emails values (48          ,'32ded68d89443e808',          'a84065b7933ad01019'          ,10);
insert into google_gmail_emails values (49          ,'32ded68d89443e808',          '2813e59cf6c1ff698e'          ,9);
insert into google_gmail_emails values (50          ,'32ded68d89443e808',          'cbc4bd40cd1687754'          ,10);
insert into google_gmail_emails values (51          ,'32ded68d89443e808',          'aa0bd72b729fab6e9e'          ,4);
insert into google_gmail_emails values (52          ,'32ded68d89443e808',          '75d295377a46f83236'          ,5);
insert into google_gmail_emails values (53          ,'32ded68d89443e808',          '6b503743a13d778200'          ,3);
insert into google_gmail_emails values (54          ,'32ded68d89443e808',          '5b8754928306a18b68'          ,4);
insert into google_gmail_emails values (55          ,'32ded68d89443e808',          '47be2887786891367e'          ,5);
insert into google_gmail_emails values (56          ,'e0e0defbb9ec47f6f7',          '5dc768b2f067c56f77'          ,6);
insert into google_gmail_emails values (57          ,'e0e0defbb9ec47f6f7',          '2813e59cf6c1ff698e'          ,4);
insert into google_gmail_emails values (58          ,'e0e0defbb9ec47f6f7',          '6b503743a13d778200'          ,8);
insert into google_gmail_emails values (59          ,'e0e0defbb9ec47f6f7',          'e22d2eabc2d4c19688'          ,3);
insert into google_gmail_emails values (60          ,'e0e0defbb9ec47f6f7',          'e6088004caf0c8cc51'          ,2);
insert into google_gmail_emails values (61          ,'e0e0defbb9ec47f6f7',          'aa0bd72b729fab6e9e'          ,6);
insert into google_gmail_emails values (62          ,'e0e0defbb9ec47f6f7',          '55e60cfcc9dc49c17e'          ,5);
insert into google_gmail_emails values (63          ,'e0e0defbb9ec47f6f7',          '850badf89ed8f06854'          ,6);
insert into google_gmail_emails values (64          ,'e0e0defbb9ec47f6f7',          'd63386c884aeb9f71d'          ,3);
insert into google_gmail_emails values (65          ,'e0e0defbb9ec47f6f7',          'a84065b7933ad01019'          ,10);
insert into google_gmail_emails values (66          ,'e0e0defbb9ec47f6f7',          '32ded68d89443e808'          ,6);
insert into google_gmail_emails values (67          ,'e0e0defbb9ec47f6f7',          '47be2887786891367e'          ,8);
insert into google_gmail_emails values (68          ,'e0e0defbb9ec47f6f7',          '157e3e9278e32aba3e'          ,7);
insert into google_gmail_emails values (69          ,'e0e0defbb9ec47f6f7',          'cbc4bd40cd1687754'          ,2);
insert into google_gmail_emails values (70          ,'e0e0defbb9ec47f6f7',          'e0e0defbb9ec47f6f7'          ,3);
insert into google_gmail_emails values (71          ,'6b503743a13d778200',          '850badf89ed8f06854'          ,5);
insert into google_gmail_emails values (72          ,'6b503743a13d778200',          '55e60cfcc9dc49c17e'          ,10);
insert into google_gmail_emails values (73          ,'6b503743a13d778200',          'cbc4bd40cd1687754'          ,2);
insert into google_gmail_emails values (74          ,'6b503743a13d778200',          'e0e0defbb9ec47f6f7'          ,5);
insert into google_gmail_emails values (75          ,'6b503743a13d778200',          '7cfe354d9a64bf8173'          ,5);
insert into google_gmail_emails values (76          ,'6b503743a13d778200',          '32ded68d89443e808'          ,4);
insert into google_gmail_emails values (77          ,'6b503743a13d778200',          'e6088004caf0c8cc51'          ,9);
insert into google_gmail_emails values (78          ,'6b503743a13d778200',          'aa0bd72b729fab6e9e'          ,7);
insert into google_gmail_emails values (79          ,'6b503743a13d778200',          '5dc768b2f067c56f77'          ,9);
insert into google_gmail_emails values (80          ,'e22d2eabc2d4c19688',          '8bba390b53976da0cd'          ,5);
insert into google_gmail_emails values (81          ,'e22d2eabc2d4c19688',          'e0e0defbb9ec47f6f7'          ,2);
insert into google_gmail_emails values (82          ,'e22d2eabc2d4c19688',          'ef5fe98c6b9f313075'          ,10);
insert into google_gmail_emails values (83          ,'e22d2eabc2d4c19688',          '5eff3a5bfc0687351e'          ,2);
insert into google_gmail_emails values (84          ,'e22d2eabc2d4c19688',          '47be2887786891367e'          ,4);
insert into google_gmail_emails values (85          ,'e22d2eabc2d4c19688',          '406539987dd9b679c0'          ,8);
insert into google_gmail_emails values (86          ,'e22d2eabc2d4c19688',          'cbc4bd40cd1687754'          ,8);
insert into google_gmail_emails values (87          ,'e22d2eabc2d4c19688',          '7cfe354d9a64bf8173'          ,10);
insert into google_gmail_emails values (88          ,'e22d2eabc2d4c19688',          'e6088004caf0c8cc51'          ,5);
insert into google_gmail_emails values (89          ,'e22d2eabc2d4c19688',          'aa0bd72b729fab6e9e'          ,9);
insert into google_gmail_emails values (90          ,'e22d2eabc2d4c19688',          '6edf0be4b2267df1fa'          ,8);
insert into google_gmail_emails values (91          ,'e22d2eabc2d4c19688',          '157e3e9278e32aba3e'          ,3);
insert into google_gmail_emails values (92          ,'e22d2eabc2d4c19688',          'd63386c884aeb9f71d'          ,2);
insert into google_gmail_emails values (93          ,'d63386c884aeb9f71d',          'cbc4bd40cd1687754'          ,6);
insert into google_gmail_emails values (94          ,'d63386c884aeb9f71d',          '8bba390b53976da0cd'          ,10);
insert into google_gmail_emails values (95          ,'d63386c884aeb9f71d',          '75d295377a46f83236'          ,10);
insert into google_gmail_emails values (96          ,'d63386c884aeb9f71d',          '5b8754928306a18b68'          ,4);
insert into google_gmail_emails values (97          ,'d63386c884aeb9f71d',          'e6088004caf0c8cc51'          ,7);
insert into google_gmail_emails values (98          ,'d63386c884aeb9f71d',          'e22d2eabc2d4c19688'          ,9);
insert into google_gmail_emails values (99          ,'d63386c884aeb9f71d',          '55e60cfcc9dc49c17e'          ,3);
insert into google_gmail_emails values (100         ,'d63386c884aeb9f71d',          '5dc768b2f067c56f77'          ,3);
insert into google_gmail_emails values (101         ,'d63386c884aeb9f71d',          '32ded68d89443e808'          ,8);
insert into google_gmail_emails values (102         ,'d63386c884aeb9f71d',          '157e3e9278e32aba3e'          ,8);
insert into google_gmail_emails values (103         ,'cbc4bd40cd1687754',          '7cfe354d9a64bf8173'          ,10);
insert into google_gmail_emails values (104         ,'cbc4bd40cd1687754',          '114bafadff2d882864'          ,2);
insert into google_gmail_emails values (105         ,'cbc4bd40cd1687754',          '157e3e9278e32aba3e'          ,4);
insert into google_gmail_emails values (106         ,'cbc4bd40cd1687754',          'e6088004caf0c8cc51'          ,1);
insert into google_gmail_emails values (107         ,'cbc4bd40cd1687754',          '5eff3a5bfc0687351e'          ,8);
insert into google_gmail_emails values (108         ,'cbc4bd40cd1687754',          '5b8754928306a18b68'          ,5);
insert into google_gmail_emails values (109         ,'cbc4bd40cd1687754',          '850badf89ed8f06854'          ,9);
insert into google_gmail_emails values (110         ,'cbc4bd40cd1687754',          '406539987dd9b679c0'          ,2);
insert into google_gmail_emails values (111         ,'cbc4bd40cd1687754',          'd63386c884aeb9f71d'          ,4);
insert into google_gmail_emails values (112         ,'cbc4bd40cd1687754',          'e0e0defbb9ec47f6f7'          ,2);
insert into google_gmail_emails values (113         ,'cbc4bd40cd1687754',          'cbc4bd40cd1687754'          ,4);
insert into google_gmail_emails values (114         ,'cbc4bd40cd1687754',          '2813e59cf6c1ff698e'          ,5);
insert into google_gmail_emails values (115         ,'cbc4bd40cd1687754',          '47be2887786891367e'          ,8);
insert into google_gmail_emails values (116         ,'cbc4bd40cd1687754',          'e22d2eabc2d4c19688'          ,8);
insert into google_gmail_emails values (117         ,'cbc4bd40cd1687754',          '32ded68d89443e808'          ,2);
insert into google_gmail_emails values (118         ,'ef5fe98c6b9f313075',          '47be2887786891367e'          ,1);
insert into google_gmail_emails values (119         ,'ef5fe98c6b9f313075',          '91f59516cb9dee1e88'          ,8);
insert into google_gmail_emails values (120         ,'ef5fe98c6b9f313075',          '2813e59cf6c1ff698e'          ,8);
insert into google_gmail_emails values (121         ,'ef5fe98c6b9f313075',          'e22d2eabc2d4c19688'          ,5);
insert into google_gmail_emails values (122         ,'ef5fe98c6b9f313075',          '406539987dd9b679c0'          ,8);
insert into google_gmail_emails values (123         ,'ef5fe98c6b9f313075',          '6b503743a13d778200'          ,7);
insert into google_gmail_emails values (124         ,'ef5fe98c6b9f313075',          '850badf89ed8f06854'          ,1);
insert into google_gmail_emails values (125         ,'ef5fe98c6b9f313075',          '114bafadff2d882864'          ,5);
insert into google_gmail_emails values (126         ,'ef5fe98c6b9f313075',          'e0e0defbb9ec47f6f7'          ,9);
insert into google_gmail_emails values (127         ,'ef5fe98c6b9f313075',          '5dc768b2f067c56f77'          ,10);
insert into google_gmail_emails values (128         ,'ef5fe98c6b9f313075',          '55e60cfcc9dc49c17e'          ,6);
insert into google_gmail_emails values (129         ,'ef5fe98c6b9f313075',          'cbc4bd40cd1687754'          ,1);
insert into google_gmail_emails values (130         ,'ef5fe98c6b9f313075',          '5b8754928306a18b68'          ,5);
insert into google_gmail_emails values (131         ,'ef5fe98c6b9f313075',          '32ded68d89443e808'          ,10);
insert into google_gmail_emails values (132         ,'ef5fe98c6b9f313075',          '8bba390b53976da0cd'          ,10);
insert into google_gmail_emails values (133         ,'ef5fe98c6b9f313075',          'd63386c884aeb9f71d'          ,1);
insert into google_gmail_emails values (134         ,'ef5fe98c6b9f313075',          'e6088004caf0c8cc51'          ,7);
insert into google_gmail_emails values (135         ,'ef5fe98c6b9f313075',          '5eff3a5bfc0687351e'          ,8);
insert into google_gmail_emails values (136         ,'ef5fe98c6b9f313075',          'ef5fe98c6b9f313075'          ,7);
insert into google_gmail_emails values (137         ,'8bba390b53976da0cd',          'd63386c884aeb9f71d'          ,7);
insert into google_gmail_emails values (138         ,'8bba390b53976da0cd',          '55e60cfcc9dc49c17e'          ,7);
insert into google_gmail_emails values (139         ,'8bba390b53976da0cd',          '5dc768b2f067c56f77'          ,6);
insert into google_gmail_emails values (140         ,'8bba390b53976da0cd',          '406539987dd9b679c0'          ,6);
insert into google_gmail_emails values (141         ,'8bba390b53976da0cd',          '5eff3a5bfc0687351e'          ,2);
insert into google_gmail_emails values (142         ,'8bba390b53976da0cd',          '91f59516cb9dee1e88'          ,5);
insert into google_gmail_emails values (143         ,'8bba390b53976da0cd',          'e6088004caf0c8cc51'          ,5);
insert into google_gmail_emails values (144         ,'8bba390b53976da0cd',          '75d295377a46f83236'          ,3);
insert into google_gmail_emails values (145         ,'8bba390b53976da0cd',          'cbc4bd40cd1687754'          ,6);
insert into google_gmail_emails values (146         ,'8bba390b53976da0cd',          'a84065b7933ad01019'          ,1);
insert into google_gmail_emails values (147         ,'8bba390b53976da0cd',          'e22d2eabc2d4c19688'          ,6);
insert into google_gmail_emails values (148         ,'8bba390b53976da0cd',          '6edf0be4b2267df1fa'          ,1);
insert into google_gmail_emails values (149         ,'8bba390b53976da0cd',          '32ded68d89443e808'          ,1);
insert into google_gmail_emails values (150         ,'8bba390b53976da0cd',          '850badf89ed8f06854'          ,8);
insert into google_gmail_emails values (151         ,'157e3e9278e32aba3e',          '850badf89ed8f06854'          ,3);
insert into google_gmail_emails values (152         ,'157e3e9278e32aba3e',          'aa0bd72b729fab6e9e'          ,2);
insert into google_gmail_emails values (153         ,'157e3e9278e32aba3e',          '75d295377a46f83236'          ,10);
insert into google_gmail_emails values (154         ,'157e3e9278e32aba3e',          'e22d2eabc2d4c19688'          ,10);
insert into google_gmail_emails values (155         ,'157e3e9278e32aba3e',          '5eff3a5bfc0687351e'          ,8);
insert into google_gmail_emails values (156         ,'157e3e9278e32aba3e',          '114bafadff2d882864'          ,7);
insert into google_gmail_emails values (157         ,'157e3e9278e32aba3e',          '91f59516cb9dee1e88'          ,4);
insert into google_gmail_emails values (158         ,'157e3e9278e32aba3e',          '6edf0be4b2267df1fa'          ,3);
insert into google_gmail_emails values (159         ,'157e3e9278e32aba3e',          'a84065b7933ad01019'          ,2);
insert into google_gmail_emails values (160         ,'157e3e9278e32aba3e',          '5b8754928306a18b68'          ,9);
insert into google_gmail_emails values (161         ,'2813e59cf6c1ff698e',          '47be2887786891367e'          ,2);
insert into google_gmail_emails values (162         ,'2813e59cf6c1ff698e',          'e0e0defbb9ec47f6f7'          ,4);
insert into google_gmail_emails values (163         ,'2813e59cf6c1ff698e',          '75d295377a46f83236'          ,5);
insert into google_gmail_emails values (164         ,'2813e59cf6c1ff698e',          '5eff3a5bfc0687351e'          ,5);
insert into google_gmail_emails values (165         ,'2813e59cf6c1ff698e',          '406539987dd9b679c0'          ,7);
insert into google_gmail_emails values (166         ,'2813e59cf6c1ff698e',          'cbc4bd40cd1687754'          ,2);
insert into google_gmail_emails values (167         ,'2813e59cf6c1ff698e',          '8bba390b53976da0cd'          ,3);
insert into google_gmail_emails values (168         ,'2813e59cf6c1ff698e',          '6edf0be4b2267df1fa'          ,6);
insert into google_gmail_emails values (169         ,'2813e59cf6c1ff698e',          '32ded68d89443e808'          ,3);
insert into google_gmail_emails values (170         ,'2813e59cf6c1ff698e',          '114bafadff2d882864'          ,6);
insert into google_gmail_emails values (171         ,'2813e59cf6c1ff698e',          '55e60cfcc9dc49c17e'          ,2);
insert into google_gmail_emails values (172         ,'aa0bd72b729fab6e9e',          '75d295377a46f83236'          ,5);
insert into google_gmail_emails values (173         ,'aa0bd72b729fab6e9e',          'e22d2eabc2d4c19688'          ,10);
insert into google_gmail_emails values (174         ,'aa0bd72b729fab6e9e',          '91f59516cb9dee1e88'          ,5);
insert into google_gmail_emails values (175         ,'aa0bd72b729fab6e9e',          'ef5fe98c6b9f313075'          ,6);
insert into google_gmail_emails values (176         ,'aa0bd72b729fab6e9e',          '8bba390b53976da0cd'          ,3);
insert into google_gmail_emails values (177         ,'aa0bd72b729fab6e9e',          'cbc4bd40cd1687754'          ,10);
insert into google_gmail_emails values (178         ,'aa0bd72b729fab6e9e',          '7cfe354d9a64bf8173'          ,9);
insert into google_gmail_emails values (179         ,'aa0bd72b729fab6e9e',          '5eff3a5bfc0687351e'          ,2);
insert into google_gmail_emails values (180         ,'aa0bd72b729fab6e9e',          '2813e59cf6c1ff698e'          ,1);
insert into google_gmail_emails values (181         ,'aa0bd72b729fab6e9e',          'aa0bd72b729fab6e9e'          ,1);
insert into google_gmail_emails values (182         ,'aa0bd72b729fab6e9e',          '47be2887786891367e'          ,6);
insert into google_gmail_emails values (183         ,'aa0bd72b729fab6e9e',          'd63386c884aeb9f71d'          ,9);
insert into google_gmail_emails values (184         ,'91f59516cb9dee1e88',          'd63386c884aeb9f71d'          ,5);
insert into google_gmail_emails values (185         ,'91f59516cb9dee1e88',          'e6088004caf0c8cc51'          ,5);
insert into google_gmail_emails values (186         ,'91f59516cb9dee1e88',          '8bba390b53976da0cd'          ,9);
insert into google_gmail_emails values (187         ,'91f59516cb9dee1e88',          '91f59516cb9dee1e88'          ,6);
insert into google_gmail_emails values (188         ,'91f59516cb9dee1e88',          'a84065b7933ad01019'          ,4);
insert into google_gmail_emails values (189         ,'91f59516cb9dee1e88',          '2813e59cf6c1ff698e'          ,7);
insert into google_gmail_emails values (190         ,'91f59516cb9dee1e88',          'aa0bd72b729fab6e9e'          ,4);
insert into google_gmail_emails values (191         ,'91f59516cb9dee1e88',          '850badf89ed8f06854'          ,9);
insert into google_gmail_emails values (192         ,'91f59516cb9dee1e88',          '406539987dd9b679c0'          ,3);
insert into google_gmail_emails values (193         ,'91f59516cb9dee1e88',          'e22d2eabc2d4c19688'          ,1);
insert into google_gmail_emails values (194         ,'91f59516cb9dee1e88',          'ef5fe98c6b9f313075'          ,7);
insert into google_gmail_emails values (195         ,'91f59516cb9dee1e88',          'e0e0defbb9ec47f6f7'          ,5);
insert into google_gmail_emails values (196         ,'91f59516cb9dee1e88',          '6b503743a13d778200'          ,9);
insert into google_gmail_emails values (197         ,'91f59516cb9dee1e88',          '55e60cfcc9dc49c17e'          ,4);
insert into google_gmail_emails values (198         ,'91f59516cb9dee1e88',          '6edf0be4b2267df1fa'          ,3);
insert into google_gmail_emails values (199         ,'91f59516cb9dee1e88',          '5eff3a5bfc0687351e'          ,8);
insert into google_gmail_emails values (200         ,'114bafadff2d882864',          '157e3e9278e32aba3e'          ,10);
insert into google_gmail_emails values (201         ,'114bafadff2d882864',          '75d295377a46f83236'          ,8);
insert into google_gmail_emails values (202         ,'114bafadff2d882864',          '47be2887786891367e'          ,3);
insert into google_gmail_emails values (203         ,'114bafadff2d882864',          'aa0bd72b729fab6e9e'          ,10);
insert into google_gmail_emails values (204         ,'114bafadff2d882864',          'cbc4bd40cd1687754'          ,7);
insert into google_gmail_emails values (205         ,'114bafadff2d882864',          '5dc768b2f067c56f77'          ,2);
insert into google_gmail_emails values (206         ,'114bafadff2d882864',          '2813e59cf6c1ff698e'          ,5);
insert into google_gmail_emails values (207         ,'114bafadff2d882864',          '5eff3a5bfc0687351e'          ,6);
insert into google_gmail_emails values (208         ,'406539987dd9b679c0',          'ef5fe98c6b9f313075'          ,8);
insert into google_gmail_emails values (209         ,'406539987dd9b679c0',          '114bafadff2d882864'          ,5);
insert into google_gmail_emails values (210         ,'406539987dd9b679c0',          '8bba390b53976da0cd'          ,10);
insert into google_gmail_emails values (211         ,'406539987dd9b679c0',          '32ded68d89443e808'          ,3);
insert into google_gmail_emails values (212         ,'406539987dd9b679c0',          'e0e0defbb9ec47f6f7'          ,7);
insert into google_gmail_emails values (213         ,'406539987dd9b679c0',          'd63386c884aeb9f71d'          ,7);
insert into google_gmail_emails values (214         ,'406539987dd9b679c0',          '91f59516cb9dee1e88'          ,6);
insert into google_gmail_emails values (215         ,'406539987dd9b679c0',          'e22d2eabc2d4c19688'          ,4);
insert into google_gmail_emails values (216         ,'406539987dd9b679c0',          'a84065b7933ad01019'          ,3);
insert into google_gmail_emails values (217         ,'5eff3a5bfc0687351e',          '2813e59cf6c1ff698e'          ,7);
insert into google_gmail_emails values (218         ,'5eff3a5bfc0687351e',          'a84065b7933ad01019'          ,3);
insert into google_gmail_emails values (219         ,'5eff3a5bfc0687351e',          '6b503743a13d778200'          ,5);
insert into google_gmail_emails values (220         ,'5eff3a5bfc0687351e',          'ef5fe98c6b9f313075'          ,1);
insert into google_gmail_emails values (221         ,'5eff3a5bfc0687351e',          '5dc768b2f067c56f77'          ,2);
insert into google_gmail_emails values (222         ,'5eff3a5bfc0687351e',          'e6088004caf0c8cc51'          ,6);
insert into google_gmail_emails values (223         ,'5eff3a5bfc0687351e',          '850badf89ed8f06854'          ,8);
insert into google_gmail_emails values (224         ,'5eff3a5bfc0687351e',          '91f59516cb9dee1e88'          ,7);
insert into google_gmail_emails values (225         ,'5eff3a5bfc0687351e',          '75d295377a46f83236'          ,5);
insert into google_gmail_emails values (226         ,'5eff3a5bfc0687351e',          '47be2887786891367e'          ,6);
insert into google_gmail_emails values (227         ,'5eff3a5bfc0687351e',          '7cfe354d9a64bf8173'          ,7);
insert into google_gmail_emails values (228         ,'a84065b7933ad01019',          '6b503743a13d778200'          ,3);
insert into google_gmail_emails values (229         ,'a84065b7933ad01019',          '75d295377a46f83236'          ,9);
insert into google_gmail_emails values (230         ,'a84065b7933ad01019',          'e0e0defbb9ec47f6f7'          ,6);
insert into google_gmail_emails values (231         ,'a84065b7933ad01019',          'a84065b7933ad01019'          ,6);
insert into google_gmail_emails values (232         ,'a84065b7933ad01019',          '5dc768b2f067c56f77'          ,6);
insert into google_gmail_emails values (233         ,'a84065b7933ad01019',          '2813e59cf6c1ff698e'          ,1);
insert into google_gmail_emails values (234         ,'a84065b7933ad01019',          'd63386c884aeb9f71d'          ,5);
insert into google_gmail_emails values (235         ,'a84065b7933ad01019',          'ef5fe98c6b9f313075'          ,9);
insert into google_gmail_emails values (236         ,'a84065b7933ad01019',          '406539987dd9b679c0'          ,9);
insert into google_gmail_emails values (237         ,'a84065b7933ad01019',          '55e60cfcc9dc49c17e'          ,2);
insert into google_gmail_emails values (238         ,'a84065b7933ad01019',          '8bba390b53976da0cd'          ,9);
insert into google_gmail_emails values (239         ,'a84065b7933ad01019',          '850badf89ed8f06854'          ,9);
insert into google_gmail_emails values (240         ,'a84065b7933ad01019',          'e6088004caf0c8cc51'          ,5);
insert into google_gmail_emails values (241         ,'a84065b7933ad01019',          '157e3e9278e32aba3e'          ,9);
insert into google_gmail_emails values (242         ,'850badf89ed8f06854',          'e22d2eabc2d4c19688'          ,4);
insert into google_gmail_emails values (243         ,'850badf89ed8f06854',          '91f59516cb9dee1e88'          ,9);
insert into google_gmail_emails values (244         ,'850badf89ed8f06854',          '32ded68d89443e808'          ,4);
insert into google_gmail_emails values (245         ,'850badf89ed8f06854',          '5dc768b2f067c56f77'          ,10);
insert into google_gmail_emails values (246         ,'850badf89ed8f06854',          'cbc4bd40cd1687754'          ,3);
insert into google_gmail_emails values (247         ,'850badf89ed8f06854',          'aa0bd72b729fab6e9e'          ,4);
insert into google_gmail_emails values (248         ,'850badf89ed8f06854',          '7cfe354d9a64bf8173'          ,5);
insert into google_gmail_emails values (249         ,'850badf89ed8f06854',          'a84065b7933ad01019'          ,5);
insert into google_gmail_emails values (250         ,'850badf89ed8f06854',          '5b8754928306a18b68'          ,1);
insert into google_gmail_emails values (251         ,'850badf89ed8f06854',          '157e3e9278e32aba3e'          ,4);
insert into google_gmail_emails values (252         ,'850badf89ed8f06854',          '55e60cfcc9dc49c17e'          ,4);
insert into google_gmail_emails values (253         ,'850badf89ed8f06854',          '850badf89ed8f06854'          ,9);
insert into google_gmail_emails values (254         ,'47be2887786891367e',          'e0e0defbb9ec47f6f7'          ,5);
insert into google_gmail_emails values (255         ,'47be2887786891367e',          '2813e59cf6c1ff698e'          ,9);
insert into google_gmail_emails values (256         ,'47be2887786891367e',          '55e60cfcc9dc49c17e'          ,7);
insert into google_gmail_emails values (257         ,'47be2887786891367e',          '406539987dd9b679c0'          ,7);
insert into google_gmail_emails values (258         ,'47be2887786891367e',          'e22d2eabc2d4c19688'          ,4);
insert into google_gmail_emails values (259         ,'47be2887786891367e',          'aa0bd72b729fab6e9e'          ,6);
insert into google_gmail_emails values (260         ,'55e60cfcc9dc49c17e',          'd63386c884aeb9f71d'          ,2);
insert into google_gmail_emails values (261         ,'55e60cfcc9dc49c17e',          '6edf0be4b2267df1fa'          ,4);
insert into google_gmail_emails values (262         ,'55e60cfcc9dc49c17e',          '5eff3a5bfc0687351e'          ,5);
insert into google_gmail_emails values (263         ,'55e60cfcc9dc49c17e',          '850badf89ed8f06854'          ,3);
insert into google_gmail_emails values (264         ,'55e60cfcc9dc49c17e',          '47be2887786891367e'          ,8);
insert into google_gmail_emails values (265         ,'55e60cfcc9dc49c17e',          '75d295377a46f83236'          ,7);
insert into google_gmail_emails values (266         ,'55e60cfcc9dc49c17e',          '5b8754928306a18b68'          ,8);
insert into google_gmail_emails values (267         ,'55e60cfcc9dc49c17e',          '114bafadff2d882864'          ,7);
insert into google_gmail_emails values (268         ,'55e60cfcc9dc49c17e',          'e0e0defbb9ec47f6f7'          ,5);
insert into google_gmail_emails values (269         ,'55e60cfcc9dc49c17e',          'e6088004caf0c8cc51'          ,1);
insert into google_gmail_emails values (270         ,'55e60cfcc9dc49c17e',          '32ded68d89443e808'          ,10);
insert into google_gmail_emails values (271         ,'55e60cfcc9dc49c17e',          'ef5fe98c6b9f313075'          ,8);
insert into google_gmail_emails values (272         ,'55e60cfcc9dc49c17e',          '2813e59cf6c1ff698e'          ,3);
insert into google_gmail_emails values (273         ,'55e60cfcc9dc49c17e',          'aa0bd72b729fab6e9e'          ,6);
insert into google_gmail_emails values (274         ,'55e60cfcc9dc49c17e',          '406539987dd9b679c0'          ,1);
insert into google_gmail_emails values (275         ,'55e60cfcc9dc49c17e',          '6b503743a13d778200'          ,1);
insert into google_gmail_emails values (276         ,'5b8754928306a18b68',          '7cfe354d9a64bf8173'          ,1);
insert into google_gmail_emails values (277         ,'5b8754928306a18b68',          '6edf0be4b2267df1fa'          ,1);
insert into google_gmail_emails values (278         ,'5b8754928306a18b68',          'cbc4bd40cd1687754'          ,6);
insert into google_gmail_emails values (279         ,'5b8754928306a18b68',          '406539987dd9b679c0'          ,1);
insert into google_gmail_emails values (280         ,'5b8754928306a18b68',          '5dc768b2f067c56f77'          ,4);
insert into google_gmail_emails values (281         ,'5b8754928306a18b68',          'a84065b7933ad01019'          ,4);
insert into google_gmail_emails values (282         ,'5b8754928306a18b68',          '6b503743a13d778200'          ,10);
insert into google_gmail_emails values (283         ,'5b8754928306a18b68',          '2813e59cf6c1ff698e'          ,9);
insert into google_gmail_emails values (284         ,'5b8754928306a18b68',          'e0e0defbb9ec47f6f7'          ,4);
insert into google_gmail_emails values (285         ,'5b8754928306a18b68',          'e6088004caf0c8cc51'          ,5);
insert into google_gmail_emails values (286         ,'5b8754928306a18b68',          '91f59516cb9dee1e88'          ,8);
insert into google_gmail_emails values (287         ,'5b8754928306a18b68',          '32ded68d89443e808'          ,3);
insert into google_gmail_emails values (288         ,'5b8754928306a18b68',          'd63386c884aeb9f71d'          ,3);
insert into google_gmail_emails values (289         ,'5b8754928306a18b68',          '55e60cfcc9dc49c17e'          ,2);
insert into google_gmail_emails values (290         ,'5b8754928306a18b68',          'aa0bd72b729fab6e9e'          ,8);
insert into google_gmail_emails values (291         ,'5b8754928306a18b68',          '5b8754928306a18b68'          ,3);
insert into google_gmail_emails values (292         ,'5b8754928306a18b68',          '157e3e9278e32aba3e'          ,7);
insert into google_gmail_emails values (293         ,'5b8754928306a18b68',          '5eff3a5bfc0687351e'          ,5);
insert into google_gmail_emails values (294         ,'7cfe354d9a64bf8173',          'ef5fe98c6b9f313075'          ,4);
insert into google_gmail_emails values (295         ,'7cfe354d9a64bf8173',          'd63386c884aeb9f71d'          ,7);
insert into google_gmail_emails values (296         ,'7cfe354d9a64bf8173',          '5eff3a5bfc0687351e'          ,1);
insert into google_gmail_emails values (297         ,'7cfe354d9a64bf8173',          '6b503743a13d778200'          ,7);
insert into google_gmail_emails values (298         ,'7cfe354d9a64bf8173',          '47be2887786891367e'          ,1);
insert into google_gmail_emails values (299         ,'7cfe354d9a64bf8173',          '32ded68d89443e808'          ,4);
insert into google_gmail_emails values (300         ,'7cfe354d9a64bf8173',          '6edf0be4b2267df1fa'          ,9);
insert into google_gmail_emails values (301         ,'7cfe354d9a64bf8173',          '5b8754928306a18b68'          ,9);
insert into google_gmail_emails values (302         ,'7cfe354d9a64bf8173',          'e22d2eabc2d4c19688'          ,9);
insert into google_gmail_emails values (303         ,'7cfe354d9a64bf8173',          'cbc4bd40cd1687754'          ,8);
insert into google_gmail_emails values (304         ,'7cfe354d9a64bf8173',          '2813e59cf6c1ff698e'          ,6);
insert into google_gmail_emails values (305         ,'7cfe354d9a64bf8173',          'e6088004caf0c8cc51'          ,6);
insert into google_gmail_emails values (306         ,'7cfe354d9a64bf8173',          '157e3e9278e32aba3e'          ,1);
insert into google_gmail_emails values (307         ,'7cfe354d9a64bf8173',          '406539987dd9b679c0'          ,3);
insert into google_gmail_emails values (308         ,'7cfe354d9a64bf8173',          '91f59516cb9dee1e88'          ,7);
insert into google_gmail_emails values (309         ,'e6088004caf0c8cc51',          '5dc768b2f067c56f77'          ,7);
insert into google_gmail_emails values (310         ,'e6088004caf0c8cc51',          'cbc4bd40cd1687754'          ,4);
insert into google_gmail_emails values (311         ,'e6088004caf0c8cc51',          '6edf0be4b2267df1fa'          ,9);
insert into google_gmail_emails values (312         ,'e6088004caf0c8cc51',          'aa0bd72b729fab6e9e'          ,4);
insert into google_gmail_emails values (313         ,'e6088004caf0c8cc51',          '47be2887786891367e'          ,2);
insert into google_gmail_emails values (314         ,'e6088004caf0c8cc51',          'e6088004caf0c8cc51'          ,5);
commit;

insert into google_gmail_labels values (0		,'Shopping');
insert into google_gmail_labels values (1		,'Custom_3');
insert into google_gmail_labels values (2		,'Social');
insert into google_gmail_labels values (3		,'Promotion');
insert into google_gmail_labels values (4		,'Social');
insert into google_gmail_labels values (5		,'Promotion');
insert into google_gmail_labels values (6		,'Shopping');
insert into google_gmail_labels values (7		,'Custom_3');
insert into google_gmail_labels values (8		,'Social');
insert into google_gmail_labels values (9		,'Shopping');
insert into google_gmail_labels values (10		,'Social');
insert into google_gmail_labels values (11		,'Promotion');
insert into google_gmail_labels values (12		,'Shopping');
insert into google_gmail_labels values (13		,'Social');
insert into google_gmail_labels values (14		,'Promotion');
insert into google_gmail_labels values (15		,'Shopping');
insert into google_gmail_labels values (16		,'Custom_2');
insert into google_gmail_labels values (17		,'Custom_3');
insert into google_gmail_labels values (18		,'Social');
insert into google_gmail_labels values (19		,'Custom_2');
insert into google_gmail_labels values (20		,'Promotion');
insert into google_gmail_labels values (21		,'Custom_2');
insert into google_gmail_labels values (22		,'Custom_3');
insert into google_gmail_labels values (23		,'Social');
insert into google_gmail_labels values (24		,'Social');
insert into google_gmail_labels values (25		,'Promotion');
insert into google_gmail_labels values (26		,'Shopping');
insert into google_gmail_labels values (27		,'Shopping');
insert into google_gmail_labels values (28		,'Social');
insert into google_gmail_labels values (29		,'Shopping');
insert into google_gmail_labels values (30		,'Promotion');
insert into google_gmail_labels values (31		,'Promotion');
insert into google_gmail_labels values (32		,'Custom_1');
insert into google_gmail_labels values (33		,'Custom_2');
insert into google_gmail_labels values (34		,'Social');
insert into google_gmail_labels values (35		,'Custom_1');
insert into google_gmail_labels values (36		,'Shopping');
insert into google_gmail_labels values (37		,'Promotion');
insert into google_gmail_labels values (38		,'Promotion');
insert into google_gmail_labels values (39		,'Custom_1');
insert into google_gmail_labels values (40		,'Custom_2');
insert into google_gmail_labels values (41		,'Custom_1');
insert into google_gmail_labels values (42		,'Custom_3');
insert into google_gmail_labels values (43		,'Custom_2');
insert into google_gmail_labels values (44		,'Social');
insert into google_gmail_labels values (45		,'Custom_1');
insert into google_gmail_labels values (46		,'Shopping');
insert into google_gmail_labels values (47		,'Promotion');
insert into google_gmail_labels values (48		,'Shopping');
insert into google_gmail_labels values (49		,'Custom_2');
insert into google_gmail_labels values (50		,'Custom_3');
insert into google_gmail_labels values (51		,'Shopping');
insert into google_gmail_labels values (52		,'Shopping');
insert into google_gmail_labels values (53		,'Custom_1');
insert into google_gmail_labels values (54		,'Promotion');
insert into google_gmail_labels values (55		,'Custom_2');
insert into google_gmail_labels values (56		,'Custom_3');
insert into google_gmail_labels values (57		,'Custom_2');
insert into google_gmail_labels values (58		,'Promotion');
insert into google_gmail_labels values (59		,'Social');
insert into google_gmail_labels values (60		,'Custom_2');
insert into google_gmail_labels values (61		,'Social');
insert into google_gmail_labels values (62		,'Shopping');
insert into google_gmail_labels values (63		,'Custom_1');
insert into google_gmail_labels values (64		,'Promotion');
insert into google_gmail_labels values (65		,'Shopping');
insert into google_gmail_labels values (66		,'Custom_1');
insert into google_gmail_labels values (67		,'Custom_3');
insert into google_gmail_labels values (68		,'Social');
insert into google_gmail_labels values (69		,'Custom_3');
insert into google_gmail_labels values (70		,'Custom_2');
insert into google_gmail_labels values (71		,'Custom_2');
insert into google_gmail_labels values (72		,'Social');
insert into google_gmail_labels values (73		,'Social');
insert into google_gmail_labels values (74		,'Custom_2');
insert into google_gmail_labels values (75		,'Social');
insert into google_gmail_labels values (76		,'Custom_1');
insert into google_gmail_labels values (77		,'Custom_3');
insert into google_gmail_labels values (78		,'Custom_3');
insert into google_gmail_labels values (79		,'Custom_3');
insert into google_gmail_labels values (80		,'Custom_3');
insert into google_gmail_labels values (81		,'Shopping');
insert into google_gmail_labels values (82		,'Promotion');
insert into google_gmail_labels values (83		,'Custom_2');
insert into google_gmail_labels values (84		,'Custom_1');
insert into google_gmail_labels values (85		,'Shopping');
insert into google_gmail_labels values (86		,'Social');
insert into google_gmail_labels values (87		,'Promotion');
insert into google_gmail_labels values (88		,'Social');
insert into google_gmail_labels values (89		,'Custom_3');
insert into google_gmail_labels values (90		,'Promotion');
insert into google_gmail_labels values (91		,'Custom_2');
insert into google_gmail_labels values (92		,'Custom_3');
insert into google_gmail_labels values (93		,'Custom_2');
insert into google_gmail_labels values (94		,'Promotion');
insert into google_gmail_labels values (95		,'Custom_1');
insert into google_gmail_labels values (96		,'Custom_3');
insert into google_gmail_labels values (97		,'Custom_3');
insert into google_gmail_labels values (98		,'Shopping');
insert into google_gmail_labels values (99		,'Promotion');
insert into google_gmail_labels values (100		,'Custom_2');
insert into google_gmail_labels values (101		,'Custom_1');
insert into google_gmail_labels values (102		,'Custom_1');
insert into google_gmail_labels values (103		,'Social');
insert into google_gmail_labels values (104		,'Custom_1');
insert into google_gmail_labels values (105		,'Custom_2');
insert into google_gmail_labels values (106		,'Custom_1');
insert into google_gmail_labels values (107		,'Custom_1');
insert into google_gmail_labels values (108		,'Custom_3');
insert into google_gmail_labels values (109		,'Custom_1');
insert into google_gmail_labels values (110		,'Custom_1');
insert into google_gmail_labels values (111		,'Custom_2');
insert into google_gmail_labels values (112		,'Custom_3');
insert into google_gmail_labels values (113		,'Custom_1');
insert into google_gmail_labels values (114		,'Custom_3');
insert into google_gmail_labels values (115		,'Social');
insert into google_gmail_labels values (116		,'Social');
insert into google_gmail_labels values (117		,'Social');
insert into google_gmail_labels values (118		,'Social');
insert into google_gmail_labels values (119		,'Promotion');
insert into google_gmail_labels values (120		,'Custom_2');
insert into google_gmail_labels values (121		,'Promotion');
insert into google_gmail_labels values (122		,'Shopping');
insert into google_gmail_labels values (123		,'Custom_3');
insert into google_gmail_labels values (124		,'Custom_1');
insert into google_gmail_labels values (125		,'Custom_3');
insert into google_gmail_labels values (126		,'Social');
insert into google_gmail_labels values (127		,'Shopping');
insert into google_gmail_labels values (128		,'Custom_2');
insert into google_gmail_labels values (129		,'Shopping');
insert into google_gmail_labels values (130		,'Shopping');
insert into google_gmail_labels values (131		,'Promotion');
insert into google_gmail_labels values (132		,'Custom_1');
insert into google_gmail_labels values (133		,'Promotion');
insert into google_gmail_labels values (134		,'Custom_2');
insert into google_gmail_labels values (135		,'Social');
insert into google_gmail_labels values (136		,'Social');
insert into google_gmail_labels values (137		,'Promotion');
insert into google_gmail_labels values (138		,'Custom_2');
insert into google_gmail_labels values (139		,'Custom_2');
insert into google_gmail_labels values (140		,'Promotion');
insert into google_gmail_labels values (141		,'Custom_1');
insert into google_gmail_labels values (142		,'Shopping');
insert into google_gmail_labels values (143		,'Promotion');
insert into google_gmail_labels values (144		,'Social');
insert into google_gmail_labels values (145		,'Custom_1');
insert into google_gmail_labels values (146		,'Promotion');
insert into google_gmail_labels values (147		,'Promotion');
insert into google_gmail_labels values (148		,'Promotion');
insert into google_gmail_labels values (149		,'Custom_1');
insert into google_gmail_labels values (150		,'Social');
insert into google_gmail_labels values (151		,'Custom_1');
insert into google_gmail_labels values (152		,'Social');
insert into google_gmail_labels values (153		,'Custom_2');
insert into google_gmail_labels values (154		,'Social');
insert into google_gmail_labels values (155		,'Shopping');
insert into google_gmail_labels values (156		,'Shopping');
insert into google_gmail_labels values (157		,'Custom_3');
insert into google_gmail_labels values (158		,'Custom_2');
insert into google_gmail_labels values (159		,'Promotion');
insert into google_gmail_labels values (160		,'Shopping');
insert into google_gmail_labels values (161		,'Custom_1');
insert into google_gmail_labels values (162		,'Promotion');
insert into google_gmail_labels values (163		,'Custom_1');
insert into google_gmail_labels values (164		,'Social');
insert into google_gmail_labels values (165		,'Custom_3');
insert into google_gmail_labels values (166		,'Social');
insert into google_gmail_labels values (167		,'Shopping');
insert into google_gmail_labels values (168		,'Custom_3');
insert into google_gmail_labels values (169		,'Promotion');
insert into google_gmail_labels values (170		,'Custom_2');
insert into google_gmail_labels values (171		,'Custom_1');
insert into google_gmail_labels values (172		,'Custom_1');
insert into google_gmail_labels values (173		,'Social');
insert into google_gmail_labels values (174		,'Custom_3');
insert into google_gmail_labels values (175		,'Social');
insert into google_gmail_labels values (176		,'Custom_1');
insert into google_gmail_labels values (177		,'Custom_1');
insert into google_gmail_labels values (178		,'Custom_1');
insert into google_gmail_labels values (179		,'Custom_1');
insert into google_gmail_labels values (180		,'Custom_1');
insert into google_gmail_labels values (181		,'Promotion');
insert into google_gmail_labels values (182		,'Shopping');
insert into google_gmail_labels values (183		,'Social');
insert into google_gmail_labels values (184		,'Promotion');
insert into google_gmail_labels values (185		,'Custom_3');
insert into google_gmail_labels values (186		,'Custom_3');
insert into google_gmail_labels values (187		,'Custom_2');
insert into google_gmail_labels values (188		,'Custom_1');
insert into google_gmail_labels values (189		,'Custom_1');
insert into google_gmail_labels values (190		,'Social');
insert into google_gmail_labels values (191		,'Custom_3');
insert into google_gmail_labels values (192		,'Shopping');
insert into google_gmail_labels values (193		,'Custom_2');
insert into google_gmail_labels values (194		,'Promotion');
insert into google_gmail_labels values (195		,'Custom_3');
insert into google_gmail_labels values (196		,'Social');
insert into google_gmail_labels values (197		,'Shopping');
insert into google_gmail_labels values (198		,'Social');
insert into google_gmail_labels values (199		,'Custom_1');
insert into google_gmail_labels values (200		,'Custom_3');
insert into google_gmail_labels values (201		,'Social');
insert into google_gmail_labels values (202		,'Custom_2');
insert into google_gmail_labels values (203		,'Custom_3');
insert into google_gmail_labels values (204		,'Shopping');
insert into google_gmail_labels values (205		,'Custom_2');
insert into google_gmail_labels values (206		,'Custom_2');
insert into google_gmail_labels values (207		,'Custom_1');
insert into google_gmail_labels values (208		,'Promotion');
insert into google_gmail_labels values (209		,'Custom_1');
insert into google_gmail_labels values (210		,'Promotion');
insert into google_gmail_labels values (211		,'Custom_2');
insert into google_gmail_labels values (212		,'Social');
insert into google_gmail_labels values (213		,'Custom_3');
insert into google_gmail_labels values (214		,'Promotion');
insert into google_gmail_labels values (215		,'Shopping');
insert into google_gmail_labels values (216		,'Custom_2');
insert into google_gmail_labels values (217		,'Social');
insert into google_gmail_labels values (218		,'Promotion');
insert into google_gmail_labels values (219		,'Shopping');
insert into google_gmail_labels values (220		,'Social');
insert into google_gmail_labels values (221		,'Custom_1');
insert into google_gmail_labels values (222		,'Custom_1');
insert into google_gmail_labels values (223		,'Promotion');
insert into google_gmail_labels values (224		,'Social');
insert into google_gmail_labels values (225		,'Social');
insert into google_gmail_labels values (226		,'Custom_1');
insert into google_gmail_labels values (227		,'Custom_1');
insert into google_gmail_labels values (228		,'Social');
insert into google_gmail_labels values (229		,'Custom_3');
insert into google_gmail_labels values (230		,'Shopping');
insert into google_gmail_labels values (231		,'Promotion');
insert into google_gmail_labels values (232		,'Social');
insert into google_gmail_labels values (233		,'Social');
insert into google_gmail_labels values (234		,'Shopping');
insert into google_gmail_labels values (235		,'Custom_3');
insert into google_gmail_labels values (236		,'Shopping');
insert into google_gmail_labels values (237		,'Custom_2');
insert into google_gmail_labels values (238		,'Promotion');
insert into google_gmail_labels values (239		,'Custom_2');
insert into google_gmail_labels values (240		,'Promotion');
insert into google_gmail_labels values (241		,'Custom_2');
insert into google_gmail_labels values (242		,'Social');
insert into google_gmail_labels values (243		,'Promotion');
insert into google_gmail_labels values (244		,'Promotion');
insert into google_gmail_labels values (245		,'Promotion');
insert into google_gmail_labels values (246		,'Social');
insert into google_gmail_labels values (247		,'Social');
insert into google_gmail_labels values (248		,'Social');
insert into google_gmail_labels values (249		,'Custom_3');
insert into google_gmail_labels values (250		,'Custom_1');
insert into google_gmail_labels values (251		,'Social');
insert into google_gmail_labels values (252		,'Custom_2');
insert into google_gmail_labels values (253		,'Custom_2');
insert into google_gmail_labels values (254		,'Shopping');
insert into google_gmail_labels values (255		,'Shopping');
insert into google_gmail_labels values (256		,'Custom_2');
insert into google_gmail_labels values (257		,'Shopping');
insert into google_gmail_labels values (258		,'Social');
insert into google_gmail_labels values (259		,'Custom_2');
insert into google_gmail_labels values (260		,'Promotion');
insert into google_gmail_labels values (261		,'Shopping');
insert into google_gmail_labels values (262		,'Custom_2');
insert into google_gmail_labels values (263		,'Custom_1');
insert into google_gmail_labels values (264		,'Promotion');
insert into google_gmail_labels values (265		,'Social');
insert into google_gmail_labels values (266		,'Shopping');
insert into google_gmail_labels values (267		,'Shopping');
insert into google_gmail_labels values (268		,'Custom_3');
insert into google_gmail_labels values (269		,'Custom_1');
insert into google_gmail_labels values (270		,'Custom_2');
insert into google_gmail_labels values (271		,'Custom_1');
insert into google_gmail_labels values (272		,'Promotion');
insert into google_gmail_labels values (273		,'Shopping');
insert into google_gmail_labels values (274		,'Custom_2');
insert into google_gmail_labels values (275		,'Custom_1');
insert into google_gmail_labels values (276		,'Social');
insert into google_gmail_labels values (277		,'Promotion');
insert into google_gmail_labels values (278		,'Shopping');
insert into google_gmail_labels values (279		,'Custom_3');
insert into google_gmail_labels values (280		,'Social');
insert into google_gmail_labels values (281		,'Promotion');
insert into google_gmail_labels values (282		,'Custom_3');
insert into google_gmail_labels values (283		,'Social');
insert into google_gmail_labels values (284		,'Custom_1');
insert into google_gmail_labels values (285		,'Shopping');
insert into google_gmail_labels values (286		,'Custom_3');
insert into google_gmail_labels values (287		,'Custom_2');
insert into google_gmail_labels values (288		,'Custom_2');
insert into google_gmail_labels values (289		,'Custom_1');
insert into google_gmail_labels values (290		,'Custom_1');
insert into google_gmail_labels values (291		,'Custom_1');
insert into google_gmail_labels values (292		,'Custom_2');
insert into google_gmail_labels values (293		,'Custom_1');
insert into google_gmail_labels values (294		,'Custom_3');
insert into google_gmail_labels values (295		,'Custom_2');
insert into google_gmail_labels values (296		,'Custom_1');
insert into google_gmail_labels values (297		,'Custom_1');
insert into google_gmail_labels values (298		,'Custom_3');
insert into google_gmail_labels values (299		,'Custom_2');
insert into google_gmail_labels values (300		,'Custom_3');
insert into google_gmail_labels values (301		,'Promotion');
insert into google_gmail_labels values (302		,'Custom_1');
insert into google_gmail_labels values (303		,'Promotion');
insert into google_gmail_labels values (304		,'Social');
insert into google_gmail_labels values (305		,'Promotion');
insert into google_gmail_labels values (306		,'Shopping');
insert into google_gmail_labels values (307		,'Custom_2');
insert into google_gmail_labels values (308		,'Promotion');
insert into google_gmail_labels values (309		,'Custom_2');
insert into google_gmail_labels values (310		,'Social');
insert into google_gmail_labels values (311		,'Custom_1');
insert into google_gmail_labels values (312		,'Custom_1');
insert into google_gmail_labels values (313		,'Promotion');
insert into google_gmail_labels values (314		,'Social');
commit;

select * from google_gmail_emails;
select * from google_gmail_labels;



-- session 13 notes

select * from Album; -- 347
select * from Artist; -- 275
select * from Customer; -- 59
select * from Employee; -- 8
select * from Genre; -- 25
select * from Invoice; -- 412
select * from InvoiceLine; -- 2240
select * from MediaType; -- 5
select * from Playlist; -- 18
select * from PlaylistTrack; -- 8715
select * from Track; -- 3503

1) Find the artist who has contributed with the maximum no of songs. Display the artist name and the no of albums.

with cte as
    (select ar.name as artist_name, count(1) as no_of_songs
     , rank() over (order by count(1) desc) as rnk
    from track t
    join Album al on al.albumid = t.albumid
    join artist ar on ar.artistid = al.artistid
    group by ar.name)
select artist_name, no_of_songs
from cte
where rnk = 1;



11) Which is the most popular and least popular genre?
 -- Popularity is defined based on how many times it has been purchased.

-- incorrect
select g.name as genre_name, count(1) as no_of_purchase
, first_value(g.name) over (order by count(1) desc) as most_popular
, first_value(g.name) over (order by count(1)
                          range between unbounded preceding and unbounded following) as least_popular
from invoiceline il
join track t on t.trackid = il.trackid
join genre g on g.genreid = t.genreid
group by g.name
order by 2 desc


-- correct
with cte as
    (select g.name as genre_name, count(1) as no_of_purchase
    , rank() over(order by count(1) desc) rnk
    from invoiceline il
    join track t on t.trackid = il.trackid
    join genre g on g.genreid = t.genreid
    group by g.name)
select genre_name, 'Most Popular' as Popularity
from cte
where rnk = 1
union
select genre_name, 'Least Popular' as Popularity
from cte
where rnk = (select max(rnk) from cte)



select * from Album; -- 347
select * from Artist; -- 275
select * from Customer; -- 59
select * from Employee; -- 8
select * from Genre; -- 25
select * from Invoice; -- 412
select * from InvoiceLine; -- 2240
select * from MediaType; -- 5
select * from Playlist; -- 18
select * from PlaylistTrack; -- 8715
select * from Track; -- 3503

10) Find artist who have performed in multiple genres. Diplay the aritst name and the genre.

with cte as
        (select distinct ar.name as artist_name, g.name as genre_name
        from track t
        join album al on al.albumid = t.albumid
        join artist ar on ar.artistid = al.artistid
        join genre g on g.genreid = t.genreid ),
    multiple_genre as
        (select artist_name, count(1)
        from cte
        group by artist_name
        having count(1) > 1)
select mg.artist_name, cte.genre_name
from multiple_genre mg
join cte on cte.artist_name = mg.artist_name
order by 1,2;




13) Identify the 5 most popular artist for the most popular genre.
    Popularity is defined based on how many songs an artist has performed in for the particular genre.
    Display the artist name along with the no of songs.

with cte as
        (select g.genreid, g.name as genre_name, count(1) as no_of_purchase
        , rank() over(order by count(1) desc) rnk
        from invoiceline il
        join track t on t.trackid = il.trackid
        join genre g on g.genreid = t.genreid
        group by g.genreid, g.name),
    most_popular_genre as
        (select genreid, genre_name from cte where rnk = 1 )  ,
    final_data as
        (select  ar.name as artist_name, count(1) as no_of_songs
         , rank() over (order by count(1) desc) as rnk
        from track t
        join album al on al.albumid = t.albumid
        join artist ar on ar.artistid = al.artistid
        join most_popular_genre pop on pop.genreid = t.genreid
        group by ar.name)
select artist_name, no_of_songs
from final_data
where rnk < 6;



-- Assignment Queries
1) Find the artist who has contributed with the maximum no of songs. Display the artist name and the no of albums.
2) Display the name, email id, country of all listeners who love Jazz, Rock and Pop music.
3) Find the employee who has supported the most no of customers. Display the employee name and designation
4) Which city corresponds to the best customers?
5) The highest number of invoices belongs to which country?
6) Name the best customer (customer who spent the most money).
7) Suppose you want to host a rock concert in a city and want to know which location should host it.
8) Identify all the albums who have less then 5 track under them.
9) Display the track, album, artist and the genre for all tracks which are not purchased.
10) Find artist who have performed in multiple genres. Diplay the aritst name and the genre.
11) Which is the most popular and least popular genre? (Popularity is defined based on how many times it has been purchased.)
12) Identify if there are tracks more expensive than others. If there are then display the track name along with the album title and artist name for these expensive tracks.
13) Identify the 5 most popular artist for the most popular genre. Display the artist name along with the no of songs. (Popularity is defined based on how many songs an artist has performed in for the particular genre.)


-- session 14 notes

-->> Popularity Percentage
    /* Find the popularity percentage for each user on Meta/Facebook.
    The popularity percentage is defined as the total number of friends the user has divided by the
    total number of users on the platform, then converted into a percentage by multiplying by 100.
    Output each user along with their popularity percentage. Order records in ascending order by user id.
    */
select * from facebook_friends;

a) Find how many friends each user has? --
b) Find total users in FB --
c) Find PP = a / b

-- b)
select user1 from facebook_friends
union
select user2 from facebook_friends

-- a)
with all_users as
    (select user1 as users from facebook_friends
     union all
    select user2 as users from facebook_friends)
select users, count(1) as no_of_frnds
from all_users
group by users
order by 1;

-- c)
with all_users as
        (select user1 as users from facebook_friends
         union all
        select user2 as users from facebook_friends),
    user_frnds as
        (select users, count(1) as no_of_frnds
        from all_users
        group by users),
    unq_users as
        (select count(distinct users) as total_users
         from all_users)
select a.users
, round(((a.no_of_frnds::decimal / b.total_users::decimal) * 100),2) as popularity_percentage
from user_frnds a
cross join unq_users b
order by 1;




-->> User Email Labels
    /* Find the number of emails received by each user under each built-in email label.
    The email labels are: 'Promotion', 'Social', and 'Shopping'.
    Output the user along with the number of promotion, social, and shopping mails count
    */
select * from google_gmail_emails;
select * from google_gmail_labels;

select to_user --, label -- Correct solution
, sum(case when label = 'Promotion' then 1 else 0 end) as Promotion
, sum(case when label = 'Social' then 1 else 0 end) as Social
, sum(case when label = 'Shopping' then 1 else 0 end) as Shopping
from google_gmail_emails E
join google_gmail_labels L on L.email_id = E.id
where L.label in ('Promotion', 'Social', 'Shopping')
--and to_user = '5b8754928306a18b68'
group by to_user
--order by 2;


select to_user --, label
, count(case when label = 'Promotion' then 1 else 0 end) as Promotion
, count(case when label = 'Social' then 1 else 0 end) as Social
, count(case when label = 'Shopping' then 1 else 0 end) as Shopping
from google_gmail_emails E
join google_gmail_labels L on L.email_id = E.id
where L.label in ('Promotion', 'Social', 'Shopping')
and to_user = '5b8754928306a18b68'
group by to_user;


select to_user --, label
, (case when label = 'Promotion' then 1 else 0 end) as Promotion
, (case when label = 'Social' then 1 else 0 end) as Social
, (case when label = 'Shopping' then 1 else 0 end) as Shopping
from google_gmail_emails E
join google_gmail_labels L on L.email_id = E.id
where L.label in ('Promotion', 'Social', 'Shopping')
and to_user = '5b8754928306a18b68'
--group by to_user




-- WINDOW Functions
drop table employee;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
COMMIT;


select * from employee;

-- These 11 are window functions in SQL. But some of them may not be supported in some RDBMS.
RANK
DENSE RANK
ROW_NUMBER
LAG
LEAD
NTILE
LAST_VALUE
FIRST_VALUE
NTH_VALUE
CUME_DIST
PERCENT_RANK


-- 1) Fetch the first 2 employees from each department to join the company.

select * from employee
order by dept_name, emp_id
limit 2

-- OVER clause -- can be used to create windows/partitions for your resultset

select emp_id, emp_name, dept_name
from (select *
      , row_number() over(partition by dept_name order by emp_id ) as rn
      from employee) x
where rn < 3;


select *
, row_number() over(partition by dept_name order by emp_id ) as rn
from employee
where rn < 3;


-- Order of execution for window function:
1) Partition by
2) Order by
3) window funciton itself



-- Doubts:
4) Display all the available paintings and all the artist. If a painting was sold then mark them as "Sold".
    and if more than 1 painting of an artist was sold then display a "**" beside their name.

select p.name as painting_name
, case when x.no_of_paintings > 1
        then concat(a.first_name,' ', a.last_name, '**')
   else concat(a.first_name,' ', a.last_name)
end as artist_name
, case when s.id is not null then 'SOLD' end as sold_or_not
from paintings p
full outer join artists a on p.artist_id = a.id
left join sales s on s.painting_id = p.id
left join (select artist_id, count(1) no_of_paintings
       from sales group by artist_id ) x on x.artist_id = a.id;


-- session 15 notes ---

select * from employee order by dept_name, salary desc;

-- 2) Fetch the top 3 employees in each department earning the max salary.

row_number()
rank()
dense_rank()

with cte as
    (select *
    , rank() over(partition by dept_name order by salary desc) as rnk
    from employee
    )
select *
from cte
where rnk <= 3;



select *
, row_number() over(partition by dept_name order by salary desc) as rn
, rank() over(partition by dept_name order by salary desc) as rnk
, dense_rank() over(partition by dept_name order by salary desc) as dens_rnk
from employee;


--5)
/* Find the date with the highest total energy consumption from the Meta/Facebook data centers.
Output the date along with the total energy consumption across all data centers.
If there are multiple days with same highest energy consumption then display both dates.
*/

select * from fb_eu_energy;
select * from fb_asia_energy;
select * from fb_na_energy;

drop table fb_eu_energy;
create table fb_eu_energy
    (
        date            date,
        consumption     int
    );

drop table fb_asia_energy;
create table fb_asia_energy
    (
        date            date,
        consumption     int
    );

drop table fb_na_energy;
create table fb_na_energy
    (
        date            date,
        consumption     int
    );

insert into fb_eu_energy values ('2020-01-01',400);
insert into fb_eu_energy values ('2020-01-02',350);
insert into fb_eu_energy values ('2020-01-03',500);
insert into fb_eu_energy values ('2020-01-04',500);
insert into fb_eu_energy values ('2020-01-07',600);

insert into fb_asia_energy values ('2020-01-01',400);
insert into fb_asia_energy values ('2020-01-02',400);
insert into fb_asia_energy values ('2020-01-04',675);
insert into fb_asia_energy values ('2020-01-05',1200);
insert into fb_asia_energy values ('2020-01-06',750);
insert into fb_asia_energy values ('2020-01-07',400);

insert into fb_na_energy values ('2020-01-01',250);
insert into fb_na_energy values ('2020-01-02',375);
insert into fb_na_energy values ('2020-01-03',600);
insert into fb_na_energy values ('2020-01-06',500);
insert into fb_na_energy values ('2020-01-07',250);
commit;

with all_energy as
        (select * from fb_eu_energy
        union all
        select * from fb_asia_energy
        union all
        select * from fb_na_energy),
    agg_energy as
        (select date, sum(consumption) as tot_consumption
        from all_energy
        group by date),
    cte as
        (select *
        , rank() over(order by tot_consumption desc) as rnk
        from agg_energy)
select date, tot_consumption
from cte
where rnk = 1;

select * from (
    select * , rank() over(order by tot_consumption desc) as rnk
    from (select date, sum(consumption) as tot_consumption
          from (select * from fb_eu_energy
                union all
                select * from fb_asia_energy
                union all
                select * from fb_na_energy)X
          group by date)Y
) xx
where rnk = 1;



-- 4): From the students table, write a SQL query to interchange the adjacent student names.
    -- Note: If there are no adjacent student then the student name should stay the same.

drop table students;
create table students
    (
        id              int primary key,
        student_name    varchar(50) not null
    );
insert into students values
    (1, 'James'),
    (2, 'Michael'),
    (3, 'George'),
    (4, 'Stewart'),
    (5, 'Robin');

select * from students;

-- LEAD & LAG window functions

select ID
, case when id%2 <> 0 then lead(student_name,1,student_name) over(order by id)
       when id%2 = 0 then lag(student_name, 1, 'NO RECORD FOUND') over(order by id)
  end as new_student_name
from students ;



-- 6) Find the Best Selling Item for each month
/*
Find the best selling item for each month (no need to separate months by year)
where the biggest total invoice was paid.
The best selling item is calculated using the formula (unitprice * quantity).
Output the description of the item along with the amount paid.
*/

SELECT * FROM online_retail;

drop table online_retail;
create table online_retail
    (
        invoiceno       varchar(20),
        stockcode       varchar(20),
        description     varchar(200),
        quantity        int,
        invoicedate     date,
        unitprice       float,
        customerid      int,
        country         varchar(50)
    );
insert into online_retail values ('544586',	'21890',			'S/6 WOODEN SKITTLES IN COTTON BAG',		3		,'2011-02-21',	2.95	,17338	,'United Kingdom');
insert into online_retail values ('541104',	'84509G',			'SET OF 4 FAIRY CAKE PLACEMATS',			3		,'2011-01-13',	3.29	,NULL		,'United Kingdom');
insert into online_retail values ('560772',	'22499',			'WOODEN UNION JACK BUNTING',				3		,'2011-07-20',	4.96	,NULL		,'United Kingdom');
insert into online_retail values ('555150',	'22488',			'NATURAL SLATE RECTANGLE CHALKBOARD',		5		,'2011-05-31',	3.29	,NULL		,'United Kingdom');
insert into online_retail values ('570521',	'21625',			'VINTAGE UNION JACK APRON',					3		,'2011-10-11',	6.95	,12371	,'Switzerland');
insert into online_retail values ('547053',	'22087',			'PAPER BUNTING WHITE LACE',					40		,'2011-03-20',	2.55	,13001	,'United Kingdom');
insert into online_retail values ('573360',	'22591',			'CARDHOLDER GINGHAM CHRISTMAS TREE',		6		,'2011-10-30',	3.25	,15748	,'United Kingdom');
insert into online_retail values ('571039',	'84536A',			'ENGLISH ROSE NOTEBOOK A7 SIZE',			1		,'2011-10-13',	0.42	,16121	,'United Kingdom');
insert into online_retail values ('578936',	'20723',			'STRAWBERRY CHARLOTTE BAG',					10		,'2011-11-27',	0.85	,16923	,'United Kingdom');
insert into online_retail values ('559338',	'21391',			'FRENCH LAVENDER SCENT HEART',				1		,'2011-07-07',	1.63	,NULL		,'United Kingdom');
insert into online_retail values ('568134',	'23171',			'REGENCY TEA PLATE GREEN',					1		,'2011-09-23',	3.29	,NULL		,'United Kingdom');
insert into online_retail values ('552061',	'21876',			'POTTERING MUG',							12		,'2011-05-06',	1.25	,13001	,'United Kingdom');
insert into online_retail values ('543179',	'22531',			'MAGIC DRAWING SLATE CIRCUS PARADE',		1		,'2011-02-04',	0.42	,12754	,'Japan');
insert into online_retail values ('540954',	'22381',			'TOY TIDY PINK POLKADOT',					4		,'2011-01-12',	2.1		,14606	,'United Kingdom');
insert into online_retail values ('572703',	'21818',			'GLITTER HEART DECORATION',					13		,'2011-10-25',	0.39	,16110	,'United Kingdom');
insert into online_retail values ('578757',	'23009',			'I LOVE LONDON BABY GIFT SET',				1		,'2011-11-25',	16.95,	12748	,'United Kingdom');
insert into online_retail values ('542616',	'22505',			'MEMO BOARD COTTAGE DESIGN',				4		,'2011-01-30',	4.95	,16816	,'United Kingdom');
insert into online_retail values ('554694',	'22921',			'HERB MARKER CHIVES',						1		,'2011-05-25',	1.63	,NULL		,'United Kingdom');
insert into online_retail values ('569545',	'21906',			'PHARMACIE FIRST AID TIN',					1		,'2011-10-04',	13.29   ,NULL			,'United Kingdom');
insert into online_retail values ('549562',	'21169',			'YOU''RE CONFUSING ME METAL SIGN',			1		,'2011-04-10',	1.69	,13232	,'United Kingdom');
insert into online_retail values ('580610',	'21945',			'STRAWBERRIES DESIGN FLANNEL',				1		,'2011-12-05',	1.63	,NULL		,'United Kingdom');
insert into online_retail values ('558066',	'gift_0001_50',		'Dotcomgiftshop Gift Voucher £50.00',		1		,'2011-06-24',	41.67   ,NULL			,'United Kingdom');
insert into online_retail values ('538349',	'21985',			'PACK OF 12 HEARTS DESIGN TISSUES',			1		,'2010-12-10',	0.85	,NULL		,'United Kingdom');
insert into online_retail values ('537685',	'22737',			'RIBBON REEL CHRISTMAS PRESENT',			15		,'2010-12-08',	1.65	,18077	,'United Kingdom');
insert into online_retail values ('545906',	'22614',			'PACK OF 12 SPACEBOY TISSUES',				24		,'2011-03-08',	0.29	,15764	,'United Kingdom');
insert into online_retail values ('550997',	'22629',			'SPACEBOY LUNCH BOX',						12		,'2011-04-26',	1.95	,17735	,'United Kingdom');
insert into online_retail values ('558763',	'22960',			'JAM MAKING SET WITH JARS',					3		,'2011-07-03',	4.25	,12841	,'United Kingdom');
insert into online_retail values ('562688',	'22918',			'HERB MARKER PARSLEY',						12		,'2011-08-08',	0.65	,13869	,'United Kingdom');
insert into online_retail values ('541424',	'84520B',			'PACK 20 ENGLISH ROSE PAPER NAPKINS',		9		,'2011-01-17',	1.63	,NULL		,'United Kingdom');
insert into online_retail values ('581405',	'20996',			'JAZZ HEARTS ADDRESS BOOK',					1		,'2011-12-08',	0.19	,13521	,'United Kingdom');
insert into online_retail values ('571053',	'23256',			'CHILDRENS CUTLERY SPACEBOY',				4		,'2011-10-13',	4.15	,12631	,'Finland');
insert into online_retail values ('563333',	'23012',			'GLASS APOTHECARY BOTTLE PERFUME',			1		,'2011-08-15',	3.95	,15996	,'United Kingdom');
insert into online_retail values ('568054',	'47559B',			'TEA TIME OVEN GLOVE',						4		,'2011-09-23',	1.25	,16978	,'United Kingdom');
insert into online_retail values ('574262',	'22561',			'WOODEN SCHOOL COLOURING SET',				12		,'2011-11-03',	1.65	,13721	,'United Kingdom');
insert into online_retail values ('569360',	'23198',			'PANTRY MAGNETIC SHOPPING LIST',			6		,'2011-10-03',	1.45	,14653	,'United Kingdom');
insert into online_retail values ('570210',	'22980',			'PANTRY SCRUBBING BRUSH',					2		,'2011-10-09',	1.65	,13259	,'United Kingdom');
insert into online_retail values ('576599',	'22847',			'BREAD BIN DINER STYLE IVORY',				1		,'2011-11-15',	16.95,	14544	,'United Kingdom');
insert into online_retail values ('579777',	'22356',			'CHARLOTTE BAG PINK POLKADOT',				4		,'2011-11-30',	1.63	,NULL		,'United Kingdom');
insert into online_retail values ('566060',	'21106',			'CREAM SLICE FLANNEL CHOCOLATE SPOT',		1		,'2011-09-08',	5.79	,NULL		,'United Kingdom');
insert into online_retail values ('550514',	'22489',			'PACK OF 12 TRADITIONAL CRAYONS',			24		,'2011-04-18',	0.42	,14631	,'United Kingdom');
insert into online_retail values ('569898',	'23437',			'50''S CHRISTMAS GIFT BAG LARGE',			2		,'2011-10-06',	2.46	,NULL		,'United Kingdom');
insert into online_retail values ('563566',	'23548',			'WRAP MAGIC FOREST',						25		,'2011-08-17',	0.42	,13655	,'United Kingdom');
insert into online_retail values ('539492',	'90209C',			'PINK ENAMEL+GLASS HAIR COMB',				1		,'2010-12-20',	2.11	,NULL		,'United Kingdom');
insert into online_retail values ('559693',	'21169',			'YOU''RE CONFUSING ME METAL SIGN',			1		,'2011-07-11',	4.13	,NULL		,'United Kingdom');
insert into online_retail values ('573386',	'22112',			'CHOCOLATE HOT WATER BOTTLE',				24		,'2011-10-30',	4.25	,17183	,'United Kingdom');
insert into online_retail values ('536520',	'84985A',			'SET OF 72 GREEN PAPER DOILIES',			1		,'2010-12-01',	1.45	,14729	,'United Kingdom');
insert into online_retail values ('556283',	'23306',			'SET OF 36 DOILIES PANTRY DESIGN',			12		,'2011-06-10',	1.45	,15628	,'United Kingdom');
insert into online_retail values ('571909',	'21117',			'BLOND DOLL DOORSTOP',						2		,'2011-10-19',	1.25	,15006	,'United Kingdom');
insert into online_retail values ('565378',	'21155',			'RED RETROSPOT PEG BAG',					7		,'2011-09-02',	4.96	,NULL		,'United Kingdom');
insert into online_retail values ('536592',	'90214H',			'LETTER "H" BLING KEY RING',				1		,'2010-12-01',	0.85	,NULL		,'United Kingdom');
insert into online_retail values ('580613',	'23438',			'RED SPOT GIFT BAG LARGE',					12		,'2011-12-05',	1.25	,14759	,'United Kingdom');
insert into online_retail values ('544336',	'21034',			'REX CASH+CARRY JUMBO SHOPPER',				1		,'2011-02-17',	0.95	,13230	,'United Kingdom');
insert into online_retail values ('542633',	'22382',			'LUNCH BAG SPACEBOY DESIGN',				2		,'2011-01-31',	4.13	,NULL		,'United Kingdom');
insert into online_retail values ('558485',	'23285',			'PINK VINTAGE SPOT BEAKER',					1		,'2011-06-30',	0.85	,NULL		,'United Kingdom');
insert into online_retail values ('564231',	'22424',			'ENAMEL BREAD BIN CREAM',					1		,'2011-08-24',	12.75,	13468	,'United Kingdom');
insert into online_retail values ('578746',	'84029E',			'RED WOOLLY HOTTIE WHITE HEART.',			25		,'2011-11-25',	9.13	,NULL		,'United Kingdom');
insert into online_retail values ('558564',	'23176',			'ABC TREASURE BOOK BOX',					3		,'2011-06-30',	2.25	,14057	,'United Kingdom');
insert into online_retail values ('C559345','21439',			'BASKET OF TOADSTOOLS',						-408	,'2011-07-07',	1.06	,13984	,'United Kingdom');
insert into online_retail values ('576920',	'23312',			'VINTAGE CHRISTMAS GIFT SACK',				4		,'2011-11-17',	4.15	,13871	,'United Kingdom');
insert into online_retail values ('564473',	'22384',			'LUNCH BAG PINK POLKADOT',					10		,'2011-08-25',	1.65	,16722	,'United Kingdom');
insert into online_retail values ('562264',	'23321',			'SMALL WHITE HEART OF WICKER',				3		,'2011-08-03',	3.29	,NULL		,'United Kingdom');
insert into online_retail values ('542541',	'79030D',			'TUMBLER, BAROQUE',							1		,'2011-01-28',	12.46,NULL			,'United Kingdom');
insert into online_retail values ('579937',	'22090',			'PAPER BUNTING RETROSPOT',					12		,'2011-12-01',	2.95	,13509	,'United Kingdom');
insert into online_retail values ('574076',	'22483',			'RED GINGHAM TEDDY BEAR',					1		,'2011-11-02',	5.79	,NULL		,'United Kingdom');
insert into online_retail values ('C571707','10135',			'COLOURING PENCILS BROWN TUBE',				-1		,'2011-10-18',	1.25	,14056	,'United Kingdom');
insert into online_retail values ('565617','84598',				'BOYS ALPHABET IRON ON PATCHES',			3		,'2011-09-05',	0.42	,NULL		,'United Kingdom');
insert into online_retail values ('579187','20665',				'RED RETROSPOT PURSE',						1		,'2011-11-28',	5.79	,NULL		,'United Kingdom');
insert into online_retail values ('542922','22423',				'REGENCY CAKESTAND 3 TIER',					3		,'2011-02-02',	12.75,	12682	,'France');
insert into online_retail values ('570677','23008',				'DOLLY GIRL BABY GIFT SET',					2		,'2011-10-11',	16.95,	12836	,'United Kingdom');
insert into online_retail values ('577182','21930',				'JUMBO STORAGE BAG SKULLS',					10		,'2011-11-18',	2.08	,16945	,'United Kingdom');
insert into online_retail values ('576686','20992',				'JAZZ HEARTS PURSE NOTEBOOK',				1		,'2011-11-16',	0.39	,16916	,'United Kingdom');
insert into online_retail values ('553844','22569',				'FELTCRAFT CUSHION BUTTERFLY',				4		,'2011-05-19',	3.75	,13450	,'United Kingdom');
insert into online_retail values ('580689','23150',				'IVORY SWEETHEART SOAP DISH',				6		,'2011-12-05',	2.49	,12994	,'United Kingdom');
insert into online_retail values ('545000','85206A',			'CREAM FELT EASTER EGG BASKET',				6		,'2011-02-25',	1.65	,15281	,'United Kingdom');
insert into online_retail values ('541975','22382',				'LUNCH BAG SPACEBOY DESIGN',				40		,'2011-01-24',	1.65	,NULL		,'Hong Kong');
insert into online_retail values ('544942','22551',				'PLASTERS IN TIN SPACEBOY',					12		,'2011-02-25',	1.65	,15544	,'United Kingdom');
insert into online_retail values ('543177','22667',				'RECIPE BOX RETROSPOT',						6		,'2011-02-04',	2.95	,14466	,'United Kingdom');
insert into online_retail values ('574587','23356',				'LOVE HOT WATER BOTTLE',					4		,'2011-11-06',	5.95	,14936	,'Channel Islands');
insert into online_retail values ('543451','22774',				'RED DRAWER KNOB ACRYLIC EDWARDIAN',		1		,'2011-02-08',	2.46	,NULL		,'United Kingdom');
insert into online_retail values ('578270','22579',				'WOODEN TREE CHRISTMAS SCANDINAVIAN',		1		,'2011-11-23',	1.63	,14096	,'United Kingdom');
insert into online_retail values ('551413','84970L',			'SINGLE HEART ZINC T-LIGHT HOLDER',			12		,'2011-04-28',	0.95	,16227	,'United Kingdom');
insert into online_retail values ('567666','22900',				'SET 2 TEA TOWELS I LOVE LONDON',			6		,'2011-09-21',	3.25	,12520	,'Germany');
insert into online_retail values ('571544','22810',				'SET OF 6 T-LIGHTS SNOWMEN',				2		,'2011-10-17',	2.95	,17757	,'United Kingdom');
insert into online_retail values ('558368','23249',				'VINTAGE RED ENAMEL TRIM PLATE',			12		,'2011-06-28',	1.65	,14329	,'United Kingdom');
insert into online_retail values ('546430','22284',				'HEN HOUSE DECORATION',						2		,'2011-03-13',	1.65	,15918	,'United Kingdom');
insert into online_retail values ('565233','23000',				'TRAVEL CARD WALLET TRANSPORT',				1		,'2011-09-02',	0.83	,NULL		,'United Kingdom');
insert into online_retail values ('559984','16012',				'FOOD/DRINK SPONGE STICKERS',				50		,'2011-07-14',	0.21	,16657	,'United Kingdom');
insert into online_retail values ('C546997','22398',			'MAGNETS PACK OF 4 SWALLOWS',				-6		,'2011-03-18',	1.25	,12748	,'United Kingdom');
insert into online_retail values ('538597','21824',				'PAINTED METAL STAR WITH HOLLY BELLS',		5		,'2010-12-13',	1.45	,15555	,'United Kingdom');
insert into online_retail values ('557892','23191',				'BUNDLE OF 3 RETRO NOTE BOOKS',				1		,'2011-06-23',	1.65	,14534	,'United Kingdom');
insert into online_retail values ('539314','21114',				'LAVENDER SCENTED FABRIC HEART',			20		,'2010-12-16',	1.25	,13874	,'United Kingdom');
insert into online_retail values ('561369','23009',				'I LOVE LONDON BABY GIFT SET',				1		,'2011-07-26',	24.96,NULL			,'United Kingdom');
insert into online_retail values ('562560','22411',				'JUMBO SHOPPER VINTAGE RED PAISLEY',		2		,'2011-08-05',	2.08	,14156	,'EIRE');
insert into online_retail values ('580848','72799E',			'IVORY PILLAR CANDLE SILVER FLOCK',			1		,'2011-12-06',	0.79	,18005	,'United Kingdom');
insert into online_retail values ('555388','22725',				'ALARM CLOCK BAKELIKE CHOCOLATE',			4		,'2011-06-02',	3.75	,17719	,'United Kingdom');
insert into online_retail values ('539451','22470',				'HEART OF WICKER LARGE',					3		,'2010-12-17',	5.91	,NULL		,'United Kingdom');
insert into online_retail values ('580730','21126',				'SET OF 6 GIRLS CELEBRATION CANDLES',		1		,'2011-12-05',	1.25	,NULL		,'United Kingdom');
insert into online_retail values ('577598','23210',				'WHITE ROCKING HORSE HAND PAINTED',			24		,'2011-11-21',	1.25	,13430	,'United Kingdom');
insert into online_retail values ('537141','22193',				'RED DINER WALL CLOCK',						1		,'2010-12-05',	8.5		,15570	,'United Kingdom');
insert into online_retail values ('579161','23493',				'VINTAGE DOILY TRAVEL SEWING KIT',			5		,'2011-11-28',	1.95	,17379	,'United Kingdom');
insert into online_retail values ('11','22087','PAPER BUNTING WHITE LACE',20,'2011-05-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('12','22087','PAPER BUNTING WHITE LACE',12,'2011-07-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('13','22087','PAPER BUNTING WHITE LACE',1	,'2011-08-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('14','22087','PAPER BUNTING WHITE LACE',10,'2011-07-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('15','22087','PAPER BUNTING WHITE LACE',2	,'2011-06-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('16','22087','PAPER BUNTING WHITE LACE',1	,'2011-04-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('17','22087','PAPER BUNTING WHITE LACE',1	,'2011-02-28',	2.55,NULL,'United Kingdom');
insert into online_retail values ('18','22087','PAPER BUNTING WHITE LACE',10,'2011-01-28',	2.55,NULL,'United Kingdom');
commit;

select * from  online_retail;

with cte as
    (SELECT description as item, TO_CHAR(invoicedate, 'MM') as mon_id , TO_CHAR(invoicedate, 'MON') as mon
    , sum(quantity * unitprice) as tot_sales
    , rank() over(partition by TO_CHAR(invoicedate, 'MM') order by sum(quantity * unitprice) desc) as rnk
    FROM online_retail
    --where TO_CHAR(invoicedate, 'MON') = 'JAN'
    group by description, TO_CHAR(invoicedate, 'MM') , TO_CHAR(invoicedate, 'MON'))
select item, mon, tot_sales
from cte
where rnk = 1;


-- session 16 notess ---

-- FIRST_value, LAST_VALUE, NTH_VALUE