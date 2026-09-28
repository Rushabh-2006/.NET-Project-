# .NET-Project-

# SkillBridge 🚀

**SkillBridge** is a career readiness and internship platform designed to bridge the gap between academic learning and industry demands. It enables students to analyze skill gaps, follow structured learning roadmaps, build verified projects, and match with recruiters for internships and placements.

---

## 📌 Features & Core Workflows

- **Role-Based Portals**: Tailored workflows and dashboards for **Student**, **Recruiter/Company**, **Faculty/Placement Officer**, and **Admin**.
- **Skill Gap Analysis**: Compares a student's profile against target career requirements to highlight strengths and missing skills.
- **Career Roadmaps**: Step-by-step level progression (Fundamentals → Advanced → Projects & Placement).
- **Project-Based Learning**: Skill-matched project recommendations, proof submissions, and verification workflows.
- **Internship Management**: Job/internship postings, candidate matching, application tracking, and recruiter evaluations.
- **Institutional Oversight**: Faculty monitoring of student placement readiness, activity, and verified portfolios.

---

## 🛠️ Tech Stack

- **Frontend**: ASP.NET Core MVC (Razor Views `.cshtml`), Bootstrap 5, Custom Modern CSS, Chart.js
- **Backend**: ASP.NET Core Web API & MVC Controllers
- **Data Access**: Pure ADO.NET (`MySqlConnector`) — *no ORM/EF*
- **Database**: MySQL (`skillbridge_db`)
- **Architecture**: N-Tier Clean Architecture

---

## 📂 Project Architecture

```
.
├── Database/               # SQL scripts (Schema, Seed Data, Stored Procedures)
├── SkillBridge.API/        # ASP.NET Core Web API (Services & Endpoints)
├── SkillBridge.Web/        # ASP.NET Core MVC (UI, Controllers, Razor Views)
├── SkillBridge.DataAccess/ # ADO.NET Data Repositories & Helpers
├── SkillBridge.Common/     # Shared Models, DTOs, Enums, and Utilities
└── SkillBridge.sln         # Visual Studio Solution
```

---

## 🚀 Getting Started

### 1. Prerequisites
- [.NET 8.0 SDK](https://dotnet.microsoft.com/download)
- [MySQL Server](https://dev.mysql.com/downloads/mysql/) or XAMPP / MySQL Workbench
- Visual Studio 2022 or VS Code

### 2. Database Setup
Execute the scripts in the `Database/` folder in sequential order:
1. `01_SkillBridge_Schema.sql`
2. `02_SkillBridge_SeedData.sql`
3. `03_SkillBridge_StoredProcs.sql`

Ensure your database connection string in `SkillBridge.Web/appsettings.json` and `SkillBridge.API/appsettings.json` matches your local MySQL credentials:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Port=3306;Database=skillbridge_db;Uid=root;Pwd=YOUR_PASSWORD;AllowUserVariables=True;"
}
```

### 3. Run the Solution
You can run both projects concurrently or launch from Visual Studio / Terminal:

```bash
# Terminal 1: Run Web API
dotnet run --project SkillBridge.API

# Terminal 2: Run Web Application
dotnet run --project SkillBridge.Web
```

Open your browser and navigate to `http://localhost:5000` (or configured port) to access the application.

---

## 👥 Default Demo Credentials

| Role | Email | Password |
|---|---|---|
| **Admin** | `admin@skillbridge.com` | `Admin@123` |
| **Recruiter** | `recruiter@techcorp.com` | `Recruiter@123` |
| **Faculty** | `faculty@university.edu` | `Faculty@123` |
| **Student** | `student@example.com` | `Student@123` |
