/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
SELECT title
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
WHERE customer_id = 1
GROUP BY film_id, title
HAVING count(*) > 1
ORDER BY title;
