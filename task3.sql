--creating database
create database task3

--using the database
use task3

--creating the parent table department
create table department(deptid int primary key,deptname varchar(15) unique)

--inserting into department table
insert into department values(100,'Developer'),(101,'UI/UX')

--creating the address table
create table address(addressid int primary key,
city varchar(20) unique,
state varchar(30) unique,
pincode bigint unique)

--inserting values into address tables
insert into address values(1,
'Mannford','Oklahoma',74044)

insert into address values(2,'SIDNEY','Ohio',45365)
 select * from address

--creating the child table employee
create table employee(id int primary key,
name varchar(25) unique,
deptid int references department(deptid),
deptname varchar(15),
mobile1 decimal unique,
mobile2 decimal default 04224310477,
street_address varchar(30),
addressid int references address(addressid))

--altering the table
alter table employee add  Designation varchar(30) not null

select * from employee
select * from address
select * from department

alter table employee drop column deptname

--inserting into table employee
insert into employee values(1,'John',100,9952410021,9895874423,'234 HINTON Rd',1,'DEVELOPER')
insert into employee values(2,'JAMIE',101,7895674537,9789434423,'214 Doorley Rd',2,'DESIGNER')
insert into employee values(3,'JACK',100,5647467564,944239253,'236 Hinton Rd',1,'Developer')


update department set deptid=103 where deptid=100

