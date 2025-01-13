/* 13.Managers with at Least 5 Direct Reports :

Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 
Write a solution to find managers with at least five direct reports.
*/

SELECT e1.name
FROM Employee e1
INNER JOIN Employee e2
ON e1.id=e2.managerId
GROUP BY e2.managerId
HAVING COUNT(e2.managerId) >= 5