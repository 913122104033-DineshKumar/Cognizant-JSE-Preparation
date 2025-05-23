-- Query 1
SET @user_id = 1;
SET @current_date = '2025-05-25 00:00:00';

SELECT * 
FROM Events 
WHERE city = (SELECT city FROM Users WHERE Users.user_id = @user_id) 
    AND start_date > @current_date 
ORDER BY start_date ASC;

-- Query 2
