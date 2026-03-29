---
applyTo: "**"
---

# Core Design Principles

- Universal guidelines for writing easy-to-understand, effective, maintainable, and production-level code.

## KISS (Keep It Simple)

- Choose boring, proven solutions over clever ones
- Simple > Complex > Complicated
- Ask: "What's the simplest thing that could work?"

## YAGNI (You Aren't Gonna Need It)

- Build what's needed now, refactor when needed later
- Every line of code is a liability
- Delete code aggressively

## DRY (Don't Repeat Yourself) - With Nuance

- Abstract after the 3rd duplication, not before
- Consider: Wrong abstraction > Duplication > Right abstraction
- Duplication is cheaper than wrong coupling
- Shared code creates coupling; choose wisely

## SOLID Principles (Pragmatic Application)

**Single Responsibility**

- Each function does ONE thing
- Each class/module has ONE reason to change
- Bad: `process_user_data_and_send_email()`
- Good: `process_user()` + `send_email()`

**Open/Closed (for Extension)**

- Design for swappability where it matters
- Use interfaces/protocols for external dependencies
- Don't prematurely make everything "pluggable"

**Dependency Inversion**

- Depend on abstractions for external systems (APIs, databases, file systems)
- Makes testing and swapping easier
