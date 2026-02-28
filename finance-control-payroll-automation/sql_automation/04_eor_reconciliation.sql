-- =====================================================
-- PAYROLL AUTOMATION PROJECT
-- EOR RECONCILIATION LOGIC
-- =====================================================

USE payroll_automation;


-- -----------------------------------------------------
-- 1️⃣ Aggregate EOR Payroll Only
-- -----------------------------------------------------
CREATE OR REPLACE VIEW eor_base AS
SELECT
    Month,
    Country,
    Currency,
    SUM(Gross_Amount) AS Expected_Payroll,
    COUNT(*) AS Employee_Count
FROM payment_batch
WHERE Employment_Model = 'EOR'
GROUP BY Month, Country, Currency;


-- -----------------------------------------------------
-- 2️⃣ Full EOR Reconciliation View
-- -----------------------------------------------------
CREATE OR REPLACE VIEW eor_reconciliation AS
SELECT
    Month,
    Country,
    Currency,

    -- Assign EOR Provider Automatically
    CASE
        WHEN Country IN ('Jordan', 'Germany') THEN 'Oyster'
        WHEN Country = 'USA' THEN 'Remote'
        WHEN Country = 'UAE' THEN 'Deel'
    END AS EOR_Provider,

    -- Generate Invoice Number
    CONCAT(
        CASE
            WHEN Country = 'Jordan' THEN 'OYS-JO-'
            WHEN Country = 'Germany' THEN 'OYS-GE-'
            WHEN Country = 'USA' THEN 'REM-US-'
            WHEN Country = 'UAE' THEN 'DEE-UA-'
        END,
        REPLACE(Month, '-', '')
    ) AS Invoice_Number,

    -- Invoice Date = End of Month
    LAST_DAY(STR_TO_DATE(CONCAT('01-', Month), '%d-%b-%y')) AS Invoice_Date,

    Employee_Count,
    Expected_Payroll,

    0.15 AS Employer_Tax_Percentage,
    0.05 AS Service_Fee_Percentage,

    -- Calculate Invoice Total
    ROUND(Expected_Payroll * (1 + 0.15 + 0.05), 2) AS Invoice_Total,

    -- Simulate Paid Amount (equal for now)
    ROUND(Expected_Payroll * (1 + 0.15 + 0.05), 2) AS Paid_Amount,

    -- Variance Calculation
    ROUND(
        ROUND(Expected_Payroll * (1 + 0.15 + 0.05), 2)
        -
        ROUND(Expected_Payroll * (1 + 0.15 + 0.05), 2),
        2
    ) AS Variance,

    'Reconciled' AS Status

FROM eor_base;

SELECT * FROM eor_reconciliation
ORDER BY Month, Country;