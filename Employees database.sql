create database EMPLOYEES;

use EMPLOYEES;

drop table employee_Details;

create table Employee_Details(
Empid int primary key,
FullName varchar(20) null,
ManagerID int null,
DOJ date,
City varchar(10) null );

insert into Employee_Details values(
121,'John Snow',321,'2019-10-31','Toronto'),
(321,'Walter White',986,'2020-01-30','California'),
(421,'Kuldeep Rana',876,'2021-11-27','New Delhi'),
(1234,'Alba Otto',567,'2020-08-28','Mumbai');

select * from Employee_Details;


drop table employee_salary;

create table Employee_Salary(
Empid int references employee_details(empid),
Project varchar(2) ,
Salary int,
variable int );


insert into Employee_Salary values
(121,'P1',8000,500),
(321,'P2',10000,1000),
(421,'P1',12000,0),
(1234,null,null,100);

select * from Employee_Salary;
select * from employee_details;



select * from employee_details join employee_salary on employee_details.empid = employee_salary.empid;



-- SELECT * FROM [table1] JOIN [table2] ON [table1.primary_key] = [table2.foreign_key];

-- To fetch the records that are present in one table but not in another table?

select ed.* 
from employee_details as ed
left join employee_salary as es
on ed.empid=es.empid
where es.empid is null ;



-- To fetch all the employees who are not working on any project?

select ed.*,project
from employee_details as ED 
join employee_salary as ES 
on ED.empid = ES.empid 
where project is null;


-- To fetch all the employees from employee_details who joined in the year 2020?

select empid,fullname,year(doj) doj
from employee_details
where year(doj)=2020;

-- To fetch all the employees from employees_details who have a salary record in employee_salary?

select fullname,managerid,doj,city,salary
from employee_details as ED join employee_salary as ES
where ED.empid = ES.empid and salary is not null ;


-- To fetch a project-wise count of employees?

select project,count(empid) 'No of employees',row_number() over(order by count(empid) desc) as rank_of_emp
from employee_salary
group by project;


-- To fetch employees names and salaries even if the salary value is not present for the employee?

select fullname, salary
from employee_details as ED join employee_salary as ES
on ED.empid = ES.empid  
where salary is null or salary is not null;


-- To fetch all the Employes who are also manager?

select empid ,fullname, managerid
from employee_details
where managerid is not null;


-- To fetch duplicate records from employee_details?

select count(empid),count(fullname),count(managerid),count(city) 
from employee_details
group by fullname,managerid,city ;

select *,count(*)
from employee_details
group by empid having count(*);

-- To fetch only odd rows from the table ?


select *
from
    (select *, row_number() over(order by (select null)) as rn
    from employee_details
) as sub 
where rn % 2 <> 0;



-- To find the 3rd highest salary from a table without top or limit keyword?

SELECT *
FROM (
    SELECT salary,
           ROW_NUMBER() OVER (ORDER BY (salary) desc) AS rn
    FROM employee_salary
) AS sub
WHERE rn % 3 = 0;


-- 1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’. 

select empid,fullname,managerid
from employee_details
where managerid=986;


-- 2. Write an SQL query to fetch the different projects available from the EmployeeSalary table. 

select distinct(project)
from employee_salary;


-- 3. Write an SQL query to fetch the count of employees working in project ‘P1.

select count(empid) as 'no of employees',project
from employee_salary
group by project having project='p1';



-- 4. Write an SQL query to find the maximum, minimum, and average salary of the employees.

select empid, max(salary), min(salary), avg(salary)
from employee_salary
group by empid;



-- 5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000. 

select empid ,salary
from employee_salary
where salary between 9000 and 15000;


-- 6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321. 

select *
from employee_details
where city='toronto' and managerid=321;



-- 7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321. 

select *
from employee_details
where city='california' or managerid=321 ;



-- 8. Write an SQL query to fetch all those employees who work on Projects other than P1. 

select *
from employee_salary
where project!='p1';


-- 9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.

select empid,salary+variable as 'total salary'
from employee_salary;


-- 10. Write an SQL query to fetch the employees whose name begins with any two characters, 
-- followed by a text “-hn” and ends with any sequence of characters. 

select *
from employee_details
where fullname like '__hn%' ;



-- 11. Write an SQL query to fetch all the EmpIds which are present in either of the tables 
-- – ‘EmployeeDetails’ and ‘EmployeeSalary’. 

