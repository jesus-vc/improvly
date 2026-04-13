# Current PR Goals

**Branch:** `feature/database-connection`  
**Target:** `main`

## Objective

Connect the Express backend to PostgreSQL and validate the connection before building any models or endpoints.

## Implementation Checklist

### 2. Database Connection Layer

**What:** Set up a PostgreSQL connection pool and export a reusable db client

**Components:**

- `database.js` with connection pool creation (using `pg`)
- Connection string loaded from environment variable (`DATABASE_URL`)
- Exported db client for use across route handlers

**Reasoning:**

- Separates DB concerns from business logic (single responsibility)
- Connection pool is the Node.js equivalent of SQLAlchemy's session factory — avoids opening a new connection per request
- Environment-based connection string supports local dev → production migration
- Validates DB connectivity before building models on top of it

## Success Criteria

- [ ] Database connection pool initializes without errors
- [ ] `DATABASE_URL` loaded from `.env`, not hardcoded
- [ ] Connection verified (e.g. simple `SELECT 1` query succeeds)
- [ ] Integration test confirms DB is reachable

## Out of Scope (for this PR)

- Data models / table queries
- Authentication/authorization
- Business logic endpoints
- Production deployment configuration

## Next Steps (Future PRs)

- User authentication (hardcoded user_id=1 for MVP)
- Core API endpoints (observations, chains)
- LLM integration (Anthropic Claude)

---

## Add-on: JavaScript Re-learning

This PR is also an opportunity to reinforce JavaScript concepts through the implementation work above. Topics are covered as they naturally appear in the code rather than as isolated exercises.

### Topics in Scope for This PR

- async/await (DB queries are async)
- Modules: import/export patterns
- Error handling: try/catch with async functions

### Approach

- Examples use real Improvly code (not toy examples)
- Brief explanation + code — no need to cover every edge case
- Goal is interview readiness, not exhaustive coverage
