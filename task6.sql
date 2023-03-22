create database task6
use task6
--creating the salesman
create table salesman (salesman_id int primary key,name varchar(25),city varchar(20),commission decimal
)

--inserting values
insert into salesman values(5001,'James Hoog','New York',0.15)
insert into salesman values(5002,'Nail Knite','Paris',0.13)
insert into salesman values(5005,'Pit Alex','London',0.11)
insert into salesman values(5006,'Mc Lyon','Paris',0.14)
insert into salesman values(5007,'Paul Adam','Rome',0.13)
insert into salesman values(5003,'Lauson Hen','San Jose',0.12)

select * from salesman

--creating a customer table
create table customer (customer_id int primary key,cust_name varchar(30),
city varchar(20),grade int,salesman_id int)


--inserting values into the table customer
insert into customer values(3002,'Nick Rimando','New York',100,5001)
insert into customer values(3007,'Brad Davis','New York',200,5001)
insert into customer values(3005,'Graham Zusi','California',200,5002)
insert into customer values(3008,'Julian Green','London',300,5002)
insert into customer values(3004,'Fabian Johnson','Paris',300,5006)
insert into customer values(3009,'Geoff Cameron','Berlin',100,5003)
insert into customer values(3003,'Jozu Altidor','Moscow',100,5007)
insert into customer(customer_id,cust_name,city,salesman_id) values(3001,'Brad Guzan','London',5005)

--creating a table called orders
create table orders (ord_no int,purch_amt decimal(10,2),ord_date date,customer_id int,salesman_id int)

--inserting values inside orders
insert into orders values(70001,150.5,'2012-10-05',3005,5002)
insert into orders values(70009,270.65,'2012-08-10',3001,5005)
insert into orders values(70002,65.26,'2012-10-05',3002,5001)
insert into orders values(70004,110.5,'2012-08-17',3009,5003)
insert into orders values(70007,948.5,'2012-09-10',3005,5004)
insert into orders values(70005,2400.6,'2012-07-27',3007,5001)
insert into orders values(70008,5760,'2012-07-27',3007,5001)
insert into orders values(70010,1983.43,'2012-10-10',3004,5006)
insert into orders values(70003,2480.4,'2012-10-10',3009,5003)
insert into orders values(70012,250.45,'2012-06-27',3008,5002)
insert into orders values(70011,75.29, '2012-08-17',3003,5007)
insert into orders values(70013,3045.6,'2012-04-25',3002,5001)
select * from orders


--task
--From the above tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
select s.name as 'Salesman',c.cust_name,s.city from salesman as s 
inner join 
customer c 
on s.city=c.city


--From the above tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.
select customer.cust_name,salesman.name as salesman_name, customer.city,salesman.commission from customer
inner join salesman 
on customer.salesman_id=salesman.salesman_id 
where commission>0.12


--From the above tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
select orders.ord_no,orders.ord_date,orders.purch_amt, Customer.cust_name,customer.grade, salesman.name as salesman_name,salesman.commission 
from orders 
inner join
customer
on orders.customer_id=customer.customer_id 
inner join
salesman on 
salesman.salesman_id=customer.salesman_id 
order by ord_no


--From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select orders.ord_no, purch_amt,customer.cust_name,salesman.city from orders
inner join customer
on customer.customer_id=orders.customer_id 
inner join salesman 
on salesman.salesman_id=customer.salesman_id
where
orders.purch_amt>500 and orders.purch_amt<2000


--From the above tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
select customer.customer_id,customer.cust_name, customer.city,customer.grade, salesman.name as salesman_name, salesman.city from customer
inner join salesman 
on customer.salesman_id=salesman.salesman_id order by customer_id