/* 9.Rising Temperature:

    Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.

Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
*/

select w2.id from Weather w1 join
Weather w2 on
date_sub(w2.recordDate, interval 1 day)= w1.recordDate
and w2.temperature>w1.temperature;