create database insurance030;
USE insurance030;
create table PERSON( driver_id char(10), Name char(20), address char(20), primary key(driver_id));
desc PERSON;

CREATE table CAR( Regno varchar(20), model varchar(20),  year int, primary key(Regno));
create table ACCIDENT( report_number int, date date, location varchar(20), primary key(report_number));
create table OWNS(driver_id char(10), Regno varchar(20), primary key(Regno),
foreign key(driver_id) references PERSON(driver_id),
foreign key(Regno) references CAR(Regno)
);
desc OWNS;
create table PARTICIPATED( driver_id varchar(20), Regno varchar(20), report_number int, damage_amount int);
alter table PARTICIPATED add primary key(report_number);
alter table PARTICIPATED add foreign key(report_number) references ACCIDENT(report_number);
alter table PARTICIPATED add foreign key(driver_id) references PERSON(driver_id);
alter table PARTICIPATED add foreign key(Regno) references CAR(Regno);
desc PARTICIPATED;
ALTER TABLE OWNS drop foreign key owns_ibfk_2;
alter table OWNS drop primary key;
ALTER table OWNS ADD primary key(driver_id, Regno);

insert into PERSON( driver_id, Name, address) values
('100', 'BGY', 'BANGLORE'),
('101' , 'AMAY', 'BANGLORE'), 
('103', 'APPU', 'BANGLORE');
SELECT * from PERSON;
insert into CAR (Regno, model, year) values
('KA01AB3245', 'URUS', 2020), 
('KA01BD7353', 'FORTUNER', 2021),
("KA04CD5345", "CRETA", 2016);
select * from CAR;
insert INTO ACCIDENT(report_number, date, location) values 
(0021, '20201230', 'BANGLORE'),
(0043, '20210523', 'BANGLORE'),
(0067, '20210610', 'MYSORE'),
(0075, '20200919', 'MANGLORE'),
(0089, '20210228', 'SHIMOGA');
select * FROM ACCIDENT;
INSERT INTO OWNS(driver_id, Regno) values 
( '100', 'KA01AB3245' ), 
( '101', 'KA01BD7353' ), 
( '103',"KA04CD5345" );
select * from OWNS;
drop table PARTICIPATED;
create table PARTICIPATED( driver_id varchar(20), Regno varchar(20), report_number int, damage_amount int);
alter table PARTICIPATED add primary key(driver_id, Regno, report_number);
alter table PARTICIPATED add foreign key(report_number) references ACCIDENT(report_number);
alter table PARTICIPATED add foreign key(driver_id) references PERSON(driver_id);
alter table PARTICIPATED add foreign key(Regno) references CAR(Regno);
desc PARTICIPATED;
insert into PARTICIPATED(driver_id, Regno, report_number, damage_amount) values('100','KA01AB3245',0075, 11000);
insert into PARTICIPATED(driver_id, Regno, report_number, damage_amount) values
( '101', 'KA01BD7353', 0021, 20000), 
( '103',"KA04CD5345", 0043, 15000),
( '103',"KA04CD5345", 0089, 25000);
SELECT * FROM PARTICIPATED;
COMMIT;

 
