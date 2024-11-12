# learning-pgsql

## Create Database

In PostgreSQL, **templates** are predefined databases used as starting points when creating new databases. They provide a structure and initial setup that can be cloned into a new database. PostgreSQL comes with two default templates: `template1` and `template0`.

In summary, `template1` is the default template for creating new databases, while `template0` is a clean, unmodifiable template that can be used to create databases with specific settings.

### Template1

- `template1` is the default template that PostgreSQL uses to create new databases if no template is specified.
- It contains some default objects and settings that can be customized by the PostgreSQL user. Any changes made to `template1` (such as adding extensions, functions, or custom settings) will be cloned into any new databases created using it.
- Since it’s modifiable, if you install extensions or add custom settings to `template1`, these will automatically be included in all databases created from it.

### Template0

- `template0` is a "pristine" template, containing only the bare essentials and no custom configurations.
- It is useful when you want to create a database with specific settings, such as custom encoding or collation, because it doesn’t enforce existing settings.
- `template0` is unmodifiable to ensure it remains in its original, clean state. This makes it ideal when you need to set a specific collation or encoding that might differ from `template1`.

When creating a new database, you can specify a template as follows:

```sql
CREATE DATABASE my_database TEMPLATE template0;
```

Or use `template1` explicitly (though it’s the default):

```sql
CREATE DATABASE my_database TEMPLATE template1;
```

By choosing `template0`, you have more flexibility with encoding and collation settings, especially in cases where `template1` imposes a default setting that might be incompatible with what you need.

## Create Table

To create a new table in PostgreSQL, you use the `CREATE TABLE` statement. The following illustrates the basic syntax of the `CREATE TABLE` statement:

```sql
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
    ...
);
```

In this syntax:
column1, column2, column3, … are the names of the columns of the table.
datatype is the type of data that the column can hold such as integer, character, decimal, etc.
table_name is the name of the table that the new table will belong to.

### Data types

PostgreSQL provides several data types that allow you to define columns of tables:
VARCHAR(n): A variable-length character string with a maximum size of n characters.
TEXT: A variable-length character string with no maximum limit.
CHAR(n): A fixed-length character string with a size of n characters.
INTEGER: A signed four-byte integer.
DECIMAL: An exact numeric value with a fixed number of digits on both the whole and the fractional parts.
NUMERIC: An exact numeric value with a user-specified precision and scale.
DATE: A date value in the format YYYY-MM-DD.
TIME: A time value in the format HH:MI:SS.
TIMESTAMP: A date and time value in the format YYYY-MM-DD HH:MI:SS.
BOOLEAN: A true or false value.
SERIAL: An auto-incrementing four-byte integer.
In addition to the basic data types, PostgreSQL provides several special-purpose data types such as geometric, network address, and monetary data types.
REAL: A single-precision floating-point number, it just caring about the 6 digits after the decimal point to be percise, if more than that, it will work aROUND it.

### Constraints

Constraints are rules that enforce the integrity of the data stored in the table. PostgreSQL provides several types of constraints that you can add to a table:

- `NOT NULL`: Ensures that a column cannot have a NULL value.
- `UNIQUE`: Ensures that all values in a column are unique, if you used it like this `UNIQUE (column1, column2, …)`, it will ensure that the combination of values in the specified columns is unique.
- `PRIMARY KEY`: A combination of `NOT NULL` and `UNIQUE`. It uniquely identifies each row in a table.
- `FOREIGN KEY`: Ensures that the values in a column match the values in another table’s column.
- `CHECK`: Ensures that all values in a column satisfy a specified condition, it works with operators like `=`, `>`, `<`, `>=`, `<=`, `<>`, `BETWEEN`, `LIKE`, `IN`, and `IS NULL`.
- `DEFAULT`: Provides a default value for a column when no value is specified.
- `INDEX`: Improves the performance of queries by allowing them to retrieve data more quickly.

### On Delete/Update Options

When you define a foreign key constraint, you can specify the `ON DELETE` and `ON UPDATE` options to define the action that the database should take when a referenced row is deleted or updated. The following options are available:

- `CASCADE`: Deletes or updates the rows in the child table when the referenced row is deleted or updated.
- `SET NULL`: Sets the foreign key column in the child table to NULL when the referenced row is deleted or updated.
- `RESTRICT`: Prevents the deletion or update of the referenced row if there are any related rows in the child table.
- `NO ACTION`: The same as `RESTRICT`. It prevents the deletion or update of the referenced row if there are any related rows in the child table.

