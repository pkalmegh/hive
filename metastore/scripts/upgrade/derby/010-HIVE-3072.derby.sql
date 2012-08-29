CREATE TABLE "APP"."SKEWED_STRING_LIST" ("STRING_LIST_ID" BIGINT NOT NULL);

ALTER TABLE "APP"."SKEWED_STRING_LIST" ADD CONSTRAINT "SKEWED_STRING_LIST_PK" PRIMARY KEY ("STRING_LIST_ID");

CREATE TABLE "APP"."SKEWED_STRING_LIST_VALUES" ("STRING_LIST_ID" BIGINT NOT NULL, "STRING_LIST_VALUE" VARCHAR(256), "INTEGER_IDX" INTEGER NOT NULL);

ALTER TABLE "APP"."SKEWED_STRING_LIST_VALUES" ADD CONSTRAINT "SKEWED_STRING_LIST_VALUES_PK" PRIMARY KEY ("STRING_LIST_ID");

ALTER TABLE "APP"."SKEWED_STRING_LIST_VALUES" ADD CONSTRAINT "SKEWED_STRING_LIST_VALUES_FK1" FOREIGN KEY ("STRING_LIST_ID") REFERENCES "APP"."SKEWED_STRING_LIST" ("STRING_LIST_ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE "APP"."SKEWED_COL_NAMES" ("SD_ID" BIGINT NOT NULL, "SKEWED_COL_NAME" VARCHAR(256), "INTEGER_IDX" INTEGER NOT NULL);

ALTER TABLE "APP"."SKEWED_COL_NAMES" ADD CONSTRAINT "SKEWED_COL_NAMES_PK" PRIMARY KEY ("SD_ID", "INTEGER_IDX");

ALTER TABLE "APP"."SKEWED_COL_NAMES" ADD CONSTRAINT "SKEWED_COL_NAMES_FK1" FOREIGN KEY ("SD_ID") REFERENCES "APP"."SDS" ("SD_ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE "APP"."SKEWED_COL_VALUE_LOCATION_MAPPING" ("SD_ID" BIGINT NOT NULL, "STRING_LIST_ID_KID" BIGINT NOT NULL, "LOCATION" VARCHAR(4000));

ALTER TABLE "APP"."SKEWED_COL_VALUE_LOCATION_MAPPING" ADD CONSTRAINT "SKEWED_COL_VALUE_LOCATION_MAPPING_PK" PRIMARY KEY ("SD_ID", "STRING_LIST_ID_KID");

ALTER TABLE "APP"."SKEWED_COL_VALUE_LOCATION_MAPPING" ADD CONSTRAINT "SKEWED_COL_VALUE_LOCATION_MAPPING_FK1" FOREIGN KEY ("SD_ID") REFERENCES "APP"."SDS" ("SD_ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "APP"."SKEWED_COL_VALUE_LOCATION_MAPPING" ADD CONSTRAINT "SKEWED_COL_VALUE_LOCATION_MAPPING_FK2" FOREIGN KEY ("STRING_LIST_ID_KID") REFERENCES "APP"."SKEWED_STRING_LIST" ("STRING_LIST_ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE "APP"."SKEWED_VALUES" ("SD_ID_OID" BIGINT NOT NULL, "STRING_LIST_ID_EID" BIGINT NOT NULL, "INTEGER_IDX" INTEGER NOT NULL);

ALTER TABLE "APP"."SKEWED_VALUES" ADD CONSTRAINT "SKEWED_VALUES_PK" PRIMARY KEY ("SD_ID_OID", "INTEGER_IDX");

ALTER TABLE "APP"."SKEWED_VALUES" ADD CONSTRAINT "SKEWED_VALUES_FK1" FOREIGN KEY ("SD_ID_OID") REFERENCES "APP"."SDS" ("SD_ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "APP"."SKEWED_VALUES" ADD CONSTRAINT "SKEWED_VALUES_FK2" FOREIGN KEY ("STRING_LIST_ID_EID") REFERENCES "APP"."SKEWED_STRING_LIST" ("STRING_LIST_ID") ON DELETE NO ACTION ON UPDATE NO ACTION;