select * from Emplyoee
--substring
select SUBSTRING(Empname,2,5) as name from Emplyoee
-- Concat
select CONCAT(Empname,'->',Email) as 'Name with mail' from Emplyoee
--len
select Empname,len(empname) as emplength from Emplyoee
--Upper
select Upper(empname) as 'upper name', Lower(Country) as 'Lower Country name' from Emplyoee
--trim ,Ltrim,Rtrim
select trim(empname) from Emplyoee
--Revercse
select REVERSE(empname) as tempname from Emplyoee
--round
select Round(salary,1)from Emplyoee

--replce
select Replace('Ashwini','i','z') from Emplyoee 
select Replace('Ashwini','z','i') from Emplyoee
--current timeStamp
select CURRENT_TIMESTAMP
Select cast(CURRENT_TIMESTAMP AS TIME) AS 'TODAY DATE'
SELECT CAST(CURRENT_TIMESTAMP AS DATE) AS'TODAY TIME'

Select cast(CURRENT_TIMESTAMP AS TIME) AS 'TODAY TIME '
SELECT CAST(CURRENT_TIMESTAMP AS DATE) AS'TODAY DATE'

--isnull
select empname,Country from Emplyoee
select Empname,ISNULL(COUNTRY,'NOT-ASSIGNED') AS'COUNTRY' from Emplyoee
select Empname,ISNULL(COUNTRY,'0000') AS'COUNTRY' from Emplyoee
select Empname,ISNULL(COUNTRY,'***') AS'COUNTRY' from Emplyoee
select Empname,ISNULL(COUNTRY,'-') AS'COUNTRY' from Emplyoee

--USER DEFINED 
--SINGLE VALUE /SCALAR 
 
 --perform Addition 
 create function Addition(@a int,@b int)
 returns int
 as begin 
 declare @sum int
 set @sum =@a+@b
 return @sum
 end
 select dbo.Addition(2,2) as'sum'
 --o/p -4


 --get emp name by id 

 create function GetEmpNameById(@id int)
 returns varchar(20)
 as begin 
 return(select Empname from Emplyoee where Empid =@id)
 end
 select* From dbo.GetEmpNameById(1) 

--create function GetEmpNameById(@id int)
--returns varchar(20)
--as begin
--return (select empname from Employee where empid=@id)
--end
 create function GetEmpnameById1(@id int)
 returns varchar(20)
 as begin 
 return(select Empname from Emplyoee where Empid =@id)
 end
 select dbo.GetEmpnameById1(4) as 'empname'


-- get emp details
create function GetEmpDetails(@id int)
returns table
as 
return (select * from Emplyoee where empid=@id)


select * from dbo.GetEmpDetails(2)

-- get emp by idept
create function GetEmpByDept(@id int)
returns table
as 
return (select * from Emplyoee where deptid=@id)

select * from dbo.GetEmpByDept(4)

--salary 15%
select * from Emplyoee
create function Calculation1(@sal int)
returns int
as begin 
declare @NewSal int
set @NewSal = @sal+(@sal *15/100)
return @NewSal
end
select empname,salary ,dbo.Calculation1(Salary) as 'new salary' from Emplyoee


--create stored procedure
create procedure SP_GetAllEmpByDept(@did int)
as begin
select * from Emplyoee where deptid=@did
return
end


--insert stored procedure
create proc SP_InsetEmployee(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@empdept varchar(20),
@sal int,
@managerid int
)
as begin
insert into Emplyoee values(@empid,@empname,@email,@age,@country,@deptid,@empdept,@sal,@managerid)
return
end
select * from Emplyoee

----insert execute ( stored procedure)
exec SP_InsetEmployee
@empid=13,
@empname ='Test1',
@email='test@gmail.com',
@age=22,
@country ='UK',
@deptid =5,
@empdept = 'Hr',
@sal =23000,
@managerid=1

--update Employee(SP)
create proc SP_UpdateEmployee(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@empdept varchar(20),
@sal int,
@managerid int
)
as begin
update Emplyoee set empname=@empname,email=@email,age=@age,country=@country,deptid=@deptid,empdept = @empdept,salary=@sal,managerid=@managerid where empid=@empid
return
End

--update EXECUTE Employee(SP)
exec SP_UpdateEmployee
@empid=13,
@empname ='Uma',
@email='uma@gmail.com',
@age=22,
@country ='UK',
@deptid =5,
@empdept = 'Hr',
@sal =23000,
@managerid=1

select* from Emplyoee



--DELETE Employee(SP)
create proc SP_DeleteEmployee1(
@empid int,
@empname varchar(20),
@email varchar(30),
@age int,
@country varchar(20),
@deptid int,
@empdept varchar(20),
@sal int,
@managerid int
)
as begin
delete  from Emplyoee where empid =@empid
return
end

--DELETE EXECUTE  Employee(SP)
exec SP_DeleteEmployee1
@empid=13,
@empname='Uma',
@email='uma@gmail.com',
@age=22,
@country ='UK',
@deptid =5,
@empdept = 'Hr',
@sal =23000,
@managerid=1
select * from Emplyoee


