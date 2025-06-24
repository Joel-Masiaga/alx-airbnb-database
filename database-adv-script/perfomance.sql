-- Initial Query (Unoptimized) - to retrieve all bookings with user, property, and payment details
EXPLAIN
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.name AS property_name,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON b.id = pay.booking_id
WHERE 
    b.start_date >= '2023-01-01'
    AND b.end_date <= '2023-12-31';

-- Optimized Query - selecting fewer columns, assuming indexes exist
EXPLAIN
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON pay.booking_id = b.id
WHERE 
    b.start_date >= '2023-01-01'
    AND b.end_date <= '2023-12-31';
