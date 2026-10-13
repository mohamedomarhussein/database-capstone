# Security Checklist

- [x] **Least-privilege roles** — `app_read`, `app_write`, no superuser for apps
      (see `migrations/V4` or `security/roles.sql`)
- [x] **RLS on every multi-tenant / sensitive table** — `orders`, `products`
- [x] **Sensitive fields hashed/encrypted** — passwords stored as bcrypt hashes,
      emails optionally encrypted with pgcrypto
- [x] **Audit log on critical tables** — `orders`, `payments` (trigger-based)
- [x] **Parameterized queries only** — no string concatenation in app code
- [x] **Backups taken AND a test restore performed** — see `docs/restore_test.md`