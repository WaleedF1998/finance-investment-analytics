**Global AP & Payroll Control Framework**
Excel → SQL Automation Architecture

**Project Overview**
This project demonstrates the design and evolution of a multi-country financial control framework adaptable for NGOs, payroll providers, and global finance operations.
The framework began as an Excel-based Accounts Payable (AP) governance model and evolved into a structured payroll automation system supported by SQL-based validation and reconciliation logic.
It is designed to be scalable, modular, and adaptable across industries.

**Architecture Flow**
Raw_Input
→ Validation_Engine
→ Payment_Batch
→ EOR_Reconciliation
→ Compliance Modules
→ Control_Dashboard

**Core Layers**
1️⃣ **Raw Input Layer**
Structured transaction and payroll data source.

2️⃣ **Validation Engine (Control Layer)**
Rule-based validation including:
Required field checks
Amount validation
Currency and FX checks
VAT logic
Duplicate detection
Data blocking logic
Only validated records proceed forward.

3️⃣ **Payment Batch (Execution Layer)**
Processes only approved transactions.
Transaction-level payment queue
System-generated Batch_ID
Aggregated batch summaries

4️⃣ **EOR Reconciliation (Accounting Layer)**
Multi-country payroll reconciliation logic:
Filter by employment model
Aggregate payroll by month & country
Apply employer tax & service fees
Auto-generate invoice structure
Perform variance checks
Reconciliation status tracking

5️⃣ **Compliance Modules**
Designed for NGO and grant-based environments:
Grant Register
Donor Compliance Summary
These modules demonstrate adaptability of the framework to compliance-driven environments.

6️⃣ **Control Dashboard (Reporting Layer)**
Executive-level summary including:
Blocked vs Approved transactions
Payment execution overview
EOR reconciliation status
Risk visibility

**Technical Implementation**
**Excel Models**
Used to design and prototype the financial control framework.
**SQL Automation**
Includes:
Database setup
Validation engine logic
Payment batch processing
EOR reconciliation engine
All SQL scripts are modular and can rebuild the full system sequentially.

**Workflow Diagram**
A visual representation of the end-to-end control architecture.

**Positioning**
This framework demonstrates:
Finance transformation thinking
Payroll system logic
Multi-country compliance awareness
Structured automation design
Control-first architecture

It is adaptable to NGOs, payroll platforms, global employment providers, and finance operations teams.
