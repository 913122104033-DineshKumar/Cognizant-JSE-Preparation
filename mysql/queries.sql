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
SELECT * 
FROM Events
WHERE event_id IN (
    SELECT event_id FROM Feedback 
    GROUP BY event_id
    HAVING COUNT(*) >= 10
    AND AVG(rating) > 2
);

-- Query 3
SELECT full_name 
FROM Users
WHERE user_id IN (
    SELECT user_id 
    FROM Registration
    WHERE DATEDIFF('2025-08-01', registration_date) >= 90
);

-- Query 4
SELECT e.*, s.session_count
FROM Events e 
JOIN 
(
    SELECT event_id, COUNT(*) AS session_count
    FROM Session 
    WHERE TIME(start_time) >= '10:00:00' AND
    TIME(end_time) <= '12:00:00'
    GROUP BY event_id
) AS s 
ON e.event_id = s.event_id;

-- Query 5
SELECT city, COUNT(DISTINCT u.user_id) as registration_count
FROM Users u
JOIN Registration r
ON u.user_id = r.user_id
GROUP BY city
ORDER BY registration_count DESC
LIMIT 5;

-- Query 6
SELECT e.event_id, e.title, r.resource_count
FROM Events e 
LEFT JOIN (
    SELECT event_id, COUNT(event_id) AS resource_count
    FROM Resources 
    GROUP BY event_id
) as r
ON e.event_id = r.event_id

-- Query 10
SELECT * 
FROM Events
WHERE event_id IN (
    SELECT event_id 
    FROM Registration
)
AND 
event_id NOT IN (
    SELECT event_id
    FROM Feedback
);

-- QUERY 11
SELECT registration_date, COUNT(DISTINCT user_id) 
FROM Registration
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date; 

-- Query 14
SELECT e.event_id, r.user_count
FROM Events e 
JOIN (
    SELECT event_id, COUNT(*) as user_count
    FROM Registration
    GROUP BY event_id
) r
ON e.event_id = r.event_id
ORDER BY r.user_count DESC
LIMIT 3;

-- Query 16
SELECT user_id, full_name
FROM Users 
WHERE registration_date >= CURDATE() - INTERVAL 30 DAY
AND user_id NOT IN (
    SELECT user_id 
    FROM Registration
);

-- Query 21
SELECT user_id 
FROM feedback
GROUP BY user_id
ORDER BY COUNT(feedback_id)
LIMIT 5;

-- Query 22
SELECT * 
FROM Users 
WHERE user_id IN (
    SELECT user_id
    FROM registration
    GROUP BY user_id
    HAVING COUNT(user_id) >= 2
);

-- Query 25
SELECT event_id
FROM events
WHERE event_id NOT IN (
    SELECT event_id
    FROM session
);


