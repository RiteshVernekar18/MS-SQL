
use basic_assignments

--1.Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create table customer (
customer_id int, 
first_name varchar(20), 
last_name varchar(20),
email varchar(50), 
[address] varchar(100),
city varchar(20), 
[state] varchar(20), 
zip int
)

--2.Insert 5 new records into the table
insert into customer values(1,'Abhishek','shetty','abhishekshetty1@gmail.com','Devraj layout','Davanagere','Karnataka',577006)
insert into customer values(2,'Akash','Shet','akashshet2@gmail.com','SSLayout','Davangere','Karnataka',577004)
insert into customer values(3,'Suraj','Tendulkar','surajtendulkar3@gmail.com','Naagarbavi','bangalore','Karnataka',477896)
insert into customer values(4,'Vamshi','Gavaskar','vamshigavaskar4@gmail.com','BTMlayout','bangalore','Karnataka',477892)
insert into customer values(5,'taara','Darwadkar','taaradarwadkar5@gmail.com','GandiNagar','Shimoga','Karnataka',677896)

--3.	Select only the ‘first_name’ & ‘last_name’ columns from the customer table
select * from customer
select first_name,last_name from customer


--4.	Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’
select first_name,city from customer where first_name like 'g%%' and city='san jose'


use basic_assignments

--1.Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’
create table orders(
order_id int,order_date date,amount int,customer_id int)

insert into orders values(1,getdate(),15000,1)
insert into orders values(2,getdate(),20000,2)
insert into orders values(3,getdate(),25000,3)
insert into orders values(4,getdate(),18000,4)
insert into orders values(5,getdate(),26000,5)

--2.Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
select * from customer inner join orders on customer.customer_id=orders.customer_id

--3.Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
select * from customer left join orders on customer.customer_id=orders.customer_id
select * from customer right join orders on customer.customer_id=orders.customer_id

--4.Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3
update orders set amount=100 where customer_id like 3
select * from orders


--1.Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
select min(amount) as [MINIMUM AMOUNT] from orders
select max(amount) as [MAXIMUM AMOUNT] from orders
select avg(amount) as [AVG AMOUNT] from orders

--2.Create a user-defined function, which will multiply the given number with 10
create function multiply_ten (@num as int)
returns int
as 
begin
return(
@num*10
)
end

select *, dbo.multiply_ten(amount) as multiply_by_10 from orders

--3.Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print the corresponding value
use BASIC_ASSIGNMENTS 
select 
case 
when 100<200 then '100 is less than 200'
when 200>=200 then '200 is greater or equal to 200'
else '100 is less than 200'
end as [CASE STATEMENT]


--1.Arrange the ‘Orders’ dataset in decreasing order of amount
select * from orders order by amount desc

--2.Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which comprises of same columns as first table. 
 CREATE TABLE EMPLOYEE_DETAILS1(
 EMP_ID INT, EMP_NAME VARCHAR(50), EMP_SALARY INT )

 CREATE TABLE EMPLOYEE_DETAILS2(
 EMP_ID INT, EMP_NAME VARCHAR(50), EMP_SALARY INT)

 INSERT INTO EMPLOYEE_DETAILS1 VALUES (1,'SAM CURREN',25000),(2,'SURAJ',24000),(3,'AHINAV',30000)
 INSERT INTO EMPLOYEE_DETAILS2 VALUES (1,'SANJAY',28500),(2,'ABHISHEK',21500),(3,'RAM',29600)

 select * from EMPLOYEE_DETAILS1
 select * from EMPLOYEE_DETAILS2

 --3.Apply the union operator on these two tables
 select * from EMPLOYEE_DETAILS1
 union 
 select * from EMPLOYEE_DETAILS2

 --4.Apply the intersect operator on these two tables
select * from EMPLOYEE_DETAILS1
intersect
select * from EMPLOYEE_DETAILS2

--5.Apply the except operator on these two tables
select * from EMPLOYEE_DETAILS1
except
select * from EMPLOYEE_DETAILS2

select * from EMPLOYEE_DETAILS2
except
select * from EMPLOYEE_DETAILS1

use basic_assignments


--1.Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose
create view customer_san_jose 
as 
select first_name from customer
where city='san jose'

select * from customer_san_jose

--2.Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
----a.	Rollback the transaction
----b.	Set the first name of customer to Alex, where the last name is Jordan

begin transaction
update customer set first_name='Francis' where last_name='jordan'
rollback transaction
commit transaction

select * from customer
select * from orders

use basic_assignments
update customer set last_name='Jordan' where city like 'davanagere'

begin transaction
update customer set first_name='Alex' where last_name='Jordan'
commit transaction

--3.Inside a try catch block, divide 100 with 0, print the default error message
begin try
update orders set amount=100/0 where order_id=2
end try

begin catch
print 'DEFAULT ERROR MESSAGE'
end catch

use basic_assignments











