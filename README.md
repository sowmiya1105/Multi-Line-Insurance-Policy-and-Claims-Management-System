# 🛡️ Multi-Line Insurance Policy and Claims Management System

## 📋 Project Overview

The **Multi-Line Insurance Policy and Claims Management System** is an enterprise-grade Salesforce CRM solution designed for insurance carriers managing **Auto, Home (Property), and Life insurance**.

The system digitizes and automates the complete insurance policy and claims lifecycle, including:

* Policy and underwriting management
* Dynamic risk-based premium calculation
* First Notice of Loss (FNOL) and claim intake
* Intelligent claim triage and routing
* Automated regulatory and regional routing
* High-value claim approval workflows
* Claims adjuster management
* Interactive Lightning dashboards
* Role-based security and access control
* Reports and analytical dashboards

The solution replaces fragmented spreadsheets, manual queue sorting, and offline email-based authorization processes with a centralized Salesforce platform using **Salesforce Flows, Approval Processes, Validation Rules, Apex, Lightning Web Components (LWC), Permission Sets, Queues, and Public Groups**.

---

## 👥 Team Details

| Role        | Name              | Email                                                             |
| ----------- | ----------------- | ----------------------------------------------------------------- |
| Team Lead   | Sowmiyavasan S    | [sowmiyavasan1105@gmail.com](mailto:sowmiyavasan1105@gmail.com)   |
| Team Member | Abiramai M        | [abimaran93341@gmail.com](mailto:abimaran93341@gmail.com)         |
| Team Member | Ameera Thabasum J | [ameerathabasum29@gmail.com](mailto:ameerathabasum29@gmail.com)   |
| Team Member | Varsha            | [varshasangeetha23@gmail.com](mailto:varshasangeetha23@gmail.com) |
| Team Member | Swathi Mithra A   | [swathimithraa@gmail.com](mailto:swathimithraa@gmail.com)         |

### Team ID

`SWTID-2026-4462`

### Platform

**Salesforce Developer Edition – Lightning Experience**

### Academic Year

**2026**

---

## 🎥 Demo

**Demo Link:**
[Add / Open Demo Link]

---

## 🎯 Project Objectives

The main objectives of the project are:

* Automate insurance quoting and underwriting processes.
* Calculate risk-based premiums dynamically.
* Automatically categorize and route incoming claims.
* Route claims to specialized Auto, Life, and Property queues.
* Enforce approval requirements for high-value claims.
* Provide adjusters with an integrated claims workspace.
* Reduce manual claim sorting and processing.
* Implement least-privilege, role-based security.
* Provide real-time operational reports and dashboards.
* Improve claim processing speed and auditability.

---

## ⭐ Key Features

### 🏠 Multi-Line Insurance Management

The system supports three major insurance lines:

* Auto Insurance
* Home / Property Insurance
* Life Insurance

Custom Salesforce objects and record types are used to manage policy and claim information.

---

### 💰 Dynamic Premium Calculation

The Apex service class **`PremiumCalculator.cls`** calculates insurance premiums based on risk-related factors.

For property insurance, the calculation considers:

* Property square footage
* Year built
* State

For auto insurance, the calculation considers:

* Vehicle model year
* Vehicle type
* Vehicle age

---

### 🔄 Intelligent Claim Routing

The **`ClaimRoutingFlow`** automatically routes newly created claims according to their insurance line.

Claims are automatically assigned to:

* **Auto Queue**
* **Life Queue**
* **Property Queue**

This eliminates manual claim sorting and improves workload distribution.

---

### 💵 High-Value Claim Approval

Claims exceeding **$50,000** are automatically sent through a formal Salesforce Approval Process.

The process:

1. Detects claims above $50,000.
2. Locks the claim record.
3. Changes the status to `Pending Approval`.
4. Sends an alert to Claims Management.
5. Allows the manager to approve or reject the claim.
6. Records the approval or rejection history.

---

### 📊 Claims Adjuster Dashboard

The project includes custom Lightning Web Components:

* `claimsDashboardLwc`
* `claimTileLwc`

