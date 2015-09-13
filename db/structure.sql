CREATE TABLE "proposals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "speaker_name" varchar NOT NULL, "title" varchar NOT NULL, "description" text NOT NULL, "email" varchar NOT NULL, "phone" varchar, "bio" text NOT NULL, "website" varchar, "hash_code" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "selected" boolean DEFAULT 'f' NOT NULL, "position" integer DEFAULT 0 NOT NULL, "filepicker_url" varchar, "archived" boolean DEFAULT 'f' NOT NULL);
CREATE INDEX "index_proposals_on_created_at" ON "proposals" ("created_at");
CREATE UNIQUE INDEX "index_proposals_on_hash_code" ON "proposals" ("hash_code");
CREATE INDEX "index_proposals_on_position" ON "proposals" ("position");
CREATE TABLE "rails_admin_histories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "message" text, "username" varchar, "item" integer, "table" varchar, "month" integer(2), "year" integer(8), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_rails_admin_histories" ON "rails_admin_histories" ("item", "table", "month", "year");
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120702175322');

INSERT INTO schema_migrations (version) VALUES ('20120702183557');

INSERT INTO schema_migrations (version) VALUES ('20120704192838');

INSERT INTO schema_migrations (version) VALUES ('20120916135701');

INSERT INTO schema_migrations (version) VALUES ('20120916135924');

INSERT INTO schema_migrations (version) VALUES ('20130112162727');

INSERT INTO schema_migrations (version) VALUES ('20130122215403');

INSERT INTO schema_migrations (version) VALUES ('20130122215825');

INSERT INTO schema_migrations (version) VALUES ('20130218170602');

INSERT INTO schema_migrations (version) VALUES ('20150401002146');

