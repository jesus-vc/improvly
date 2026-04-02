# Current PR Goals

**Branch:** `test/relearn-javascript`  
**Target:** `main`

## Objective

This is a temporary sandbox environment where I want to re-learn JavaScript by implementing the checklist below. I want to review all the core building blocks of JavaScript (including the list below) for an upcoming job interview where I'll have to use JavaScript to pair program live with senior engineers.

Your goal is to help me relearn these blocks by generating code and gradually explaining topics to me as we go along.

### JavaScript Topics to Cover

- Variables: let, const
- Functions: arrow vs regular
- Objects & arrays
- Loops: for, for...of, .map(), .filter()
- Conditionals
- Destructuring
- Spread/rest (...)
- Basic async: async/await

### Learning Approach

**Format:**

- Work through topics one-by-one with exercises after each
- If pace feels slow, switch to comprehensive file with all examples
- Create separate files per topic (e.g., `01-variables.js`, `02-functions.js`)

**Explanation Style:**

- Brief reminders with code examples (assume basic familiarity)
- Detailed explanations including common pitfalls and best practices

**Practice:**

- Start with example code to read and run (Node.js)
- May switch to challenges/exercises as needed

**Context:**

- Every piece of code should relate to the Express backend or React Native mobile app
- Examples should use realistic scenarios from the Improvly project (users, observations, comedy chains, API calls)
- Prepare for live pair programming interviews with senior engineers

## Implementation Checklist

Bootstrap the Express backend with minimal infrastructure to validate the tech stack and enable end-to-end testing.

### 1. Express Application Bootstrap

**What:** Set up the minimal Express app entry point and configuration

**Components:**

- `server.js` with Express instance
- Basic CORS configuration (for future React Native app)
- Health check endpoint (GET /health)
- Environment variable loading (.env file)

**Reasoning:**

- Proves Express runs before adding complexity
- Health check enables infrastructure monitoring later
- CORS config needed for mobile app to call backend
- Environment variables keep secrets out of code (database URL, etc.)

## Success Criteria

- [x] Express server starts without errors
- [x] Health check endpoint returns 200 OK
- [x] CORS configured for mobile app origins
- [x] Environment variables load correctly
- [x] No hardcoded secrets in code

## Out of Scope (for this PR)

- Database connection
- Authentication/authorization
- Business logic endpoints
- Testing infrastructure
- Production deployment configuration

## Next Steps (Future PRs)

- Database connection (PostgreSQL + node-postgres or Prisma)
- User authentication (hardcoded user_id=1 for MVP)
- Core API endpoints (observations, chains)
- LLM integration (Anthropic Claude)
