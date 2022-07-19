create database airline030;
use airline030;

create table aircraft(
		aid int,
        aname varchar(30),
        cruisingrange int,
        primary key(aid));

create table flights(
		flno int,
        ffrom varchar(30),
        fto varchar(30),
        distace int,
        departs timestamp default '2022-07-12 12:03:45',
        arrives timestamp default '2022-07-12 12:03:45',
        price real,
        aid int,
        primary key(flno),
        foreign key(aid) references aircraft(aid));
        
create table employee(
		eid int,
        ename varchar(30),
        salary int,
        primary key(eid));
        
create table certified(
		eid int,
        aid int,
        primary key(eid, aid),
        foreign key(eid) references employee(eid),
        foreign key(aid) references aircraft(aid));
        
insert into aircraft values
		(101,'Boeing 747',3000),
        (102,'IndiGo',900),
        (103,'Emirates Airlines',8000),
        (104,'Dreamliner',10000),
        (105,'Quatar Airways',3500),
        (106,'Vistara',1500),
        (107,'SpiceJet', 12000);

insert into flights values
		(14321,'Bangalore','Delhi',2500,'2005-05-13 07:15:31','2005-05-13 17:15:31',5000,101),
        (16432,'Bangalore','Lucknow',3000,'2005-05-13 07:15:31','2005-05-13 11:15:31',6000,106),
        (16633,'Lucknow','Delhi',500,'2005-05-13 12:15:31',' 2005-05-13 17:15:31',3000,107),
		(17587,'Bangalore','Frankfurt',8000,'2005-05-13 07:15:31','2005-05-13 22:15:31',60000,103),
        (17864,'Bangalore','Frankfurt',8500,'2005-05-13 07:15:31','2005-05-13 23:15:31',75000,105),
        (19765,'Kolkata','Delhi',3400,'2005-05-13 07:15:31','2005-05-13 09:15:31',7000,102);
        
insert into employee values
		(701,'A',50000),
        (702,'B',100000),
        (703,'C',150000),
        (704,'D',90000),
        (705,'E',40000),
        (706,'F',60000),
        (707,'G',90000);
        
insert into certified values
		(701,101),(701,102),(701,106),(701,105),
        (702,104),(703,104),(704,104),(702,107),
        (703,107),(704,107),(702,101),(703,105),
        (704,105),(705,103);
        
-- Q1
select distinct aname
from  aircraft a, employee e, certified c
where e.eid = c.eid AND e.salary > 80000 AND a.aid = c.aid;

-- Q2
select c.eid, MAX(a.cruisingrange)
from aircraft a, certified c
where  c.eid IN (select eid
				from certified
                group by(eid)
                having count(eid) > 3);
                
-- Q3

select e.ename
from employee e
where e.salary < (select min(price)
				  from flights
				  where ffrom = 'Bangalore' AND fto = 'Frankfurt');


        
