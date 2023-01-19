Create table Dept1
(
Deptid int,
Deptname varchar(50),
)
Select* from Dept1
Alter  table Dept1 alter column Deptid int not null
Alter table Dept1 add constraint PK_Dept1 primary key(Deptid)
Sp_help Dept1
select * from Dept1
Create table Emplyoee
(
Empid int primary key,
Empname varchar(50) not null,
Email varchar(50)unique,
Age  int check (Age>18),
Country varchar(20) default 'India',
Deptid int foreign key references Dept1(Deptid),
)

select * from Dept1
Alter table Dept1 add Contraint pk_Dept1 primary key(Deptid )

insert into Dept1 values(1,'HR')
insert into Dept1 values(2,'Manager')
insert into Dept1 values(3,'Developer')
insert into Dept1 values(4,'Testing')
insert into Dept1 values(5,'Sales')
Alter table Emplyoee Add EmpDept varchar(40)


insert into Emplyoee values(1,'Ashwini','ashu@gmail.com',22,'India',1,'Hr')
insert into Emplyoee  values(2,'Ritik','ritika@gmail.com', 23,'India',5,'SALES')
insert into Emplyoee  values(3,'Ashwini','ashu24@gmail.com', 22,'England',4,'TESTING')
insert into Emplyoee  values (4,'Ragashri','ragashri@gmail.com',26,'USA',3,'Developer')
insert into Emplyoee  values (5,'Payal','payal@gmail.com',21,'USA',1,'HR')
insert into Emplyoee  values (6,'Manthan','manthan@gmail.com',34,'England',5,'SALES')
insert into Emplyoee  values (7,'Pooja','pooja@gmail.com',20,'India',3,'Developer')
insert into Emplyoee values (8,'Pranit','pranit@gmail.com',21,'Russia',1,'HR')
insert into Emplyoee values (9,'Soni','soni@gmail.com',45,'Russia',4,'TESTING')
insert into Emplyoee values (10,'Radha','radha@gmail.com',32,'Japan',2,'MANGER')
--distinct --
select distinct Country From Emplyoee
Select Country from Emplyoee group by Country
select* from Emplyoee
select Country ,Count(Country) from Emplyoee group by Country 


Alter table Emplyoee Add Salary int
update Emplyoee set Salary = 25000 where Empid in(2,4)
update Emplyoee set Salary = 45000 where Empid in(1,3)
update Emplyoee set Salary = 60000 where Empid in(6,8)
update Emplyoee set Salary = 35000 where Empid in(5,9)
update Emplyoee set Salary = 50000 where Empid in(7,10)

--Condition 
select * from Emplyoee where age>=23
select * from Emplyoee where age<=24
select * from Emplyoee where age<>23
select * from Emplyoee where age!=23

select * from Emplyoee where Salary>=45000
select * from Emplyoee where Salary<=30000
select * from Emplyoee where Salary<>50000
select * from Emplyoee where Salary!=25000

--Between--
select * from Emplyoee where salary between 25000 and 30000
select * from Emplyoee where country between 'india' and 'japan'

--Operator
select * from Emplyoee where Empid in(1,2,3,8)
--country not in japan and england
select * from Emplyoee where country not in ('India') and country not in('japan')

--Like clause and not like clause
--like
-- start with a
select * from Emplyoee where Empname like 'a%'
--end with a
select * from Emplyoee where Empname like '%a'
-- range 
select * from Emplyoee where Empname like '[a-l]%'
select * from Emplyoee where Empname like '%[a-l]'
select * from Emplyoee where Empname like '[ash]%'
select * from Emplyoee where Empname like '%[ash]'
select * from Emplyoee where Empname like '[ash]%'
select * from Emplyoee where Empname like '_a%'
select * from Emplyoee where empname like '%h%'
Select * from Emplyoee where empname like '%_a_%'

--not like
select * from Emplyoee where Empname not like  '[a-l]%'
select * from Emplyoee where Empname not like '%[a-l]'
select * from Emplyoee where Empname not like '[ash]%'
select * from Emplyoee where Empname not like '%[ash]'
select * from Emplyoee where Empname not like '[ash]%'
select * from Emplyoee where Empname not like '_a%'
select * from Emplyoee where empname not like '%h%'
Select * from Emplyoee where empname not like '%_a_%'

-- and , or & not operator

select * from Emplyoee where deptid=2 and country='Japan'		
select * from Emplyoee where deptid=2 or country='India'			 
select * from Emplyoee where not country='England' 

--isnull /isnotnull
update Emplyoee  set Country =null where Empid =8
select * from Emplyoee where Country is null
select * from Emplyoee where country is not null

