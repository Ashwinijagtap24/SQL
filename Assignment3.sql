CREATE TABLE Worker 
(
	WorkerId int NOT NULL PRIMARY KEY identity(1,1),
	FName varchar(50),
	LName varchar(50),
	Salary int,
	JoiningDate datetime,
	Department CHAR(25)
)
drop table Worker
sp_help Worker 
insert into Worker values ('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR')
select*from worker
insert into Worker values ('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin')
insert into Worker values ('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR')
insert into Worker values( 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin')
insert into Worker values(  'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin')
insert into Worker values(  'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account')
insert into Worker values( 'Satish', 'Kumar', 75000 ,'2020-01-14 09:00:00', 'Account')
insert into Worker values( 'Geetika', 'Chauhan', 90000,'2011-04-14 09:00:00', 'Admin')
select * from worker
create table Bonus
(
workerrefid int,
bonusAmt int,
bonusDate datetime,
)
alter table Bonus add constraint fk_workerrefid foreign key(workerrefid)
references Worker(WorkerId)

select* from Bonus
insert into Bonus values(1, 5000, '2020-02-16')
insert into Bonus values(2, 3000, '2011-06-16')
insert into Bonus values(3, 4000, '2020-02-16')
insert into Bonus values(1, 4500, '2020-02-16')
insert into Bonus values(002, 3500, '2011-06-16')

create table Title
(
workerrefid int,
workertitle varchar(50),
affectedfrom datetime
)
sp_help Title
alter table Title add constraint fk_workerrefid foreign key(workerrefid)
references Worker(WorkerId)
select * from Title
insert into Title values(001, 'Manager', '2016-02-20 00:00:00')
 insert into Title values(002, 'Executive', '2016-06-11 00:00:00')
insert into Title values (008, 'Executive', '2016-06-11 00:00:00')
insert into Title values (005, 'Manager', '2016-06-11 00:00:00')
insert into Title values  (004, 'Asst. Manager', '2016-06-11 00:00:00')
insert into Title values (007, 'Executive', '2016-06-11 00:00:00')
insert into Title values(006, 'Lead', '2016-06-11 00:00:00')
insert into Title values(003, 'Lead', '2016-06-11 00:00:00')

--Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker 
--table using the alias name as <WORKER_NAME>.
select * from Worker
select* from Bonus
select * from Title
select Fname as'Worker_name' from Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(Fname) from worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct department from worker

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(Fname, 1,3) from Worker

---5. Write an SQL query to find the position of the alphabet (‘a’) 
--in the first name column ‘Amitabh’ from Worker table.
select * from Worker
select* from Bonus
select * from Title
select  from worker
Select charindex('a','Amitabh' )as matchposition

--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after 
--removing white spaces from the right side.
select RTRIM(fname) from worker
select LTRIM(fname) from worker
select TRIM(fname) from worker

--Q-7. Write an SQL query to print the DEPARTMENT from Worker 
--table after removing white spaces from the left side.
select LTRIM(department) from worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT 
--from Worker table and prints its length.
select distinct department ,len(department) as'length' from worker

--9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select Replace(fname,'a','A')from worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
--A space char should separate them.
select concat(fname,' ',Lname )as 'complete name'from worker
select concat(fname,'->',Lname )from worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by fname asc

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by fname asc, department desc

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where fname in('vipul', 'satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where fname not in('vipul','satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department = 'admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select fname ,contains('a')from worker
select * from worker where fname like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker where fname like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where fname like'______h' 

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from Worker
select* from Bonus
select * from Title
select  from worker 
select * from worker where joiningDate = '2014-02'
select * from worker where year(joiningDate) =2014 and month(joiningDate) =2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from worker where department ='Admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select fname,salary from worker where  salary >=50000 and salary <=100000

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department,count(department) from worker group by department order by count(department) desc
select* from worker

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from Worker
select* from Bonus
select * from Title

select * from worker w inner join Title t on w.workerid = t.workerrefid where workertitle='manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select workertitle ,count(*) from title
 group by workertitle having count(*) >1
 select * from Title

--Q-26. Write an SQL query to show only odd rows from a table.
select * from worker
select *from worker where workerid % 2 != 0
select *from worker where workerid % 2 <> 0

--Q-27. Write an SQL query to show only even rows from a table.
select * from worker where workerid%2=0

--Q-28. Write an SQL query to clone a new table from another table.
select * into workercopy from worker
select * from workercopy

--Q-29. Write an SQL query to fetch intersecting records of two tables.
select * from worker intersect select * from workercopy

--Q-30. Write an SQL query to show records from one table that another table does not have.
select * from worker
--select* from Bonus
select * from title
select * from worker minus select * from Title

--Q-31. Write an SQL query to show the current date and time.
select CURRENT_TIMESTAMP

--Q-32. Write an SQL query to show the top n (say 10) records of a table.
select top 10 * from worker order by salary desc

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker  order by salary desc
offset 4 rows  
fetch next 1 rows only

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select * from worker  order by salary desc
offset 4 rows  
fetch next 1 rows only

--Q-35. Write an SQL query to fetch the list of employees with the same salary.
select salary,count(*) from worker group by salary order by count(salary)desc

Select distinct W.WORKERID, W.FNAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary and 
W.WORKERID != W1.WORKERID

--Q-36. Write an SQL query to show the second highest salary from a table.
select * from worker order by salary desc
offset 1 rows 
fetch next 1 rows only  

--Q-37. Write an SQL query to show one row twice in results from a table.
select  distinct department from worker w group by w.department 
union all
select  distinct department from worker w1  group by w1.department 
 --or
 select FNAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FNAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.
select * from worker intersect select * from workercopy

--Q-39. Write an SQL query to fetch the first 50% records from a table.
 select top 50 PERCENT * from worker order by workerid asc

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select department, count(department ) from worker group by department

select department,Count(department) from worker group by department having count(department)<5

--Q-41. Write an SQL query to show all departments along with the number of people in there.
select * from worker
select  department ,count(department)from worker group by department

--Q-42. Write an SQL query to show the last record from a table.
Select * from Worker where WORKERID = (SELECT max(WORKERID) from Worker)
select max(workerid) from worker


--Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where workerid =( select min(workerid) from worker)

--Q-44. Write an SQL query to fetch the last five records from a table.
select* from worker where workerid >(select count(*) from worker)-5

--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select * from worker where salary in(
select max(salary) from worker group by department)

select * from worker
select* from Bonus
select * from Title


--Q-46. Write an SQL query to fetch three max salaries from a table.
select * from worker order by salary desc
offset 0 rows
fetch next 3 rows only

--Q-47. Write an SQL query to fetch three min salaries from a table.
select * from worker where salary in
( 
select min(salary) from worker where salary >
(
select min(salary) from worker
)
)

select * from worker order by salary asc
offset 0 rows 
fetch next 3 rows only

--Q-48. Write an SQL query to fetch nth max salaries from a table.

SELECT distinct Salary from worker a WHERE n >= 
(SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary)
order by a.Salary desc

select top 1 salary from(
select distinct top N salary from worker order by salary desc)
as temp order by salary

select * from worker w where (salary-1) =
(
select count(distinct (w.salary))
from worker w2 where w2.salary > w.salary
)
--Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department,sum(salary)from worker group by department 


--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select fname from worker where salary in(select max(salary) from worker)
select fname from worker where salary =(select max(salary) from worker)