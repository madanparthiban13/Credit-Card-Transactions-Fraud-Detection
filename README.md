
# Credit Card Fraud Detection Using SQL

This project demonstrates the use of structured query language (SQL) for identifying potentially fraudulent credit card transactions. The dataset consists of 50,000 synthetic transactions that include cardholder information, merchant details, transaction metadata, and basic fraud indicators.

The goal of this project is to simulate fraud detection techniques commonly used in financial institutions and payment systems, using SQL alone.

## Project Files

```
fraud-detection-sql/
│
├── data/
│   └── fraud_sql_project_merged_dataset_fixed.csv
│
├── sql/
│   └── fraud_detection_queries.sql
│
├── README.md
```

## Dataset Summary

The dataset contains fields such as:

- `user_id`, `card_id`, `merchant_id`
- Transaction details: `amount`, `currency`, `status`, `transaction_time`, `transaction_country`
- Merchant details: `category`, `merchant_name`, `country_code`
- Card metadata: `card_type`, `status_card`
- Fraud flags: 
  - `flag_high_amount`
  - `flag_cross_country_quick`
  - `flag_declined`

All data was generated to resemble real-world transaction patterns with embedded anomalies for fraud analysis.

## SQL Skills Demonstrated

- Joins between multiple tables
- Aggregation functions: `SUM`, `COUNT`, `AVG`, `MAX`
- Filtering with `WHERE`, `HAVING`, and conditional logic
- Window functions: `LAG()` for time-based behavior analysis
- Common Table Expressions (CTEs)
- View creation for reusable query logic

## Key Queries and Use Cases

1. **Frequent declines**: Identify users with three or more declined transactions in a single day.
2. **Geo-velocity detection**: Detect transactions from different countries within 24 hours.
3. **Rapid repeated purchases**: Use time differences between transactions to catch bots or automation.
4. **Gambling risk analysis**: Identify top users transacting with gambling-related merchants.
5. **High amount flag validation**: Check how well high-value flags align with actual amounts.
6. **Cross-feature fraud detection**: Combine geography and spend behavior to flag high-risk users.
7. **User-level timelines**: Manually inspect user transaction patterns over time.
8. **Reusable view**: Create a view (`suspicious_users`) for downstream analysis or dashboarding.

## How to Use This Project

1. Install MySQL and open MySQL Workbench
2. Create a new schema:
   ```sql
   CREATE DATABASE fraud_project;
   USE fraud_project;
   ```

3. Create the table structure using the queries in `fraud_detection_queries.sql`
4. Import the dataset:
   - Use the Import Wizard in MySQL Workbench
   - Or run:
     ```sql
     LOAD DATA LOCAL INFILE 'path_to/fraud_sql_project_merged_dataset_fixed.csv'
     INTO TABLE transactions_merged
     FIELDS TERMINATED BY ',' ENCLOSED BY '"'
     LINES TERMINATED BY '\n'
     IGNORE 1 ROWS;
     ```

5. Run the SQL queries from `fraud_detection_queries.sql`

## About This Project
This is an SQL portfolio project intended to demonstrate the use of core SQL skills in a realistic fraud detection scenario. The queries and structure are designed for analysis and insight, not production deployment.

