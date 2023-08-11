--- List all the customers who live in Texas.
SELECT CONCAT(first_name,' ',last_name) AS full_name,address.district FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';
-- Jennifer Davis, Kim Cruz, Richard Mccray, Bryan Hardison, Ian Still

-- Get all the payments above 6.99 with the customer's' full name.
SELECT CONCAT(first_name,' ',last_name) AS full_name,payment.amount FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;
-- Not listing all of these

-- Show all customer's names who have made total payments over $175.
SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM customer
WHERE customer_id
IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >175
	ORDER BY SUM(amount) DESC
)
GROUP BY full_name;
-- Eleanor Hunt, Tommy Collazo, Karl Seal, Marion Snyder, Rhonda Kennedy, Clara Shaw

-- List all customers that live in Nepal
SELECT CONCAT(first_name,' ',last_name) AS full_name,country.country FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
Full JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Kevin Schuler

-- Which staff member had the most transactions?
SELECT CONCAT(first_name,' ',last_name) AS full_name, count(payment.staff_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY full_name
ORDER BY full_name LIMIT 1;
-- Jon Stephens, 7304 total

-- What film had the most actors in it?
SELECT film.title, COUNT(actor_id)
FROM film_actor
FULL JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film.title
ORDER BY COUNT(actor_id) DESC LIMIT 1;
--Lambs Cincinatti

-- Show all customers who have made a single payment above 6.99
SELECT CONCAT(first_name,' ',last_name) AS full_name, count(payment.staff_id),COUNT(*)
FROM payment
FULL JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
GROUP BY full_name
HAVING count(*) = 1

--Which category is the most prevalent in the films?
SELECT category.name,COUNT(*)
FROM film_category
FULL JOIN category
ON film_category.category_id = category.category_id
GROUP BY category.name
ORDER BY COUNT(*) DESC LIMIT 1
-- Sports