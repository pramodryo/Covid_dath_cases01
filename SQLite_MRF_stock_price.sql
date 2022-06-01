-- Tital :- MRF Stock Price History (2002-07-01 to 2021-09-29)

-- Data link:- https://www.kaggle.com/datasets/pavan9065/mrf-stock-price-history


--SELECT * FROM MRFNS;

-- find the days where no treds 
--select date, volume from MRFNS where volume = 0;

--find the days where treds is greater than and less than average treds
--SELECT COUNT(volume) as total_days,COUNT(volume)-(SELECT COUNT(volume) FROM MRFNS WHERE volume >= (select avg(volume) from MRFNS)) as less_than_avg_treds, COUNT(volume)-(SELECT COUNT(volume) FROM MRFNS WHERE volume <= (select avg(volume) from MRFNS)) as greter_than_avg_treds FROM MRFNS;


-- find the pick price of stock
--select date, max(open) FROM MRFNS;

-- find the top 10 day's where highest hike on stock price in same day
--select date, open, close, close- open as day_hike FROM MRFNS order by day_hike desc limit 10;

--find the day where highest treds with percentage hike on that day ((New Price - Old Price) / Old Price) x 100
--SELECT date,open,close, (close - open)*100/open as percentage_increse_stock_price, max(volume) from MRFNS;


--find the percentage change in stock price
--SELECT date,open,close, (close - open)*100/open as percentage_price from MRFNS;


-- find the stock price change in a day
--SELECT date, open, high, close, adj_close, volume, close- open as Today_stock_price from MRFNS;


-- show the day where highest incerse in stock price
--SELECT date, open, close, max(close-open) as high_return_in_a_day FROM MRFNS;


-- create a new table which store the information of stock price change to the privious day
--CREATE TABLE day_change as SELECT date,volume, open, open- LAG(open) over (order by date) as Diff_to_last_day FROM MRFNS;
--SELECT * FROM day_change;



-- find the return from stock from first day to last date
--1) first i am create a table 
--2) then calculate returen 

--create table return as select date,open from MRFNS where date in ("2002-07-01","2021-09-29");
--select *from return;

--select open - LAG(open) over (order by date) as return_in_RS, date- Lag(Date) over (order by date) as in_years FROM return;



