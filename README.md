# Clean Architecture · .NET + Angular Infrastructure Template

A reusable **full-stack software infrastructure template** for building enterprise applications with **ASP.NET Core, Angular, Clean Architecture, SQL Server, Docker, and .NET Aspire**.

This repository is **not a business application**.

It does not implement a specific business domain such as CRM, ERP, E-Commerce, HRM, Finance, Inventory, or any other business process.

Instead, it provides a **pre-built technical foundation** that can be cloned and extended when starting a new full-stack .NET + Angular application.

The primary goal is to avoid rebuilding the same architectural and infrastructure foundations for every new project.

---

## Overview

`clean-architecture-angular-host` is an **Infrastructure Source Template** designed for teams and developers who want a ready-to-use foundation for new full-stack applications.

The template combines:

* Clean Architecture
* ASP.NET Core
* Angular
* Entity Framework Core
* SQL Server
* Docker
* .NET Aspire
* API infrastructure
* Dependency Injection
* Application abstractions
* Repository and Unit of Work patterns
* SPA hosting
* Authentication infrastructure
* OpenAPI / Swagger
* Health checks and service defaults
* Development and containerized execution

The Angular application is integrated into the ASP.NET Core WebApp and can be served together with the backend as a single application.

```text
                         Browser
                            │
                            ▼
                ┌─────────────────────────┐
                │   ASP.NET Core WebApp   │
                │                         │
                │   Angular SPA           │
                │   Web API               │
                │   Static Assets         │
                └────────────┬────────────┘
                             │
                             ▼
                ┌─────────────────────────┐
                │   Application Layer     │
                │   Use Cases / CQRS      │
                └────────────┬────────────┘
                             │
                             ▼
                ┌─────────────────────────┐
                │      Domain Layer       │
                │   Entities / Rules      │
                └────────────┬────────────┘
                             │
                             ▲
                ┌────────────┴────────────┐
                │    Infrastructure       │
                │ EF Core / SQL Server    │
                └─────────────────────────┘
```

---

# Purpose

The purpose of this repository is to provide a **repeatable technical foundation** for future software projects.

Instead of starting every new application with:

```text
Create ASP.NET Core project
        ↓
Create Angular project
        ↓
Configure Clean Architecture
        ↓
Configure EF Core
        ↓
Configure SQL Server
        ↓
Configure Dependency Injection
        ↓
Configure API
        ↓
Configure Angular ing
        ↓
Configure Docker
        ↓
Configure Aspire
        ↓
Configure authentication
        ↓
Configure shared infrastructure
```

a new project can start from this template:

```text
clean-architecture-angular-host
             │
             ▼
          Clone
             │
             ▼
      Rename / Configure
             │
             ▼
      Add Business Domain
             │
             ▼
      Implement Features
             │
             ▼
     Build the Application
```

The template provides the **technical foundation** while the consuming application provides the **business domain**.

---

# What This Repository Is

This repository is:

* An **Infrastructure Template**
* An **Architecture Template**
* A **Full-Stack Application Foundation**
* A **Clean Architecture baseline**
* An **ASP.NET Core + Angular hosting solution**
* A **Docker-ready application foundation**
* A **.NET Aspire-ready distributed application foundation**
* A reusable starting point for enterprise software

---

# What This Repository Is NOT

This repository is intentionally **not**:

* A CRM
* An ERP
* An HRM
* An E-Commerce application
* An Inventory Management System
* A Financial System
* A CMS
* An MRP
* A complete SaaS product
* A production business application

There is intentionally **no business domain** implemented in this repository.

For example, the template does not define business entities such as:

```text
Customer
Order
Product
Invoice
Employee
Payroll
Warehouse
Purchase
SalesOrder
```

Those concepts belong to the application that is built **on top of this template**.

---

# Infrastructure vs. Business Logic

The architectural responsibility is intentionally divided into two areas.

## Infrastructure Provided by This Template

