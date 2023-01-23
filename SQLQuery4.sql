create table Customer
(
CustomerId int primary key identity(1,1),
CustomerName varchar(40)
)
select* from Customer
insert into Customer values('Ashu')
insert into Customer values('Poonam')
insert into Customer values('Mona')
insert into Customer values('Ritika')

select * from emp
select * from dept

select depid,count(id) from emp group by depid
select d.deptname ,count(e.id) as 'count' from emp e
inner join dept d on d.deptid = e.depid  
where d.position  = 'developer' group by d.deptname

--select salary ,Count(id) from emp group by salary having avg(salary)<salary

select * from CustomerInfo


select Country , count(CustId) from CustomerInfo 
where Country in( 'india' ,'USA')
group by Country
order by count(CustId)



