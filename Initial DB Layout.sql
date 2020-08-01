DROP TABLE IF EXISTS "title_platform", "publisher", "review", "sales", "genre", "title", "platform";
-- DROP TABLE "title"

CREATE TABLE "platform" (
    "id" INT   NOT NULL,
    "platform_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_platform" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "title" (
    "id" INT   NOT NULL,
    "game_title" VARCHAR   NOT NULL,
    "year_released" INT   NOT NULL,
    "publisher_id" INT   NOT NULL,
    "genre_id" INT   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "genre" (
    "id" INT   NOT NULL,
    "genre" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_genre" PRIMARY KEY (
        "id"
     )
);

 CREATE TABLE "sales" (
    "title_id" INT   NOT NULL,
    "eu_sales" FLOAT   NOT NULL,
    "na_sales" FLOAT   NOT NULL,
    "jp_sales" FLOAT   NOT NULL,
    "other_sales" FLOAT   NOT NULL,
    "platform_id" INT   NOT NULL,
    CONSTRAINT "pk_sales" PRIMARY KEY (
        "title_id", "platform_id"
     )
);

CREATE TABLE "review" (
	"id" SERIAL, 
    "title_id" INT   NOT NULL,
    "source" VARCHAR   NOT NULL,
    "score" INT   NOT NULL,
    "body" VARCHAR   NOT NULL,
    "platform_id" INT   NOT NULL,
    CONSTRAINT "pk_review" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "publisher" (
    "publisher_id" INT   NOT NULL,
    "publisher" VARCHAR   NOT NULL,
    CONSTRAINT "pk_publisher" PRIMARY KEY (
        "publisher_id"
     )
);

CREATE TABLE "title_platform" (
    "title_id" INT   NOT NULL,
    "platform_id" INT   NOT NULL,
    CONSTRAINT "pk_title_platform" PRIMARY KEY (
        "title_id","platform_id"
     )
);

ALTER TABLE "title" ADD CONSTRAINT "fk_title_publisher_id" FOREIGN KEY("publisher_id")
REFERENCES "publisher" ("publisher_id");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_genre_id" FOREIGN KEY("genre_id")
REFERENCES "genre" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("id");

ALTER TABLE "sales" ADD CONSTRAINT "fk_sales_platform_id" FOREIGN KEY("platform_id")
REFERENCES "platform" ("id");

ALTER TABLE "review" ADD CONSTRAINT "fk_review_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("id");

ALTER TABLE "review" ADD CONSTRAINT "fk_review_platform_id" FOREIGN KEY("platform_id")
REFERENCES "platform" ("id");

ALTER TABLE "title_platform" ADD CONSTRAINT "fk_title_platform_title_id" FOREIGN KEY("title_id")
REFERENCES "title" ("id");

ALTER TABLE "title_platform" ADD CONSTRAINT "fk_title_platform_platform_id" FOREIGN KEY("platform_id")
REFERENCES "platform" ("id");

