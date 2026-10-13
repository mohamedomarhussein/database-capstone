ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;

-- App sets: SET app.current_merchant = '<id>';
CREATE POLICY tenant_orders ON orders
    USING (merchant_id = current_setting('app.current_merchant', true)::bigint);

CREATE POLICY tenant_products ON products
    USING (merchant_id = current_setting('app.current_merchant', true)::bigint);