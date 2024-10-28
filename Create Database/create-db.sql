CREATE DATABASE learning_sql
  WITH OWNER = olo -- Owener: olo this is the user that will own the database
       ENCODING = 'UTF8' -- Encoding: UTF8 this is the encoding of the database
       TABLESPACE = pg_default -- Table space: pg_default this is the table space where the database will be created
       LC_COLLATE = 'en_US.UTF-8' -- LC_COLLATE: en_US.UTF-8 this is the collation of the database
       LC_CTYPE = 'en_US.UTF-8' -- LC_CTYPE: en_US.UTF-8 this is the character type of the database
       TEMPLATE = template0 -- Template: template0 this is the template that will be used to create the database
       CONNECTION LIMIT = -1; -- Connection limit: -1 this is the maximum number of connections that can be made to the database which is unlimited
