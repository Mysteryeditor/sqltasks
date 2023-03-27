create database task9
use task9

create table studentdetails (studentid int primary key,studentname varchar(20),semester varchar(5),secured_marks decimal(10,4),total_marks decimal(10,4))

--inserting values
insert into studentdetails values(1,'Srikanth','sem1',490,500),
(2,'Darshan','sem1',489,500),
(3,'Dhana','sem1',450,500),
(4,'Selva','sem2',430,500),
(5,'arun','sem3',460,500),
(6,'jose','sem3',499,500)


--1.creating a stored procedure using conditional statements to search for a record from the students table (created in SQL task8) based on the student name column
create procedure sp_search(@name varchar(20))
as 
begin
if((select studentname from studentdetails where studentname=@name)=@name)
print 'The student name '+@name+'is valid.'
else 
print 'Invalid student name'
end

sp_search 'joseph'

--2.Write a stored procedure in sql to give remarks for the secured marks column in the student table using case statement
create procedure sp_remarks
as 
begin 
select 
studentid ,studentname,semester ,secured_marks ,total_marks,
case
when secured_marks>450 then 'Distinction'
when secured_marks>400 then 'First Class'
when secured_marks>350 then 'Second Class'
else 'third class'
end as remarks
from studentdetails
end

exec sp_remarks

--3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)

--local table variable
declare @a int 
declare @b int 
set @a=10 
set @b=5

select(@a/@b) as local_table_variable

--global table variable
declare @@x float
set @@x=2
declare @@square float
set @@square=Square(2)

select @@square as square

--temporary table
create table ##temptable1 (studentid int primary key,studentname varchar(20),semester varchar(5),secured_marks decimal(10,4),total_marks decimal(10,4))

insert into ##temptable1 
select studentid,studentname,semester,secured_marks,total_marks
from studentdetails
where studentid>3

select * from ##temptable1



--temporary stored procedure
create procedure ##sp_tempsp 
as
begin
select * from ##temptable1 where secured_marks>430
end