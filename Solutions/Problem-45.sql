/*45.Restaurant Growth :

    Table: Customer
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+

In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

*/

WITH Aggregated AS (
    SELECT visited_on, SUM(amount) AS total_amount
    FROM Customer
    GROUP BY visited_on
),
MovingAverage AS (
    SELECT 
        a1.visited_on,
        SUM(a2.total_amount) AS amount,
        ROUND(AVG(a2.total_amount), 2) AS average_amount
    FROM Aggregated a1
    JOIN Aggregated a2
    ON a2.visited_on BETWEEN DATE_SUB(a1.visited_on, INTERVAL 6 DAY) AND a1.visited_on
    GROUP BY a1.visited_on
    HAVING COUNT(a2.visited_on) = 7
)
SELECT visited_on, amount, average_amount
FROM MovingAverage
ORDER BY visited_on;
