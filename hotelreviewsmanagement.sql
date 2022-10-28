CREATE TABLE hotel (
	id bigserial,
	Name varchar (100),
	Place varchar (70),
	Type varchar (100),
	Price numeric,
	ReviewsCount bigint,
	Rating decimal(5, 2),	
	City varchar (50),
	State varchar (30)
);

-- viewing the table created
SELECT * FROM hotel;

-- copying data into the created table
COPY hotel FROM 'C:\Users\Public\Documents\SQL\HotelData.csv'  WITH DELIMITER ',' csv header encoding 'windows-1251';

-- checking for unique values in city and state
SELECT DISTINCT city, state FROM hotel;

--1. Which hotel has the highest rating?
SELECT * FROM hotel WHERE Rating = (SELECT MAX(Rating) FROM hotel);

-- 2. which hotel is the most expensive?
SELECT * FROM hotel WHERE Price = (SELECT MAX(Price)FROM hotel);


-- 3. What is the cheapest hotel?
SELECT * FROM hotel WHERE price = (SELECT MIN (price)FROM hotel);

--4.  Which hotels have the prices above 50,000 and ratings over 5.0?
SELECT * FROM hotel WHERE Price >= 50000 AND rating >= 5.0 ORDER BY city;
--- The most expensive hotels are located in the state of Maastricht.

SELECT id, Name, Type, city
FROM hotel
GROUP BY id, Name, Type, city
HAVING MAX(rating)>=7.0;

--5. what is the average price of hotels?
SELECT sum (price) AS "Total price",
       round(avg(price), 2) AS "Average price"
FROM hotel;

--6.  what is the average rating of hotels?
SELECT round(avg(rating), 2) AS "Average rating"
FROM hotel;

--7. what is the total and average reviews count?
SELECT sum (reviewscount) AS "Total reviews", round(avg(reviewscount), 2) AS "Average reviews count"
FROM hotel;

--8.  what are the distinct hotel room types?
SELECT DISTINCT Type FROM hotel;

SELECT * From hotel ORDER BY City ASC;

SELECT * FROM hotel ORDER BY price DESC;