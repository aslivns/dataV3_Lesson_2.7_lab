-- In this lab, you will be using the Sakila database of movie rentals.

USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query. 

SELECT cat.name, COUNT(DISTINCT(film_cat.film_id)) AS category_count
FROM film_category film_cat
JOIN category cat
ON film_cat.category_id = cat.category_id
GROUP BY cat.name
ORDER BY category_count DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.
-- REVENUE !!!! 

SELECT s.first_name AS name, s.last_name AS surname, SUM(p.amount) AS revenue
FROM payment p
JOIN staff s
ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY p.staff_id;

-- 3. Which actor has appeared in the most films?

SELECT a.first_name AS name, a.last_name AS last_name, COUNT(*) AS appeared_count
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY appeared_count DESC
LIMIT 1;  

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.first_name AS name, c.last_name AS last_name, COUNT(*) AS no_of_rent
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY no_of_rent DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name AS name, s.last_name AS last_name, a.address AS staff_adress
FROM staff s
JOIN address a
ON a.address_id = s.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT title AS film_title, COUNT(*) AS number_of_actors
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY number_of_actors DESC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT c.first_name, c.last_name, SUM(amount) AS total_payment
FROM payment p
JOIN customer c 
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name;


-- 8. List number of films per category.

SELECT c.name AS genre, COUNT(*) AS no_of_films
FROM film_category fc
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY genre;



