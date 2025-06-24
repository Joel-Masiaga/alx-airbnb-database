-- 1. Finding the total number of bookings made by each user - Aggregation
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

-- 2. Using ROW_NUMBER() to rank properties based on total number of bookings - Window Function
SELECT 
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        p.id AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM 
        properties p
    LEFT JOIN 
        bookings b ON p.id = b.property_id
    GROUP BY 
        p.id, p.name
) AS property_bookings
ORDER BY 
    booking_rank;