```text
Application Infrastructure
│
├── Clean Architecture
├── ASP.NET Core
├── Angular hosting
├── Web API infrastructure
├── Dependency Injection
├── EF Core
├── SQL Server integration
├── Repository abstractions
├── Unit of Work abstractions
├── CQRS / Mediator infrastructure
├── Authentication infrastructure
├── OpenAPI / Swagger
├── Exception handling
├── Health checks
├── Service defaults
├── .NET Aspire
├── Docker
└── Application hosting
```

## Business Logic Added by the Consuming Application

```text
Business Application
│
├── Domain
│   ├── Entities
│   ├── Value Objects
│   ├── Aggregates
│   └── Business Rules
│
├── Application
│   ├── Commands
│   ├── Queries
│   ├── Use Cases
│   └── Business Workflows
│
└── Presentation
    ├── Angular Features
    ├── API Endpoints
    └── User Experience
```

This separation is intentional.

The template provides **how the application is built and hosted**.

The consuming project defines **what the application actually does**.

---

# Architectural Principles

The template follows the fundamental dependency direction of Clean Architecture:

```text
Presentation
     │
     ▼
Infrastructure
     │
     ▼
Application
     │
     ▼
Domain
```

The dependency rule is:

> **Outer layers may depend on inner layers. Inner layers should not depend on outer layers.**

The Domain layer remains independent from infrastructure and presentation concerns.

---

# Project Structure

```text
clean-architecture-angular-host/
│
├── AngularApp.slnx
├── Dockerfile
├── README.md
├── .dockerignore
├── .gitignore
│
└── Src/
    │
    ├── 1.Core/
    │   │
    │   ├── AngularApp.Core.Domain/
    │   │   └── Domain abstractions and core building blocks
    │   │
    │   └── AngularApp.Core.Application/
    │       ├── Application abstractions
    │       ├── CQRS / Mediator infrastructure
    │       ├── DTOs / Models
    │       ├── Repository abstractions
    │       ├── Unit of Work abstractions
    │       ├── Mapping
    │       ├── Validation
    │       └── Application services
    │
    ├── 2.Infra/
    │   │
    │   └── AngularApp.Infra.Data/
    │       ├── Entity Framework Core
    │       ├── SQL Server
    │       ├── Data Context
    │       ├── Repository implementations
    │       └── Persistence infrastructure
    │
    └── 3.EndPoints/
        │
        ├── AngularApp.EndPoint.WebApi/
        │   └── API infrastructure
        │
        ├── AngularApp.EndPoint.WebApp/
        │   ├── ASP.NET Core host
        │   └── Angular SPA
        │
        ├── AngularApp.ServiceDefaults/
        │   └── Shared .NET Aspire service configuration
        │
        └── AngularApp.AppHost/
            └── .NET Aspire application orchestration
```

---

# Angular Integrated Hosting

One of the primary goals of this template is to provide an integrated Angular hosting model.

Instead of deploying the Angular application as a completely separate web server, the compiled Angular application can be hosted by the ASP.NET Core WebApp.

```text
Angular Source
      │
      │ npm build
      ▼
Angular dist/
      │
      ▼
ASP.NET Core WebApp
      │
      ├── Web API
      ├── Static Assets
      └── Angular SPA
      │
      ▼
    Browser
```

This provides a simple deployment model where the frontend and backend can be delivered as one application.

It can also eliminate the need for separate frontend/backend origins in deployments where both are intentionally served from the same host.

---

# .NET Aspire

The template also includes support for **.NET Aspire**.

Aspire provides an application orchestration layer for running and observing the application's services.

```text
                .NET Aspire
                     │
          ┌──────────┴──────────┐
          │                     │
       AppHost             ServiceDefaults
          │                     │
          ├─────────────┐       │
          │             │       │
        WebApp        WebApi    │
          │             │       │
          └─────────────┴───────┘
                    │
                    ▼
               Infrastructure
```

