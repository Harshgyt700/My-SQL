-- Assignments
use company;
select * from branch;
select * from customers;
select * from accounts;
select * from transactions;
select * from employees;
-- 1) Fetch all transaction data.
select * 
from transactions;

-- 2) Fetch account_number and acc type from all accounts.
select Account_number,acc_type
from accounts;

-- 3) Fetch customer id and name of all active customers.
select customer_id,concat(first_name,' ',last_name) as name
from customers
where is_active='true';

-- 4) Fetch customer id and name of all active customers who were born after 2000.
select customer_id,concat(first_name,' ',last_name) name
from customers
where is_active='true' and year(dob)>2000;

-- 5) Find employees whose salary ranges from 50k to 70k
select *
from employees
where salary between 50000 and 70000;

-- 6) Find customers who have not provided basic information such as address or phone number.
select * 
from customers
where phone_no is null or address is null;

-- 7) Find customers having "oo" in their name.
select *
from customers
where first_name like '%oo%' or last_name like '%n%';

-- 8) Identify the total no of wire transfer transactions.
select count(*)
from transactions
where trns_type='wire transfer';
select distinct trns_type from transactions;

-- 9) Identify the unique transaction type.
select distinct trns_type
from transactions;

-- 10) Fetch the first 15-20 transactions
select * 
from transactions
limit 5 offset 15;

-- 11) Fetch the inactive customers name, phone no, address and dob. Display the the oldest customer first.
select concat(first_name,' ',last_name) name,phone_no,address,dob 
from customers
where is_active='false'
order by 4;

-- 12) Find the customers who are from either "77 Lien Park", "337 Westend Park" or "9 Troy Plaza".
select * 
from customers
where address in ("77 Lien Park", "337 Westend Park" , "9 Troy Plaza");

-- 13) Fetch all customers who have "Park" or "Plaza" in their address.
select *
from customers
where address like '%Park%' or address like  '%Plaza%';


-- 14) Find employees working in Mumbai
select * 
from employees e 
join branch b on b.branch_code=e.branch_code
where branch_name='Mumbai';
-- 15) Find total no of successful transactions that belong to inactive customers. 
select * 
from transactions t
 join accounts a on a.account_number=t.acc_number
join customers c on a.cust_id=c.customer_id
where c.is_active<>'true' and t.status='Success';

-- 16) Categorise employees based on their salary.
select *,
case when salary>50000 then 'low salary'
	 when salary between 50000 and 70000 then 'middle salary'
     else 'high salary'
end as categories
from employees;

-- 17) Find the total balance of all savings account.
select round(sum(balance),3)
from accounts
where acc_type='Saving';

-- 18) Display the total account balance in all the Loan or saving accounts.
select sum(balance) as sums
from accounts
where acc_type ='Saving' or acc_type='Loan';

use demo;
select * from customers;
select * from sales_order;
select * from products;
-- Assignment 6th
-- 1) Fetch all the small shipped orders from August 2003 till the end of year 2003.
select * 
from sales_order
where deal_size='Small' and status='Shipped'
and month_id>8 and year_id=2003;

-- 2) Find all the orders which do not belong to customers from USA and are still in process.
select * 
from customers c
join sales_order s on s.customer=c.customer_id
where country<>'USA' and status='In Process';

-- 3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
select * 
from sales_order s
join products p on p.product_code=s.product
where s.status not in('In Process', 'Shipped', 'Resolved')
and p.product_line in ('Ships','Planes','Trains');

-- 4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
select *
from customers
where phone like '%(%' or phone like '%)%' or phone like '%+%';

-- 5) Find customers whose phone number does not have any space.
select *
from customers
where phone not like '% %';

-- 6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
select * 
from sales_order
where month_id>1 and month_id<6
and quantity_ordered%2=0;

-- 7) Find orders which sold the product for price higher than its original price.
select *
from products p
join sales_order s on s.product=p.product_code
where p.price<s.price_each;

-- 8) Find the average sales order price
select avg(price_each)
from sales_order;
select round(avg(price_each),2)
from sales_order;

-- 9) Count total no of orders
select count(*)
from sales_order;

-- 10) Find the total quantity sold.
select sum(quantity_ordered)
from sales_order;

-- 11) Fetch the first order date and the last order date.
select min(order_date) as first_order_date,max(order_date) as last_order_date
from sales_order;

select * from sales_order;
select * from  customers;
select * from products;

-- group by and having clause
select country
from customers
group by country;

select status
from sales_order;

select status 
from sales_order
group by status;

select distinct status
from sales_order;

select status,count(1) 
from sales_order
group by status;

select distinct status
from sales_order
group by status;