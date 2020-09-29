-- create procedure that computes the average score for one user
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN u_id int)
BEGIN
    UPDATE users SET overall_score = (
        SELECT SUM(score) / COUNT(project_id) 
        FROM corrections 
        WHERE user_id = u_id)
    WHERE id = u_id;
END //
