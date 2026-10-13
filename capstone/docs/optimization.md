# Query Optimization Evidence

## Query 1: List recent orders for a merchant

### 1. QUERY
```sql
SELECT id, customer_id, status, total, created_at
FROM orders
WHERE merchant_id = 1 AND status = 'paid'
ORDER BY created_at DESC
LIMIT 50;