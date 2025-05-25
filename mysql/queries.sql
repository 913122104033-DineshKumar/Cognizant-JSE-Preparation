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

--Query 7
SELECT u.user_id, e.event_id, e.title, f.comments
FROM Feedback f
JOIN Users u ON u.user_id = f.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating <= 5;

-- Query 8
SELECT e.event_id, e.title, s.total_session
FROM Events e
JOIN (
    SELECT event_id, COUNT(*) AS total_session
    FROM Session
    GROUP BY event_id
) s
ON e.event_id = s.event_id
WHERE e.status = 'upcoming';

-- Query 9
SELECT organizer_id, COUNT(event_id) AS number_of_events, status
FROM Events 
GROUP BY organizer_id, status; 

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

-- Query 12
SELECT event_id, COUNT(session_id) AS session_count
FROM Session
GROUP BY event_id
HAVING COUNT(*) = (
    SELECT MAX(session_count) 
    FROM (
        SELECT COUNT(*) AS session_count
        FROM Session
        GROUP BY event_id
    ) AS session_counts
);

-- Query 13
SELECT e.city, AVG(f.rating) AS average_rating
FROM Events e 
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.city; 

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

-- Query 15
SELECT
    s1.session_id AS session1_id,
    s1.start_time AS start_time,
    s1.end_time AS end_time,
    s2.session_id AS session2_id,
    s2.start_time AS start_time,
    s2.end_time AS end_time
FROM Session s1
JOIN Session s2
ON s1.event_id = s2.event_id
AND s1.session_id < s2.session_id
AND (
    s1.end_time > s2.start_time AND
    s2.end_time > s1.start_time
);

-- Query 16
SELECT user_id, full_name
FROM Users 
WHERE registration_date >= CURDATE() - INTERVAL 30 DAY
AND user_id NOT IN (
    SELECT user_id 
    FROM Registration
);

-- Query 17
SELECT speaker_name, COUNT(*)
FROM Session 
GROUP BY speaker_name
HAVING COUNT(session_id) > 1; 

-- Query 18
SELECT event_id, title
FROM Events 
WHERE event_id NOT IN (
    SELECT event_id
    FROM Resources
);

-- Query 19
SELECT e.event_id, r.total_registrations, f.average_rating
FROM Events e 
JOIN (
    SELECT event_id, COUNT(*) AS total_registrations
    FROM Registration
    GROUP BY event_id
) r
JOIN (
    SELECT event_id, AVG(rating) as average_rating
    FROM Feedback
    GROUP BY event_id
) f
ON e.event_id = r.event_id AND e.event_id = f.event_id
WHERE e.status = 'completed';

-- Query 20
SELECT u.user_id, COUNT(DISTINCT r.event_id) As registration_count, COUNT(DISTINCT f.feedback_id) as feedback_count
FROM Users u 
LEFT JOIN Registration r ON r.user_id = u.user_id
LEFT JOIN (
    SELECT event_id
    FROM Events
    WHERE status = 'completed'
) e
ON e.event_id = r.evemt_id
LEFT JOIN Feedback f ON f.user_id = u.user_id
GROUP BY u.user_id;

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
    GROUP BY user_id, event_id
    HAVING COUNT(user_id) >= 2
);

-- Query 23
SELECT MONTH(registration_date) AS registration_month, COUNT(*) AS registration_count
FROM Registration
WHERE TIMESTAMPDIFF(DAY, registration_date, CURRENT_DATE) <= 365
GROUP BY MONTH(registration_date)
ORDER BY MONTH(registration_date);

-- Query 24
SELECT event_id, AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS average_minute_difference
FROM Session s 
GROUP BY event_id
ORDER BY event_id;  

-- Query 25
SELECT event_id
FROM events
WHERE event_id NOT IN (
    SELECT event_id
    FROM session
);


