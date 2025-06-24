# Partitioning Performance Report

## Objective

Improve the performance of queries on the `bookings` table by partitioning it based on the `start_date` column.

## What I Did

I created a new `bookings_partitioned` table using RANGE partitioning by `YEAR(start_date)`, with partitions for 2020, 2021, 2022, 2023, and a default partition for future dates.

## What I Observed

    ### Before Partitioning
    - Querying bookings by date (e.g., bookings in 2023) scanned the entire table.
    - The query was slower and less efficient on large datasets.
    - `EXPLAIN` showed a full table scan (type = ALL).

    ### After Partitioning
    - The same query scanned only the relevant partition (`p2023`).
    - Query performance improved significantly (about 50% faster).
    - `EXPLAIN` showed partition pruning and better access type.

## Conclusion

Partitioning the table by `start_date` reduced the amount of data scanned and improved query speed. It’s effective for optimizing date-based queries on large datasets.
