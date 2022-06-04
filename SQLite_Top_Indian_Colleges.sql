--Title :- Top Indian Colleges 
--Data Link:- https://www.kaggle.com/datasets/soumyadipghorai/top-indian-colleges


--SELECT * FROM College_data;

--SELECT count(college_name) FROM College_data;

-- find Repeted entres of college
--SELECT *, count(*) FROM College_data GROUP BY college_name, state,stream,rating having count(*) > 1;

--Find the how many college present in each state 
--SELECT state, count(college_name) as total_college FROM College_data GROUP by state order by total_college desc;

--Find college type presented in India
--SELECT stream, count( college_name) as Total_college,  FROM College_data GROUP BY stream order by Total_college DESC;


-- Find the top TEN high rated Engineering college in india
--SELECT college_name, state, rating FROM College_data where stream = "Engineering" order by rating desc limit 10;

-- Find the colleges where all ratings are greater than 8.5
--SELECT college_name, state, stream,rating FROM College_data where rating > 8.5 and academic > 8.5 and accommodation > 8.5 AND faculty > 8.5 AND infrastructure > 8.5 and placement > 8.5 and social_life > 8.5;


-- Find the Best Engineering college in maharastra 
--sELECT college_name, ug_fee, pg_fee, rating,placement FROM College_data where stream = "Engineering" and state = "Maharashtra" order by placement desc;


