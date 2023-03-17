--creating the database
create database task2

--shifting to database
use sqltask2

--creating the table
create table employeetable
(regno int primary key,
studname varchar(30),
marks int check(marks>65),
course varchar(10) default 'UG',
phnnumber decimal
)

--renaming the table 
exec sp_rename 'employeetable','studenttable'

--inserting values
insert into studenttable values(101,'Srikanth',70,'BCOM',9952410021)

--creating a schema
create schema studentdetails

--tranferring or renaming the student table to the new schema
alter schema studentdetails transfer dbo.studenttable

--renaming the database
exec sp_renamedb 'task2','SQLTASK2'

--creating another table
create table costtocompany(id int identity(1,1),name varchar(25),salary money,increment smallmoney)

--inserting values
insert into costtocompany(name,salary,increment) values('Srikanth',25000,350)
insert into costtocompany(name,salary,increment) values('Darshan',45000,600),('Dhana',20000,500),('Selva',50000,600)

--computed column
alter table costtocompany add grosssalary as (salary+increment)

--select into
select * into
richguys 
from costtocompany
where salary>20000

--displaying tables
select * from richguys