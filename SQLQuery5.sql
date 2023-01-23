Select * from Custome
select* from emp
select * from dept

select avg(salary) from emp 
group by position

select name from emp where salary >
(
select salary from emp where  id=3 
)

select name from emp where id =
(
select id from
)

select* from product

create table Prod
(
Id int ,
Name varchar(20),
Sp varchar(50),
)
select * from Prod
insert into Prod values(1,'Ashu',5000)
insert into Prod values(2,'Poonam',500)
insert into Prod values(3,'Nikhil',2000)
insert into Prod values(4,'Ritika',1000)
insert into Prod values(5,'Ashwini',6000)
insert into Prod values(6,'Mona',300)


create table Order1
(
oId int ,
oName varchar(20),
Price varchar(50),
)
select * from Order1
insert into Order1 select Id,Name,Sp from Prod where Id in
(select Id from product where Sp>1000)

--update
update Prod set Sp=Sp+(Sp *0.20)
where oPrice = 
(select oid from Order1 where oName ='Nikhil')

delete from Prod where oid
()
