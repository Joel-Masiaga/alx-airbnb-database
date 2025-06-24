-- to drop the original table if it exists
DROP TABLE IF EXISTS bookings_partitioned;

-- to create a partitioned version of the bookings table
CREATE TABLE bookings_partitioned (
    id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


-- Query to fetch bookings in 2023 (perfomance testing)
EXPLAIN SELECT * 
FROM bookings_partitioned 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
