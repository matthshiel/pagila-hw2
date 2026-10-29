/*
 * Create a report that shows the total number of rentals per year and month.
 *
 * HINT:
 * The ROLLUP clause is a convenient syntactic sugar for complicated combinations of GROUP BY and UNION clauses.
 * Although we won't cover this syntax in class, there is a great tutorial at
 * <https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-rollup/>.
 * The tutorial is based off of the pagila database's rental table,
 * and contains a query that almost solves this problem.
 */
SELECT extract(year FROM rental_date AT TIME ZONE 'UTC') AS "Year", extract(month FROM rental_date AT TIME ZONE 'UTC') AS "Month",
count(*) AS "Total Rentals"
FROM rental
GROUP BY ROLLUP (extract(year FROM rental_date AT TIME ZONE 'UTC'), extract(month FROM rental_date AT TIME ZONE 'UTC'))
ORDER BY "Year" NULLS LAST, "Month" NULLS LAST;

