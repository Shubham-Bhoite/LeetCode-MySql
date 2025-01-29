/* 29.Fix Names in a Table :

    Table: Users
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 
Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
*/

SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2))) AS name  
FROM Users  
ORDER BY user_id;