The dashboard provides:

* Total Open Claims
* Pending Approval Value
* Resolved Today
* Claim status filtering
* Claim severity information
* Policy details
* Financial loss information
* Approve / Investigate actions

---

## 🗂️ Custom Objects

### 📄 Policy__c

The **Policy__c** object stores insurance policy information.

Important fields include:

* Policy Number
* Customer
* Policy Type
* Policy State
* Policy Start Date
* Policy Term
* Premium
* Square Footage
* Year Built
* VIN

Supported policy types:

* Auto
* Home
* Life

---

### 📑 Claim__c

The **Claim__c** object stores casualty and insurance claim information.

Important fields include:

* Claim Number
* Policy
* Claim Amount
* Approval Status
* Date of Loss
* Claim Description
* Owner / Queue

Claim approval statuses include:

* New
* Pending Approval
* Approved
* Rejected

---

## 🔄 Salesforce Automation

Salesforce Flow Builder is used to automate important insurance processes.

### 1. ClaimRoutingFlow

A record-triggered Flow that automatically evaluates the policy line of business and assigns the claim to the appropriate queue.

### 2. AutoQuotingFlow

A screen Flow that guides insurance agents through the quoting process and invokes the premium calculation logic.

### 3. Claim Policy Holder State Update

A record-triggered Flow that copies the policy state to the related claim record.

### 4. Claim_Approver_Screen_Flow

A screen Flow that allows managers to review and approve or reject claims.

### 5. Submission_Automation_Flow

An autolaunched Flow that sends claimant confirmation emails and creates follow-up investigation tasks.

---

## 💻 Apex Development

### PremiumCalculator.cls

The **PremiumCalculator** Apex service layer performs dynamic premium calculations based on insurance risk factors.

### ClaimsAdjusterController.cls

The **ClaimsAdjusterController** Apex controller provides server-side functionality for the Claims Dashboard LWC.

It uses:

* `@AuraEnabled`
* `WITH SECURITY_ENFORCED`
* Optimized SOQL queries
* Secure claim status updates

### Apex Testing

The project includes an Apex test class:

**`ClaimsAdjusterControllerTest`**

The test suite achieved:

* **95.8% code coverage**
* **0 test failures**

This exceeds Salesforce's 75% minimum deployment requirement.

---

## 🎨 Lightning Experience & UI/UX

A custom Lightning application called:

**Insurance Claims Console**

was created with navigation for:

* Policies
* Claims
* Adjuster Dashboard
* Analytical Reports

Custom Lightning Record Pages were also configured for Policy and Claim records.

---

## 📈 Reports & Dashboards

The project includes analytical reports such as:

1. **Open Claims by Status**
2. **High-Value Claims Awaiting Executive Sign-Off**
3. **Premium Portfolio Distribution by Line**

These reports support management monitoring and provide real-time visibility into insurance operations.

---

## 🔐 Security & Access Control

The system follows a least-privilege security model using Salesforce security features.

### Role Hierarchy

```text
CEO
  ↓
VP of Claims
  ↓
Claims Managers
  ↓
Claims Adjusters
```

### Permission Sets

#### Insurance_Agent_Access

* CRUD access to `Policy__c`
* Read-only access to `Claim__c`
* Access to AutoQuotingFlow

#### Claims_Adjuster_Access

* Read access to `Policy__c`
* Read/Edit/Update access to `Claim__c`
* Adjuster Dashboard access

#### Claims_Manager_Access

* Full CRUD access to Policy and Claim objects
* Approval administration
* Queue management

---

## 📬 Specialized Queues

Three workload queues are configured for claims:

### 🚗 Auto Queue

Handles:

* Collision claims
* Comprehensive claims
* Bodily injury vehicle claims

### ❤️ Life Queue

Handles:

* Term life claims
* Whole life claims
* Disability claim reviews

### 🏠 Property Queue

Handles:

* Residential property losses
* Commercial structure losses
* Hazard-related losses

---

## 🌎 Regional Public Groups

Regional Public Groups are used for territory-based access.

