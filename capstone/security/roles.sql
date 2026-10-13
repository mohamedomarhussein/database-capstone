CREATE ROLE app_read;
CREATE ROLE app_write;

GRANT CONNECT ON DATABASE capstone TO app_read, app_write;
GRANT USAGE ON SCHEMA public TO app_read, app_write;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_read;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_write;

-- No DELETE on audit_log — append-only
REVOKE DELETE ON audit_log FROM app_write;