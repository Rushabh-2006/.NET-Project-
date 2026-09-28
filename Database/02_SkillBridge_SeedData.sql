-- SkillBridge Seed Data Script (02_SkillBridge_SeedData.sql)
USE `skillbridge_db`;

-- Passwords: All hashed as SHA256 of "Password123" -> '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601'

-- 1. Insert Users (Student, Recruiter, Faculty, Admin)
INSERT INTO `Users` (`Id`, `Name`, `Email`, `PasswordHash`, `Role`, `PhoneNumber`) VALUES
(1, 'Alex Student', 'student@skillbridge.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'Student', '+1-555-0101'),
(2, 'Sarah Jenkins', 'recruiter@techcorp.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'Recruiter', '+1-555-0202'),
(3, 'Dr. Alan Grant', 'faculty@university.edu', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'Faculty', '+1-555-0303'),
(4, 'Platform Admin', 'admin@skillbridge.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'Admin', '+1-555-0404'),
(5, 'Maria Chen', 'maria.student@skillbridge.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'Student', '+1-555-0105'),
(6, 'David Miller', 'david.student@skillbridge.com', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'Student', '+1-555-0106');

-- 2. Verification Badges
INSERT INTO `VerificationBadges` (`UserId`, `IsEmailVerified`, `IsPhoneVerified`, `IsLinkedInVerified`, `IsGitHubVerified`) VALUES
(1, TRUE, TRUE, TRUE, TRUE),
(2, TRUE, TRUE, TRUE, FALSE),
(3, TRUE, TRUE, TRUE, TRUE),
(4, TRUE, TRUE, TRUE, TRUE),
(5, TRUE, FALSE, TRUE, FALSE),
(6, TRUE, TRUE, FALSE, TRUE);

-- 3. Companies
INSERT INTO `Companies` (`UserId`, `CompanyName`, `Industry`, `Website`, `Location`, `Description`) VALUES
(2, 'TechCorp Systems', 'Enterprise Software', 'https://techcorp.example.com', 'Seattle, WA', 'Leading provider of cloud infrastructure and enterprise software solutions.');

-- 4. Skills Master List
INSERT INTO `Skills` (`Id`, `Name`, `Category`, `Description`) VALUES
(1, 'C#', 'Programming Languages', 'Object-oriented type-safe programming language for .NET'),
(2, 'ASP.NET Core', 'Web Frameworks', 'Cross-platform high-performance framework for building modern cloud apps'),
(3, 'SQL Server', 'Databases', 'Relational database management system'),
(4, 'Web API', 'Web Technologies', 'RESTful HTTP web service architecture'),
(5, 'Git', 'Tools & DevOps', 'Distributed version control system'),
(6, 'Entity Framework', 'ORM', 'Object-relational mapper for .NET'),
(7, 'HTML/CSS', 'Frontend', 'Standard markup and styling languages for web pages'),
(8, 'JavaScript', 'Frontend', 'Dynamic scripting language for web browser interactivity'),
(9, 'SignalR', 'Real-time Web', 'Library for adding real-time web functionality to applications'),
(10, 'React', 'Frontend Frameworks', 'JavaScript library for building user interfaces'),
(11, 'Docker', 'DevOps', 'Platform for developing, shipping, and running applications in containers'),
(12, 'MySQL', 'Databases', 'Open-source relational database management system');

-- 5. Career Goals
INSERT INTO `CareerGoals` (`Id`, `Title`, `Description`) VALUES
(1, 'ASP.NET Developer', 'Builds robust, enterprise web applications and API microservices using C# and Microsoft .NET ecosystem.'),
(2, 'Full Stack Engineer', 'Designs and delivers end-to-end web applications from frontend interfaces to backend relational databases.'),
(3, 'DevOps & Cloud Engineer', 'Automates CI/CD pipelines, containerization, and cloud infrastructure deployment.');

-- 6. Career Required Skills
INSERT INTO `CareerSkills` (`CareerGoalId`, `SkillId`) VALUES
-- ASP.NET Developer required skills
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
-- Full Stack Engineer required skills
(2, 1), (2, 4), (2, 7), (2, 8), (2, 10), (2, 12),
-- DevOps Engineer required skills
(3, 3), (3, 5), (3, 11), (3, 12);

-- 7. Roadmap Levels for ASP.NET Developer
INSERT INTO `RoadmapLevels` (`CareerGoalId`, `LevelNumber`, `LevelTitle`, `SkillId`, `Description`) VALUES
(1, 1, 'Level 1: C# Fundamentals', 1, 'Master C# syntax, OOP principles, LINQ, and collections.'),
(1, 2, 'Level 2: Database & Frontend Essentials', 3, 'Learn SQL queries, schema design, HTML5, CSS3, and JavaScript.'),
(1, 3, 'Level 3: Web API & MVC Development', 2, 'Build MVC controllers, REST Web APIs, and route configurations.'),
(1, 4, 'Level 4: ORM & Authentication', 6, 'Implement data persistence, authentication, and authorization filters.'),
(1, 5, 'Level 5: Major Project & Internship', 5, 'Deliver an end-to-end project, version control, and internship readiness.');

-- 8. Projects Master List
INSERT INTO `Projects` (`Id`, `Title`, `Difficulty`, `Description`, `RequiredSkillIds`) VALUES
(1, 'Student Management System', 'Beginner', 'CRUD web app for student records, enrollment tracking, and grade reports.', '1,3,7'),
(2, 'Online Book Marketplace', 'Intermediate', 'E-commerce platform with catalog search, shopping cart, and order processing.', '1,2,3,7,8'),
(3, 'Hospital Queue Management System', 'Advanced', 'Real-time patient queue dashboard with doctor assignments and status updates.', '1,2,3,4,9'),
(4, 'Multi-tenant SaaS Application', 'Expert', 'Multi-tenant subscription manager with RBAC, billing, and API endpoints.', '1,2,3,4,5,6,11');

-- 9. Student Profiles
INSERT INTO `StudentProfiles` (`Id`, `UserId`, `Bio`, `College`, `Degree`, `GraduationYear`, `TargetCareerGoalId`, `ReadinessScore`, `LinkedInUrl`, `GitHubUrl`) VALUES
(1, 1, 'Passionate .NET developer focused on backend architectures and high-performance Web APIs.', 'University of Technology', 'B.S. Computer Science', 2026, 1, 78.50, 'https://linkedin.com/in/alex-student', 'https://github.com/alex-student'),
(2, 5, 'Aspiring Full Stack Engineer skilled in React, JavaScript, and MySQL.', 'State University', 'B.S. Information Technology', 2026, 2, 62.00, 'https://linkedin.com/in/maria-chen', 'https://github.com/maria-chen'),
(3, 6, 'Computer Science senior building cloud infrastructure skills.', 'Tech Institute', 'B.S. Software Engineering', 2025, 3, 45.00, 'https://linkedin.com/in/david-miller', 'https://github.com/david-miller');

-- 10. Student Skills (Alex Student - Id 1)
INSERT INTO `StudentSkills` (`StudentId`, `SkillId`, `ConfidencePercentage`, `HasProjectEvidence`, `HasCertificateEvidence`, `HasAssessmentEvidence`, `HasGitHubEvidence`, `HasFacultyVerification`, `VerificationStatus`) VALUES
(1, 1, 90, TRUE, TRUE, TRUE, TRUE, TRUE, 'VERIFIED'),  -- C#
(1, 3, 85, TRUE, FALSE, TRUE, TRUE, FALSE, 'VERIFIED'), -- SQL Server
(1, 5, 80, TRUE, FALSE, FALSE, TRUE, FALSE, 'VERIFIED'),-- Git
(1, 7, 75, TRUE, FALSE, FALSE, FALSE, FALSE, 'UNVERIFIED'),-- HTML/CSS
(1, 2, 40, FALSE, FALSE, FALSE, FALSE, FALSE, 'UNVERIFIED'),-- ASP.NET Core (Needs improvement)
(1, 4, 30, FALSE, FALSE, FALSE, FALSE, FALSE, 'UNVERIFIED');-- Web API (Needs improvement)

-- 11. Certifications
INSERT INTO `Certifications` (`StudentId`, `Title`, `IssuingOrganization`, `IssueDate`, `FilePath`, `LinkedSkillId`, `VerificationStatus`, `VerificationHash`, `ReviewedByFacultyId`, `ReviewNotes`) VALUES
(1, 'Microsoft Certified: C# Specialist', 'Microsoft', '2025-06-15', '/uploads/csharp_cert.pdf', 1, 'Verified', '8f3a1c9e02b4512a87d401c9b3e1f0a2d5e781a9c3b4e5f6a7b8c9d0e1f2a3b4', 3, 'Verified official credential.');

-- 12. Internships Posted
INSERT INTO `Internships` (`Id`, `RecruiterId`, `Title`, `CompanyName`, `Location`, `Stipend`, `Description`, `RequiredSkillIds`, `MinimumMatchPercentage`) VALUES
(1, 2, '.NET Developer Intern', 'TechCorp Systems', 'Seattle, WA / Remote', '$2,500 / month', 'Develop Web API endpoints and MVC controllers for enterprise client modules.', '1,2,3,5', 65),
(2, 2, 'Full Stack Engineering Intern', 'TechCorp Systems', 'Remote', '$2,200 / month', 'Build frontend views and database queries for web applications.', '1,4,7,8,12', 60);

-- 13. Applications
INSERT INTO `Applications` (`InternshipId`, `StudentId`, `MatchPercentage`, `AutoDecision`, `FinalDecision`, `Notes`) VALUES
(1, 1, 75, 'Selected', 'Selected', 'Strong match in C#, SQL Server, and Git skills.');

-- 14. Mentorship Requests
INSERT INTO `Mentorships` (`StudentId`, `FacultyId`, `Topic`, `Status`, `Notes`) VALUES
(1, 3, 'Guidance on Web API & Microservices Architecture', 'Active', 'Dr. Grant: Recommended focusing on REST standards and repository patterns.');
