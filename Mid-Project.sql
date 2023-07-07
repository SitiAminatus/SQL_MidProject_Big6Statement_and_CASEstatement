use mavenmovies;

-- NUMBER 1
/*We will need a list of all staff members, including their first and last names, email addresses, and the store
identification number where they work.*/


SELECT *
FROM staff;

SELECT first_name, last_name, email, store_id
FROM staff;

-- NUMBER 2
/*We will need separate counts of inventory items held at each of your two stores.*/

SELECT *
FROM inventory;

SELECT store_id,
	COUNT(inventory_id) AS 'total_inventory'
FROM inventory
GROUP BY store_id;

-- NUMBER 3
/*We will need a count of active customers for each of your stores. Separately, please.*/

SELECT *
FROM customer;

SELECT 
	store_id,
	COUNT(active) AS 'total_active_status'
FROM customer
WHERE active = 1
GROUP BY store_id;

-- other solution
SELECT store_id,
		COUNT(customer_id) AS 'total_active_customer'
FROM customer
WHERE active=1
GROUP BY store_id;

-- NUMBER 4
/*In order to assess the liability of a data breach, we will need you to provide a count of all customer email
addresses stored in the database.*/

SELECT *
FROM customer;

SELECT COUNT(customer_id) AS 'total_email'
FROM customer;

-- NUMBER 5 NOT SOLVED
/* We are interested in how diverse your film offering is as a means of understanding how likely you are to 
keep customers engaged in the future. 
Please provide a count of unique film titles you have in inventory at
each store and then provide a count of the unique categories of films you provide 

						store_1 store_2
count of unique film  	200     400
*/

SELECT *
FROM inventory;

SELECT 
	COUNT(DISTINCT film_id) AS 'total_inventory', store_id
FROM inventory
GROUP BY store_id;

SELECT *
FROM category;

SELECT COUNT(DISTINCT name) AS 'film_category'
FROM category;

-- if you want to show the category list name then:
SELECT DISTINCT name
FROM category;
    
-- NUMBER 6
/*We would like to understand the replacement cost of your films. Please provide the replacement cost for the
film that is least expensive to replace, the most expensive to replace, and the average of all films you carry*/

SELECT *
FROM film;

SELECT 
	MIN(replacement_cost) AS 'least_expensive_to_replace',
	MAX(replacement_cost) AS 'most_expensive_to_replace',
	AVG(replacement_cost) AS 'average_to_replace'
FROM film;

-- NUMBER 7 
/*We are interested in having you put payment monitoring systems and maximum payment processing
restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.*/

SELECT *
FROM payment;

SELECT 
	AVG(amount) AS 'average_payment',
	MAX(amount) AS 'max_payment'
FROM payment;


-- NUMBER 8
/*We would like to better understand what your customer base looks like. Please provide a list of all customer
identification values, with a count of rentals they have made all-time, with your highest volume customers at
the top of the list.*/

SELECT *
FROM payment;

SELECT customer_id, COUNT(rental_id) AS 'total_rent'
FROM payment
GROUP BY customer_id 
ORDER BY total_rent DESC;