Here’s an example that creates a foreign key constraint with the `ON DELETE CASCADE` option:

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (product_id)
        REFERENCES products (product_id)
        ON DELETE CASCADE
);
```

In this example, the `ON DELETE CASCADE` option specifies that when a row in the `products` table is deleted, all related rows in the `orders` table will also be deleted.

## Insert Data

To insert data into a table in PostgreSQL, you use the `INSERT INTO` statement. The following illustrates the syntax of the `INSERT INTO` statement:

```sql
INSERT INTO table_name (column1, column2, column3, …)
VALUES (value1, value2, value3, …);
```

btw, you can insert multiple rows into a table with a single `INSERT` statement as follows:

```sql
INSERT INTO table_name (column1, column2, column3, …)
VALUES
    (value1, value2, value3, …),
    (value4, value5, value6, …),
    …;
```

you can also insert from another table as follows:

```sql
INSERT INTO table_name (column1, column2, column3, …)
SELECT column1, column2, column3, …
FROM another_table
WHERE condition;
``` 

## Fetch Data

To query data from a table in PostgreSQL, you use the `SELECT` statement. The following illustrates the basic syntax of the `SELECT` statement:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table_name;
```

In this syntax:

- column1, column2, … are the columns of the table that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.

If you want to retrieve data from all columns of the table, you use the following syntax:

```sql
SELECT * FROM table_name;
```

In this syntax, the asterisk (\*) is a wildcard character that represents all columns of the table.

### Math Operators

You can use the following math operators in the `SELECT` statement to perform arithmetic operations:

- `+` for addition
- `-` for subtraction
- `*` for multiplication
- `/` for division
- `%` for modulor
- `^` for exponentiation
- `|/` for square root
- `||/` for cube root
- `!!` for factorial
- `@` for absolute value
- `||` for concatenation

### String Functions

PostgreSQL provides a variety of string functions that allow you to manipulate strings. Here are some common string functions:

- `LENGTH(string)`: Returns the length of the string.
- `UPPER(string)`: Converts the string to uppercase.
- `LOWER(string)`: Converts the string to lowercase.
- `TRIM([leading|trailing|both] [characters] from string)`: Removes the specified characters from the beginning, end, or both ends of the string.
- `POSITION(substring IN string)`: Returns the position of the substring in the string.
- `SUBSTRING(string FROM start [FOR length])`: Extracts a substring from the string.
- `CONCAT(string1, string2)`: Concatenates two strings.

### Math Functions

PostgreSQL provides a variety of math functions that allow you to perform mathematical operations. Here are some common math functions:

- `ABS(number)`: Returns the absolute value of the number.
- `CEIL(number)`: Returns the smallest integer greater than or equal to the number.
- `FLOOR(number)`: Returns the largest integer less than or equal to the number.
- `ROUND(number, decimal_places)`: Rounds the number to the specified number of decimal places.
- `SQRT(number)`: Returns the square root of the number.
- `CBRT(number)`: Returns the cube root of the number.
- `POWER(base, exponent)`: Returns the base raised to the exponent.
- `MOD(dividend, divisor)`: Returns the remainder of the division of the dividend by the divisor.
- `RANDOM()`: Returns a random number between 0 and 1.
- `TRUNC(number, decimal_places)`: Truncates the number to the specified number of decimal places.
- `GREATEST(value1, value2, …)`: Returns the greatest value from a list of values.
- `LEAST(value1, value2, …)`: Returns the least value from a list of values.

## Filter Data

To filter data in PostgreSQL, you use the `WHERE` clause in the `SELECT` statement. The following illustrates the basic syntax of the `SELECT` statement with the `WHERE` clause:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table_name
WHERE
    condition;
```

In this syntax:

- column1, column2, … are the columns of the table that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

The `WHERE` clause allows you to filter rows based on a specified condition. If the condition evaluates to true, the row is included in the result set; otherwise, it is excluded.

### Comparison Operators

PostgreSQL provides a variety of comparison operators that allow you to compare values. Here are some common comparison operators:

- `=`: Equal to
- `<>` or `!=`: Not equal to
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal to
- `<=`: Less than or equal to
- `BETWEEN`: Between an inclusive range
- `IN`: In a specified list
- `NOT IN`: Not in a specified list
- `LIKE`: Similar to a specified pattern
- `ILIKE`: Case-insensitive version of `LIKE`
- `IS NULL`: Is a null value
- `IS NOT NULL`: Is not a null value
- `IS DISTINCT FROM`: Is distinct from a specified value
- `IS NOT DISTINCT FROM`: Is not distinct from a specified value
- `ANY` or `SOME`: Compares a value to any value in a list
- `ALL`: Compares a value to all values in a list

### Logical Operators

PostgreSQL provides several logical operators that allow you to combine multiple conditions. Here are some common logical operators:

- `AND`: Returns true if both conditions are true
- `OR`: Returns true if either condition is true
- `NOT`: Returns true if the condition is false

### Case Expression

The `CASE` expression allows you to add conditional logic to a query. It evaluates a list of conditions and returns one of multiple possible result expressions. The following illustrates the basic syntax of the `CASE` expression:

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result
END
```

