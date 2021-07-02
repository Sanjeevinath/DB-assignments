/* 1. Insert a row to ‘Employees’ table with following values:
• LastName → Davolio
• FirstName → Nancy
• Title → Sales Representative
• TitleOfCourtesy → Ms.
• BirthDate → 1948-12-08
• HireDate → 1992-05-01
• Address → 507 - 20th Ave. E. Apt. 2A
• City → Seattle
• Region → WA
• PostalCode → 98122
• Country → USA
• HomePhone → (206) 555-9857
• Extension → 5467
• Notes → Education includes a BA in psychology from Colorado State University in
1970. She also completed "The Art of the Cold Call." Nancy is a member of Toastmasters
International.
• ReportsTo → 2
• PhotoPath → http://accweb/emmployees/davolio.bmp*/select * from employees;INSERT INTO employees(LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Notes,ReportsTo,PhotoPath) Values('Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E. Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', 'Education includes a BA in psychology from Colorado State University in
1970. She also completed "The Art of the Cold Call." Nancy is a member of Toastmasters
International.', '2', 'http://accweb/emmployees/davolio.bmp');

/* Insert the data into ‘Customers’ table
• CustomerID → ALFKI
• CompanyName → Alfreds Futterkiste
• ContactName → Maria Anders
• ContactTitle → Sales Representative
• Address → Obere Str. 57
• City → Berlin
• PostalCode → 12209
• Country → Germany
• Phone → 030-0074321
• Fax → 030-0076545
*/
select * from customers;INSERT INTO customers(CustomerID,CompanyName,ContactName,ContactTitle,Address,City,PostalCode,Country,Phone,Fax)VALUES('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', '12209', 'Germany', '030-0074321', '030-0076545');/* 3. Inserting multiple rows. Insert the below data into ‘Employees’ table.In record 1, birth date is greater than today’s date. Mention the error you receive, then update the
birthdate to ‘1952-02-19’ and try re-load*/select * from employees;UPDATE employees SET BirthDate = '1952-02-19' WHERE EmployeeID = 1;/* 4. Insert one new customer in Customers table with below info
• CustomerID → BONAP
• CompanyName → Bon app'
• ContactName → Laurence Lebihan
• ContactTitle → Owner
• Address → 12, rue des Bouchers
• City → Marseille
• PostalCode → 13008
• Country → France
• Phone →91.24.45.4
• Fax → 91.24.45.41
*/
select * from customers;
INSERT INTO customers(CustomerID,CompanyName,ContactName,ContactTitle,Address,City,PostalCode,Country,Phone,Fax)VALUES('BONAP', 'Bon app', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', '13008', 'France', '91.24.45.4', '91.24.45.41');-- 5. Get the distinct [Contact Title] from ‘Customers’ tableSelect * from customers;SELECT DISTINCT ContactTitle FROM customers;-- 6. Get the total number of Employees under each title. (Using GroupBy)SELECT Title , COUNT(*) "Total number of Employees" FROM employees GROUP BY Title; -- 7. Get the list of customers reached more than 15 orders from ‘Orders’ Table (Using Group By,Having)Select * from Orders;
SELECT CustomerID,COUNT(CustomerID) "ORDERS" FROM orders GROUP BY CustomerID HAVING COUNT (CustomerID)>15;

/* 8. Oops!! We inserted the incorrect name in ‘Employees’ table where the LastName is
‘Buchan’. Name must be updated to ‘Buchanan’ using transaction. (Using Begin Tran,Commit)
*/
select * from employees;
BEGIN
UPDATE employees SET LastName='Buchanan' WHERE FirstName='Steven'; 
COMMIT;
END;

--9. Show the details of orders of each customer so far. (Using joins) Tables: Orders, Customers
SELECT Orders.OrderId,customers.ContactName FROM Orders 
INNER JOIN customers ON 
Orders.CustomerID=customers.CustomerId;

--10. Get the details of all customers those who didn’t place any orders so far. (Using leftjoin)
SELECT customers.ContactName FROM customers
LEFT JOIN Orders ON customers.CustomerID=Orders.CustomerID
WHERE Orders.CustomerID IS NULL; 

--11. Get the Product details (from Products Table) of each order (from Order Details Tables) using joins.
SELECT* from products; 
SELECT * FROM Orders;
Select * from Order_Details;
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10248', '1', 18.00, '3', '25');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10249', '2', 19.00, '3', '35');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10250', '3', 10.00, '3', '15');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10251', '4', 22.00, '3', '25');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10252', '5', 21.35, '3', '25');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10253', '6', 25.00, '3', '35');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10254', '7', 30.00, '3', '45');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10255', '8', 40.00, '3', '15');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10256', '9', 97.00, '3', '35');
INSERT INTO Order_Details(Order_id,Product_id,Unitprice,Quantity,Discount)
VALUES ('10257', '10', 31.00, '3', '25');

SELECT  Order_Details.Order_id,products.ProductID,products.ProductName,products.SupplierID,products.CategoryID,products.QuantityPerUnit,products.UnitPrice,products.UnitsInStock,products.UnitsOnOrder,products.ReorderLevel,products.Discontinued,Order_Details.Quantity,Order_Details.Discount
FROM products
INNER JOIN Order_Details
ON Order_Details.Product_id=products.ProductID;
 
--12. Delete the record from ‘Customers’ table who didn’t place any order
DELETE FROM customers WHERE CustomerID NOT IN 
(SELECT Orders.CustomerID from Orders)
