# Driver-Based Revenue Decomposition & Forecasting (FP&A)

## Business Question
What is driving month-over-month revenue change, and how will revenue evolve under different customer and pricing scenarios?

## Decision Use
Supports FP&A and leadership reviews by:
- explaining revenue movement with a reconciled bridge
- identifying the primary growth lever (customers vs ARPU)
- quantifying scenario impact for planning

## Methodology
Revenue identity:
Revenue = Paying Customers × ARPU

Driver attribution:
- Volume impact = (Customers_t − Customers_{t-1}) × ARPU_{t-1}
- Price impact  = (ARPU_t − ARPU_{t-1}) × Customers_t

Reconciliation:
Total revenue change = Volume impact + Price impact

## Validation
- Reconciliation check enforced
- Assumptions separated from calculations
- Sensitivity checks on key drivers

## Outputs
- Monthly revenue bridge
- Variance explanation
- Base / Upside / Downside forecast

## Tools
Excel

## Status
Implemented using simulated or anonymized data. Documentation precedes final model packaging.
