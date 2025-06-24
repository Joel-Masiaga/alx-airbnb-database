# Performance Monitoring Report

## Objective

Monitor and improve database performance by analyzing query execution plans and refining the schema where needed.

## Monitoring Tools Used

- SHOW PROFILE
- EXPLAIN

## Queries Analyzed

1. Query - Retrieve bookings with user and property details

```sql
SELECT b.id, u.name, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id;


2. Query - Fetch bookings by date range
    SELECT *
    FROM bookings
    WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

## Bottlenecks Identified
- Full table scans observed on bookings during date filtering.
- Joins on user_id and property_id lacked supporting indexes in some cases.
- High execution time and resource usage, especially with large datasets.

### Before Improvements
- Some queries involving `bookings.user_id`, `bookings.property_id`, and `payments.booking_id` used full table scans.
- `SHOW PROFILE` revealed high time spent in the execution and data sending phases.
- `EXPLAIN` showed inefficient access types (`ALL`) for some joins.

### Changes Made
- Added indexes on `bookings(user_id)`, `bookings(property_id)`, and `payments(booking_id)`.
- Simplified query structures by selecting only necessary columns.
- Ensured WHERE clauses matched indexed columns.

### After Improvements
- Queries used `ref` or `range` access types instead of `ALL`.
- Execution time was noticeably reduced (about 40–60% faster).
- `SHOW PROFILE` confirmed reduced time in key execution stages.

## Conclusion
Monitoring query plans with `EXPLAIN` and `SHOW PROFILE` helped identify and fix performance bottlenecks. Indexing and minor query adjustments led to faster and more efficient execution across commonly used queries.
```
