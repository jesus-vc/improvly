---
applyTo: "**"
---

# Code Organization

## File Structure

- Group by feature/domain, not by type
  - Bad: `/models/`, `/controllers/`, `/services/`
  - Better: `/users/`, `/payments/`, `/auth/`
- Keep related code together (high cohesion, low coupling)
- Max ~200-300 lines per file; split when it feels cluttered.

## Naming Conventions

- Variables/functions: Descriptive, not cryptic
  - Bad: `proc_usr()`, `tmp`, `data`, `handle_it()`
  - Good: `authenticate_user()`, `user_email`, `response_data`
- Constants: Uppercase with underscores: `MAX_RETRY_ATTEMPTS`
- Avoid abbreviations unless universally understood (HTTP, URL, ID acceptable)
- Name length proportional to scope: loop variables can be short, module-level should be descriptive

## Function Design

- Max 10-20 lines per function (guideline)
- Limit parameters (typically 3-4); use objects/structs when needed
- Return early to reduce nesting
- One level of abstraction per function
- Pure functions when possible (same input → same output, no side effects)

## Type Safety

- Use type annotations/hints when available in the language
- Leverage static type checking tools
- Document expected types in comments if language doesn't support types
