-- 1. Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.id
ORDER BY b.start_date;  

-- 2. Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    r.id AS review_id,
    r.rating,
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.id = r.property_id;

-- 3. Retrieve all users and all bookings, even if a user has no booking or a booking is not linked to a user
-- FULL OUTER JOIN using LEFT JOIN + RIGHT JOIN + UNION 

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date
FROM 
    users u
LEFT JOIN 
    bookings b ON u.id = b.user_id

UNION

SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.start_date,
    b.end_date
FROM 
    users u
RIGHT JOIN 
    bookings b ON u.id = b.user_id;


