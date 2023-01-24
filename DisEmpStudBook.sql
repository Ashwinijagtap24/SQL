create table DisEmployee
(
Id int primary key identity(1,1),
Name varchar(100),
DeptName varchar(100),
Salary int,
Age int
)
select * from DisEmployee
create table DisStudent
(
Id int primary key identity(1,1),
Name varchar(100),
Stream varchar(100),
Percentage int,
Age int,
Gender varchar(50)
)
create table DisBook
(
Id int primary key identity(1,1),
Name varchar(100),
Price int,
Author varchar(100),
edition varchar(100),
Publication int
)
