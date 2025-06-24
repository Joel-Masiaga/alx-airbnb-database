# Query Optimization Report

## Objective

Improve the performance of a complex query that retrieves bookings with user, property, and payment details.

## What I Did

I wrote an initial query that joined the `bookings`, `users`, `properties`, and `payments` tables. I used `EXPLAIN` to analyze the query plan and identify performance issues. Then, I refactored the query by selecting only necessary columns and ensuring indexes were in place on join keys.

## What I Observed

    ### Before Optimization

    - The query joined all four tables and selected many columns.
    - `EXPLAIN` showed full table scans and unnecessary data reads.
    - Query performance was slow, especially with large data.

    ### After Optimization

    - Reduced selected columns to only what was needed.
    - Ensured indexes existed on `user_id`, `property_id`, and `booking_id`.
    - Query execution became faster and more efficient.
    - `EXPLAIN` showed improved access type (using indexes).

## Conclusion

Refactoring the query and using proper indexing reduced execution time and improved performance. Selecting only required data and optimizing joins made the query more efficient for large datasets.