--order by
--asc
select * from Emplyoee  order by Deptid asc
select * from Emplyoee  order by Empid asc
select * from Emplyoee  order by Country asc
select * from Emplyoee  order by Email asc
--dec
select * from Emplyoee  order by Deptid desc
select * from Emplyoee  order by Empid desc
select * from Emplyoee  order by Country desc
select * from Emplyoee  order by Email desc

--offset /fetch 
select * from Emplyoee Order by Empname Offset 3 rows fetch next 3 rows only
select * from Emplyoee Order by Empid Offset 3 rows fetch next 3 rows only
select * from Emplyoee Order by Empid Offset 3 rows
select * from Emplyoee Order by Empid Offset 3 rows fetch next 3 rows only  

-- highest salary in 2,3
select * from Emplyoee order by Salary desc 
offset 1 row
fetch next 3 rows only

---- highest salary in 2,3,4 highest salary
select * from Emplyoee order by Salary desc 
offset 1 row
fetch next 3 rows only

-- 3,4,5 highest salary
select * from Emplyoee order by Salary desc
offset 2 rows
fetch next 3 rows only

-- using top 3 highest salary
select Top 3* from Emplyoee order by Salary desc

--using top 3 lowest salary
select Top 3*from Emplyoee order by Salary asc

--join 
- types
--Inner Join
--Left Join
--Right Join
--Self Join
--Cross Join / Cartesian product

select* from Emplyoee
Select* from Dept1

--Inner Join

select e.*,d.Deptname 
from Emplyoee e 
inner join Dept1 d 
on d.Deptid = e.Deptid

select e.empname as 'Employee name' ,
e.email as 'Email id' ,
d.deptname as 'dept name'
from Emplyoee e inner join Dept1 d on d.Deptid = e.Deptid
--or
select  e.empname,e.email,d.deptname
from Emplyoee e inner join Dept1 d on d.Deptid =  e.Deptid 
--or
select  e.empname,e.email,d.deptname
from Emplyoee e inner join Dept1 d on d.Deptid =  e.Deptid 

--left join 
select e.*,d.Deptname from 
Emplyoee e left join Dept1 d on d.Deptid = e.Deptid


insert into Dept1 values(6,'Associate')
insert into Dept1 values(7,'Receiptionist')
select * from Dept1
select * from Emplyoee

insert into Emplyoee values(11,'Akash','akash@gmail.com',23,'Japan',null,'Production',23000)
insert into Emplyoee values(12,'Vishakha','vishakha@gmail.com',28,'Koria',null,'Production',23000)

-- right join 
select e.* ,d.deptid from
Emplyoee e right join Dept1 d 
on d.Deptid = e.Deptid


--full join 
select e.*,d.Deptname  from Emplyoee e full join Dept1 d on d.Deptid = e.Deptid

--self join 
alter table emplyoee add Managerid int 
update Emplyoee set Managerid  =1 where empid in (2,3,4)
update Emplyoee set Managerid =5 where empid in (6,7,8)
update Emplyoee set Managerid  =9 where empid in (10,11,12)
				   
select emp.Empname as 'Ename',man.Empname as 'mname' from Emplyoee emp ,Emplyoee man
where man.Empid = emp.Managerid

--cross join
select * from Emplyoee cross join Dept1
select * from Dept1 cross join Emplyoee

--Aggregation function 
select* from Emplyoee
--sum
select sum(Salary) as 'sum of salary'from emplyoee
select sum(Age) as ' total age ' from emplyoee

--Count 
select count( empname) as 'total employee' from Emplyoee
select count(*) as 'All record' from Emplyoee
select count(distinct Country ) from Emplyoee
select  country,count(country) from Emplyoee group by  country

--mAx
select Max(salary) as 'Max salary'from Emplyoee 
select Max(Age) as 'Max Age'from Emplyoee 

--min
select Min(salary) as 'Min salary'from Emplyoee 
select Min(Age) as 'Min Age'from Emplyoee 

--avg
select Avg(salary) as 'Avg salary'from Emplyoee 
select Avg(Age) as 'Avg Age'from Emplyoee 

--identity Column 
--create new table Customer and Order  
create table Customers
(
custId int primary key identity(1,1),
custName varchar(20),
)
insert into Customers values('Raju')
insert into Customers values('Baburao')
insert into Customers values('Sham')
select* from Customers
insert into Customers values('Anuradha')

create table Orders
(
orderId int primary key identity(1,1),
custId int ,
constraint fk_custemers_order foreign key(custId) references customers(custId)
)
select * from Orders
insert into Orders values(3)--1
insert into Orders values(3)--2
insert into Orders values(6)--3 remove and display next identity 
insert into Orders values(3)--4
insert into Orders values(6)--5 remove and display next identity 
insert into Orders values(1)--6

