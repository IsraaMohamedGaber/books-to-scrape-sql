
-- 1. Average price for each rating
SELECT Rating, AVG(Price) AS Avg_Price
FROM books
GROUP BY Rating
ORDER BY Rating;

-- 2. The 5 most expensive books rated 4 or 5
SELECT Title, Rating, Price
FROM books
WHERE Rating IN (4, 5)
ORDER BY Price DESC
LIMIT 5;

-- 3. How many books are out of stock, per rating
SELECT Rating, COUNT(*) AS Out_Of_Stock_Count
FROM books
WHERE in_stock = 0
GROUP BY Rating
ORDER BY Rating;