In this syntax:

- condition1, condition2, … are the conditions that you want to evaluate.
- result1, result2, … are the result expressions that you want to return.
- result is the default result expression if none of the conditions are true.

## Update Data

To update data in a table in PostgreSQL, you use the `UPDATE` statement. The following illustrates the basic syntax of the `UPDATE` statement:

```sql
UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition;
```

In this syntax:

- table_name is the name of the table that you want to update data in.
- column1, column2, … are the columns that you want to update.
- value1, value2, … are the new values that you want to set for the columns.

## Delete Data

To delete data from a table in PostgreSQL, you use the `DELETE` statement. The following illustrates the basic syntax of the `DELETE` statement:

```sql
DELETE FROM table_name
WHERE condition;
```

In this syntax:

- table_name is the name of the table that you want to delete data from.
- condition is a boolean expression that evaluates to true or false.

The `DELETE` statement deletes all rows from the table that satisfy the condition. If you omit the `WHERE` clause, the `DELETE` statement will delete all rows from the table.

## Aggregate Functions

PostgreSQL provides a variety of aggregate functions that allow you to perform calculations on a set of values. Here are some common aggregate functions:

- `COUNT()`: Returns the number of rows in a group.
- `SUM()`: Returns the sum of values in a group.
- `AVG()`: Returns the average of values in a group.
- `MIN()`: Returns the minimum value in a group.
- `MAX()`: Returns the maximum value in a group.

You can use aggregate functions in the `SELECT` statement to calculate summary statistics for a group of rows. Here’s an example that calculates the total number of employees in the `employees` table:

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```

In this example, the `COUNT()` function calculates the total number of rows in the `employees` table. The `AS` keyword is used to alias the result of the aggregate function as `total_employees`.

## Group Data

To group data in PostgreSQL, you use the `GROUP BY` clause in the `SELECT` statement. The `GROUP BY` clause divides the rows returned by the `SELECT` statement into groups. The following illustrates the basic syntax of the `SELECT` statement with the `GROUP BY` clause:

```sql
SELECT
    column1,
    aggregate_function(column2)
FROM
    table_name
GROUP BY
    column1;
```

In this syntax:

- column1 is the column that you want to group by.
- aggregate_function(column2) is an aggregate function that calculates summary statistics for each group.
- table_name is the name of the table that you want to query data from.

The `GROUP BY` clause divides the rows returned by the `SELECT` statement into groups based on the values in the specified column. The aggregate function calculates summary statistics for each group.

### HAVING Clause

The `HAVING` clause allows you to filter groups based on a specified condition. The following illustrates the basic syntax of the `SELECT` statement with the `GROUP BY` and `HAVING` clauses:

```sql
SELECT
    column1,
    aggregate_function(column2)
FROM
    table_name
GROUP BY
    column1
HAVING
    condition;
```

In this syntax:

- column1 is the column that you want to group by.
- aggregate_function(column2) is an aggregate function that calculates summary statistics for each group.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

The `HAVING` clause filters groups based on a specified condition. If the condition evaluates to true, the group is included in the result set; otherwise, it is excluded.

## Order Data

To order data in PostgreSQL, you use the `ORDER BY` clause in the `SELECT` statement. The `ORDER BY` clause sorts the rows returned by the `SELECT` statement. The following illustrates the basic syntax of the `SELECT` statement with the `ORDER BY` clause:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table_name
ORDER BY
    column1 [ASC|DESC],
    column2 [ASC|DESC],
    ...;
```

In this syntax:

- column1, column2, … are the columns that you want to sort by, it will sort by the first column first, then the second column, and so on.
- table_name is the name of the table that you want to query data from.
- ASC is the ascending order (default).
- DESC is the descending order.

## Joining Tables

In PostgreSQL, you can join two or more tables to query data from multiple tables. The following illustrates the basic syntax of the `SELECT` statement with the `JOIN` clause:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table1
JOIN
    table2 ON table1.column_name = table2.column_name;
