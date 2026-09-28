-- SkillBridge Stored Procedures & Helper Queries (03_SkillBridge_StoredProcs.sql)
USE `skillbridge_db`;

DELIMITER //

-- Procedure to compute and update a student's readiness score
DROP PROCEDURE IF EXISTS `sp_CalculateStudentReadiness` //
CREATE PROCEDURE `sp_CalculateStudentReadiness`(IN p_StudentId INT)
BEGIN
    DECLARE v_SkillsScore DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_ProjectsScore DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_CertsScore DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_InternshipsScore DECIMAL(5,2) DEFAULT 0.00;
    DECLARE v_ProblemSolvingScore DECIMAL(5,2) DEFAULT 75.00;
    DECLARE v_GitHubScore DECIMAL(5,2) DEFAULT 65.00;
    DECLARE v_FinalReadiness DECIMAL(5,2) DEFAULT 0.00;

    -- 1. Skills score: average confidence of verified/held skills
    SELECT IFNULL(AVG(ConfidencePercentage), 0) INTO v_SkillsScore
    FROM StudentSkills WHERE StudentId = p_StudentId;

    -- 2. Projects score
    SELECT IFNULL(COUNT(*) * 25, 0) INTO v_ProjectsScore
    FROM StudentProjects WHERE StudentId = p_StudentId;
    IF v_ProjectsScore > 100 THEN SET v_ProjectsScore = 100; END IF;

    -- 3. Certifications score
    SELECT IFNULL(COUNT(*) * 30, 0) INTO v_CertsScore
    FROM Certifications WHERE StudentId = p_StudentId AND VerificationStatus = 'Verified';
    IF v_CertsScore > 100 THEN SET v_CertsScore = 100; END IF;

    -- 4. Internships score
    SELECT IFNULL(COUNT(*) * 50, 0) INTO v_InternshipsScore
    FROM Applications WHERE StudentId = p_StudentId AND FinalDecision = 'Selected';
    IF v_InternshipsScore > 100 THEN SET v_InternshipsScore = 100; END IF;

    -- Weighted composite score:
    -- Skills (30%) + Projects (25%) + Certs (15%) + Internships (15%) + Problem Solving (7.5%) + GitHub (7.5%)
    SET v_FinalReadiness = (v_SkillsScore * 0.30) + (v_ProjectsScore * 0.25) + (v_CertsScore * 0.15) + (v_InternshipsScore * 0.15) + (v_ProblemSolvingScore * 0.075) + (v_GitHubScore * 0.075);

    UPDATE StudentProfiles SET ReadinessScore = v_FinalReadiness WHERE Id = p_StudentId;
END //

DELIMITER ;
