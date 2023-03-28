create database task7
use task7
create table student (studentid int primary key,studentname varchar(25),department varchar(20),score decimal(5,2))
INSERT INTO student VALUES
(1, 'Srikanth', 'CS', 85),
(2, 'Darshan', 'CS', 92),
(3, 'Dhana Prakash', 'CS', 78),
(4, 'SelvaGanapathy', 'IT', 89),
(5, 'Arun Joseph', 'CT', 81),
(6, 'Venkitraman', 'MBA', 87),
(7, 'Harita', 'CS', 91),
(8, 'Harishmitha', 'BCA', 80),
(9, 'Vignesh', 'MBA', 83),
(10, 'Yamini', 'BCA', 90),
(11, 'Ranita', 'BCA', 88),
(12, 'Karthikeyan', 'CS', 84),
(13, 'Divya Prakash', 'BCA', 79),
(14, 'Siva Bharath', 'BCOM', 92),
(15, 'Sharon', 'IT', 86),
(16, 'Hari', 'BCA', 82),
(17, 'Vasanth', 'CT', 90),
(18, 'Vikram', 'CS', 75),
(19, 'Hemanth', 'IT', 89),
(20, 'Harshan', 'BCA', 91),
(21, 'Sam', 'BCOM', 93),
(22, 'Raja', 'CS', 87),
(23, 'Veeraraghavan', 'MBA', 77),
(24, 'Dr Strange', 'MBBS', 88),
(25, 'IRONMAN', 'BE', 80);

--1. Create a non-clustered index for department.
create index dept on student (department)

--2. Create a filtered index for department='BCA'
create index BCA on student(department) where department='BCA'

--3. Create a view for students in BCA department.
create view bca_dept as 
select * from student where department='BCA'

select * from student

--4. Apply Rank() for all the students based on score.
select *, rank() over(order by score desc) rank from student

--5. Apply Dense_Rank() for students in each department based on score.
select *, dense_rank() over(order by score desc) rank from student


--b. Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).
create table manager(id int primary key,name varchar(25)unique)
insert into manager values (1002,'Srikanth'),(1003,'Selva'),(1004,'Dhana')

--creating the 2nd table employee
create table employee(eid int primary key,ename varchar(25),mid int references manager(id),department varchar(10))
insert into employee values(2001,'Arun',1001,'React'),(2002,'harita',1002,'Angular'),(2003,'Ranita',1004,'.NET')
insert into employee values (2004,'Venkit',1003,'java')



--1. Create a complex view by retrieving the records from Manager and Employee table.
alter view manemp as
select employee.eid as employee_id,employee.ename,employee.mid as manager_id,manager.name, employee.department 
from employee 
full join
manager on
manager.id=employee.mid

select * from manemp
select * from manager
select * from employee

--2. Show the working of 'on delete cascade on update set default' for the above tables

--setting a default value for the child table column
alter table employee add constraint default_const default '1001' for mid 



--setting the on delete and on update functionality for the parent table
alter table employee add foreign key(mid) references manager(id) on update set default on delete cascade


--deleting a record from the parent table
delete from manager where id='1002'
insert into employee values(2004,'srikanth',1005,'Angular')
update manager set id=1007 where id=1005

