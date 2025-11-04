
-- ----------------------------------------
-- CC Fraud Detection SQL Project
-- All queries below showcase fraud detection logic
-- ----------------------------------------

-- 1. Users with 3 or more declined transactions in a single day
-- Objective: Catch accounts that may be testing stolen cards
SELECT 
  user_id,
  DATE(transaction_time) AS txn_date,
  COUNT(*) AS decline_count
FROM transactions_merged
WHERE status = 'Declined'
GROUP BY user_id, txn_date
HAVING decline_count >= 3
ORDER BY decline_count DESC;

-- 2. Users transacting in multiple countries in one day
-- Objective: Detect geo-fraud by spotting country changes in a short time
SELECT 
  user_id,
  DATE(transaction_time) AS txn_date,
  COUNT(DISTINCT transaction_country) AS countries_used
FROM transactions_merged
GROUP BY user_id, txn_date
HAVING countries_used > 1
ORDER BY countries_used DESC;

-- 3. Back-to-back transactions within 2 minutes
-- Objective: Spot rapid successive transactions (automation or bot)
WITH txn_times AS (
  SELECT 
    user_id,
    transaction_time,
    LAG(transaction_time) OVER (PARTITION BY user_id ORDER BY transaction_time) AS prev_txn_time
  FROM transactions_merged
)
SELECT 
  user_id,
  transaction_time,
  prev_txn_time,
  TIMESTAMPDIFF(MINUTE, prev_txn_time, transaction_time) AS minutes_between
FROM txn_times
WHERE TIMESTAMPDIFF(MINUTE, prev_txn_time, transaction_time) BETWEEN 0 AND 2;

-- 4. Top 10 spenders at gambling merchants
-- Objective: Flag users spending heavily in risky categories
SELECT 
  user_id,
  SUM(amount) AS total_gambling_spent,
  COUNT(*) AS gambling_txns
FROM transactions_merged
WHERE category = 'Gambling'
GROUP BY user_id
ORDER BY total_gambling_spent DESC
LIMIT 10;

-- 5. High amount flag analysis
-- Objective: Review how effective our 'high amount' fraud flag is
SELECT 
  flag_high_amount,
  COUNT(*) AS txn_count,
  ROUND(AVG(amount), 2) AS avg_amount,
  MAX(amount) AS max_amount
FROM transactions_merged
GROUP BY flag_high_amount;

-- 6. Users with high spend and frequent country hopping
-- Objective: Combine monetary and geographic indicators
SELECT 
  user_id,
  COUNT(*) AS txns,
  COUNT(DISTINCT transaction_country) AS country_count,
  SUM(amount) AS total_spent
FROM transactions_merged
GROUP BY user_id
HAVING total_spent > 1000 AND country_count > 3
ORDER BY total_spent DESC;

-- 7. Timeline of transactions for a single user
-- Objective: Perform manual review on user behavior
SELECT 
  transaction_time,
  amount,
  merchant_name,
  transaction_country,
  category,
  flag_high_amount,
  flag_declined
FROM transactions_merged
WHERE user_id = 101
ORDER BY transaction_time;

-- 8. Create a view of suspicious users
-- Objective: Easily reuse list of risky users across dashboards
CREATE VIEW suspicious_users AS
SELECT user_id
FROM transactions_merged
WHERE flag_high_amount = 1 OR flag_declined = 1 OR flag_cross_country_quick = 1
GROUP BY user_id
HAVING COUNT(*) >= 5;
