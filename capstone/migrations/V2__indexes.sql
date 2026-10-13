-- Tenant-leading indexes for multi-tenant isolation
CREATE INDEX idx_products_merchant ON products (merchant_id, created_at DESC);
CREATE INDEX idx_orders_merchant_created ON orders (merchant_id, created_at DESC);
CREATE INDEX idx_orders_customer ON orders (customer_id, created_at DESC);
CREATE INDEX idx_order_items_order ON order_items (order_id);

-- GIN index for JSONB attribute queries
CREATE INDEX idx_products_attributes ON products USING GIN (attributes);

-- Categories tree traversal
CREATE INDEX idx_categories_parent ON categories (parent_id);

-- Order status filtering
CREATE INDEX idx_orders_status ON orders (status) WHERE status <> 'shipped';