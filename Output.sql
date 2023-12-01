
/* 1. What are the names of all the customers who live in New York? */

SELECT 
    CONCAT(FirstName, ' ', LastName) AS Name
FROM
    customers
WHERE
    city = 'New York';

/*2. What is the total number of accounts in the Accounts table? */

SELECT 
    COUNT(accountid) AS Total_no_of_accounts
FROM
    accounts;

/*3. What is the total balance of all checking accounts? */

SELECT 
    accounttype, SUM(balance) AS Total_Balance
FROM
    accounts
WHERE
    accounttype = 'Checking'
GROUP BY accounttype;

/*4. What is the total balance of all accounts associated with customers who live in Los Angeles? */

SELECT 
    c.city, SUM(a.balance) AS Total_Balance
FROM
    accounts a
        JOIN
    customers c USING (customerid)
WHERE
    city = 'Los Angeles'
GROUP BY city;

/*5. Which branch has the highest average account balance? */

SELECT 
    B.branchname,
    A.branchid,
    ROUND(AVG(A.balance), 2) AS avg_account_balance
FROM
    accounts A
        JOIN
    branches B USING (branchid)
GROUP BY branchid
ORDER BY avg_account_balance DESC
LIMIT 1;

/*6. Which customer has the highest current balance in their accounts?  */

SELECT 
    A.customerid,
    CONCAT(C.firstname, ' ', C.lastname) AS Name,
    SUM(A.balance) AS current_balance
FROM
    accounts A
        JOIN
    customers C USING (customerid)
GROUP BY customerid
ORDER BY current_balance DESC;

/*7. Which customer has made the most transactions in the Transactions table? */

with most_t as(
SELECT 
    CONCAT(C.firstname, ' ', C.lastname) AS Name,
    COUNT(T.accountid) AS T_Transactions
,dense_rank() over (order by count(T.accountid) desc ) as top 
from transactions T join accounts A using (accountid) join customers C using(customerid)
group by Name)

SELECT 
    Name, T_Transactions
FROM
    most_t
WHERE
    top = 1;

/*8.Which branch has the highest total balance across all of its accounts? */

SELECT 
    B.branchname,
    A.branchid,
    ROUND(Sum(A.balance), 2) AS total_balance
FROM
    accounts A
        JOIN
    branches B USING (branchid)
GROUP BY branchid
ORDER BY total_balance DESC
LIMIT 1;

/*9. Which customer has the highest total balance across all of their accounts, 
including savings and checking accounts?*/

SELECT 
    CONCAT(C.firstname, ' ', C.lastname) AS Name,
    SUM(A.balance) AS Balance
FROM
    accounts A
        JOIN
    customers C USING (customerid)
GROUP BY Name , Accounttype
ORDER BY balance DESC
LIMIT 1;

/*10. Which branch has the highest number of transactions in the Transactions table?*/

with transaction_count as (SELECT 
    B.branchid, B.branchname, T.transactionid, A.accountid
FROM
    accounts A
        JOIN
    transactions T USING (accountid)
        JOIN
    branches B USING (branchid) )

SELECT 
    branchname, COUNT(transactionid) AS no_of_transactions
FROM
    transaction_count
GROUP BY branchname
ORDER BY no_of_transactions DESC
LIMIT 1 ;
