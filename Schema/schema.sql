CREATE SCHEMA schema_name;

CREATE TABLE schema_name.table_name (
    column1 datatype,
    column2 datatype,
    ...
);

ALTER ROLE username SET search_path TO schema_name;


SELECT current_schema();


SHOW search_path;

SET search_path TO schema_name;
