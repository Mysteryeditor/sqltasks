create database task14

--a. Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
create table hobbies(HobbyID int primary key,HobbyName varchar(25) unique)

--creating a table for errors
create table errorbackup(err_number int,err_line int,err_msg varchar(max),level int,state int,time datetime)

--1. insert records into the table using a stored procedure.
alter procedure sp_insert (@id int,@hname varchar(25))
as
begin
begin try
set nocount on
insert into hobbies values(@id,@hname)
end try
begin catch
insert into errorbackup values(ERROR_NUMBER(),error_line(),ERROR_message(),ERROR_SEVERITY(),ERROR_STATE(),getdate())
print 'The hobby / id already exists'
end catch
end

execute sp_insert 2,'Magic'

select * from errorbackup

--b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.
alter procedure twonum(@num1 int,@num2 int)
as
begin
if(@num1=@num2)
begin
declare @product int
set @product=@num1*@num2
print 'the result is'+convert(varchar,(@product))
end
else 
begin
raiserror('The two numbers should be the same',16,1)
end
end

twonum 2,4


--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
    --Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.
create table friends(id int identity(1,1),
name varchar(20)unique)

drop table friends

alter procedure sp_insert_friends (@name varchar(20))
as
begin
if left(@name,1 ) in ('A','D','H','K','P','R','S','T','V','Y')
begin
insert into friends(name) values(@name)
end
else
begin
throw 696969,'The names should start with A,D,H,K,P,R,S,T,V,Y',1;
end
end

sp_insert_friends 'Bhanu'



select * from friends








