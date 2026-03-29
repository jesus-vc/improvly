-- Development seed data for Improvly MVP
-- Creates test user for hardcoded auth (user_id=1)

-- Insert test user
INSERT INTO users (id, email, name, max_chain_limit, created_at, updated_at)
VALUES (
  1,
  'dev@improvly.local',
  'Dev User',
  50,
  NOW(),
  NOW()
)
ON CONFLICT (id) DO NOTHING;

-- Reset sequence to avoid conflicts if adding more users later
SELECT setval('users_id_seq', (SELECT MAX(id) FROM users));
