create table product
(
Pid int primary key identity(1,1),
Pname varchar(100),
Price int,
CompanyName varchar(100)
)
drop table product
select * from product