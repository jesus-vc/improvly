# Database Setup

Database schema and seed data for Improvly MVP.

## Files

- **`schema.dbml`** - Source of truth (copy to [dbdiagram.io](https://dbdiagram.io) to visualize/export)
- **`seeds/dev_user.sql`** - Test user (user_id=1) for hardcoded auth

## First-Time Setup

### 1. Check PostgreSQL

```bash
which psql  # Should return path, e.g., /usr/local/bin/psql
```

If not installed: `brew install postgresql@14` (macOS)

### 2. Generate SQL from DBML

**Option A: Use dbdiagram.io (easiest)**

1. Copy contents of `schema.dbml`
2. Paste into [dbdiagram.io](https://dbdiagram.io)
3. Click Export → PostgreSQL
4. Save as `backend/database/schema.sql`

**Option B: Use DBML CLI**

```bash
npm install -g @dbml/cli
dbml2sql schema.dbml -o schema.sql
```

### 3. Create and Load Database

```bash
# Create database
createdb improvly_dev

# Load schema
psql improvly_dev < backend/database/schema.sql

# Load test user
psql improvly_dev < backend/database/seeds/dev_user.sql
```

### 4. Verify

```bash
psql improvly_dev -c "\dt"                    # List tables (should show 7)
psql improvly_dev -c "SELECT * FROM users;"   # Verify user_id=1 exists
```

## Reset Database

```bash
dropdb improvly_dev && createdb improvly_dev
psql improvly_dev < backend/database/schema.sql
psql improvly_dev < backend/database/seeds/dev_user.sql
```

## Schema Changes

1. Edit `schema.dbml`
2. Regenerate `schema.sql` (see step 2 above)
3. Reset database (no migrations in MVP)
