# Scalability Patterns

## The "Add One More" Check

Before finalizing any design with multiple similar fields, ask:

**"What happens when I add one more of these?"**

- Does it require changing the structure (e.g., ALTER TABLE, new code)?
- Or can I just add data (e.g., INSERT)?

**If you can add data without changing structure, change the structure now.**

**Signal**: Multiple boolean flags (`is_favorite`, `is_archived`, `is_flagged`...) or "What if we want to add..."

---

## Real Example: Improvly's `chain_labels`

### ❌ Rigid Approach

```sql
CREATE TABLE association_chains (
  id SERIAL PRIMARY KEY,
  is_favorite BOOLEAN DEFAULT FALSE,
  is_archived BOOLEAN DEFAULT FALSE,
  is_flagged BOOLEAN DEFAULT FALSE
  -- Adding "is_hidden" = ALTER TABLE + migration + code changes
);
```

### ✅ Flexible Pattern

```sql
CREATE TABLE association_chains (
  id SERIAL PRIMARY KEY,
  story_id INT NOT NULL REFERENCES stories(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE chain_labels (
  chain_id INT NOT NULL REFERENCES association_chains(id) ON DELETE CASCADE,
  label_type VARCHAR(50) NOT NULL,
  applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (chain_id, label_type)
);
```

**Why this works better:**

- New labels = INSERT, not ALTER TABLE
- Future: users could create custom labels
- Analytics-ready: `SELECT label_type, COUNT(*) GROUP BY label_type`
