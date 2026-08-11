# Clean Architecture · .NET + Angular Integrated Host (with .NET Aspire)

A **Clean Architecture starter template** that hosts an Angular SPA directly
from an ASP.NET Core application — served together on a single port — and is
orchestrated end-to-end with **.NET Aspire**. This is an infrastructure /
architecture template: it intentionally contains **no business domain
logic**. It exists as a reusable, production-style starting point for new
full-stack .NET + Angular solutions.

> Looking for a project with real business logic (DDD, CQRS, and domain
> rules)? See **[NovaCommerce](#)** — a full e-commerce implementation built
> on top of these same architectural principles.

## Why this template exists

Most "Clean Architecture" starters only cover the backend. This one also
solves a problem full-stack .NET teams run into constantly: **how do you
serve an Angular SPA from ASP.NET Core without dealing with CORS, separate
ports, or a second hosting process?** This template answers that, and adds
**.NET Aspire** on top so the whole solution (API + Angular host + any future
services) can be run, discovered, and observed as a single distributed
application from one entry point.

## What this demonstrates

- **Clean Architecture** layering — clear separation between Domain,
  Application, Infrastructure, and Presentation, with dependencies pointing
  inward
- **Integrated SPA hosting** — the Angular app is built and served directly
  by ASP.NET Core on a single port, no CORS configuration required
- **.NET Aspire orchestration** — `AppHost` composes and runs the API and the
  Angular host together, with `ServiceDefaults` providing shared
  configuration for health checks, service discovery, resilience, and
  telemetry across projects
- **SQL Server integration** via EF Core in the Infrastructure layer
- A structure ready to extend with real domain logic, CQRS, or additional
  services

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | .NET, ASP.NET Core |
| Frontend | Angular |
| Database | SQL Server (EF Core) |
| Orchestration | .NET Aspire (AppHost + ServiceDefaults) |
| Architecture | Clean Architecture |

## Project Structure

```
Src/
├── 1.Core/
│   ├── AngularApp.Core.Domain/          # Entities, business rules (template-level, no domain logic yet)
│   └── AngularApp.Core.Application/     # Use cases, interfaces, DTOs
├── 2.Infra/
│   └── AngularApp.Infra.Data/           # EF Core, SQL Server, repositories
└── 3.EndPoints/
    ├── AngularApp.EndPoint.WebApi/      # ASP.NET Core Web API
    ├── AngularApp.EndPoint.WebApp/      # Hosts and serves the built Angular SPA
    ├── AngularApp.ServiceDefaults/      # Shared Aspire service configuration (health checks, telemetry, resilience)
    └── AngularApp.AppHost/              # .NET Aspire orchestrator — runs and wires up all services
```

**Dependency direction:** `EndPoints → Infra → Core.Application → Core.Domain`
— outer layers depend on inner layers, never the reverse.

## Getting Started

### Prerequisites
- Visual Studio 2022 (17.9+) with the **.NET Aspire workload** installed
- .NET SDK (matching the solution's target version)
- Node.js (for the Angular build)
- SQL Server (local or containerized)

### Run with Visual Studio
1. Clone the repository and open `AngularApp.slnx` in Visual Studio
2. In Solution Explorer, right-click **`AngularApp.EndPoint.WebApp`** and
   select **Set as Startup Project**
3. Press **Run** (F5)
4. Visual Studio restores dependencies, builds the Angular app, and starts
   ASP.NET Core — the API and the Angular SPA are served together on the
   same port
5. The app opens automatically in your browser at the URL shown in the
   console output

> **Note:** Since this solution includes .NET Aspire, you can alternatively
> set **`AngularApp.AppHost`** as the startup project to run the full
> distributed application through the Aspire dashboard, with health checks
> and telemetry for every service visible in one place.

## Scope of this repository

This is an **architecture and infrastructure template**, not a finished
business application. It doesn't include tests or a Dockerfile, since the
goal here is to demonstrate the hosting and orchestration pattern rather
than a specific feature set. For a fully implemented project — with domain
logic, CQRS, automated tests, Docker, and CI/CD — see the flagship projects
linked from my [profile](https://github.com/KTajerbashi).
