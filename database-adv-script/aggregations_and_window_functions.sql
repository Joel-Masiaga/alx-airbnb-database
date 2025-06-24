-- 1. Find total number of bookings made by each user - Aggregation
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM 
    users u
JOIN 
    bookings b ON u.id = b.user_id
GROUP BY 
    u.id, u.name
ORDER BY 
    total_bookings DESC;


-- 2. Rank properties based on total number of bookings - Window Function
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name
ORDER BY 
    booking_rank;

-- 3. Assign a row number to each booking per user - Window Function using ROW_NUMBER()
SELECT 
    b.id AS booking_id,
    b.user_id,
    u.name AS user_name,
    b.start_date,
    ROW_NUMBER() OVER (PARTITION BY b.user_id ORDER BY b.start_date) AS row_num
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
ORDER BY 
    b.user_id, row_num;