create table Book
(
Bookid int primary Key,
Bookname varchar(20) Not null,
Authorid int ,
Price numeric(5,2),
Published  Date
)
alter table Book
Add constraint Fk_Auhtorid
Foreign key(Authorid) References Author( Authorid)
select* from Book
insert into Book values(101,'A Better India' ,7, 150,'2019-02-16')
insert into Book values(102,'The India Story' ,1, 100,'2018-10-21')
insert into Book values(103,'Business of sport' ,2, 490,'2020-06-06')
insert into Book values(104,'Decoding Indian',3, 100,'2021-12-17')
insert into Book values(105,'The Maverick effect' ,5, 560.00,'2021-12-17')
insert into Book values(106,'Diary of Ann Frank',6,90.56,'2020-01-24')
insert into Book values(107,'Two State',4,550.00,'2020-11-25')
insert into Book values(108,'Jungle Book',6,990.19,'2022-12-08')
insert into Book values(109,'IF',6,200.20,'2021-09-13')
insert into Book values(110,'The Dairy',9,150,'2020-06-1')
insert into Book values(111,'India Postive',4,100,'2020-09-11')
insert into Book values(112,'Dairy of Ann Frank',6,90.56,'2022-02-03')

create table Author 
(
Authorid int Primary key,
Authorname varchar(20) Not null,
PHno int,
Email  varchar(20),
Address1 varchar(20),
City  varchar(20)
)

select * from Author
insert  into Author values(1,'Bimal jalal', 969696,'bimal@gamail.com','tilak raod ','Pune')
insert into Author values(2,'Vinit karnik',5678978,'vinit@gmail.com','Andheri nagri','Mumbai')
insert into Author values(3,'Ashwini Shrivastav',963547,'ashwini@gmail.com','Sadashiv peth','Pune')
insert into Author values(4,'Mr.Chetan Bhagat',7979797,'Chetan@gmail.com','street no 2','Mumbai')
insert into Author values(5,'Harish mehata',75862410,'harish@gmail.Com','Vadgaon bk','Pune')
insert into Author values(6,'Rudyard kiplling',8754496,'kips@gmail.com','Dharavi nagar','Mumbai')
insert into Author values (7,'Narayan murthy',9645125,'narayan@gmail.Com','Manikbag ','Mumbai')
insert into Author values(8,'Vymokesh Bakshi',8328587,'bakshi@gmail.com','Ulasnagar','Mumbai')
insert into Author values(9,'Deshpande', 7485879,'anne@gmail.com','Manpada ','Thane')
insert into Author values(10,'Asha joshi',8563479,'asha@gmail.com','Laxmi raod ','Nagpur')


Create table Award
(
Awardid  int primary key,
Awardtypeid int ,
Authorid  int,
Bookid int,
Years int
)
select* from Award
insert  into Award values(301,202,3,104,2022)
insert  into Award values(302,201,1,102,2020)
insert  into Award values(303,203,2,102,2021)
insert  into Award values(304,204,4,107,2021)
insert  into Award values(305,205,4,111,2021)
insert  into Award values(306,201,5,105,2022)
insert  into Award values(307,202,6,112,2021)
insert  into Award values(308,203,7,101,2020)
insert  into Award values(309,204,6,109,2022)
insert  into Award values(310,205,9,110,2020)
insert  into Award values(311,202,6,106,2020)


alter table Award 
add constraint fk_Awardtypeid
foreign key(Awardtypeid)  references Awards(Awardtypeid)

create table Awards
(
Awardtypeid int primary key ,
Awardname varchar(20),
Awardprice int
)
select * from Awards
insert into Awards values(201,'Booker Prize',6000)
insert into Awards values(202,'National Book',5000)
insert into Awards values(203,'Costa Book',2000)
insert into Awards values(204,'Edgar Awards',9000)
insert into Awards values(205,'Hugo Awards',6000)

--1.Write a query to show book name , author name and award name for all books which has received any award.
select * from book
select* from author
select* from Award
select* from Awards
select  b.bookname ,a.authorname, aw.awardname
from book b inner join author a on  a.Authorid = b.Authorid
inner join award a1  on a1.Authorid = a.Authorid
inner join awards aw  on aw.Awardtypeid = a1.Awardtypeid
group by b.Bookname,a.Authorname,aw.Awardname

--2.	Write a query to update author name of authors whose book price is > 100. Prefix author name with ‘Honourable’ /Hon.
select * from book
select* from author
select* from Award
select* from Awards

select CONCAT(authorname,'-','hon') as 'author name'
from Author where Authorid in (select Authorid from book  where price>100)
select * from Author

--3.	Write a query to display authors and number of books written by that author.
--Show author who has written maximum books at the top.
select * from book
select* from author
select* from Award
select* from Awards

select authorid,count( authorid)as'count book' from Book group by authorid order by desc )

select Authorname,count (bookid) as'totalcount' 
from book b inner join author a on a.Authorid = b.Authorid
group by Authorname
order by count(bookid) desc


select * from book


--4.	Write a query to select book name with 5 th highest price.
select * from book 
order by price desc
offset 4 rows 
fetch next 1 rows only 

--5.	Select list of books which have same price as book ‘Diary of Ann Frank’.
select * from book
select* from book where price =
(select price from  book where Bookname='Diary of Ann Frank')

--6.	Increase price of all books written by Mr. Chetan Bhagat by 5%.
select * from book
select * from Author
update book set price = price+(price*0.05)
where Authorid =(select authorid from author where Authorname ='Mr.Chetan Bhagat'  )
select* from book

--7.	Show award names and number of books which got these awards. 
select * from book
select * from Author
select * from Award
select * from Awards

select awardname, count(b.Bookid) from book b inner join Award a on b.Bookid = a.Bookid
inner join Awards aw on aw.Awardtypeid = a.Awardtypeid
group by Awardname

--8.	Delete all books written by ‘Chetan Bhagat’ 
select * from book
select * from Author
select * from Award
select * from Awards

 delete from book where Authorid in
 (select Authorid from author where Authorname= 'Mr.Chetan Bhagat')


--9.	Create view to show name of book and year when it has received award. 
select * from book
select * from Author
select * from Award
select * from Awards
create view Vbook
as
select bookname,a.years from book b inner join award a on b.Bookid = a.Bookid
select * from Vbook

--10.	Create trigger to ensure min price of any book must be Rs. 100. 

--11.	Increase price of book by 10% if that book has received any award.
update  book set price = price+(price*0.10) from Book b inner join award a
on a.Bookid = b.Bookid
--12.	Show names of author and number of books written by that Author.
select * from book
select * from Author
select * from Award
select * from Awards

select * from book
select * from Author
select Authorname, count(b.bookid) from Author a inner join book b
on a.Authorid = b.Authorid
group by Authorname

--13.	Show names of authors whose books are published before year 2020.
select * from book
select * from Author
select * from Award
select * from Awards

select a.authorname, b.published 
from author a inner join book b on a.Authorid = b.Authorid 
where Published <'2020'


--14.	Show name of books which has published within 1 year after 15 August 2020.
select bookname,published from book where published  between '2020-8-15' And '2021-8-15'
--15.	Delete all authors whose no book is published in year 2020
select * from book
select * from Author
select * from Award
select * from Awards

delete from Author where Authorid in(
select authorid from book where year(cast(published as date))
not in (year(cast('2020' as date)))
)




