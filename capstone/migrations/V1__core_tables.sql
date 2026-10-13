CREATE TABLE customers (
    id          BIGSERIAL PRIMARY KEY,
    email       TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    full_name   TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE categories (
    id          SERIAL PRIMARY KEY,
    name        TEXT NOT NULL,
    parent_id   INT REFERENCES categories(id)
);

CREATE TABLE products (
    id          BIGSERIAL PRIMARY KEY,
    merchant_id BIGINT NOT NULL,
    sku         TEXT NOT NULL UNIQUE,
    name        TEXT NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    category_id INT REFERENCES categories(id),
    attributes  JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE orders (
    id          BIGSERIAL PRIMARY KEY,
    merchant_id BIGINT NOT NULL,
    customer_id BIGINT NOT NULL REFERENCES customers(id),
    status      TEXT NOT NULL DEFAULT 'pending'
                CHECK (status IN ('pending','paid','shipped','cancelled')),
    total       NUMERIC(12,2) NOT NULL DEFAULT 0,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE order_items (
    id          BIGSERIAL PRIMARY KEY,
    order_id    BIGINT NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id  BIGINT NOT NULL REFERENCES products(id),
    quantity    INT NOT NULL CHECK (quantity > 0),
    unit_price  NUMERIC(10,2) NOT NULL
);

CREATE TABLE payments (
    id          BIGSERIAL PRIMARY KEY,
    order_id    BIGINT NOT NULL UNIQUE REFERENCES orders(id),
    amount      NUMERIC(12,2) NOT NULL,
    method      TEXT NOT NULL,
    paid_at     TIMESTAMPTZ NOT NULL DEFAULT now()
);