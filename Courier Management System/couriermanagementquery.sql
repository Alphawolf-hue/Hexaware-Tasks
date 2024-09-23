--creating database
create database couriermanagementsystem
use couriermanagementsystem

--creating table Users
create table Users(
 UserID int identity(1,1) not null PRIMARY KEY,
UserName VARCHAR(255) not null,
Email VARCHAR(255) UNIQUE not null,
UserPassword VARCHAR(255) not null,
ContactNumber VARCHAR(20) not null,
UserAddress varchar(255) not null
)

--Entering data for Users
Insert into Users(UserName,Email,UserPassword,ContactNumber,UserAddress)values('Aniket','ab@gmail.com','12345','9765','WB')
Insert into Users(UserName,Email,UserPassword,ContactNumber,UserAddress)values('Leo','lm@gmail.com','12945','9764','ARG')
Insert into Users(UserName,Email,UserPassword,ContactNumber,UserAddress)values('sergio','sb@gmail.com','12346','4765','ESP')
Insert into Users(UserName,Email,UserPassword,ContactNumber,UserAddress)values('Lamine','ly@gmail.com','15345','9865','BCN')
Insert into Users(UserName,Email,UserPassword,ContactNumber,UserAddress)values('Pedri','pg@gmail.com','12045','9865','TST')

create table Courierservices(ServiceID INT identity(1,1) PRIMARY KEY,
ServiceName VARCHAR(100) not null,
Cost DECIMAL(8, 2) not null
)

--Enter data for Courierservices
Insert into Courierservices(ServiceName,Cost)values('SnailMail',50)
Insert into Courierservices values('Bluedart',60)
Insert into Courierservices values('RoyalMail',30)
Insert into Courierservices values('Avion',100)
Insert into Courierservices values('Lufthansa',30)

create table Courier(
CourierID INT identity(1,1) PRIMARY KEY, 
SenderID int not null,
ReceiverID int not null ,
CourierWeight DECIMAL(5, 2) not null, 
CourierStatus VARCHAR(50) not null, 
TrackingNumber VARCHAR(20) UNIQUE , 
DeliveryDate DATE not null,
ServiceID int,
FOREIGN KEY (SenderID) REFERENCES Users(UserID),
FOREIGN KEY (ReceiverID) REFERENCES Users(UserID),
FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID)
)

Insert into Courier(SenderID,ReceiverID,CourierWeight,CourierStatus,TrackingNumber,DeliveryDate,ServiceID)
values(1,2,10,'In Progress','ABLM4','2024-09-20',3)
Insert into Courier values(3,4,15,'Shipped','LMSR18','2024-09-27',4)
Insert into Courier values(3,5,5,'Failed','SBYJ7','2024-09-18',2)
Insert into Courier values(5,1,7.5,'Shipped','LPGLM8','2024-09-28',5)
Insert into Courier values(4,2,3,'In Progress','LYLM30','2024-09-19',4)



create table Roles(
RoleID int identity(1,1) primary key,
RoleName varchar(50) not null
)

Insert into Roles(RoleName)
values('Manager'),('Delivery Man'),('Operation head'),('Warehouse manager')

create table Employee(EmployeeID int identity(1,1) PRIMARY KEY, 
Name VARCHAR(100)not null, 
Email VARCHAR(255) UNIQUE, 
ContactNumber VARCHAR(20), 
RoleID int, 
Salary int not null,
foreign key (RoleID) references Roles(RoleID) 
)

Insert into Employee(Name,Email,ContactNumber,RoleID,Salary)
values('Dani Rodri','d@gmail.com','912651',1,50000),('John Arias','J@gmail.com','912652',3,35000),
('Mark Felton','m@gmail.com','912653',2,20000),('John Henry','T@gmail.com','912654',4,30000),
('Santi Can','SC@gmail.com','912660',2,20000),('David John','dj@gmail.com','988890',3,35000)



create table [Location](LocationID INT identity(1,1) PRIMARY KEY, 
LocationName VARCHAR(100) not null, 
LocAddress varchar(100) not null
)

Insert into Location(LocationName,LocAddress) values('Warehouse1','North'),
('Warehouse2','South'),('Warehouse3','East'),('Warehouse4','West')

update Courier set CourierStatus='In Transit' where CourierStatus='Delivered' 
Insert into Courier (SenderID,ReceiverID,CourierWeight,CourierStatus,TrackingNumber,DeliveryDate,ServiceID) values(2,1,30,'Delivered','KMVJ9','2024-09-15',1)
update Courier set CourierStatus='Delivered' where CourierID=5
update Courier set CourierStatus='In Transit' where CourierID=1
update Courier set CourierStatus='Not Delivered' where CourierStatus='Failed'


