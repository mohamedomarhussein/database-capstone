# NoSQL Layer Justification

## Redis — Cart & Session Cache
**Why Redis:** Carts are ephemeral, high-throughput, and write-heavy.
PostgreSQL would generate excessive WAL traffic and bloat for data that
expires in minutes. Redis offers sub-millisecond reads/writes, TTL-based
expiry, and atomic operations (INCR, HSET) ideal for cart mutations.

**What it solves better than Postgres:** In-memory latency, native TTL,
no WAL/replication overhead for throwaway data.

## MongoDB — Product Catalog Variability
**Why MongoDB:** Electronics have voltage, wattage, connectors; clothing has
size, color, material. A relational schema would need hundreds of nullable
columns or constant schema migrations. MongoDB's document model handles
polymorphic product types naturally.

**Alternative in Postgres:** We kept the canonical products table in Postgres
(price, SKU, category) and used a JSONB `attributes` column for the variable
fields — this gives 90% of MongoDB's flexibility with full ACID guarantees.
MongoDB would only be justified if schema per product type became extremely
deep or needed independent scaling.

## Conclusion
Postgres remains the system of record. Redis accelerates carts. JSONB in
Postgres covers most of the NoSQL "flexibility" need — MongoDB would only be
added if we crossed ~50 distinct product schemas.