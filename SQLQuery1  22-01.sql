create table StudCrud
(
Studid int,
Sname varchar(100),
Sstream varchar(100),
SPercentage int,
Sage int,
Sgender varchar(50)
)
select* from StudCrud
select* from StudentCrud
--drop table StudCrud
create table Book
(
Bookid int primary key identity(1,1),
Bookname varchar(100),
Price int,
Author varchar(100),
Edition varchar(100),
Publication int 
)
select * from Book