create table Payment(PaymentID INT identity(1,1) PRIMARY KEY, 
CourierID INT, 
LocationId INT, 
Amount DECIMAL(10, 2) not null, 
PaymentDate DATE, 
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID), 
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)
update Payment set PaymentDate=null where PaymentID=2  select * from Payment
insert into Payment(CourierID,LocationId,Amount,PaymentDate) 
values(3,1,60,'2024-09-02'),(4,1,30,'2024-09-18'),(5,2,100,'2024-09-05'),
(1,2,50,'2024-09-10'),(6,1,50,'2024-09-01'),(2,4,100,'2024-09-17')

--updating table for adding SenderAddress and ReceiverAddress column and inserting values in those columns
alter table Courier
add SenderAddress varchar(255),ReceiverAddress varchar(255)

update Courier
set SenderAddress='WB',ReceiverAddress='ARG'
where CourierID=1 

update Courier
set SenderAddress='ESP',ReceiverAddress='BCN'
where CourierID=2

update Courier
set SenderAddress='ESP',ReceiverAddress='TST'
where CourierID=3

update Courier
set SenderAddress='TST',ReceiverAddress='WB'
where CourierID=4

update Courier
set SenderAddress='BCN',ReceiverAddress='ARG'
where CourierID=5

update Courier
set SenderAddress='ARG',ReceiverAddress='WB'
where CourierID=6

select * from Users
select * from Courier
select * from Roles
select * from [Location]
select * from Courierservices
select * from Payment
select * from Employee
--1.List all customers
select userID,userName from Users
--2.List all orders for a specific customer
select * from Courier where ReceiverID=2 
--3.List all couriers
select * from Courier
--4.List all packages for a specific sender: 
select c.CourierID,c.SenderID,c.ReceiverID,c.CourierWeight,c.CourierStatus,c.TrackingNumber,cs.ServiceName
from  Courier c
join CourierServices cs
on c.ServiceID=cs.ServiceID 
where SenderID=3

-- 5.List all deliveries for a specific courier: 
select cs.ServiceName,count(cs.ServiceID) as Deliveries
from Courier c
join Courierservices cs
on c.ServiceId=cs.ServiceID
where ServiceName='Avion' group by cs.ServiceName

-- 6.List all undelivered packages: 
select * from Courier where CourierStatus!='Delivered'

--7.List all packages that are scheduled for delivery today: 
select * from Courier where DeliveryDate=cast(getdate() as varchar)

-- 8.List all packages with a specific status: 
select * from Courier where CourierStatus='In Transit'

--9.Calculate the total number of packages for each courier. 
select cs.ServiceName,Count(c.CourierID) as TotalPackages
from Courier c
right join Courierservices cs
on c.ServiceID=cs.ServiceID 
group by cs.ServiceName

-- 10.Find the average delivery time for each courier 
select cs.ServiceName,avg(datediff(day,p.PaymentDate,c.DeliveryDate)) as avg_time
from Courier c
join Payment p
on c.CourierID=p.CourierID
join Courierservices cs
on c.ServiceID=cs.ServiceID
group by cs.ServiceName

-- 11.List all packages with a specific weight range: 
select * from Courier where CourierWeight between 10.00 and 30.00

-- 12.Retrieve employees whose names contain 'John' 
select * from Employee where [Name] like 'John%' order by salary
select * from Employee where [Name] like '%John%' order by ContactNumber desc

-- 13.Retrieve all courier records with payments greater than $50.
select c.CourierID,c.SenderID,c.ReceiverID,c.CourierWeight,c.CourierStatus,c.TrackingNumber,c.ServiceID,p.Amount
from Payment p
right join Courier c
on p.CourierID=c.CourierID
where Amount>50 
order by CourierID

--. 14.Find the total number of couriers handled by each employee. 
select emp.[Name],Count(c.CourierID) as total
from   Employee emp
left join  Courier c
on c.EmployeeID=emp.EmployeeID
group by emp.[Name] 

-- 15.Calculate the total revenue generated by each location
select l.LocationName,sum(p.Amount) as Amtgenerated from Payment p
right join [Location] l 
on p.LocationId=l.LocationID 
group by l.LocationName

