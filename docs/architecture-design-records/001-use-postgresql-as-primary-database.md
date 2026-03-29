# ADR-001: Use PostgreSQL as Primary Relational Database

## Status

Accepted

**Date:** 2026-03-19  
**Decision-Makers:** Jesus V-C, Anonymous Investor  
**Review Date:** 2026-09-19 (6 months)

## Production Review

**Review Date:** 2026-09-19 (6 months post-decision)

Update this ADR with production learnings: performance metrics, scaling experiences, operational insights. Create a superseding ADR if the decision should be reversed.

## Context

We need to choose a primary database for the application to store structured user-generated content including:

- Stories
- Themes
- Mistakes
- Conversations
- Messages
- Reverse associations

### Requirements

- Support relational data modeling (e.g., 1 user has many stories, 1 story has many associations, 1 user has many mistakes)
- Enable complex relational queries with joins
- Support aggregation queries (e.g., how many times a story has been used)
- Provide data integrity through ACID transactions
- Allow for structured reporting

### Team Context

Current development team is most familiar with PostgreSQL.

### Business Context

- **Stage:** Building MVP to validate product-market fit with early users
- **Priority:** Speed to market over premature optimization
- **Scale Expectations:** <1,000 users in first 6 months, <10,000 by end of year 1
- **Budget:** Favor proven, well-understood technology to minimize operational risk and support costs
- **Timeline:** Need to launch within 3 months to meet investor milestones

## Decision

We will use PostgreSQL as the primary relational database for all structured user data.

## Rationale

### Why PostgreSQL

- **Team Expertise:** Development team has existing PostgreSQL experience and production knowledge, enabling immediate productivity
- **Relational Requirements:** Excellent support for foreign keys, constraints, and complex joins matches our data modeling needs
- **Mature Ecosystem:** Extensive tooling, community support, and proven scalability path
- **Flexibility:** Native JSON/JSONB support allows semi-structured data when needed while maintaining schema discipline
- **Data Integrity:** ACID compliance ensures transactional consistency
- **Future-Proofing:** Offers pgvector extension for vector embeddings/semantic search capabilities needed for planned future features (nice add-on, not a deciding factor)

### Alternatives Considered

**MySQL/MariaDB**

- Pros: Similar relational capabilities, wide adoption
- Cons: Team less familiar, slightly weaker JSON support
- Decision: PostgreSQL chosen for team expertise

**NoSQL (MongoDB, DynamoDB)**

- Pros: Flexible schema, good for rapid prototyping
- Cons: Poor support for complex relationships, struggles with joins, inadequate for structured reporting requirements
- Decision: Rejected due to core relational data requirements

## Consequences

### Positive

- Strong schema discipline ensures data quality and referential integrity
- Single database vendor reduces operational complexity during MVP phase
- Established backup, monitoring, and optimization patterns from team's prior experience

### Negative

- Schema migrations add deployment complexity (requires migration tooling)
- Less flexible than schemaless alternatives for rapidly evolving schemas
- Vertical scaling can become expensive at high scale

### Neutral

- Need to establish database migration strategy (see follow-up decisions)
- Requires backup and recovery procedures
- Need to plan for connection pooling and performance optimization

### Follow-up Decisions Required

- ADR-002: Vector database selection for semantic search (see ADR-002)
- ADR-003 (pending): PII and sensitive data handling strategy

## Superseding

This decision remains active until superseded by a future ADR. If PostgreSQL no longer meets our needs, create a new ADR that explicitly supersedes ADR-001 with clear rationale for the change and migration strategy.
