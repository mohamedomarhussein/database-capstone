# Backup Restore Test

## Procedure
1. Created test database: `createdb capstone_restore_test`
2. Restored latest dump:
   ```bash
   pg_restore -d capstone_restore_test /var/backups/capstone/capstone_2026-10-13.dump