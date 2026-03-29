---
applyTo: "docs/architecture-design-records/**"
---

# Architecture Decision Records (ADR)

Guidance for creating and maintaining architecture decision records in this project.

**Example ADR:** See `docs/architecture-design-records/001-use-postgresql-as-primary-database.md` for a complete reference implementation.

## File Naming Convention

- **Format:** `NNN-verb-object-description.md` (e.g., `001-use-postgresql-as-primary-database.md`)
- **Verb:** Present tense imperative (use, choose, implement, handle)
- **Case:** Lowercase with dashes for word separation
- **Extension:** `.md` (Markdown)

**Correct Examples:**

- `001-use-postgresql-as-primary-database.md` ✓
- `002-vector-database-selection.md` ✓
- `003-implement-user-authentication.md` ✓

**Incorrect Examples:**

- `ADR-002-Vector-Database-Selection.md` ✗ (has ADR prefix, uses Title Case)
- `002_vector_database.md` ✗ (uses underscores instead of dashes)
- `2-database.md` ✗ (missing leading zeros)

## Standard Structure

ADRs should follow this section order (adapt based on decision complexity):

1. **Status** - Current state of the decision
2. **Production Review** - Reminder to update with real-world outcomes
3. **Context** - Problem statement, requirements, team/business situation
4. **Decision** - One-sentence statement of the choice
5. **Rationale** - Why this choice, alternatives evaluated
6. **Consequences** - Outcomes from implementing the decision
7. **Superseding** - How this ADR can be replaced

## Section Details

### Status

State of the decision: Accepted | Proposed | Deprecated | Superseded

```markdown
## Status

Accepted

**Date:** 2026-03-19
**Decision-Makers:** Names (optional, for accountability)
**Review Date:** 2026-09-19 (6 months recommended)
```

### Production Review

Place immediately after Status for visibility. Reminds readers to update ADR with production learnings.

**Only include for Accepted ADRs.** Skip this section for Proposed/Draft ADRs. Add it when Status changes to Accepted.

```markdown
## Production Review

**Review Date:** 2026-09-19 (6 months post-decision)

Update this ADR with production learnings: performance metrics, scaling experiences, operational insights. Create a superseding ADR if the decision should be reversed.
```

### Context

Explain the problem and environment driving the decision.

**Include:**

- Technical requirements and constraints
- **Team Context:** Skills, experience, familiarity
- **Business Context:** Stage (MVP/growth), priorities, scale expectations, budget, timeline
- Clear problem statement

**Example:**

```markdown
### Business Context

- **Stage:** Building MVP to validate product-market fit
- **Priority:** Speed to market over premature optimization
- **Scale Expectations:** <1,000 users in first 6 months
- **Budget:** Favor proven technology to minimize operational risk
```

### Decision

One clear sentence stating what was decided.

**Example:** "We will use PostgreSQL as the primary relational database for all structured user data."

### Rationale

Explain WHY this decision makes sense. Focus on evaluation criteria and decision-making logic.

**Structure:**

- **Why [Choice]:** Key reasons with bold headers for scanability
- **Alternatives Considered:** Each alternative with pros/cons and explicit rejection reason

**Important:** Rationale explains _why we chose during evaluation_. Consequences explains _what happens after implementation_. Avoid duplication.

**Example distinction:**

- **Rationale:** "Team has PostgreSQL expertise, enabling immediate productivity"
- **Consequences:** "Established backup and monitoring patterns from team's prior experience"

### Consequences

What follows from making this decision. Focus on actual/expected outcomes.

**Include:**

- **Positive:** Benefits and advantages
- **Negative:** Tradeoffs and limitations
- **Neutral:** Operational considerations (backups, monitoring, etc.)
- **Follow-up Decisions Required:** List related ADRs (mark as "(pending)" if not yet created)

### Superseding

Explain the process for replacing this ADR when it's no longer valid.

```markdown
## Superseding

This decision remains active until superseded by a future ADR. If [technology] no longer meets our needs, create a new ADR that explicitly supersedes ADR-XXX with clear rationale for the change and migration strategy.
```

## Best Practices

**Before Committing:**

- Validate your ADR against this template (check all required sections)
- Verify filename follows naming convention (lowercase, dashes, no ADR prefix)
- Ensure Status section matches format exactly (bold labels, proper spacing)
- Production Review only for Accepted ADRs

**Structure & Content:**

- **One decision per ADR** - Split complex choices into separate ADRs
- **Timestamp everything** - Date all information, especially predictions
- **Immutable foundation** - Don't alter existing content; amend with new dated sections or supersede
- **Focus on WHY** - Future readers need reasoning, not just facts

**Context Section:**

- Include business priorities driving the decision
- Explain team composition and skills impact
- Align pros/cons with project-specific needs and goals

**Rationale vs Consequences:**

- **Rationale** = evaluation criteria at decision time ("Why we chose X")
- **Consequences** = actual/expected outcomes post-implementation ("What happens because we chose X")
- Avoid saying the same thing twice in different sections

**Production Updates:**

- Update ADR with real-world data after deployment
- Add dated sections preserving original predictions
- Compare predictions vs reality to improve future decisions

**Flexibility:**
Not every section is required for every decision. Simpler decisions can have minimal Context or skip Neutral consequences. The above structure is a comprehensive template - adapt to fit the decision's scope and impact.

## When to Create an ADR

Create an ADR when:

- Decision has long-term architectural impact
- Multiple viable alternatives exist
- Future developers need to understand the "why"
- Decision affects multiple teams or systems
- Significant cost or risk involved

Skip an ADR when:

- Decision is obviously correct (no alternatives)
- Scope is limited to single small component
- Already covered by established standards/policies
- Temporary workaround or experiment (< 3 month lifespan)

## Reference

Comprehensive ADR guidance: https://github.com/joelparkerhenderson/architecture-decision-record
