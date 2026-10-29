/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */
SELECT extract(year FROM rental_date AT TIME ZONE 'UTC') AS "Year", extract(month FROM rental_date AT TIME ZONE 'UTC') AS "Month",
sum(amount) AS "Total Revenue"
FROM rental
JOIN payment USING (rental_id)
GROUP BY ROLLUP (extract(year FROM rental_date AT TIME ZONE 'UTC'), extract(month FROM rental_date AT TIME ZONE 'UTC'))
ORDER BY "Year" NULLS LAST, "Month" NULLS LAST;