--16.Find the total number of couriers delivered to each location. 
select l.LocationName,l.LocAddress,count(p.CourierID) as total
from   Payment p
right join [Location] l 
on l.LocationID=p.LocationID
group by l.LocationName,l.LocAddress order by LocationName

--17.Find the courier with the highest average delivery time: 
select top 1 cs.ServiceName,avg(datediff(day,p.PaymentDate,c.DeliveryDate)) as avg_time
from Courier c
join Payment p
on c.CourierID=p.CourierID
join Courierservices cs                
on c.ServiceID=cs.ServiceID
group by cs.ServiceName
order by avg_time desc

--18.Find Locations with Total Payments Less Than a Certain Amount 
select l.LocationName,l.LocAddress,sum(p.Amount) as total
from   Payment p
right join [Location] l 
on l.LocationID=p.LocationID
group by l.LocationName,l.LocAddress 
having sum(p.Amount)<150
order by LocationName

--19.Calculate Total Payments per Location 
select l.LocationName,l.LocAddress,sum(p.PaymentID) as total
from   Payment p
right join [Location] l 
on l.LocationID=p.LocationID
group by l.LocationName,l.LocAddress order by LocationName

--20.Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):  
select c.courierid, c.trackingnumber, c.deliverydate, sum(p.amount) as totalpayments, l.locationid
from courier c
join payment p on c.courierid = p.courierid
join location l on l.locationid = p.locationid
where l.locationid = 2
group by c.courierid, c.trackingnumber, c.deliverydate, l.locationid
having sum(p.amount) > 80

--21.Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'): 
select c.*
from courier c
join payment p on c.courierid = p.courierid
where p.amount > 80 and p.paymentdate > '2023-10-05'

--22.Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')
select l.locationname, p.paymentdate
from payment p
join [location] l on p.locationid = l.locationid
where p.paymentdate > '2024-09-10'
group by l.locationname, p.paymentdate
having sum(p.amount) > 50

--changed data here
ALTER TABLE Courier
ADD EmployeeID INT

ALTER TABLE Courier
ADD CONSTRAINT FK_Courier_Employee 
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)

-- 23.Retrieve Payments with Courier Information 
select p.Amount,* from Courier c join Payment p on p.CourierID=c.CourierID

--24.Retrieve Payments with Location Information 
select p.Amount,l.LocationName
from [Location] l
left join Payment p
on l.LocationID=p.locationID
where p.LocationId is not null
order by LocationName

-- 25.Retrieve Payments with Courier and Location Information
select p.amount,c.CourierWeight,c.CourierStatus,c.TrackingNumber,c.DeliveryDate,l.LocationName
from payment p
join courier c
on c.CourierID=p.CourierID
join [Location] l
on l.LocationID=p.LocationID
order by c.CourierID

-- 26.List all payments with courier details 
select p.Amount,c.SenderID,c.ReceiverID,c.CourierWeight,c.TrackingNumber
from courier c 
right join Payment p
on p.courierID=c.courierID

--27. Total payments received for each courier 
select cs.ServiceName,count(p.PaymentId) as total_payments
from Courier c
right join Courierservices cs
on c.ServiceID=cs.ServiceID and c.CourierStatus!='Not Delivered' 
left join Payment p
on c.CourierID=p.CourierID
group by cs.ServiceName 
--28. List payments made on a specific date
select PaymentId,Amount from Payment
where PaymentDate='2024-09-05'

-- 29.Get Courier Information for Each Payment
select p.PaymentID,p.Amount,c.SenderID,c.ReceiverID,c.CourierWeight,c.DeliveryDate
from Courier c
left join Payment p
on p.CourierID=c.CourierID order by p.PaymentID
-- 30.Get Payment Details with Location 
select p.PaymentID,p.Amount,l.LocationName
from [Location] l
left join Payment p
on l.LocationID=p.locationID
where p.LocationId is not null
order by LocationName

--31.Calculating Total Payments for Each Courier 
select cs.ServiceName,count(p.PaymentId) as total_payments
from Courier c
right join Courierservices cs
on c.ServiceID=cs.ServiceID and c.CourierStatus!='Not Delivered' 
left join Payment p
on c.CourierID=p.CourierID
group by cs.ServiceName 

--32. List Payments Within a Date Range 
select count(PaymentID) as No_of_Payments
from Payment
where PaymentDate between '2024-08-31' and '2024-09-11'
--33. Retrieve a list of all users and their corresponding courier records, including cases where there are 
--no matches on either side 
select u.UserName,c.CourierID,c.CourierWeight,c.CourierStatus,c.TrackingNumber,c.DeliveryDate
from Courier c
full outer join Users u
on c.ReceiverID=u.UserID
--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no 
--matches on either side 
select c.CourierID,c.CourierWeight,c.CourierStatus,c.DeliveryDate,cs.ServiceName
from Courier c
full outer join Courierservices cs
on c.ServiceId=cs.ServiceID
--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side 
--common entry in employee table and payments table

