-- Query 1
SET @user_id = 1;

SELECT * 
FROM Events 
WHERE city = (SELECT city FROM Users WHERE Users.user_id = @user_id) 
    AND status = 'upcoming'
    AND event_id IN
    (SELECT event_id FROM Registration
    WHERE user_id = @user_id)
ORDER BY start_date ASC;

-- Query 2
