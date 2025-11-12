💳 Credit Card Fraud Detection Using SQL

This project simulates how SQL can be used to detect potentially fraudulent credit card transactions — similar to what financial institutions might perform in early fraud detection systems. The dataset includes 50,000 synthetic transactions featuring cardholder, merchant, and transaction details, along with embedded fraud indicators.

The goal is to showcase practical SQL skills by identifying suspicious behavior patterns — using SQL alone, without machine learning or external tools.

Project Structure
fraud-detection-sql/
│
├── data/
│   └── fraud_sql_project_merged_dataset_fixed.csv
│
├── sql/
│   └── fraud_detection_queries.sql
│
├── README.md

Dataset Overview

The dataset includes fields such as:

User and Card Details: user_id, card_id, merchant_id

Transaction Info: amount, currency, status, transaction_time, transaction_country

Merchant Info: category, merchant_name, country_code

Card Metadata: card_type, status_card

Fraud Flags:

flag_high_amount

flag_cross_country_quick

flag_declined

This is a synthetic dataset built to mimic real-world patterns, with anomalies introduced for testing fraud logic.

SQL Concepts Applied

Table joins (user, card, merchant, transaction fields)

Aggregations: SUM, COUNT, AVG, MAX

Filtering: WHERE, HAVING, CASE WHEN

Window Functions: LAG() to analyze time-based behavior

Common Table Expressions (CTEs) for readable, modular queries

View creation for reusable fraud logic

Key Fraud Detection Scenarios

Frequent Declines: Users with 3+ declined transactions in one day

Geo-Velocity Checks: Transactions from different countries within 24 hours

Rapid-Fire Transactions: Potential bot-like behavior based on short time gaps

Gambling Risk Analysis: High activity with gambling merchants

High-Amount Anomalies: Review how well high-value flags correlate with actual amounts

Cross-Risk Users: Combine geography and transaction behavior to identify high-risk profiles

Timeline Audits: Inspect transaction sequences per user

Reusable Views: Created suspicious_users view for ongoing analysis or dashboards

How to Run This Project

Install MySQL (e.g., via MySQL Workbench)

Create a new schema:

CREATE DATABASE fraud_project;
USE fraud_project;


Set up the table structure using the script in fraud_detection_queries.sql

Import the dataset:

Option A: Use the MySQL Workbench Import Wizard

Option B: Run this command:

LOAD DATA LOCAL INFILE 'path_to/fraud_sql_project_merged_dataset_fixed.csv'
INTO TABLE transactions_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


Run the queries in fraud_detection_queries.sql for analysis.
