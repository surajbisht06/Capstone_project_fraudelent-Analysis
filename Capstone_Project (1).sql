use capstone_project_sql;

# 1. Retrieve all columns for all claims:
SELECT * FROM claims1;
SELECT * FROM cust_demographics;

# 2. Retrieve total number of claims:
SELECT COUNT(*) AS total_claims FROM claims1;

# 3. Retrieve all distinct incident causes:
SELECT DISTINCT incident_cause FROM claims1;

# 4. Retrieve the total claim amount for each claim type:
SELECT claim_type, SUM(claim_amount) AS total_claim_amount
FROM claims1
GROUP BY claim_type;

# 5. Retrieve the average claim amount for each claim type:
SELECT claim_type, AVG(claim_amount) AS avg_claim_amount
FROM claims1
GROUP BY claim_type;

# 6. Retrieve the count of claims filed in each geographical area:
SELECT claim_area, COUNT(*) AS claim_count
FROM claims1
GROUP BY claim_area;

# 7. Retrieve the count of fraudulent claims:
SELECT COUNT(*) AS fraudulent_claims
FROM claims1
WHERE fraudulent = 'true';

# 8. Retrieve the total number of claims and the total claim amount for each customer:
SELECT customer_id, COUNT(*) AS total_claims, SUM(claim_amount) AS total_claim_amount
FROM claims1
GROUP BY customer_id;

# 9. Retrieve the customer_id and total number of claims for customers who have filed more than 1 claims:
SELECT customer_id, COUNT(*) AS total_claims
FROM claims1
GROUP BY customer_id
HAVING total_claims > 1;

# 10. Retrieve the customer_id and the total number of claims filed by customers who have claimed more than $5000:
SELECT customer_id, COUNT(*) AS total_claims
FROM claims1
WHERE claim_amount > 5000
GROUP BY customer_id;

# 11. Retrieve the customer_id and the average claim amount for customers who have filed more than 1 claims
SELECT customer_id, AVG(claim_amount) AS avg_claim_amount
FROM claims1
GROUP BY customer_id
HAVING COUNT(*) > 1;


# Retrieve all columns for all customers:
SELECT * FROM cust_demographics;

#Retrieve the count of male and female customers
SELECT gender, COUNT(*) AS count
FROM cust_demographics
GROUP BY gender;

# Calculate the age of each customer based on their DateOfBirth:
SELECT CUST_ID, TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS age
FROM cust_demographics;

#Retrieve the count of customers in each state:
SELECT State, COUNT(*) AS count
FROM cust_demographics
GROUP BY State;

# Retrieve distinct segments of customers:
SELECT DISTINCT Segment
FROM cust_demographics;

# Count the number of customers in each segment:
SELECT Segment, COUNT(*) AS count
FROM cust_demographics
GROUP BY Segment;


#joining both the Data set 
SELECT c.*, cd.gender, cd.DateOfBirth, cd.State, cd.Contact, cd.Segment
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID;

# Retrieve the total number of claims for each gender:
SELECT cd.gender, COUNT(*) AS total_claims
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.gender;

# Retrieve the average claim amount for each gender:
SELECT cd.gender, AVG(c.claim_amount) AS avg_claim_amount
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.gender;

# Retrieve the count of claims filed in each state:
SELECT cd.State, COUNT(*) AS claim_count
FROM claims AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.State;

# Retrieve the total claim amount for each segment:
SELECT cd.Segment, SUM(c.claim_amount) AS total_claim_amount
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.Segment;


#Retrieve the count of claims for each age group (assuming you have age groups defined):
SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, cd.DateOfBirth, CURDATE()) BETWEEN 18 AND 30 THEN '18-30'
        WHEN TIMESTAMPDIFF(YEAR, cd.DateOfBirth, CURDATE()) BETWEEN 31 AND 45 THEN '31-45'
        WHEN TIMESTAMPDIFF(YEAR, cd.DateOfBirth, CURDATE()) BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    COUNT(*) AS claim_count
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY age_group;

#Retrieve the count of claims for each state and gender combination:
SELECT cd.State, cd.gender, COUNT(*) AS claim_count
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.State, cd.gender;

#Retrieve the average claim amount for each segment:
SELECT cd.Segment, AVG(c.claim_amount) AS avg_claim_amount
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.Segment;

#Retrieve the count of claims for each state and segment combination:
SELECT cd.State, cd.Segment, COUNT(*) AS claim_count
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY cd.State, cd.Segment;

#Retrieve the count of claims for each age group and gender combination:
SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, cd.DateOfBirth, CURDATE()) BETWEEN 18 AND 30 THEN '18-30'
        WHEN TIMESTAMPDIFF(YEAR, cd.DateOfBirth, CURDATE()) BETWEEN 31 AND 45 THEN '31-45'
        WHEN TIMESTAMPDIFF(YEAR, cd.DateOfBirth, CURDATE()) BETWEEN 46 AND 60 THEN '46-60'
        ELSE 'Above 60'
    END AS age_group,
    cd.gender,
    COUNT(*) AS claim_count
FROM claims1 AS c
JOIN cust_demographics AS cd ON c.customer_id = cd.CUST_ID
GROUP BY age_group, cd.gender;