```

In this syntax:

- table1, table2 are the names of the tables that you want to join.
- column1, column2, … are the columns that you want to retrieve data from.
- column_name is the column that you want to join the tables on.

### Types of Joins

PostgreSQL supports several types of joins that allow you to combine rows from two or more tables. Here are some common types of joins:

- `INNER JOIN` or `JOIN`: Returns rows when there is a match in both tables.
- `LEFT JOIN` or `LEFT OUTER JOIN`: Returns all rows from the left table and the matched rows from the right table.
- `RIGHT JOIN` or `RIGHT OUTER JOIN`: Returns all rows from the right table and the matched rows from the left table.
- `FULL JOIN` or `FULL OUTER JOIN`: Returns rows when there is a match in one of the tables.

## Pagination

To limit the number of rows returned by a query in PostgreSQL, you use the `LIMIT` clause. The `LIMIT` clause is typically used with the `ORDER BY` clause to sort the rows before limiting the number of rows returned. The following illustrates the basic syntax of the `SELECT` statement with the `LIMIT` clause:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table_name
ORDER BY
    column1
LIMIT
    row_count
OFFSET
    offset;
```

In this syntax:

- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- row_count is the maximum number of rows to return.
- offset is the number of rows to skip before starting to return rows.

The `LIMIT` clause allows you to limit the number of rows returned by a query. The `OFFSET` clause allows you to skip a specified number of rows before starting to return rows.

## Unions

In PostgreSQL, you can combine the results of two or more queries using the `UNION` operator. The `UNION` operator removes duplicate rows from the result set. The following illustrates the basic syntax of the `UNION` operator:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table1
UNION -- or `UNION ALL` to keep duplicates
SELECT
    column1,
    column2,
    ...
FROM
    table2;
```

In this syntax:

- column1, column2, … are the columns that you want to retrieve data from.
- table1, table2 are the names of the tables that you want to query data from.
- `UNION` removes duplicate rows from the result set.
- `UNION ALL` keeps duplicate rows in the result set.
- The number of columns and their data types must match in all queries.

The `UNION` operator allows you to combine the results of two or more queries into a single result set. The `UNION ALL` operator allows you to combine the results of two or more queries into a single result set, including duplicate rows.

## Intersections

In PostgreSQL, you can find the intersection of two or more queries using the `INTERSECT` operator. The `INTERSECT` operator returns rows that are common to all queries. The following illustrates the basic syntax of the `INTERSECT` operator:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table1
INTERSECT -- or `INTERSECT ALL` to keep duplicates
SELECT
    column1,
    column2,
    ...
FROM
    table2;
```

In this syntax:

- column1, column2, … are the columns that you want to retrieve data from.
- table1, table2 are the names of the tables that you want to query data from.
- The number of columns and their data types must match in all queries.

The `INTERSECT` operator allows you to find the intersection of two or more queries. It returns rows that are common to all queries.

## Differences

In PostgreSQL, you can find the difference between two or more queries using the `EXCEPT` operator. The `EXCEPT` operator returns rows that are in the first query but not in the second query. The following illustrates the basic syntax of the `EXCEPT` operator:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table1
EXCEPT -- or `EXCEPT ALL` to keep duplicates
SELECT
    column1,
    column2,
    ...
FROM
table2;
```

In this syntax:

- column1, column2, … are the columns that you want to retrieve data from.
- table1, table2 are the names of the tables that you want to query data from.
- The number of columns and their data types must match in all queries.

The `EXCEPT` operator allows you to find the difference between two or more queries. It returns rows that are in the first query but not in the second query.

## Subqueries

In PostgreSQL, you can nest one query inside another query to perform more complex queries. A query that contains another query is called a subquery. The following illustrates the basic syntax of a subquery:

```sql
SELECT
    column1,
    column2,
    ...
FROM
    table_name
WHERE
    column1 IN (SELECT column1 FROM table_name WHERE condition);
```

In this syntax:

- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

## Indexes

In PostgreSQL, an index is a data structure that improves the speed of data retrieval operations on a table. Indexes are used to quickly locate data without having to search every row in a table. The following illustrates the basic syntax of creating an index:

```sql
CREATE INDEX index_name
ON table_name (column1, column2, ...);
```

In this syntax:

- index_name is the name of the index.
- table_name is the name of the table that the index will be created on.
- column1, column2, … are the columns that the index will be created on.

Indexes can be created on one or more columns of a table. When you create an index on a column, PostgreSQL creates a separate data structure that stores the values of that column in sorted order. This allows PostgreSQL to quickly locate rows based on the values in the indexed column.

NOTICE: PostgreSQL automatically creates an index for the `primary key` and `unique` constraints columns of a table. You can also create indexes manually to improve the performance of queries that filter, sort, or join data.

## Benchmarks

In PostgreSQL, you can use the `EXPLAIN` statement to analyze the execution plan of a query. The `EXPLAIN` statement shows how PostgreSQL will execute a query, including the order in which tables will be accessed and the types of joins that will be used. The following illustrates the basic syntax of the `EXPLAIN` statement:

```sql
EXPLAIN ANALYSE SELECT
    column1,
    column2,
    ...
