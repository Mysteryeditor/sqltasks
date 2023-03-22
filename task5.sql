create database task5
use task5
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

--1. Write an SQL query to get the count of employees in each department.
select department,count(department) as 'no:ofemployees' from Trainees group by(department) 

--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
select  TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT,dateadd(day,5,JOINING_DATE) as 'Induction Program Day' from trainees

--3. Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
select choose(month(joining_date),'January','February','March','April') as month from trainees 

--4. Write an SQL query to perform the total and subtotal of salary in each department.
select coalesce(department,'all departments') as Department_Salary,sum(salary) as salary from trainees group by rollup (department)

--5.Write an SQL query to retrieve first 3 records randomly.
select top 3 * from Trainees order by NEWID()

--6.Show the working of composite key with any example

--creating a table with a composite key
create table students(id int ,name varchar(20) primary key(id,name))

--inserting the values
insert into students values(1,'sk')
insert into students values(2,'PD')




--7.Show the working of IIF and CASE for the above table.
select FIRST_NAME,iif(SALARY>100000,'rich guy','poor guy') as social_status from Trainees 

--case working
select FIRST_NAME,case
when salary>80000 then 'rich guy'
else 'poor guy'
end as social_status
from Trainees

--8.Show the working of Sequence.
create table cars(id int,model varchar(25))
insert into cars values(next value for cars_id,'GTR')

create sequence cars_id
as int
start with 1
increment by 1
maxvalue 10

select * from cars
--9.Show the working of creation of Synonym for a table in DB1 from DB2.

create synonym ts for trainees

create synonym work for task4.dbo.worker

use task4
create synonym trainer for task5.cars
--10.Show the working of IDENTITY_INSERT.
create table bikes(id int identity(1,1),model varchar(25))

--inserting values

insert into bikes(model) values('kawasaki_ninja')

insert into bikes(model) values('Ktm duke 290')

--turning off the identity
set identity_insert bikes on

--inserting values
insert into bikes(id,model) values(3,'Pulsar Ns 200')

select * from bikes

--reverting to identity
set identity_insert bikes off

--inserting values
insert into bikes(model) values('Ktm duke 290')