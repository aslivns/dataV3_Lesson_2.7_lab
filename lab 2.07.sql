-- In this lab, you will be using the Sakila database of movie rentals.

USE sakila;
-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query. 

SELECT name AS film_category, COUNT(*) AS category_count
FROM film 
JOIN film_category AS film_cat
ON film.film_id = film_cat.film_id
JOIN category AS cat
ON cat.category_id = film_cat.category_id
GROUP BY film_category
ORDER BY category_count DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.
-- REVENUE !!!! 

SELECT staff.first_name AS name, staff.last_name AS surname, SUM(amount) AS revenue
FROM payment
LEFT JOIN staff
ON staff.staff_id = payment.staff_id
WHERE payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY payment.staff_id;

-- 3. Which actor has appeared in the most films?

SELECT actor.first_name AS name, actor.last_name AS last_name, COUNT(*) AS appeared_count
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY appeared_count DESC
LIMIT 1;  

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT cus.first_name name, cus.last_name last_name, COUNT(*) AS no_of_rent
FROM customer AS cus
JOIN rental
ON cus.customer_id = rental.customer_id
GROUP BY cus.customer_id
ORDER BY no_of_rent DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT staff.first_name AS name, staff.last_name AS last_name, address.address AS staff_adress
FROM staff
JOIN address
ON address.address_id = staff.address_id;

-- 6. List each film and the number of actors who are listed for that film.
SELECT film.title AS title, COUNT(*)
FROM actor
JOIN film_actor
ON film_actor.actor_id = actor.actor_id
JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film_actor.actor_id;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.

SELECT c.first_name, c.last_name, SUM(amount) AS total_payment
FROM payment p
LEFT JOIN customer c 
ON c.customer_id = p.customer_id
GROUP BY p.customer_id
ORDER BY last_name DESC;


-- 8. List number of films per category.

SELECT cat.name AS genre, COUNT(*) AS no_of_films
FROM film_category film_cat
JOIN category cat 
ON film_cat.category_id = cat.category_id
GROUP BY cat.name;