This gives the template a foundation for evolving from a single application into a distributed application when required.

The intention is not to force a microservices architecture.

Instead, Aspire provides an orchestration foundation that can grow with the application.

---

# Database Infrastructure

The template provides infrastructure for working with:

* Entity Framework Core
* SQL Server
* Database contexts
* Repository abstractions
* Unit of Work abstractions
* Persistence configuration

The database layer is intentionally infrastructure-oriented.

No business-specific database model is imposed by the template.

The consuming application is responsible for defining its own:

```text
Entities
Relationships
Configurations
Migrations
Business Constraints
Indexes
```

---

# API Infrastructure

The Web API layer provides the foundation required for exposing application capabilities through HTTP APIs.

The template provides infrastructure for:

* Controllers
* Dependency Injection
* OpenAPI
* Swagger
* Exception handling
* Authentication infrastructure
* Authorization
* Application integration

Business-specific endpoints should be implemented by the consuming application.

For example:

```text
GET /api/customers
POST /api/orders
GET /api/products
```

do not belong to this template unless the consuming application adds them.

---

# Authentication and Authorization

The template includes authentication-related infrastructure so that applications can extend it with their own security model.

The template does not define business-specific authorization rules such as:

```text
CanApprovePurchase
CanManagePayroll
CanCancelOrder
CanEditCustomer
```

Those permissions belong to the consuming application's domain and requirements.

---

# Docker

The repository includes a multi-stage Docker build.

The overall process is:

```text
Stage 1
──────────────
Node.js
   │
   ├── npm ci
   └── Angular production build
           │
           ▼
       Angular dist


Stage 2
──────────────
.NET SDK
   │
   ├── Restore
   ├── Build
   ├── Copy Angular output
   └── Publish ASP.NET Core
           │
           ▼
       Application


Stage 3
──────────────
.NET ASP.NET Runtime
   │
   └── Published Application
```

This results in a runtime image containing the ASP.NET Core application together with the compiled Angular frontend.

The final runtime does not require Node.js to serve the already-built Angular application.

---

# Getting Started

## Prerequisites

Depending on the development workflow, you may need:

* .NET SDK compatible with the solution
* Visual Studio 2022 or another supported .NET development environment
* Node.js and npm
* Angular CLI
* SQL Server
* Docker
* Docker Compose
* .NET Aspire tooling

---

# Run the Application Locally

Clone the repository:

```bash
git clone https://github.com/KTajerbashi/clean-architecture-angular-host.git
```

Navigate into the repository:

```bash
cd clean-architecture-angular-host
```

Open the solution:

```text
AngularApp.slnx
```

The main application host is:

```text
AngularApp.EndPoint.WebApp
```

The WebApp is responsible for hosting the ASP.NET Core application and serving the compiled Angular SPA.

---

# Run with .NET Aspire

For the distributed application experience, use:

```text
AngularApp.AppHost
```

The Aspire AppHost provides the orchestration entry point for the application's services.

The Aspire dashboard can be used to observe the running application and its associated service infrastructure.

---

# Run with Docker

Build the image:

```bash
docker build -t clean-architecture-angular-host .
```

Run the container:

```bash
docker run -d \
  -p 8080:8080 \
  --name clean-architecture-angular-host \
  clean-architecture-angular-host
```

The application will then be available through the configured HTTP endpoint.

> If Docker Compose is included and configured for the current version of the repository, it can be used as the preferred multi-container development workflow.

---

# Using This Repository as a Template

This repository is intended to be **cloned and adapted**.

A typical workflow is:

```text
1. Clone the repository
        │
        ▼
2. Rename the solution and projects
        │
        ▼
3. Update namespaces
        │
        ▼
4. Configure the application
        │
        ▼
5. Define the business domain
        │
        ▼
6. Add application use cases
        │
        ▼
7. Add API endpoints
        │
        ▼
8. Add Angular features
        │
        ▼
9. Configure database
        │
        ▼
10. Add business-specific infrastructure
        │
        ▼
11. Add tests
        │
        ▼
12. Deploy the application
```

