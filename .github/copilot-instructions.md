# Improvly - Project Instructions

## Project Overview

This is a mobile app to help users become funnier in real-life conversations. Users submit everyday observations or stories, optionally providing themes they want to explore. The app uses AI to generate creative association chains that connect the observation to unexpected punchlines. Users can browse their generated chains, favorite the best ones, and search through their comedy collection.

## Tech Stack

Backend: FastAPI + SQLAlchemy + UV  
Mobile: React Native  
Database: PostgreSQL  
LLM: Anthropic Claude

See `docs/architecture-design-records/` for technology selection rationale.

## Working Principles

### Pre-Implementation Review

Before implementing any code, file, or integration:

- Explain the reasoning and necessity
- If possible, explain the reasoning using a decision or design framework (e.g., YAGNI, KISS, SOLID).
- Show alternatives considered
- Wait for approval before proceeding

### Complexity Challenge

When suggesting a solution, actively question if it's the simplest approach:

- Could this be done with fewer files/dependencies?
- Is this abstraction necessary at this stage?
- What's the 80/20 solution here?

### Decision Documentation

When making architectural decisions, capture:

- What was decided
- Why (constraints, tradeoffs)
- What was explicitly rejected and why
- Migration path for later

### Performance Approach

- Make it work, make it right, then make it fast (if needed)
- Measure before optimizing (use profilers)
- Optimize bottlenecks only after they're proven

### Code Review Checklist

Before finalizing any implementation:

- Does it solve the actual problem?
- Is it the simplest solution?
- Is it readable by someone else (or future you)?
