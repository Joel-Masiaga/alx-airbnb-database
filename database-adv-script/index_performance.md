# Index Performance Analysis

This document outlines the indexes implemented to optimize query performance and their observed impact using `EXPLAIN`.

## Identified High-Usage Columns

Based on frequent use in WHERE, JOIN, and ORDER BY clauses:

- `users.id`
- `bookings.user_id`
- `bookings.property_id`
- `bookings.start_date`
- `properties.id`

## Indexes Created

```sql
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
```