--36.List all users and all courier services, showing all possible combinations. 
select u.UserID,u.userName,c.ServiceName
from Users u
cross join CourierServices c

--37. List all employees and all locations, showing all possible combinations: 
select e.[Name],l.LocationName
from Employee e
cross join [Location] l 
--38. Retrieve a list of couriers and their corresponding sender information (if available) 
Select c.CourierId,u.Username as SenderName,u.Email,u.ContactNumber,u.UserAddress
from Courier c
left join Users u
on c.SenderID=u.UserID

--39. Retrieve a list of couriers and their corresponding receiver information (if available): 
Select c.CourierId,u.Username as ReceiverName,u.Email,u.ContactNumber,u.UserAddress
from Courier c
left join Users u
on c.ReceiverID=u.UserID

--40. Retrieve a list of couriers along with the courier service details (if available): 
Select c.CourierId,cs.ServiceName,cs.Cost
from Courier c
join Courierservices cs
on c.ServiceID=cs.ServiceID
--41. Retrieve a list of employees and the number of couriers assigned to each employee: 
select e.[Name],count(c.CourierID) as CourierHandled
from  Employee e
left join Courier c
on c.EmployeeID=e.EmployeeID
group by e.[Name]
--42. Retrieve a list of locations and the total payment amount received at each location: 
select l.LocationName,sum(p.Amount) as Tot_Pay_Amt
from  Payment p
right join [Location] l
on l.LocationID=p.LocationId
group by l.LocationName
--43. Retrieve all couriers sent by the same sender (based on SenderName)--confusion
select u.UserName,c.CourierWeight,c.DeliveryDate
from Users u
left join Courier c
on c.SenderID=u.UserID
where u.UserID=3
-- 44.List all employees who share the same role. 
select RoleID,[Name]
from Employee 
where exists
(select RoleName 
from Roles where Roles.RoleID=Employee.RoleID and roleID=2)

--45. Retrieve all payments made for couriers sent from the same location. 
select c.CourierID,p.Amount
from Payment p
join Courier c
on p.CourierID=c.CourierID where LocationId=1
--46. Retrieve all couriers sent from the same location (based on SenderAddress). 
select c1.CourierID
from Courier c1
join Courier c2
on c1.CourierID=c2.CourierID
where c1.SenderID=c2.SenderID

--47.List employees and the number of couriers they have delivered: 
select e.[name], count(c.courierid) as deliveredcount
from Employee e
left join courier c on e.EmployeeID = c.EmployeeID and c.CourierStatus = 'Delivered'
group by e.[name]


--48. Find couriers that were paid an amount greater than the cost of their respective courier services
select c.CourierID, c.TrackingNumber, c.DeliveryDate, sum(p.Amount) as TotalPayments, cs.ServiceName,cs.Cost
from Courier c
join Payment p on c.CourierID = p.CourierID
join CourierServices cs on c.ServiceID = cs.ServiceID
group by c.CourierID, c.TrackingNumber, c.DeliveryDate,cs.ServiceName, cs.Cost
having sum(p.Amount) > cs.Cost

--49. Find couriers that have a weight greater than the average weight of all couriers 
Select CourierID,CourierWeight from Courier
where CourierWeight>(select avg(CourierWeight) from Courier)

--50. Find the names of all employees who have a salary greater than the average salary: 
Select [Name] from Employee
where Salary>(select avg(salary) from Employee)

--51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT SUM(cs.Cost) AS TotalCost
FROM CourierServices cs
WHERE cs.Cost < (SELECT MAX(Cost) FROM CourierServices)

--52. Find all couriers that have been paid for 
select c.CourierID,p.PaymentDate
from Courier c  left join Payment p
on p.CourierID=c.CourierID  where Paymentdate is not null order by c.CourierID

--53. Find the locations where the maximum payment amount was made 
select l.LocationName,p.Amount
from Payment p
join [Location] l
on p.LocationId=l.LocationID
where p.Amount=(select max(Amount) from Payment)

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
(-- using Sender ID)
select CourierID,CourierWeight
 from Courier 
 where CourierWeight>(Select max(CourierWeight) from Courier 
where SenderID=3)
