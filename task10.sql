create database task10
use task10
Create table employees (EMPLOYEE_ID int primary key, 
FIRST_NAME varchar(25),
LAST_NAME varchar(25),
EMAIL varchar(30),
PHONE_NUMBER bigint,
HIRE_DATE date,
JOB_ID int , 
SALARY money)

insert into employees values(1,'Srikanth','J','sri027.cvb@gmail.com',9952410021,'2023/2/23',1,6000)
insert into employees values(2,'Darshan','M','darshan@gmail.com',8300284731,'2023/2/26',1,8000)
insert into employees values(3,'Dhana','Prakash','dhanaprakashofficial@gmail.com',9983674563,'2023/2/19',1,6000)
insert into employees values(4,'Selva','Ganapathy','selva@gmail.com',9987361271,'2023/2/20',1,6000)
insert into employees values(5,'Arun','Joseph','arunjoseph@gmail.com',9125241031,'2023/2/23',1,8500)
insert into employees values(6,'Harita','N','harita@gmail.com',6385264654,'2023/2/19',2,7000)
insert into employees values(7,'Harishmitha','K','harishmitha@gmail.com',6354354654,'2023/2/17',2,8900)
insert into employees values(8,'Venkit','Raman','venkit@gmail.com',8753567654,'2023/2/17',2,9000)
insert into employees values(9,'Ranita','N','Ranita@gmail.com',7410445675,'2023/2/15',2,9500)
insert into employees values(10,'Harita','N','harita@gmail.com',6385264654,'2023/2/19',2,7000)
insert into employees values(11,'Yamini','Priya','yamini@gmail.com',9876344654,'2023/2/26',3,7000)
insert into employees values(12,'Vignesh','vicky','harita@gmail.com',6385264654,'2023/2/19',3,7000)
insert into employees values(13,'Divya','Prakash','dp@gmail.com',7567456425,'2023/2/14',3,9800)
insert into employees values(14,'Vikram','Versatile','vikram@gmail.com',6385264654,'2023/2/19',3,6000)
insert into employees values(15,'Vasanth','Vasanth','vasanth@gmail.com',9876654434,'2023/2/23',3,5000)
insert into employees values(16,'Hari','Karthi','hari@gmail.com',6385233454,'2023/2/23',4,8000)
insert into employees values(17,'Siva','Bharath','sb@gmail.com',6384353454,'2023/2/23',4,10000)
insert into employees values(18,'Sharan','David','sd@gmail.com',9097754323,'2023/2/23',4,22600)
insert into employees values(19,'Hemanth','h','hemanth@gmail.com',9385264654,'2023/2/23',4,24520)
insert into employees values(20,'Harshan','h','harshan@gmail.com',8097654333,'2023/2/23',4,21475)

select * from employees

--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.
select first_name,last_name from employees 
where SALARY>(select salary from employees where EMPLOYEE_ID=16)

--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
select first_name,last_name,job_id from employees
where HIRE_DATE=(select hire_date from employees where employee_id=11)

--3.Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name
select employee_id,first_name,Last_name from(select avg(salary) as salary from employees)as s, employees as e where e.salary>s.salary

--4.Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary
select * from employees where FIRST_NAME=(select FIRST_NAME from employees where FIRST_NAME='yamini')

--5.Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields
select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY 
from(select min(salary) as min_salary from employees)as ms, employees as
e where e.SALARY between ms.min_salary and 20000


