create database task8
use task8

--creating a table
create table studentdetails (studentid int primary key,studentname varchar(20),semester varchar(5),secured_marks decimal(10,4),total_marks decimal(10,4))

--inserting values
insert into studentdetails values(1,'Srikanth','sem1',490,500),
(2,'Darshan','sem1',489,500),
(3,'Dhana','sem1',450,500),
(4,'Selva','sem2',430,500),
(5,'arun','sem3',460,500),
(6,'jose','sem3',499,500)

--1. Create User-define Scalar function to calculate percentage of all students after creating the following table.
alter function fn_total_percent(@sm decimal(5,2))
returns decimal(5,2)
as 
begin
return (@sm/500)*100 
end

select studentid,studentname,semester,secured_marks,total_marks,dbo.fn_total_percent(secured_marks) as percentage from studentdetails


--2.Create user-defined function to generate a table that contains result of Sem 3 students.
alter function fn_sem3()
returns table
as
return(select * from studentdetails where semester='sem3')

select * from dbo.fn_sem3()

--3.Write SQL stored procedure to retrieve all students details. (No parameters)
create procedure sp_studentdetails
as
begin
select * from studentdetails
end

exec sp_studentdetails

--4.Write SQL store procedure to display Sem 1 students details. (One parameter)
create procedure sp_sem1(@sem varchar(10))
as begin
select * from studentdetails where semester=@sem
end

exec sp_sem1 @sem='sem1'

--5.Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create procedure sp_studentcount(@a int output)
as begin
select @a= count(studentid) from studentdetails
end

declare @Total int

exec sp_studentcount @Total output

print ('The no:of students:'+convert(varchar(5),@Total))

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.

--creating the new table
create table sem1backup (id int ,studentname varchar(20),semester varchar(5),secured_marks decimal(10,4),total_marks decimal(10,4))

merge sem1backup as sem1
using studentdetails sd
on(sd.studentid=sem1.id)
when matched 
then update set
sem1.id=sd.studentid,
sem1.studentname=sd.studentname,
sem1.secured_marks=sd.secured_marks,
sem1.total_marks=sd.total_marks

when not matched by target and sd.semester='sem1'
then insert (id,studentname,semester,secured_marks,total_marks)
values(sd.studentid,sd.studentname,sd.semester,sd.secured_marks,sd.total_marks)

when not matched by source then
delete;

select * from sem1backup

--updating the actual values
update studentdetails set secured_marks=451 where studentid=3