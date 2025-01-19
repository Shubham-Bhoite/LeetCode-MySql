/* 19.Monthly Transactions I :

    Table: Transactions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 
Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
*/

select
    date_format(trans_date, '%Y-%m') as month,
    country,
    count(id) as trans_count,
    sum(state='approved') as approved_count,
    sum(amount) as trans_total_amount,
    sum(if(state= 'approved', amount, 0)) as approved_total_amount

from Transactions
group by month, country