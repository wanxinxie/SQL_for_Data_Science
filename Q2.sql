-- 1. Find all the tracks that have a length of 5,000,000 milliseconds or more.
SELECT *
FROM Tracks
WHERE Milliseconds >= 5000000

-- 2. Find all the invoices whose total is between $5 and $15 dollars.
SELECT * 
FROM Invoices
WHERE Total BETWEEN 5 AND 15

-- 3. Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.
SELECT * 
FROM Customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY')

	-- What company does Jack Smith work for?
SELECT Company 
FROM Customers
WHERE State IN ('RJ','DF','AB','BC','CA','WA','NY')
AND FirstName = 'Jack'

-- 4. Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.
SELECT * 
FROM Invoices
WHERE CustomerId IN (56, 58)
AND Total BETWEEN 1 AND 5

	-- What was the invoice date for invoice ID 315?
SELECT InvoiceDate
FROM Invoices
WHERE InvoiceId = 315

-- 5. Find all the tracks whose name starts with 'All'.
SELECT *
FROM Tracks
WHERE Name LIKE 'All%'

-- 6. Find all the customer emails that start with "J" and are from gmail.com.
SELECT *
FROM Customers
WHERE Email LIKE "J%@gmail.com"

-- 7. Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.
SELECT Total
FROM Invoices
WHERE BillingCity IN ('Brasilia','Edmonton','Vancouver')
ORDER BY InvoiceId DESC

-- 8. Show the number of orders placed by each customer (hint: this is found in the invoices table) and sort the result by the number of orders in descending order.
SELECT *, COUNT(*) AS Num_Orders
FROM Invoices
GROUP BY CustomerId
ORDER BY Num_Orders DESC

-- 9. Find the albums with 12 or more tracks.
SELECT *, Count(*) AS Ntracks
FROM Tracks
GROUP BY AlbumId
HAVING COUNT(*) >= 12