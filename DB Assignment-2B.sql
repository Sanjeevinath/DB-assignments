﻿/* 1. Insert a row to ‘Employees’ table with following values:
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
• PhotoPath → http://accweb/emmployees/davolio.bmp
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
select * from customers;
birthdate to ‘1952-02-19’ and try re-load
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
INSERT INTO customers(CustomerID,CompanyName,ContactName,ContactTitle,Address,City,PostalCode,Country,Phone,Fax)
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