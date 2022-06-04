-- Tital:- Google Books Dataset 
-- Data Link:- https://www.kaggle.com/datasets/bilalyussef/google-books-dataset?select=google_books_1299.csv


--SELECT * FROM google_books;

-- Find the total books which has data
SELECT COUNT(title) 
FROM google_books;


-- Delete the description column from google_books data
alter table google_books DROP COLUMN description;

SELECT * from google_books;


-- find and show the duplicate (repeated) rows in data
SELECT *, 
count(*) 
FROM google_books 
GROUP BY title,author,rating,voters,price,currency,publisher,page_count,generes,isbn,language,published_date 
HAVING COUNT(*) > 1;

--OR

With RECURSIVE DupCTE as (
SELECT *,
  ROW_NUMBER () OVER (PARTITION BY title, author, rating, voters, price, currency, publisher, page_count, generes, isbn, language, published_date 
                      ORDER BY published_date) as Dup_count
  FROM google_books)
SELECT * FROM DupCTE WHERE Dup_count > 1;



-- Delete the duplicate values from google_books
--using group by clause and MAX() (only when uniqe-ID over theire)
DELETE FROM google_books 
WHERE "uniqe_id" NOT IN (select MAX(title) from google_books group by "columns")


-- OR


-- By using CTE (common table expression) method
--delete the duplicate records from google_books

with RECURSIVE cte as (
SELECT *,
       ROW_NUMBER () OVER (PARTITION BY title, author, rating, voters, price, currency, publisher, page_count, generes, isbn, language, published_date 
                           ORDER BY published_date) as Dup_count
   FROM google_books
)
DELETE FROM cte WHERE Dup_count > 1;




-- Find ten largest pages books with author and genre
SELECT title,author,page_count,generes 
FROM google_books 
order BY page_count DESC limit 10;



-- Remove all commas from votars column 
UPDATE google_books 
set voters = REPLACE(voters, ',','');

SELECT  title ,voters from google_books;


-- Find  ten high price books
SELECT* FROM google_books 
ORDER by price DESC limit 10;


-- Find the books where there rating is 5 
SELECT title,rating 
FROM google_books where rating = 5;


--Find how many books which dont have any genere 
SELECT count(title) 
FROM google_books 
WHERE generes = "none";


-- Find the publisher with their publication in descending order
SELECT publisher, COUNT( publisher) as total_publicaton 
FROM google_books 
GROUP by publisher 
order by total_publicaton DESC;



-- Find the total books for perticular rating
SELECT rating , count(rating) as total_books 
FROM google_books 
GROUP by rating 
ORDER BY total_books desc;
