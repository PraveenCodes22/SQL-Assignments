create table Employees(
	EmployeeID int primary key,
	FirstName varchar(50), 
	LastName varchar(50),
	DepartmentID int
);
select * from Employees;

create table Departments(
	DepartmentID int primary key, 
	DepartmentName varchar(100)
);
select * from Departments;

create table Orders(
	OrderID int primary key, 
	EmployeeID int, 
	OrderDate date,
	TotalAmount decimal(10,2)
);
select * from Orders;


insert into  Employees (EmployeeID, FirstName, LastName, DepartmentID)
values
(1, 'John', 'Doe', 101),
(2, 'Jane', 'Smith', 102),
(3, 'Emily', 'Jones', 101),
(4, 'Michael', 'Brown', 103);


insert into Departments (DepartmentID, DepartmentName)
values 
(101, 'Sales'),
(102, 'Marketing'),
(103, 'IT');

insert into Orders (OrderID, EmployeeID, OrderDate, TotalAmount)
values 
(1, 1, '2024-08-01', 150.00),
(2, 2, '2024-08-02', 200.00),
(3, 3, '2024-08-03', 120.00),
(4, 4, '2024-08-04', 180.00),
(5, 1, '2024-08-05', 300.00);

select * from Employees;
select * from Departments;
select * from Orders;


--Write a SQL query to retrieve the total sales amount for each department. Display the
--department name and the total sales amount. 

select * from
Employees e 
join Departments d
on e.DepartmentID = d.DepartmentID
join Orders o 
on e.EmployeeID = o.EmployeeID;

select DepartmentName, sum(TotalAmount) as Total_Sales_Amount from
Employees e 
join Departments d
on e.DepartmentID = d.DepartmentID
join Orders o 
on e.EmployeeID = o.EmployeeID
group by DepartmentName
order by Total_Sales_Amount;