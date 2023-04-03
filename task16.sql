create database task16
use task16
--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.
create table weekdaytable(id int,name varchar(30))
alter trigger dmlrevoke on weekdaytable
for
insert ,update,delete
as begin
if datepart(dw,getdate())=7 or datepart(dw,getdate())=1
begin
print 'Weekends are for enjoying,not for DML Operations'
rollback tran
end
end


--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
create trigger 
delrevoke
on weekdaytable
for
delete
as begin
if datepart(hh,getdate())>11 and datepart(dw,getdate())<15
begin
print 'No deletions during 11:00-15:00pm'
rollback tran
end
end

delete from weekdaytable where id=1

--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed
alter trigger ddlrevoke on database
after
create_table,alter_table,drop_table,rename
as begin
print 'You have performed one of the ddl operations'
end

create table tablename(id int)

