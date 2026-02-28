-- =====================================================
-- PAYROLL AUTOMATION PROJECT
-- SETUP + STRUCTURAL VALIDATION
-- =====================================================


-- -----------------------------------------------------
-- 1️⃣ Create Database (Safe Version)
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS payroll_automation;
USE payroll_automation;


-- -----------------------------------------------------
-- 2️⃣ Drop Table If Exists (So Script Can Re-run)
-- -----------------------------------------------------
DROP TABLE IF EXISTS raw_input;


-- -----------------------------------------------------
-- 3️⃣ Create raw_input Table
-- -----------------------------------------------------
CREATE TABLE raw_input (
    Record_ID INT,
    Month VARCHAR(20),
    Entity_Type VARCHAR(50),
    Payment_Type VARCHAR(50),
    Country VARCHAR(50),
    Name VARCHAR(100),
    Bank_Account VARCHAR(100),
    Invoice_Number VARCHAR(50),
    Invoice_Date VARCHAR(20),
    Due_Date VARCHAR(20),
    Currency VARCHAR(10),
    Net_Amount DECIMAL(15,2),
    VAT_Applicable VARCHAR(10),
    VAT_Rate DECIMAL(5,2),
    VAT_Amount DECIMAL(15,2),
    Gross_Amount DECIMAL(15,2),
    Exchange_Rate DECIMAL(10,4),
    Amount_CHF DECIMAL(15,2),
    Employment_Model VARCHAR(50),
    EOR_Provider VARCHAR(50)
);


-- =====================================================
-- AFTER IMPORTING CSV USING TABLE IMPORT WIZARD
-- RUN THE CHECKS BELOW
-- =====================================================


-- -----------------------------------------------------
-- 4️⃣ Total Records Check
-- -----------------------------------------------------
SELECT COUNT(*) AS total_records
FROM raw_input;


-- -----------------------------------------------------
-- 5️⃣ Duplicate Record_ID Detection
-- -----------------------------------------------------
SELECT Record_ID, COUNT(*) AS duplicate_count
FROM raw_input
GROUP BY Record_ID
HAVING COUNT(*) > 1;


-- -----------------------------------------------------
-- 6️⃣ Missing Record_ID Detection
-- -----------------------------------------------------
SELECT a.Record_ID + 1 AS missing_record_id
FROM raw_input a
LEFT JOIN raw_input b
  ON b.Record_ID = a.Record_ID + 1
WHERE b.Record_ID IS NULL
  AND a.Record_ID < (SELECT MAX(Record_ID) FROM raw_input)
ORDER BY missing_record_id;


-- -----------------------------------------------------
-- 7️⃣ Manual Audit Investigation
-- -----------------------------------------------------
SELECT * FROM raw_input WHERE Record_ID = 132;
SELECT * FROM raw_input WHERE Record_ID = 278;