The template should become the **technical foundation** of the new application, not the final application itself.

---

# Example: Building a New Application

Imagine you want to build an Enterprise Resource Planning system.

You would start with:

```text
clean-architecture-angular-host
```

and then build the business domain on top:

```text
ERP Application
│
├── Organization
├── Employee
├── Customer
├── Supplier
├── Product
├── Inventory
├── Purchase
├── Sales
├── Invoice
└── Reporting
```

The infrastructure remains based on the template:

```text
Clean Architecture
ASP.NET Core
Angular
EF Core
SQL Server
Docker
Aspire
```

while the business domain becomes specific to the ERP application.

---

# Design Philosophy

The template follows several principles.

### 1. Infrastructure First

Common technical foundations should be implemented once and reused across projects.

### 2. Business-Agnostic Architecture

The template should not dictate a particular business domain.

### 3. Separation of Concerns

Business rules should remain separate from infrastructure and presentation concerns.

### 4. Replaceability

Infrastructure implementations should be replaceable without rewriting the core business logic.

### 5. Production-Oriented Structure

The project structure should resemble a real-world enterprise application rather than a tutorial project.

### 6. Evolutionary Architecture

The application should be able to start as a modular application and evolve as requirements grow.

---

# When to Use This Template

This repository is suitable when starting:

* Enterprise web applications
* Internal business systems
* SaaS platforms
* Administrative platforms
* Management systems
* Modular monoliths
* Large ASP.NET Core + Angular applications
* Applications that may later evolve into distributed systems

---

# When Not to Use This Template

This template may be unnecessary for:

* Small prototypes
* Simple static websites
* Small CRUD applications
* One-page applications
* Throwaway experiments
* Very small APIs

Clean Architecture and the surrounding infrastructure introduce additional structure and should be used when the expected complexity justifies it.

---

# Repository Scope

The scope of this repository is intentionally limited to:

```text
Architecture
Infrastructure
Application Hosting
Frontend Integration
Persistence Foundation
Security Foundation
Containerization
Orchestration
Observability Foundation
```

The scope intentionally excludes:

```text
Business Domain
Business Processes
Business Workflows
Business Rules
Industry-Specific Features
Production Data
Customer-Specific Requirements
```

This separation is one of the defining characteristics of the repository.

---

# Testing

This repository is an infrastructure template rather than a finished business application.

Therefore, business-level functional tests are intentionally outside its primary scope.

When using this repository to create a real application, the consuming project should add appropriate:

```text
Unit Tests
Integration Tests
API Tests
Architecture Tests
End-to-End Tests
```

The exact testing strategy should depend on the requirements of the application built on top of the template.

---

# CI/CD

The template is designed to be suitable for integration into a CI/CD pipeline.

A production implementation can add:

```text
Source Control
      │
      ▼
Build
      │
      ▼
Restore Dependencies
      │
      ▼
Angular Build
      │
      ▼
.NET Build
      │
      ▼
Tests
      │
      ▼
Docker Image
      │
      ▼
Security Scanning
      │
      ▼
Container Registry
      │
      ▼
Deployment
```

CI/CD configuration can be customized according to the target environment and deployment platform.

---

# Security Considerations

This repository provides infrastructure and should not be considered production-secure by default.

Before deploying an application built from this template, review:

* Authentication configuration
* Authorization policies
* Secrets management
* Database credentials
* HTTPS configuration
* CORS requirements
* Security headers
* Dependency vulnerabilities
* Container security
* Logging and sensitive data handling
* Environment-specific configuration

Production security requirements belong to the application and deployment environment.

---

# Configuration

Environment-specific configuration should not be hard-coded into the source code.

Typical configuration areas include:

```text
Database
Authentication
External Services
Logging
API Configuration
CORS
Application URLs
Environment Settings
```

Secrets should be supplied through an appropriate secret-management mechanism rather than committed to source control.

