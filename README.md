
# 💳 Credit Card Fraud Detection with SQL

This project demonstrates how SQL can be used to identify potential credit card fraud through analytical techniques. Using a realistic dataset of 50,000 transactions, I designed and executed multiple queries that simulate common fraud detection logic used in financial institutions.

---

## 📂 Project Structure

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

---

## 📊 Dataset Overview

The dataset simulates credit card transactions and includes:

- `user_id`, `card_id`, `merchant_id`
- Transaction info: `amount`, `status`, `transaction_time`, `transaction_country`
- Card details: `card_type`, `status_card`
- Merchant details: `merchant_name`, `category`, `country_code`
- Fraud indicators:
  - `flag_high_amount`
  - `flag_cross_country_quick`
  - `flag_declined`

---

## 🧠 Skills Demonstrated

| Skill                | Technique Used                                 |
|---------------------|-------------------------------------------------|
| SQL Joins           | Merge user, card, merchant, and transaction data |
| Aggregation         | `COUNT`, `SUM`, `AVG`, `MAX`                    |
| Window Functions    | `LAG()` for time-based comparisons              |
| CTEs                | Behavior analysis over session windows          |
| Filtering/Flags     | Using `CASE`, booleans, and pattern detection   |
| View Creation       | Defined `suspicious_users` for reuse            |

---

## 🕵️ Fraud Detection Queries Included

### 1. 🚩 Frequent Declines
- **Goal**: Catch users with ≥3 declined transactions in one day

### 2. 🌍 Geo-Velocity Fraud
- **Goal**: Detect users transacting in multiple countries in 24 hours

### 3. 🔁 Back-to-Back Transactions
- **Goal**: Spot automation or bot usage by time difference

### 4. 🎰 Top Gambling Spenders
- **Goal**: Flag users spending heavily in risky merchant categories

### 5. 💸 High Amount Flag Effectiveness
- **Goal**: Analyze how well the `flag_high_amount` identifies large spends

### 6. 🌐 Multi-country + High Spend Users
- **Goal**: Combine geographic and monetary anomalies

### 7. 📅 Transaction Timeline by User
- **Goal**: Manual review of user behavior over time

### 8. 🧾 Create View for Suspicious Users
- **Goal**: Reuse flagged user data in dashboards or audit workflows

---

## ⚙️ How to Run

### Requirements:
- MySQL 8.x
- MySQL Workbench
- (Optional) Power BI

### Steps:
1. Create the database:
    ```sql
    CREATE DATABASE fraud_project;
    USE fraud_project;
    ```

2. Create table structure using:
    `fraud_detection_queries.sql` (includes `CREATE VIEW` too)

3. Import the dataset:
    - File: `fraud_sql_project_merged_dataset_fixed.csv`
    - Use MySQL Workbench Import Wizard or:
      ```sql
      LOAD DATA LOCAL INFILE 'path_to_csv'
      INTO TABLE transactions_merged
      FIELDS TERMINATED BY ',' ENCLOSED BY '"'
      LINES TERMINATED BY '\n'
      IGNORE 1 ROWS;
      ```

4. Run queries from `fraud_detection_queries.sql`

---

## 📈 Optional Power BI Dashboard

Create visuals based on:
- Transactions flagged for review
- High-risk users over time
- Country-wise transaction maps
- Category-based spending trends

---

## 📌 Author Notes

This project was built to demonstrate how **pure SQL** can be used to identify fraud patterns without machine learning. Each query is designed to reflect real-world scenarios used in financial compliance and cybersecurity.

---

## 📬 Contact

Feel free to reach out via LinkedIn or GitHub if you'd like to collaborate or discuss!

