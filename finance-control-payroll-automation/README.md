**Finance Control & Payroll Automation Framework**

Excel → SQL Automation Architecture

**Project Overview**

This project demonstrates the evolution of a multi-country financial control and payroll automation framework. It began as an Excel-based Accounts Payable governance model and was later transformed into a structured SQL-driven automation engine capable of validating, batching, and reconciling payroll data at scale.

The architecture is modular and adaptable across NGOs, payroll providers, global employment platforms, and finance operations teams.

**End-to-End Architecture**

Raw_Input
→ Validation_Engine
→ Payment_Batch
→ EOR_Reconciliation
→ Compliance Extensions
→ Control_Dashboard

Each layer serves a distinct control and automation function.

**Core Layers**

The Raw Input layer captures structured multi-country payroll and transaction data.

The Validation Engine applies rule-based controls including required field checks, amount validation, VAT verification, FX logic, and duplicate detection. Failed records are blocked to ensure only compliant data proceeds.

The Payment Batch layer processes approved transactions, generates Batch_ID values, and aggregates payments by country and period to support scalable execution.

The EOR Reconciliation layer aggregates payroll by country and month, applies employer tax and service fees, calculates invoice totals, and performs variance checks to confirm reconciliation status.

The Compliance Extensions (Grant Register and Donor Compliance modules) demonstrate adaptability for governance-driven environments.

The Control Dashboard provides executive-level visibility into approval rates, reconciliation outcomes, and operational risk indicators.

**Technical Implementation**

The framework was prototyped in Excel:

donor_and_ap_compliance_dashboard_2026.xlsx

Multi-Country_Payroll_Control_Engine.xlsx

It was then rebuilt using modular SQL scripts located in:

sql_automation/

01_setup.sql

02_validation_engine.sql

03_payment_batch.sql

04_eor_reconciliation.sql

These scripts sequentially reconstruct the database, validation logic, payment batching, and reconciliation engine.

The workflow diagram (Payroll_Automation_Workflow.drawio.png) illustrates the full architecture.

**Capabilities Demonstrated**

Finance transformation thinking

Control-first architecture design

Multi-country payroll logic

SQL-based automation

Operational scalability

Compliance adaptability
