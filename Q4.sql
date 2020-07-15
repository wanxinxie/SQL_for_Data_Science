-- 1. Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE.
SELECT CustomerId,
       FirstName || " " || LastName AS FullName,
       Address,
       UPPER(City || " " || Country) AS CityandCountry
FROM Customers

-- 2. Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
SELECT FirstName,
       LastName,
       LOWER(SUBSTR(FirstName,1,4)),
       LOWER(SUBSTR(LastName,1,2)),
       LOWER(SUBSTR(FirstName,1,4)) || LOWER(SUBSTR(LastName,1,2)) AS new_employee_userid
FROM Employees

-- 3. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
SELECT FirstName,
       LastName,
       HireDate,
       (STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) AS WorkYear
FROM Employees
WHERE WorkYear >= 15
ORDER BY LastName ASC

-- 4. Are there any columns with null values? Indicate any below. Select all that apply.
SELECT COUNT(*)
FROM Customers
WHERE FirstName IS NULL

-- 5. Find the cities with the most customers and rank in descending order.
SELECT City,
       COUNT(*)
FROM Customers
GROUP BY City
ORDER BY COUNT(*) DESC

-- 6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
SELECT c.FirstName || c.LastName || i.InvoiceID AS new_customer_invoiceid
FROM Customers c INNER JOIN Invoices i
ON c.CustomerId = i.CustomerID
-- WHERE new_customer_invoiceid LIKE 'AstridGruber%'