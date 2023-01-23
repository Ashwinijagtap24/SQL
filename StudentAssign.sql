create table Students
(
sid int primary key,
SName varchar(50),
City varchar(50)
)
insert into Students values(1,'Ram','Pune')
insert into Students values(2,'Sham','Mumbai')
insert into Students values(3,'Sita','Pune')
insert into Students values(4,'Gita','Nashik')
select * from students
create table Subject
(
Subid int primary key,
Subname varchar(50),
MaxMarks int,
Passing int
)
insert into Subject values(1,'Maths',100,40)
insert into Subject values(2,'English',100,40)
insert into Subject values(3,'Marathi',50,15)
insert into Subject values(4,'Hindi',50,15)

Select * from Subject
create table Exam 
(
sid int ,
Subid int,
Marks int
)
alter table exam add foreign key (sid) references Students(sid) 
alter table exam add foreign key(Subid) references Subject(Subid)
insert into Exam values(1,1,100)
insert into Exam values(1,2,85)
insert into Exam values(1,3,40)
insert into Exam values(1,4,45)
insert into Exam values(2,1,35)
insert into Exam values(2,2,55)
insert into Exam values(2,3,25)
insert into Exam values(3,1,95)
insert into Exam values(3,2,87)
insert into Exam values(3,3,45)
insert into Exam values(3,4,42)
select * from Exam

--Q1-insert a new student (sid =5 ,name =ramesh,city =hydrabad) into the student table
select * from Students
select * from Subject
select* from Exam
insert into Students values(5,'Ramesh','Hyderabad')

--Q2-change city of sid = 4 (gita) to sangali
update Students set City ='Sangali' where sid=4
select * from Students

--Q3-Return list Containing coloumn sid ,name,Subname,Marks,MaxMarks,percentage
select * from Students
select * from Subject
select* from Exam

select s1.sid,s1.sname,s2.Subname,e.Marks ,s2.MaxMarks,s2.Passing
from Students s1 inner join Exam e on s1.sid = e.sid
inner join Subject  s2 on e.Subid = s2.Subid


--Q4-Return list Containing coloumn sid ,name,Subname,Marks,MaxMarks,
--pass(p) if student has passed ,F - if student has fail
select s1.sid,s1.sname,s2.Subname,
e.Marks,case when e.Marks>=40  then 'Pass' when e.Marks>=15 then 'Pass' else 'Fail'end,
s2.MaxMarks,s2.Passing
from Students s1 inner join Exam e on s1.sid = e.sid
inner join Subject  s2 on e.Subid = s2.Subid

--Q5-return list Containing column sid,sname ,subname,of student who were absent for exam
select * from Students
select * from Subject
select* from Exam
select s.sid,s.SName ,s1.Subname from 
Students s inner join exam e on s.sid=e.sid
inner join  subject s1 on s1.Subid = e.Subid
where s1.subid not in( select s1.Subname  from subject )

select s.sid,s.sname,sb.Subname from Students s inner join Exam e on s.sid = e.sid
inner join Subject  sb on e.Subid = sb.Subid 


--Q6-return list of all student with column sid name and city
select * from students

--Q7- return Subject list with name of just the student who came first in that subject along with his/her marks.
--marks,subid subname ,name marks,maxmarks

select sb.Subname,s.SName,e.marks from students s inner join exam e on s.sid = e.sid
inner join Subject sb on e.Subid= sb.Subid where e.Marks=(select MAx(marks) from exam where 
exam.Subid=sb.subid)

--Q8-return subject list with count of student who attempted the exam and count of
-- student who passed the  exam - subid,subname,attempt count,passcount

select count(sb.sid) as ' student attempted',s.Subname from Subject s inner join exam e on s.Subid=e.Subid
inner join students sb on sb.Sid = e.Subid group by Subname


--Q9-return total percentage of student with column studid,name,total marks,total max marks
--and percentage

select * from Students
select * from Subject
select* from Exam

select s.SName,sum(e.Marks) as obtaintotalmarks,sum(sb.MaxMarks) as totalmarks ,
sum(e.Marks)*100/sum(sb.MaxMarks) as'Percentage' ,
count(s.sid)
from  Students s inner join exam e on s.sid =e.sid
inner join subject sb on sb.Subid =e.Subid 
group by s.sname

 --Q10-
 select distinct s.sname,e.Marks, sb.Subname from Students s inner join exam e on s.sid=e.sid
 inner join Subject sb on sb.Subid=e.Subid 
where sb.Subname in(select distinct subname from subject)
group by sb.Subname

select s.sname,sb.Subname from students s,subject sb
group by sb.Subname