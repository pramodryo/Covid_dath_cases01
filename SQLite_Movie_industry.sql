--Title:- Movie Industry data
--Data link:- https://www.kaggle.com/datasets/danielgrijalvas/movies


--SELECT * from movies;

-- find the number of movie data present 
SELECT 
count(name)
from movies;


-- find the blockbuster movie of all time 
SELECT 
name, 
year,
max(gross) as gross_in_ FROM movies;


--find the how many movies release in year 2009 
SELECT name,
year FROM movies where year = 2009;


--find the type (genre) of movies released
--count total genres
SELECT COUNT(DISTINCT genre)  from movies; 
-- shows total genres 
select DISTINCT(genre) FROM movies;



-- the number of genre type movies 
SELECT 
count(name) as total_movies,
(SELECT count(name) FROM movies where genre = "Drama") as Total_drama,
(SELECT count(name) FROM movies where genre = "Adventure") as Total_Adventure,
(SELECT count(name) FROM movies where genre = "Action") as Total_action,
(SELECT count(name) FROM movies where genre = "Comedy") as Total_comedy
FROM movies;



-- find the indian movie details 
SELECT * FROM movies where country = "India";


-- find the indian movie collection 
SELECT name,
genre,
budget,
gross 
from movies where country = "India"
and 
gross is not null;


-- find the movie which can show all ages (Rated G: General audiences – All ages admitted.)
select* from movies where rating = "G"


-- find the how many percent of movie which rated PG (Rated PG: Parental guidance suggested – Some material may not be suitable for children.)
SELECT 
(SELECT count(name) from movies WHERE rating = "PG") as Total_PG,
(SELECT COUNT(name) FROM movies) as Total_movie, 
(SELECT count(name) from movies WHERE rating = "PG") *100/ (SELECT COUNT(name) FROM movies) as PG_percent
FROM movies limit 1;


-- find the top ten movies which has highest life time collection in billion (hit movie)
SELECT name,
budget,
gross
FROM movies ORDER by gross DESC limit 10;



-- find the movies which collection is less than its budget (flop movies)
SELECT * from movies WHERE budget > gross;


--find the movies rating (score) is greter than average rating and its collection also greter than average gross 
SELECT * from movies 
where
score > (SELECT avg(score) FROM movies)
and
gross > (select avg(gross) from movies);


-- find the movie which have score greter than 7.5 with largest number of people vots voted
SELECT *from movies 
where 
score > 7.5 order by votes DESC limit 10;


--find the movie highest negative percentage difference between budget and gross (flop movies)
SELECT
name,
budget,
gross, 
(gross-budget)*100/ budget as percent_collection_than_budget
FROM movies 
WHERE
percent_collection_than_budget is NOT NULL 
ORDER by percent_collection_than_budget asc ;


--find the movie highest positive percentage difference between budget and gross (hit movies)
SELECT 
name,
budget, 
gross,
(gross-budget)*100/ budget as percent_collection_than_budget 
FROM movies 
ORDER by percent_collection_than_budget DESC limit 10;


-- find the top five superhit movies in the year 1980 
SELECT* from movies
WHERE 
score > 8.0 
and 
year = "1980"
ORDER by gross DESC limit 5;

