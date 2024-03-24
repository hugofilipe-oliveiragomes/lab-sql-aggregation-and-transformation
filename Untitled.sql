USE sakila;

-- 1. You need to use SQL built-in functions to gain insights relating to the duration of movies:
-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
-- Hint: Look for floor and round functions.

SELECT MAX(length) FROM sakila.film;
SELECT MIN(length) FROM sakila.film;

-- 2. You need to gain insights related to rental dates:
-- 2.1 Calculate the number of days that the company has been operating.
-- Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operation_days FROM sakila.rental;

-- 2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
-- Hint: use a conditional expression.

SELECT rental_id, customer_id, rental_date,return_date,
       CASE 
           WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
           ELSE 'workday'
       END AS DAY_TYPE
FROM sakila.rental
ORDER BY rental_date;

-- 3. You need to ensure that customers can easily access information about the movie collection. To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.

-- 4. Please note that even if there are currently no null values in the rental duration column, the query should still be written to handle such cases in the future.
-- Hint: Look for the IFNULL() function.
