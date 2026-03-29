---
applyTo: "**"
---

# Error Handling & Validation

## Fail Fast

- Raise exceptions for programmer errors (wrong types, invalid state)
- Return error responses for user errors (bad input, rate limits)

## Error Messages

- Be specific: "Email format invalid" not "Bad input"
- Include context: what operation failed, why, what to do
- Never expose internals to users (paths, queries, keys)

## Exception Patterns

- Use custom exception types for domain-specific errors
- Catch specific exception types, avoid catching all exceptions
- Always clean up resources (use language-specific patterns: try-finally, defer, RAII, etc.)
- Re-raise with context when appropriate

## Validation

- Validate all inputs at API boundaries
- Never trust user input - validate type, length, format, allowed values
- Always validate external API responses before using them
- Check: expected structure, required fields, business rules
- Treat all external data as untrusted input