SELECT empid FROM Employee_Details
UNION
SELECT empid FROM Employee_Salary;


-- 12. Write an SQL query to fetch common records between two tables. 

select * from employee_details as Ed inner join employee_salary as ES on ED.empid = ES.empid;


-- 13. Write an SQL query to fetch records that are present in one table but not in another table. 

SELECT *
FROM employee_details as ED 
WHERE   not exists (
    SELECT 1
    FROM employee_salary as ES
    WHERE ED.empid = ES.empid );


SELECT *
FROM employee_details as ED  
WHERE managerid=321 or empid  not in(
    SELECT empid
    FROM employee_salary as ES
    where ED.empid=ES.empid
) ;



-- 14. Write an SQL query to fetch the EmpIds that are present in both the tables – ‘EmployeeDetails’ and ‘EmployeeSalary. 

select empid
from employee_details as ED, employee_salary as ES
where empid  in(
      select empid
      from employee_salary as ES
      where  ED.empid = ES.empid)
      or
      empid  not in(
      select empid
      from employee_salary as ES
      where  ED.empid = ES.empid
);


-- 15. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary. 

select empid
from employee_details as ED
where empid not in(
      select empid
      from employee_salary as ES
      );


-- 16. Write an SQL query to fetch the employee’s full names and replace the space with ‘-’. 

select replace(fullname,' ','-')
from employee_details;


-- 17. Write an SQL query to fetch the position of a given character(s) in a field. 

select position('ow' in fullname) as position
from employee_details;


-- 18. Write an SQL query to display both the EmpId and ManagerId together. 

select empid,managerid
from employee_details;


-- 19. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table. 

select substring(fullname,1,string(' ',fullname + ' ')-1) as 'first name'
from employee_details;

select remove(fullname,' ') 
from employee_details;

-- 20. Write an SQL query to uppercase the name of the employee and lowercase the city values. 

select upper(fullname),lower(city)
from employee_details;


-- 21. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field. 

SELECT count(CHAR_LENGTH(fullname) - CHAR_LENGTH(REPLACE(fullname, 'n', ''))) AS CountOfN
FROM employee_details;

select * from employee_details;

# 22. Write an SQL query to update the employee names by removing leading and trailing spaces. 

update employee_details set fullname = ltrim(fullname);
select rtrim(fullname) from employee_details;


-- 23. Fetch all the employees who are not working on any project. 

select empid
from employee_salary
where project=null;


-- 24. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000. 

select empid,salary
from employee_salary
where salary between 5000 and 10000;

-- 25. Write an SQL query to find the current date-time. 

select current_timestamp();


-- 26. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020. 

select * 
from employee_details
where year(doj)=2020 ;


-- 27. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table. 

select ed.*
from employee_details as ed 
inner join employee_salary as es on ed.empid=es.empid; 


-- 28. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order. 

select count(empid) as 'count of emp',project
from employee_salary
where project in ('p1','p2')
group by project having count(empid)
order by project desc;


-- 29. Write a query to fetch employee names and salary records. Display the employee details even if the salary record 
-- is not present for the employee. 

select ed.*,es.salary 
from employee_details as ed 
left outer join employee_salary as es on ed.empid=es.empid;


-- 30. Write an SQL query to join 3 tables. 

select * from employee_details as ed  join employee_salary as es join employee_details as ed1 on ed.empid=es.empid;



-- 31. CREATE A STORED PROCEDURE THAT SHOWS THE NTH HIGHEST SALARY

delimiter //
create procedure GETNTHHIGEST(in N int)
begin 
     select distinct salary
     from employee_salary
     order by salary desc
     limit N-1, 1;
end //
delimiter ;
CALL GetNthHighest(3);



create procedure GetNthHighestSalary(IN N Int)
Begin
	Declare nth_salary decimal(10,2);
    
    set nth_salary=(
    select distinct(salary)
    from employee_salary
	order by salary desc
    limit N-1,1
    );

    select nth_salary as NthHighestSalary;
end;











SELECT * FROM employee_details ed
JOIN employee_salary es ON ed.empid = es.empid
JOIN employee_salary ON ed.empid = es.empid
LIMIT 5;







sELECT FullName,Salary,row_number() OVER (ORDER BY Salary DESC) AS DenseRank
FROM Employee_details join employee_salary
where Employee_details.empid=employee_salary.empid;


use school;

select* from course_master;
select * from student_master;
select * from enrollment_master;