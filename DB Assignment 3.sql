/* 1. Create a View ‘V_Employees_Orders’ with below columns
o LastName
o FirstName
o Title
o TitleOfCourtesy
o BirthDate
o HireDate
o Address
o OrderID
o OrderDate
o RequiredDate
o ShippedDate
o ShipVia
o Freight
o ShipName
*/
CREATE VIEW [V_Employees_Orders] AS
SELECT LastName,FirstNamE,Title,TitleOfCourtesy,BirthDate,HireDate,Address,OrderID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName
FROM employees,Orders;
SELECT * FROM V_Employees_Orders;

--2. Update ShipName column inside View V_Employees_Orders.
BEGIN TRAN
UPDATE V_Employees_Orders SET ShipName = ' ';
ROLLBACK 

/* 3. Can we use ORDER BY Clause in VIEW? Try creating another view
V_Employees_Territories for the below columns with ORDER BY EmployeeID.
o EmployeeID
o LastName
o FirstName
o Title
o TitleOfCourtesy
o BirthDate
o HireDate
o Address
o TerritoryID
*/
create view V_Employees_Territories as 
select top 100 percent e.EmployeeID,e.LastName,e.FirstName,e.Title,e.TitleOfCourtesy,e.BirthDate,e.HireDate,e.Address,t.TerritoryID  
from Employees e,Territories t
 order by e.EmployeeID asc;

--4. Get the all the Employee Full Names with upper case and lowercase
SELECT upper(LastName) + upper(FirstName) AS FullName 
FROM employees; 
SELECT lower(LastName)+ ' ' + lower(FirstName) AS FullName 
FROM employees; 

/*5. What will be the result of the below Query?
Select Concat (FirstName, ' -> ', Address)
From Employees
*/
Select Concat (FirstName, ' -> ', Address)
From Employees;
/* ANSWER
Nancy -> 507 - 20th Ave. E.
Apt. 2A
Andrew -> 908 W. Capital Way
Janet -> 722 Moss Bay Blvd.
Margaret -> 4110 Old Redmond Rd.
Steven -> 14 Garrett Hill
Michael -> Coventry House
Miner Rd.
Robert -> Edgeham Hollow
Winchester Way
Laura -> 4726 - 11th Ave. N.E.
Anne -> 7 Houndstooth Rd.
Nancy -> 507 - 20th Ave. E. Apt. 2A
*/

/*6. What will be the output of below snippet?
Select sum(1) from Customers
Select sum(2) from Customers
Select sum(3) from Customers
*/
Select * from customers;
Select sum(1) from Customers;
--89
Select sum(2) from Customers;
--178
Select sum(3) from Customers;
--267

/* 7. Write a query to extract a substring from the string “Address”, starting from
the 2nd character and must contain 4 characters.
*/
SELECT substring(Address,2,5)
FROM customers;

/*8. Write a query to extract a substring of 3 characters, starting for the 2nd characterfor
the FirstName and order it according to the FirstName .
*/
SELECT substring(FirstName,2,4)
FROM employees;

--9. Write a query to get FIRST and LAST Day of Current Month.
SELECT DATENAME(WEEKDAY, DATEADD(DD,-(DAY(GETDATE() -1)), GETDATE())) AS FirstDay;
SELECT DATENAME(WEEKDAY, DATEADD(DD,-(DAY(GETDATE())), DATEADD(MM, 1, GETDATE()))) AS LastDay;

--10. Create Cluster index on ShipperID Column in the Shippers table.
CREATE CLUSTERED INDEX clusterindex
ON shippers(ShipperID);
SELECT * FROM shippers;

--11. Try creating one more Cluster index on Shippers table for Company Name Column.
CREATE CLUSTERED INDEX cname
ON shippers(CompanyName);

/* 12. Create non-cluster IX_tblSuppliersindex on CompanyName, ContactName, ContactTitle,
Address, City Columns on the Suppliers table.
*/
CREATE NONCLUSTERED INDEX IX_tblSuppliersindex
ON Suppliers(CompanyName,ContactName,ContactTitle,Address,City);
SELECT * FROM Suppliers;

--13. Drop Index IX_tblSuppliers on the suppliers table
DROP INDEX Suppliers.IX_tblSuppliersindex;

/* 14. Construct a stored procedure, named usp_EmpName, that accepts one input
parameter named EmployeeID and returns the name of the employee using try catch
block.
*/
CREATE PROCEDURE usp_EmpName
@id int  
AS
BEGIN TRY
 SELECT FirstName,LastName FROM employees WHERE EmployeeID = @id
END TRY
BEGIN CATCH
END CATCH;

DROP PROCEDURE usp_EmpName;
GO

usp_EmpName 1

/* 15. Can we create Stored Procedure without "Begin" and "End" refer the below image and
try to answers?
*/
We can create MySQL stored procedures without ‘BEGIN’ and ‘END’ 
just in the same way created with both of them only thing is to omit to BEGIN and END. 

--16. Can we returnNULL valueusing stored procedure?
If you try to return NULL from a stored procedure using the RETURN keyword, 
you will get a warning, and 0 is returned instead

/*17. Create a function TotalEmployee that returns count of employees from the employees
table.
*/
create function TotalEmployee()
returns int
as begin
declare @cnt int
select @cnt=count(*) from Employees
return @cnt
end 

--18. Drop Function TotalEmployee using SQLCommand.
DROP FUNCTION TotalEmployee;
select * from TotalEmployee;

/*19. Creates a table-valued function TopTenCustomers that returns a list of
customers including CompanyName, ContactName, ContactTitle, Address, City,
Region, PostalCode
*/
SELECT * FROM customers;
CREATE FUNCTION TopTenCustomers (@id nvarchar(30))
RETURNS TABLE
 AS
 RETURN(SELECT CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode
		FROM customers
		WHERE CustomerID = @id)
SELECT * FROM TopTenCustomers('ALFKI')