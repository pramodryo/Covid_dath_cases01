-- Tital:- COVID-19 India- state wise cases, death and recovery
-- Data Link:- https://www.kaggle.com/datasets/aryakrishnanar/covid-data-india-statewise



--SELECT * FROM C19INDIA;

-- find the total active cases
SELECT sum (active_cases) from C19INDIA;


-- find the top five state which has highest active cases
SELECT "state/ut", active_cases FROM C19INDIA ORDER by active_cases DESC limit 5;

--create new table as high_death and add top 10 state which has maximum death.
CREATE TABLE High_death as  SELECT "state/ut", active_cases , death 
FROM C19INDIA ORDER by death DESC limit 10;

--SELECT * FROM High_death;


-- find the state which has maximum recovery percentage to total cases. 
SELECT "state/ut",confirmed_cases, "cured/discharged", ("cured/discharged" * 100 / confirmed_cases) 
as recovry_rate FROM C19INDIA ORDER by recovry_rate DESC;



-- find the pecentage death of state to the confirmed cases
SELECT "state/ut",(cast (death as float)), confirmed_cases, ((cast (death as float)) * 100 / confirmed_cases) 
as deathPercenrage FROM C19INDIA order by deathPercenrage DESC;


--show the death percentage of india by the confirmed_cases
SELECT sum(cast(death as float)) as total_death, sum(confirmed_cases) as total_cases, (sum(cast(death as float)) / sum(confirmed_cases)) * 100  
as India_death_percentage from C19INDIA;


-- find the state which has lees than 5 active cases and store it in table  
CREATE table Less_active_cass as select "state/ut", active_cases 
FROM C19INDIA where active_cases <= 5;
SELECT * from Less_active_cass;
