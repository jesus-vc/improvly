---
applyTo: "**"
---

# Data Access

## Database Query Patterns

- Select specific columns, not all columns
- Avoid N+1 queries (use joins or batch queries)
- Paginate large result sets

## External Integrations

- Don't import third-party services directly in business logic
- Use abstraction layers/interfaces (Strategy pattern)
- Makes testing and provider swapping trivial
- Set appropriate timeouts for external calls
- Implement retry logic with exponential backoff
- Fail gracefully, never expose external service errors to users
