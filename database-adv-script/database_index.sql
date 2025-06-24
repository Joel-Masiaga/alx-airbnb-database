-- Create index on users.id (used in JOINs)
CREATE INDEX idx_users_id ON users(id);

-- Create index on bookings.user_id (used in JOINs and WHERE clauses)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (used in JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on properties.id (used in JOINs)
CREATE INDEX idx_properties_id ON properties(id);

-- index on start_date for filtering bookings by date
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Create index on users.id (used in JOINs)
CREATE INDEX idx_users_id ON users(id);

-- Create index on bookings.user_id (used in JOINs and WHERE clauses)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (used in JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on properties.id (used in JOINs)
CREATE INDEX idx_properties_id ON properties(id);

-- Optional: index on start_date for filtering bookings by date
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Analyze query performance after indexing
EXPLAIN ANALYZE
SELECT 
    b.id, b.start_date, b.end_date, u.name, p.name
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
WHERE 
    b.start_date BETWEEN '2023-01-01' AND '2023-12-31';

