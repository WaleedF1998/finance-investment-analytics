# Driver-Based Revenue Decomposition & Forecasting (FP&A)

## Business Question
What is driving month-over-month revenue change, and how will revenue evolve under different customer and pricing scenarios?

## Decision Use
Designed for FP&A / leadership reviews to:
- explain revenue movement with a reconciled bridge (no storytelling)
- identify the primary growth lever (customers vs ARPU)
- quantify scenario impact for planning (Base / Upside / Downside)

## Methodology
Revenue identity:
- Revenue = Paying Customers × ARPU
- ARPU = Revenue / Paying Customers

Driver decomposition:
- Volume impact = (Customers_t − Customers_{t-1}) × ARPU_{t-1}
- Price impact  = (ARPU_t − ARPU_{t-1}) × Customers_t

Reconciliation:
- Total revenue change = Volume impact + Price impact
- Check = (Total change − Sum of impacts) → must equal 0

## Validation & Controls
- Reconciliation check enforced (Check = 0)
- Inputs separated from calculations
- Assumptions documented and versioned
- Sensitivity checks on key drivers (ARPU, acquisition, churn)

## Outputs
- Monthly revenue bridge (price vs volume)
- Variance explanation with reconciliation
- 12-month forecast under Base / Upside / Downside scenarios

## Tools
Excel

## Status
Implemented using simulated/anonymized SaaS-style data. Documentation is written first, followed by model packaging and visuals.
