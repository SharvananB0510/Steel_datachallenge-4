# Finance Analysis
This contribution is part of the 6 challenges presented by Steel Data.

Get the dataset [link](https://www.steeldata.org.uk/sql4.html)

## Challenge Overview

In this challenge, we're looking at how customers behave with their accounts at 'The Big Bank.' We want to understand things like who lives in a certain place, how many accounts there are, the balance in checking accounts, the total balance for specific locations and customers, and which branch has the highest average account balance.

##   Tables
1. Customers: Contains details about customers like customer_id,firstname,lastname,state and city
2. Accounts: It contains information about account_id,branch_id,customer_id,account_type and balance
3. Transactions : Tracks data like transaction date and amount also includes transaction_id and account_id
4. Branches: Stores data related to branch like state,city, branch_name, branch_id

### Schema Diagram 
![image](https://github.com/SharvananB0510/Steel_datachallenge-4/assets/69303949/418e7e63-9da3-4b2b-9ab7-3187f4d1621d)

## Questions Answered

1. What are the names of all the customers who live in New York?
2. What is the total number of accounts in the Accounts table?
3. What is the total balance of all checking accounts?
4. What is the total balance of all accounts associated with customers who live in Los Angeles?
5. Which branch has the highest average account balance?
6. Which customer has the highest current balance in their accounts?
7. Which customer has made the most transactions in the Transactions table?
8. Which branch has the highest total balance across all of its accounts?
9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
10. Which branch has the highest number of transactions in the Transactions table?