--Group BY
Select* From Emplyoee
-- find the no of customer in each country
Select Country,(Count(empid )) as 'totalemp 'from Emplyoee
group by Country
order by totalemp
-- count the emp in each dept
select EmpDept ,(Count(EmpDept) )as 'totalEmpDept' from Emplyoee
group by EmpDept
order by totalEmpDept

-- count the emp which is in development dept
select EmpDept, Count(empdept ) from Emplyoee  where EmpDept ='developer'  group by EmpDept 

select e.EmpDept, Count(empdept ) from Emplyoee e where e.EmpDept ='HR'  group by EmpDept 
		--Or
select d.deptname , count(e.empid) as 'emp count' from Emplyoee e
inner join dept1 d on d.deptid=e.deptid
--where d.deptname='hr'-+
group by d.deptname

select* from Emplyoee
select Country ,(Count(empid)) as 'totalemp' from Emplyoee
group by Country 
having count(empid)<3

select Country ,(Count(empid)) as 'totalemp' from Emplyoee
group by Country 
having count(empid)=3

select Country ,(Count(empid)) as 'totalemp' from Emplyoee
group by Country 
having count(empid)!=2

select Country ,(Count(empid)) as 'totalemp' from Emplyoee
group by Country 
having count(empid)>2

select Country ,(Count(empid)) as 'totalemp' from Emplyoee
group by Country 
having count(empid)<=2

select Country ,(Count(empid)) as 'totalemp' from Emplyoee
group by Country 
having count(empid)>=2

Select * From Emplyoee
--display count of employee who's from india & usa (using group by)
select country,count(Empid) from Emplyoee 
where Country in('India','USA') 
group by Country
order by Count(empid)
 --OR
 select country,count(Empid) from Emplyoee 
 group by Country
 having country in('India','USA')
 order by Count(empid)

 --Views in SQL 
  --Create view
 create view deptwise_empcount
 as
 select d.deptname ,count(e.empid) as 'empcount' 
 from Emplyoee e inner join Dept1 d on d.Deptid = e.Deptid
 group by d.Deptname

 select* from deptwise_empcount

 --Modify the existing view
 alter view deptwise_empcount
 as
 select d.deptname ,count(e.empid) as 'empcount'
 from Emplyoee e inner join Dept1 d on d.Deptid = e.Deptid
 group by d.Deptname
 select* from deptwise_empcount

 --call the view
select * from deptwise_empcount

-- delete the view
drop view deptwise_empcount

-- create view salary greater than 30k
create view salary_great30k
as
select * from Emplyoee where salary >30000

select * from salary_great30k

create view Country_INDIA
as
select* from Emplyoee where Country ='India'
select* from Country_INDIA

--subquery
select* from Emplyoee
select* from dept1
--find the max salary from employee table
select max(salary) from Emplyoee

--subquery --> find name of emp who has higest salary
select* from Emplyoee where salary =
(select Max(salary) from Emplyoee)

--find the second highest salary using suquery
select max(Salary ) from Emplyoee where salary<>
(
select Max(salary) from Emplyoee
)
-- find the name of emp whose has 2nd highest salary
select * from Emplyoee where Salary=
(
select max(Salary ) from Emplyoee where salary<>
(
select Max(salary) from Emplyoee
)
)
-- find the name of emp whose has 3rd highest salary
select * from Emplyoee where salary =(
select max(salary) from Emplyoee where salary<
(
select max(salary) from Emplyoee where Salary<
(
select max(salary) from Emplyoee
)
))

-- emp who get less than avg salary of sales dept
select* from Emplyoee
select* from Emplyoee where salary<(
select avg(salary) from Emplyoee where Deptid = (
select deptid from Dept1 where Deptname = 'sales'))

-- select the emp whose country is same as emp id 3
select * from Emplyoee where country = (
select country from Emplyoee  where Empid =3)

-- display emp who get the more salary than emp id 11
select * from Emplyoee where salary >(
select salary from Emplyoee where Empid =11)

-- display avg salary of all depts
select avg(salary ) from Emplyoee group by Deptid
select empdept,avg(salary ) from Emplyoee group by EmpDept

-- find the emp who has less salary than the avg salary of that dept
select * from Emplyoee where salary < all(
select avg(salary) from Emplyoee group by Deptid)

-- find the emp who has greater salary than the avg salary of that dept
select * from Emplyoee where salary > all(
select avg(salary) from Emplyoee group by Deptid)




