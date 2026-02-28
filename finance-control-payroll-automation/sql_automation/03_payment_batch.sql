-- =====================================================
-- PAYROLL AUTOMATION PROJECT
-- PAYMENT BATCH LOGIC
-- =====================================================

USE payroll_automation;


-- -----------------------------------------------------
-- 1️⃣ Transaction-Level Payment Queue (Approved Records)
-- -----------------------------------------------------
CREATE OR REPLACE VIEW payment_batch AS
SELECT
    Record_ID,
    Month,
    Payment_Type,
    Name,
    Country,
    Currency,
    Gross_Amount,
    Exchange_Rate,
    Amount_CHF,
    Bank_Account,
    Employment_Model,  -- Needed for EOR filtering
    CONCAT(Month, '_', Country, '_', Payment_Type) AS Batch_ID
FROM validation_result
WHERE Validation_Result = 'PASS';


-- -----------------------------------------------------
-- 2️⃣ Payment Batch Summary (Aggregated Level)
-- -----------------------------------------------------
CREATE OR REPLACE VIEW payment_batch_summary AS
SELECT
    Batch_ID,
    Month,
    Country,
    Payment_Type,
    Currency,
    COUNT(*) AS transaction_count,
    SUM(Gross_Amount) AS total_gross_amount,
    SUM(Amount_CHF) AS total_amount_chf
FROM payment_batch
GROUP BY
    Batch_ID,
    Month,
    Country,
    Payment_Type,
    Currency;