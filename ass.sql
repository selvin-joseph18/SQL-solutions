    
create table author (AUTHOR_ID	varchar(20),AUTHOR_NAME	varchar(20),AUTHOR_COUNTRY	varchar(20),AUTHOR_CITY	varchar(20),PUBLISH_ID varchar(20));
create table publisher(PUBLISH_ID varchar(20),PUBLISH_NAME varchar(40),PUBLISH_CITY varchar(20),PUBLISH_START_DATE date,BRANCHES integer);
truncate table author;
select * from author;
insert into author values('AUT001','William Norton','UK','Cambridge','PB01');
insert into author values('AUT002','C.J.Wilde','USA','San Francisco','PB04');
insert into author values('AUT003','John Betjeman Hunter','RUSSIA','Moscow','PB01');
insert into author values('AUT004','John Betjeman Hunter','CANADA','Toronto','PB03');
insert into author values('AUT005','S.B.Swaminathan','INDIA','Delhi','PB01');
insert into author values('AUT006','Butler Andre  ','UK','London','PB03');
insert into author values('AUT007','E.Howard ','EUROPE','Berlin','PB03');
insert into author values('AUT008','Andrew Jeff','GERMANY','Berlin','PB02');
insert into author values('AUT009','Drek Tailor','Australia','Melbourne','PB01');
insert into author values('AUT010','Mary Coffing','USA','New Jersy','PB04');
insert into publisher values('PB01','Jex Max Publication','Berlin',str_to_date('4/21/1929','%m/%d/%Y'),10);
insert into publisher values('PB02','Summer Night Publication','Canada',str_to_date('8/31/2019','%m/%d/%Y'),25);
insert into publisher values('PB03','Novel Publisher Ltd. ','London',str_to_date('8/10/2018','%m/%d/%Y'),11);
insert into publisher values('PB04','Mark Book Sales','New Jersy',str_to_date('5/24/2008','%m/%d/%Y'),9);

select p.publish_name,p.publish_city,a.author_city from publisher p join author a 
on p.publish_id = a.publish_id 
where p.publish_city!=a.author_city AND   
p.publish_city = a.author_country;

    select a.*,publish_name, publish_city, publish_start_date  from  author a inner join 
 (select p.publish_name,p.publish_city,
p.publish_start_date,a.author_country 
from publisher p join author a 
on p.publish_city=a.author_city and a.publish_id=p.publish_id)d on a.author_country=d.author_country ;
1)
select p.publish_name,p.publish_city,p.publish_start_date,
a.author_city
from publisher p join author a 
on a.publish_id=p.publish_id
where p.publish_city!=a.author_city 
and a.author_country=p.publish_city;
 5 )select a.author_name,a.author_country,
p.publish_name,p.publish_city from author a 
join publisher p on a.publish_id=p.publish_id
where a.author_city!=p.publish_city;

6) select a.author_name,p.publish_name from author a join publisher p on substring(a.author_name,1,1)=
substring(p.publish_name,1,1);

select * from author where lower(author_country)= author_country ;



select * from author where (ascii(left(author_country),1)  between 65 and 90);

select * from author
where SUBSTRING(author_country,2,1)!=lower(SUBSTRING(author_country,2,1));

SELECT * FROM author
WHERE UPPER(author_country) != author_country;

SELECT *
FROM author
WHERE author_country like '_[abcdefghijklmnopqrstuvwxyz]%';



11)select author_country,count(author_country) as total from author
group by author_country;

8)select author_name from author where author_name  
not like '_.%'
7)select author_name from author where author_name  
 like '_._.%'

select author_country from author where author_country like '[A-Z]__[a-z]%' ;

3) select * from author a join publisher p on p.publish_id=a.publish_id where author_country in 
(select  a.author_country 
from publisher p join author a 
on p.publish_city=a.author_city and a.publish_id=p.publish_id)
10)
select * from 
(select  a.author_id,a.author_name,a.author_country,a.author_city,a.publish_id,
 p.publish_name, p.publish_city, p.publish_start_date, p.branches,
dense_rank() over(order by PUBLISH_START_DATE desc) as max
from author a join publisher p 
on p.publish_id=a.publish_id)d
 where max=1;


