-- =====================================================
-- PAYROLL AUTOMATION PROJECT
-- VALIDATION ENGINE
-- =====================================================

USE payroll_automation;


-- -----------------------------------------------------
-- 1️⃣ Base Validation Checks
-- -----------------------------------------------------
CREATE OR REPLACE VIEW validation_engine AS
SELECT 
    *,
    
    -- Required Field Validation
    CASE
        WHEN Country IS NULL OR Country = ''
          OR Name IS NULL OR Name = ''
        THEN 'FAIL'
        ELSE 'PASS'
    END AS RequiredField_Validation,

    -- Amount Validation
    CASE
        WHEN Net_Amount <= 0 THEN 'FAIL'
        ELSE 'PASS'
    END AS Amount_Validation,

    -- Currency Validation
    CASE
        WHEN Currency IS NULL OR Currency = ''
        THEN 'FAIL'
        ELSE 'PASS'
    END AS Currency_Validation,

    -- Exchange Rate Validation
    CASE
        WHEN Exchange_Rate IS NULL OR Exchange_Rate <= 0
        THEN 'FAIL'
        ELSE 'PASS'
    END AS ExchangeRate_Validation,

    -- VAT Validation
    CASE
        WHEN VAT_Applicable = 'Yes' 
             AND (VAT_Amount IS NULL OR VAT_Amount <= 0)
        THEN 'FAIL'
        ELSE 'PASS'
    END AS VAT_Validation,

    -- Bank Validation
    CASE
        WHEN Bank_Account IS NULL OR Bank_Account = ''
        THEN 'FAIL'
        ELSE 'PASS'
    END AS Bank_Validation,

    -- Duplicate Validation
    CASE
        WHEN Record_ID IN (
            SELECT Record_ID
            FROM raw_input
            GROUP BY Record_ID
            HAVING COUNT(*) > 1
        )
        THEN 'FAIL'
        ELSE 'PASS'
    END AS Duplicate_Validation

FROM raw_input;


-- -----------------------------------------------------
-- 2️⃣ Final Validation Result Layer
-- -----------------------------------------------------
CREATE OR REPLACE VIEW validation_result AS
SELECT *,
    CASE
        WHEN RequiredField_Validation = 'FAIL'
          OR Amount_Validation = 'FAIL'
          OR Currency_Validation = 'FAIL'
          OR ExchangeRate_Validation = 'FAIL'
          OR VAT_Validation = 'FAIL'
          OR Bank_Validation = 'FAIL'
          OR Duplicate_Validation = 'FAIL'
        THEN 'BLOCK'
        ELSE 'PASS'
    END AS Validation_Result
FROM validation_engine;


-- -----------------------------------------------------
-- 3️⃣ Control Summary Check
-- -----------------------------------------------------
SELECT Validation_Result, COUNT(*) AS total_records
FROM validation_result
GROUP BY Validation_Result;

SELECT COUNT(*) FROM validation_result;

SELECT Validation_Result, COUNT(*) 
FROM validation_result 
GROUP BY Validation_Result;