---

# Repository Philosophy

The key idea behind this repository can be summarized as:

```text
                    THIS REPOSITORY
                          │
                          ▼
             ┌─────────────────────────┐
             │ Technical Foundation    │
             ├─────────────────────────┤
             │ Architecture            │
             │ Infrastructure          │
             │ Hosting                 │
             │ Angular Integration     │
             │ Database Infrastructure │
             │ Docker                  │
             │ Aspire                  │
             └────────────┬────────────┘
                          │
                          ▼
                  YOUR APPLICATION
                          │
             ┌────────────┴────────────┐
             │                         │
             ▼                         ▼
       Business Domain           User Experience
       Business Rules            Angular Features
       Use Cases                 Workflows
       Processes                 UI
```

The template answers:

> **How should the application be structured, hosted, and operated?**

The application built on top of it answers:

> **What does the application actually do?**

---

# Relationship to Business Applications

A business application can be implemented on top of this repository without changing the fundamental infrastructure.

For example:

```text
clean-architecture-angular-host
            │
            ├── CRM
            ├── ERP
            ├── HRM
            ├── CMS
            ├── MRP
            ├── SCM
            └── Custom Enterprise Application
```

Each application can reuse the same technical foundation while implementing its own domain.

---

# Technology Stack

| Category             | Technology                     |
| -------------------- | ------------------------------ |
| Backend              | .NET / ASP.NET Core            |
| Frontend             | Angular                        |
| Architecture         | Clean Architecture             |
| ORM                  | Entity Framework Core          |
| Database             | SQL Server                     |
| API                  | ASP.NET Core Web API           |
| Frontend Hosting     | ASP.NET Core                   |
| Orchestration        | .NET Aspire                    |
| Containerization     | Docker                         |
| Composition          | Docker Compose                 |
| API Documentation    | OpenAPI / Swagger              |
| Dependency Injection | ASP.NET Core DI                |
| Application Pattern  | CQRS / Mediator infrastructure |

---

# Key Benefits

### Reusable

Start new applications from an established technical foundation.

### Consistent

Maintain a common architecture across multiple applications.

### Scalable

Provide a structure that can evolve as the application grows.

### Business-Agnostic

Keep the infrastructure independent from industry-specific requirements.

### Full-Stack

Combine ASP.NET Core and Angular in a unified application structure.

### Container-Ready

Build and run the application through Docker.

### Aspire-Ready

Provide a foundation for local orchestration and distributed application development.

---

# Intended Audience

This template is intended for:

* .NET developers
* Full-stack developers
* Angular developers working with ASP.NET Core
* Software architects
* Technical leads
* Enterprise application teams
* Teams building reusable application foundations

---

# Repository Status

This repository is maintained as a **reusable infrastructure and architecture template**.

It should evolve around improvements to:

```text
Architecture
Developer Experience
Infrastructure
Security
Observability
Deployment
Containerization
Testing Infrastructure
Documentation
```

rather than the addition of business-specific features.

---

# License

Add the appropriate license for your intended usage model.

If this repository is intended to be publicly reusable, an explicit open-source license is recommended.

---

# Summary

`clean-architecture-angular-host` is not a finished software product.

It is a **reusable infrastructure source template** designed to provide the technical foundation required to build modern full-stack applications with:

```text
.NET
+
ASP.NET Core
+
Angular
+
Clean Architecture
+
EF Core
+
SQL Server
+
Docker
+
.NET Aspire
```

The repository deliberately avoids implementing a specific business domain.

Its responsibility is to provide the **architecture, infrastructure, hosting model, development environment, and deployment foundation**.

The business application comes later.

```text
Infrastructure Template
          │
          ▼
       Clone
          │
          ▼
      Configure
          │
          ▼
   Define Business Domain
          │
          ▼
   Implement Application
          │
          ▼
      Deploy
```

> **Build the foundation once. Reuse it across applications.**