### California Adjusters

Handles claims associated with California jurisdiction.

### Texas Adjusters

Handles claims associated with Texas jurisdiction.

This provides controlled regional visibility without exposing the complete insurance portfolio.

---

## ✅ Validation Rules

Several validation rules were implemented to maintain data integrity.

### Date of Loss Validation

Prevents claims from being created with a future date of loss.

### Positive Claim Amount

Ensures that the requested claim amount is greater than zero.

### Auto VIN Validation

Ensures that Auto insurance records contain a valid 17-character VIN.

### Property Year Validation

Ensures that the property construction year falls within a valid historical range.

---

## 🧪 System Testing

End-to-end testing verified that:

* Policies calculate dynamic premiums correctly.
* Newly submitted claims are automatically routed to queues.
* Claims above $50,000 enter the approval process.
* Adjuster dashboards update claim statuses correctly.
* Permission sets and regional access work as intended.
* Apex test execution completes successfully.

### Verification Summary

| Component                     | Status           |
| ----------------------------- | ---------------- |
| Policy__c & Claim__c          | ✅ PASSED         |
| Custom Fields & Relationships | ✅ PASSED         |
| 5 Active Flows                | ✅ PASSED         |
| High-Value Approval Process   | ✅ PASSED         |
| 3 Permission Sets             | ✅ PASSED         |
| 3 Workload Queues             | ✅ PASSED         |
| Regional Public Groups        | ✅ PASSED         |
| Apex Unit Tests               | ✅ PASSED – 95.8% |
| Lightning Web Components      | ✅ PASSED         |
| Sample Data Portfolio         | ✅ PASSED         |

---

## 🚀 Deployment

The project uses Salesforce DX / SFDX deployment practices.

Basic deployment workflow:

```bash
# Clone repository
git clone <repository-url>

# Navigate to project
cd <project-folder>

# Authenticate with Salesforce
sf org login web --alias myInsuranceOrg --set-default

# Deploy metadata
sf project deploy start --source-dir force-app/

# Assign permission sets
sf org assign permset --name Insurance_Agent_Access
sf org assign permset --name Claims_Adjuster_Access
sf org assign permset --name Claims_Manager_Access

# Run Apex tests
sf apex run test --class-names ClaimsAdjusterControllerTest --code-coverage --result-format human
```

---

## 📚 Technology Stack

| Layer          | Technology                                              |
| -------------- | ------------------------------------------------------- |
| Cloud Platform | Salesforce Developer Edition                            |
| CRM            | Salesforce Lightning Experience / Customer 360          |
| Backend        | Apex                                                    |
| Automation     | Salesforce Flow Builder                                 |
| UI             | Lightning Web Components (LWC)                          |
| Security       | Profiles, Roles, Permission Sets, Queues, Public Groups |
| Data           | Custom Salesforce Objects                               |
| Analytics      | Salesforce Reports & Dashboards                         |
| Deployment     | Salesforce CLI / SFDX                                   |

---

## 📌 Project Outcomes

The Multi-Line Insurance Policy and Claims Management System successfully demonstrates an enterprise-grade Salesforce implementation.

The system provides:

* Automated insurance policy management
* Dynamic premium calculation
* Automated claim routing
* High-value claim governance
* Adjuster-focused Lightning dashboards
* Role-based security
* Regional access control
* Automated notifications and tasks
* Analytical reports and dashboards
* Comprehensive Apex testing

The implementation demonstrates how Salesforce declarative automation and programmatic development can work together to create a secure and scalable insurance management platform.

---

## 🔮 Future Enhancements

Future enhancements identified for the project include:

* Einstein AI for automated damage image classification.
* Experience Cloud portal for policyholders to submit FNOL reports.
* External payment gateway integration for automated settlement disbursements.

---

## 👥 Project Team

**Team ID:** `SWTID-2026-4462`

**Platform:** Salesforce Developer Edition – Lightning Experience

**Academic Year:** 2026

---

### 🔗 Demo

**Demo Link:**
Add the project demonstration link here.
