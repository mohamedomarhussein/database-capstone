# Capstone Project — Requirements Summary

## Chosen Track
E-commerce Order Management System

## Overview
A PostgreSQL-backed system that manages customers, products, orders, and payments.
Uses Redis for cart/session caching and MongoDB for product catalog flexibility.

## Functional Requirements
1. Customers can register, log in, and manage their profile.
2. Products belong to categories; products can have variable attributes (size, color, voltage, etc.).
3. Customers can add items to a cart, checkout, and place orders.
4. Each order has one or more order items and a payment record.
5. All sensitive operations (order status changes, payments) must be audited.
6. Multi-tenant: each merchant sees only their own orders (Row-Level Security).

## Non-Functional Requirements
- RPO < 1 min, RTO < 5 min (streaming replication + WAL archiving)
- Sensitive fields (email, password hash) encrypted or hashed
- Least-privilege roles for app read/write
- Query p95 < 200 ms for order listing

## Entities
- customers
- products (with JSONB attributes)
- categories (self-referencing tree)
- orders
- order_items
- payments
- audit_log