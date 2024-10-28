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
