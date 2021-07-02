/* 1. Create a table ‘Customers’ with below columns
a. CustomerID → Not NULL, Primary Key
b. CompanyName → Not NULL
c. ContactName
d. ContactTitle
e. Address
f. City
g. Region
h. PostalCode
i. Country
j. Phone
k. Fax
*/
CREATE TABLE Customer 
( customer_id int NOT NULL, 
  customer_name char(50) NOT NULL, 
  Contac_name char(50), 
  Contact_title char(50), 
  address char(50), 
  city char(50), 
  region char(25), 
  postal_code char(10), 
  Country char(15), 
  Phone varchar(15), 
  Fax varchar(15), 
  CONSTRAINT customer_pk PRIMARY KEY (customer_id) 
); 
--select * from Customer;

/* 2. Create a table ‘Order Details’ with below columns
a. OrderID → Not NULL
b. ProductID → Not NULL
c. UnitPrice → Not NULL, money data type
d. Quantity → Not NULL, Check Constraint [Quantity > 0]
e. Discount → Not NULL, Default Constraint [Value = 0]
*/
CREATE TABLE Order_Details 
(Order_id int NOT NULL UNIQUE, 
 Product_id int NOT NULL UNIQUE, 
 Unitprice MONEY NOT NULL , 
 Quantity int NOT NULL CHECK(Quantity>0), 
 Discount DECIMAL (3,2) NOT NULL DEFAULT(0) 
); 
--select * from Order_Details;

/* 3. Add one more column to ‘Employees’ table – Created_date which should have the
datatype to store date and time. Default value must be current date.
*/
--select * from employees;
ALTER TABLE employees ADD Created_Date DATETIME default CURRENT_TIMESTAMP; 


/* 4. Modify the length of ‘LastName’ column from 40 to 50 in ‘Employees’ table.
*/
ALTER TABLE  employees ALTER COLUMN LastName nvarchar(50);

/* 5. Add one column to ‘Orders’ table as ‘Status’ default value as active.
*/
--select * from Orders;
ALTER TABLE Orders ADD Status varchar default 'active';

/* 6. Drop below columns from corresponding tables
a. ‘Status’ from ‘Orders’ table
b. ‘Created_date’ from ‘Employees’ table
*/
ALTER TABLE Orders DROP CONSTRAINT DF__Orders__Status__09A971A2,COLUMN Status; 
ALTER TABLE employees DROP CONSTRAINT DF__Employees__Creat__08B54D69, COLUMN Created_date; 
