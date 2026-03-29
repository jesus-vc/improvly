//TODOLater Review this schema as it was built automatically by dbdiagram.io using the schema.dbml current file.

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar(255) UNIQUE NOT NULL,
  "name" varchar(100),
  "max_chain_limit" int NOT NULL DEFAULT 50,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "stories" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int NOT NULL,
  "title" varchar(100),
  "content" text NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "story_required_themes" (
  "id" SERIAL PRIMARY KEY,
  "story_id" int NOT NULL,
  "theme_id" int NOT NULL
);

CREATE TABLE "generation_requests" (
  "id" SERIAL PRIMARY KEY,
  "story_id" int NOT NULL,
  "status" varchar(50) NOT NULL DEFAULT 'pending',
  "error_message" text,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "themes" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar(60) UNIQUE NOT NULL
);

CREATE TABLE "association_chains" (
  "id" SERIAL PRIMARY KEY,
  "story_id" int NOT NULL,
  "created_at" timestamp NOT NULL DEFAULT (now())
);

CREATE TABLE "chain_labels" (
  "id" SERIAL PRIMARY KEY,
  "chain_id" int NOT NULL,
  "label_type" varchar(50) NOT NULL
);

CREATE TABLE "chain_themes" (
  "id" SERIAL PRIMARY KEY,
  "chain_id" int NOT NULL,
  "theme_id" int NOT NULL,
  "position" int NOT NULL,
  "is_final_theme" boolean DEFAULT false
);

CREATE INDEX "idx_required_themes_story" ON "story_required_themes" ("story_id");

CREATE UNIQUE INDEX "idx_required_themes_unique" ON "story_required_themes" ("story_id", "theme_id");

CREATE UNIQUE INDEX "idx_chain_unique_label" ON "chain_labels" ("chain_id", "label_type");

CREATE INDEX "idx_chain_labels_lookup" ON "chain_labels" ("chain_id");

CREATE UNIQUE INDEX "idx_chain_themes_order" ON "chain_themes" ("chain_id", "position");

COMMENT ON TABLE "users" IS 'User accounts with per-user chain limits';

COMMENT ON COLUMN "users"."max_chain_limit" IS 'Hard cap per story - can vary by subscription tier';

COMMENT ON TABLE "stories" IS 'User-submitted stories with CHECK constraint: LENGTH(content) <= 3500';

COMMENT ON COLUMN "stories"."content" IS 'Max 3500 chars - CHECK (LENGTH(content) <= 3500)';

COMMENT ON TABLE "story_required_themes" IS 'User-provided themes (0-5) that MUST appear as final themes. LLM generates remaining finals to reach 10 total.';

COMMENT ON TABLE "generation_requests" IS 'Tracks LLM generation attempts and errors';

COMMENT ON COLUMN "generation_requests"."status" IS 'pending, completed, failed';

COMMENT ON COLUMN "generation_requests"."error_message" IS 'Error details if failed';

COMMENT ON TABLE "themes" IS 'Deduplicated theme library (all lowercase for consistency)';

COMMENT ON COLUMN "themes"."name" IS 'Theme text stored in lowercase';

COMMENT ON TABLE "association_chains" IS 'Chain entity - represents one association chain. Serves as reference point for chain_themes and chain_labels.';

COMMENT ON TABLE "chain_labels" IS 'Flexible labeling system for chains. MVP uses "favorite" label type.';

COMMENT ON COLUMN "chain_labels"."label_type" IS 'Label type: favorite, important, archived, etc.';

COMMENT ON TABLE "chain_themes" IS 'Themes within chains (ordered, with final theme marked)';

COMMENT ON COLUMN "chain_themes"."position" IS 'Order in chain (1-4), final position connects to story';

COMMENT ON COLUMN "chain_themes"."is_final_theme" IS 'True if last theme in chain';

ALTER TABLE "stories" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "story_required_themes" ADD FOREIGN KEY ("story_id") REFERENCES "stories" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "story_required_themes" ADD FOREIGN KEY ("theme_id") REFERENCES "themes" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "generation_requests" ADD FOREIGN KEY ("story_id") REFERENCES "stories" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "association_chains" ADD FOREIGN KEY ("story_id") REFERENCES "stories" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "chain_labels" ADD FOREIGN KEY ("chain_id") REFERENCES "association_chains" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "chain_themes" ADD FOREIGN KEY ("chain_id") REFERENCES "association_chains" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "chain_themes" ADD FOREIGN KEY ("theme_id") REFERENCES "themes" ("id") DEFERRABLE INITIALLY IMMEDIATE;
