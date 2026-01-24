# Driver-Based Revenue Decomposition & Forecasting (FP&A)

## Business Question
What is driving month-over-month revenue change, and how will revenue evolve under different customer and pricing scenarios?

## Overview
This project applies a driver-based FP&A approach to decompose revenue changes into:
- Customer (volume) impact
- ARPU (price) impact

The model reconciles total revenue change back to its drivers and extends the analysis into base, upside, and downside forecast scenarios.

## Methodology
- Revenue modeled as: Customers × Implied ARPU
- ARPU calculated as Revenue / Paying Customers
- Volume impact: Δ Customers × Prior ARPU
- Price impact: Δ ARPU × Current Customers
- Reconciliation check ensures driver impacts fully explain revenue variance

## Outputs
- Monthly revenue driver decomposition
- Reconciled variance analysis (Check = 0)
- Forward-looking revenue forecast (Base / Upside / Downside)

## Tools
- Microsoft Excel
- FP&A driver-based modeling techniques
