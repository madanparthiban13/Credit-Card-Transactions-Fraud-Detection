# 💳 Credit Card Fraud Detection Using SQL

This project simulates how SQL can be used to detect potentially fraudulent credit card transactions — similar to how financial institutions might perform early-stage fraud checks.  
The dataset includes 50,000 synthetic transactions featuring cardholder, merchant, and transaction details, along with embedded fraud indicators.

The goal is to demonstrate practical SQL techniques for identifying suspicious activity patterns — using SQL alone, without machine learning or external tools.

---

##  Project Structure

fraud-detection-sql/
│
├── data/
│ └── fraud_sql_project_merged_dataset_fixed.csv
│
├── sql/
│ └── fraud_detection_queries.sql
│
├── README.md

---

##  Dataset Overview

The dataset includes fields such as:

- **User and Card Details:** `user_id`, `card_id`, `merchant_id`
- **Transaction Info:** `amount`, `currency`, `status`, `transaction_time`, `transaction_country`
- **Merchant Info:** `category`, `merchant_name`, `country_code`
- **Card Metadata:** `card_type`, `status_card`
- **Fraud Flags:**
  - `flag_high_amount`
  - `flag_cross_country_quick`
  - `flag_declined`

---

##  SQL Concepts Applied

- Table joins (user, card, merchant, and transaction data)
- Aggregations: `SUM`, `COUNT`, `AVG`, `MAX`
- Filtering and conditional logic using `WHERE`, `HAVING`, and `CASE WHEN`
- **Window functions:** `LAG()` to analyze user behavior over time
- **Common Table Expressions (CTEs)** for modular query design
- **Views** to create reusable fraud logic for reporting or dashboards

---

##  Key Fraud Detection Scenarios

- **Frequent Declines:** Identify users with three or more declined transactions within a single day  
- **Geo-Velocity Detection:** Detect transactions from different countries within 24 hours  
- **Rapid Repeated Purchases:** Highlight automated or bot-like transaction patterns  
- **Gambling Risk Analysis:** Identify high-frequency users with gambling merchants  
- **High-Amount Validation:** Check consistency between flagged and actual high-value transactions  
- **Cross-Risk Profiles:** Combine geography and spending patterns to identify risky users  
- **User-Level Timeline Review:** Explore individual transaction sequences over time  
- **Reusable View:** Create a `suspicious_users` view for ongoing analysis or Power BI dashboards

---

## ⚙️ How to Run This Project

1. **Install MySQL** (via MySQL Workbench or command-line tools)

2. **Create a new schema:**

   ```sql
   CREATE DATABASE fraud_project;
   USE fraud_project;
Set up the table structure using queries from fraud_detection_queries.sql

Import the dataset:

Option A: Use MySQL Workbench’s Import Wizard

Option B: Run the command below:

SQL (Copy Code):

LOAD DATA LOCAL INFILE 'path_to/fraud_sql_project_merged_dataset_fixed.csv'
INTO TABLE transactions_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Execute SQL queries from fraud_detection_queries.sql to perform the fraud analysis.

About This Project

This portfolio project demonstrates how SQL alone can be used to explore and detect fraud-like behavior in transactional data.
It focuses on data analysis, logic design, and pattern detection rather than machine learning or production deployment.

