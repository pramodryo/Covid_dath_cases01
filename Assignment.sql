/*Q. Create a report that shows the total number of courses each customer bought during the last 6 month.demo.
and order your result based on customer id in acending oredr.*/



create table CUSTOMERS(
cust_id int,
cust_name Varchar,
cust_cellno varchar,
cust_email varchar)

Insert into CUSTOMERS VALUES
(1, 'Roger', '9823017892','rogerb12@gmail.com'),
(2, 'smith', '9099312543','smith42@hotmail.com'),
(3,'joy','7845659852','joy@gmail.com'),
(4,'watson','4578986585', 'watson@gmail.com'),
(5, 'root','9865983214','root@gmail.com'),
(6, 'Roman', '9823017895','Roman@gmail.com'),
(7, 'samay', '9099312545','samay@hotmail.com'),
(8,'jesson','7845659855','jesson@gmail.com'),
(9,'don','9578986585', 'don@gmail.com'),
(10, 'stive','9965983214','stive@gmail.com')

select * from CUSTOMERS

create table COURSES(
course_id integer,
course_name Varchar,
course_price decimal(10,2))

insert into COURSES values (1,'Angular',29.99),
(2,'Node','29.99')

select * from COURSES



create table SALES(
s_id integer,
s_coustid integer,
s_courseid integer,
s_Qty_oredered integer,
CONSTRAINT FK_CUSTOMER
FOREIGN KEY(s_coustid) 
	REFERENCES CUSTOMERS(cust_id),
CONSTRAINT FK_COURSE
FOREIGN KEY(s_courseid) 
	REFERENCES COURSES(course_id)
);
	
	
insert into SALES values (1,1,1,2),
(2,1,2,3),
(3,1,1,1),
(4,2,2,2),
(5,2,1,5),
(6,2,2,1),
(7,3,1,2),
(8,4,2,3),
(9,4,1,1),
(10,5,2,2),
(11,6,1,5),
(12,7,2,1),
(13,8,1,4)


select * from sales


select c.cust_name, c.cust_cellno, c.cust_email, coalesce(sum(s_Qty_oredered),0) as total_courses from CUSTOMERS c
left join SALES s on c.cust_id = s.s_coustid
GROUP BY c.cust_name
order by cust_id;

-- coalesce(null,0) it show the null value as zero(0)