SELECT * FROM data1;

SELECT * FROM data2;

-- count number of rows in data 
select count(*) from data1
select count(*) from data2



select count(DISTINCT(district)) as total_district,count(DISTINCT(state)) as total_state from data1;
select count(DISTINCT(district)) as total_district,count(DISTINCT(state)) as total_state from data2;


--dataset for jharkhand and bihar
select * from data1 WHERE state in ('Jharkhand','Bihar')


-- population of india 
SELECT sum(population) from data2;

-- average growth
select avg(growth) from data1;

-- average sex ratio for each state
SELECT state, round(avg(sex_ratio),2) as avg_sex_ratio from data1 group by state order by avg_sex_ratio desc;


-- find satae which have average literacy rate is greater than 90
SELECT state, round(avg(literacy),0) as avg_literacy from data1 GROUP by state having avg_literacy > 90 order by avg_literacy desc;

-- find top 5 state which have average growth is high 
select state, round(avg(growth),0) as avg_growth from data1 group by state ORDER by avg_growth desc limit 5;


-- show the bottom 5 state which have sex ratio low
SELECT state, round(avg(sex_ratio),2) as avg_sex_ratio from data1 group by state order by avg_sex_ratio asc limit 5;



-- find top and bottom 3 states in literacy rate
drop table if exists #topstates;
create table #topstates
( state nvarchar(255),
  topstate float
  )
  
 
 
--find out total total males and females for each state

select d.state,sum(d.males) total_males,sum(d.females) total_females from
(select c.district,c.state state,round(c.population/(c.sex_ratio+1),0) males, round((c.population*c.sex_ratio)/(c.sex_ratio+1),0) females from
(select a.district,a.state,a.sex_ratio/1000 sex_ratio,b.population from data1 a inner join data2 b on a.district = b.district ) c) d
group by d.state;



-- total literacy rate

select c.state,sum(literate_people) total_literate_pop,sum(illiterate_people) total_lliterate_pop from 
(select d.district,d.state,round(d.literacy_ratio*d.population,0) literate_people,
round((1-d.literacy_ratio)* d.population,0) illiterate_people from
(select a.district,a.state,a.literacy/100 literacy_ratio,b.population from data1 a 
inner join data2 b on a.district=b.district) d) c
group by c.state


-- population in previous census

select sum(m.previous_census_population) previous_census_population, sum(m.current_census_population) current_census_population from(
select e.state,sum(e.previous_census_population) previous_census_population,sum(e.current_census_population) current_census_population from
(select d.district,d.state,round(d.population/(1+d.growth),0) previous_census_population,d.population current_census_population from
(select a.district,a.state,a.growth growth,b.population from data1 a inner join data2 b on a.district=b.district) d) e
group by e.state)m



-- population vs area

select (g.total_area/g.previous_census_population)  as previous_census_population_vs_area, (g.total_area/g.current_census_population) as 
current_census_population_vs_area from
(select q.*,r.total_area from (
select '1' as keyy,n.* from
(select sum(m.previous_census_population) previous_census_population,sum(m.current_census_population) current_census_population from(
select e.state,sum(e.previous_census_population) previous_census_population,sum(e.current_census_population) current_census_population from
(select d.district,d.state,round(d.population/(1+d.growth),0) previous_census_population,d.population current_census_population from
(select a.district,a.state,a.growth growth,b.population from data1 a inner join data2 b on a.district=b.district) d) e
group by e.state)m) n) q inner join (
select '1' as keyy,z.* from (
select sum(area_km2) total_area from data2)z) r on q.keyy=r.keyy)g





--window 
--output top 3 districts from each state with highest literacy rate
select a.* from
(select district,state,literacy,rank() over(partition by state order by literacy desc) rnk from data1) a
where a.rnk in (1,2,3) order by state