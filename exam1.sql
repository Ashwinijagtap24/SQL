select* from Emplyoee
select * from Dept1

select* from book
select*from author
select* from Award
select* from Awards
--find out authorname who got national awards
select a.authorname,awar.Awardname 
from author a inner join award aw on a.Authorid =aw.Authorid 
inner join Awards awar on aw.Awardtypeid = awar.Awardtypeid 
where Awardname = 'National Book'

--delete author who got national awards
delete from author where Authorid in
( 
select a.authorname,awar.Awardname 
from author a inner join award aw on a.Authorid =aw.Authorid 
inner join Awards awar on aw.Awardtypeid = awar.Awardtypeid 
where Awardname = 'National Book'
)

select authorname from author where Authorid in(
select authorid from Awards where Awardname = 'national book'
)

select 




