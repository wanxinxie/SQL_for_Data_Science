-- 1. Using a subquery, find the names of all the tracks for the album "Californication".
SELECT Name
FROM Tracks
WHERE AlbumId IN (SELECT AlbumId
    FROM Albums
    WHERE Title = "Californication")
    
-- 2. Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT COUNT(i.CustomerId) AS Num_Invoices,
       FirstName,
       LastName,
       City,
       Email
FROM Invoices i INNER JOIN Customers c
ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId

-- 3. Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT t.Name,
       a.Title,
       r.ArtistId,
       t.TrackId
FROM (
(Tracks t INNER JOIN Albums a
ON t.AlbumId = a.AlbumId)
INNER JOIN Artists r
ON r.ArtistId = a.ArtistId); 

-- 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT m.LastName as Manager_Name,
       e.LastName as Employee_Name
FROM Employees e INNER JOIN Employees m
ON e.ReportsTo = m.EmployeeID

-- 5. Find the name and ID of the artists who do not have albums.
SELECT r.Name,
       r.ArtistId
FROM Artists r
LEFT JOIN Albums a
ON r.ArtistId = a.ArtistId
WHERE a.AlbumID IS NULL

-- 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT FirstName,
       LastName
FROM Employees
UNION
SELECT FirstName,
       LastName
FROM Customers
ORDER BY LastName DESC

--  7. See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT c.City,
       i.BillingCity
FROM Customers c
INNER JOIN Invoices i
ON c.CustomerId = i.CustomerId
WHERE c.City != i.BillingCity