FROM
    table_name
WHERE
    condition;
```

In this syntax:

- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

The `EXPLAIN` statement provides valuable information about how PostgreSQL will execute a query. It can help you identify performance bottlenecks and optimize your queries for better performance.

The `ANALYSE` option tells PostgreSQL to actually execute the query and provide detailed performance statistics. This can help you identify slow queries and optimize them for better performance.

## Common Table Expressions 

In PostgreSQL, you can use common table expressions (CTEs) to define temporary result sets that can be used in subsequent queries. CTEs are useful for breaking down complex queries into smaller, more manageable parts. The following illustrates the basic syntax of a CTE:

```sql
WITH cte_name AS (
    SELECT
        column1,
        column2,
        ...
    FROM
        table_name
    WHERE
        condition
)
SELECT
    column1,
    column2,
    ...
FROM
    cte_name;
```

In this syntax:

- cte_name is the name of the common table expression.
- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

CTEs allow you to define temporary result sets that can be used in subsequent queries. They are useful for breaking down complex queries into smaller, more manageable parts.

## Recursive Common Table Expressions

In PostgreSQL, you can use recursive common table expressions (CTEs) to define recursive queries that reference themselves. Recursive CTEs are useful for querying hierarchical data structures, such as organization charts or bill of materials. The following illustrates the basic syntax of a recursive CTE:

```sql
WITH RECURSIVE cte_name AS (
    SELECT
        column1,
        column2,
        ...
    FROM
        table_name
    WHERE
        condition
    UNION ALL
    SELECT
        column1,
        column2,
        ...
    FROM
        cte_name
    WHERE
        condition
)
SELECT
    column1,
    column2,
    ...
FROM
    cte_name;
```

In this syntax:

- cte_name is the name of the recursive common table expression.
- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

Recursive CTEs allow you to define recursive queries that reference themselves. They are useful for querying hierarchical data structures, such as organization charts or bill of materials.

## Views

In PostgreSQL, a view is a virtual table that is based on the result of a query. Views allow you to encapsulate complex queries and reuse them in other queries. The following illustrates the basic syntax of creating a view:

```sql
CREATE VIEW view_name AS
SELECT
    column1,
    column2,
    ...
FROM
    table_name
WHERE
    condition;
```

In this syntax:

- view_name is the name of the view.
- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

Views allow you to encapsulate complex queries and reuse them in other queries. They are useful for simplifying queries and improving performance by precomputing results.

## Materialized Views

In PostgreSQL, a materialized view is a physical copy of the result of a query that is stored on disk. Materialized views are useful for improving the performance of queries that involve complex calculations or aggregations. The following illustrates the basic 

Think of a materialized view as a cache for the result of a query. When you create a materialized view, PostgreSQL executes the query and stores the result on disk. Subsequent queries can then retrieve the result from the materialized view instead of re-executing the query.

syntax of creating a materialized view:

```sql
CREATE MATERIALIZED VIEW view_name AS
SELECT
    column1,
    column2,
    ...
FROM
    table_name
WHERE
    condition;
```

In this syntax:

- view_name is the name of the materialized view.
- column1, column2, … are the columns that you want to retrieve data from.
- table_name is the name of the table that you want to query data from.
- condition is a boolean expression that evaluates to true or false.

And to refresh the materialized view, you can use the `REFRESH MATERIALIZED VIEW` statement:

```sql
REFRESH MATERIALIZED VIEW view_name;
```

Materialized views are useful for improving the performance of queries that involve complex calculations or aggregations. They can help reduce the time it takes to execute queries by precomputing results and storing them on disk.

## Transactions

In PostgreSQL, a transaction is a sequence of one or more SQL statements that are executed as a single unit of work. Transactions allow you to group multiple statements together and ensure that they are executed atomically. The following illustrates the basic syntax of a transaction:

```sql
BEGIN;
-- SQL statements
COMMIT;
```

In this syntax:

- `BEGIN` starts a new transaction.
- `COMMIT` commits the transaction and makes the changes permanent.

Transactions allow you to group multiple statements together and ensure that they are executed atomically. If any statement in the transaction fails, the entire transaction is rolled back, and the changes are discarded.

If you want to discard the changes made in a transaction, you can use the `ROLLBACK` statement:

```sql
BEGIN;
-- SQL statements
ROLLBACK;
```

The `ROLLBACK` statement discards the changes made in the transaction and rolls back to the beginning of the transaction.
