# phpPgAdmin
[phpPgAdmin](https://github.com/phppgadmin/phppgadmin) is a web-based administration tool for [PostgreSQL](https://www.postgresql.org).

# Important
The content of this repo ist for testing purposes only.

# Getting started

## Build locally

```bash
git clone https://github.com/Raptus/raptus.cnt.mgmt.pgadmin.git
cd phppgadmin
docker build --tag="$USER/phppgadmin" .
```

### Available Configuration Parameters

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternatively you can use docker-compose.*

Below is the complete list of available options that can be used to customize your phppgadmin installation.

| Parameter | Description |
|-----------|-------------|
| `PHP_PG_ADMIN_SERVER_DESC` | Display name for the server on the login screen. Defaults to `PostgreSQL`. |
| `PHP_PG_ADMIN_SERVER_HOST` | Hostname or IP address for server.  Use '' for UNIX domain socket. Defaults to ``. |
| `PHP_PG_ADMIN_SERVER_PORT` | Database port on server. Defaults to `5432`. |
| `PHP_PG_ADMIN_SERVER_SSL_MODE` | Database SSL mode. Possible options: `disable`, `allow`, `prefer`, `require`. To require SSL on older servers use option: `legacy`. To ignore the SSL mode, use option: `unspecified`. Defaults to `allow` |
| `PHP_PG_ADMIN_SERVER_DEFAULT_DB` | Change the default database only if you cannot connect to template1. Defaults to `template1`. |
| `PHP_PG_ADMIN_SERVER_PG_DUMP_PATH` | Specify the path to the database dump utilities for this server. Defaults to `/usr/bin/pg_dump`. |
| `PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH` | Specify the path to the database dump utilities for this server. Defaults to `/usr/bin/pg_dumpall`. |
| `PHP_PG_ADMIN_DEFAULT_LANG` | Default language. E.g.: `english`, `polish`, etc.  See [lang](https://github.com/phppgadmin/phppgadmin/tree/master/lang) directory for all possibilities. If you specify `auto` it will use your browser preference. Defaults to `auto`. |
| `PHP_PG_ADMIN_AUTO_COMPLETE` | AutoComplete uses AJAX interaction to list foreign key values on insert fields. It currently only works on single column foreign keys. You can choose one of the following values: `default on` enables AutoComplete and turns it on by default. `default off` enables AutoComplete but turns it off by default. `disable` disables AutoComplete. Defaults to `default on`. |
| `PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY` | If extra login security is `true`, then logins via phpPgAdmin with no password or certain usernames (pgsql, postgres, root, administrator) will be denied. Only set this false once you have read the FAQ and understand how to change PostgreSQL's pg_hba.conf to enable passworded local connections. Defaults to `false`. |
| `PHP_PG_ADMIN_OWNED_ONLY` | Only show owned databases? Note: This will simply hide other databases in the list - this does not in any way prevent your users from seeing other database by other means. (e.g. Run ```SELECT * FROM pg_database``` in the SQL area.). Defaults to `false`. |
| `PHP_PG_ADMIN_SHOW_COMMENTS` | Display comments on objects? Comments are a good way of documenting a database, but they do take up space in the interface. Defaults to `true`. |
| `PHP_PG_ADMIN_SHOW_ADVANCED` | Display "advanced" objects? Setting this to true will show aggregates, types, operators, operator classes, conversions, languages and casts in phpPgAdmin. These objects are rarely administered and can clutter the interface. Defaults to `false`. |
| `PHP_PG_ADMIN_SHOW_SYSTEM` | Display "system" objects? Defaults to `false`. |
| `PHP_PG_ADMIN_MIN_PASSWORD_LENGTH` | Minimum length users can set their password to. Defaults to `1`. |
| `PHP_PG_ADMIN_LEFT_WIDTH` | Width of the left frame in pixels (object browser). Defaults to `200`. |
| `PHP_PG_ADMIN_THEME` | Which look & feel theme to use. Defaults to `default`. |
| `PHP_PG_ADMIN_SHOW_OIDS` | Show OIDs when browsing tables? Defaults to `false`. |
| `PHP_PG_ADMIN_MAX_ROWS` | Max rows to show on a page when browsing record sets. Defaults to `30`. |
| `PHP_PG_ADMIN_MAX_CHARS` | Max chars of each field to display by default in browse mode. Defaults to `50`. |
| `PHP_PG_ADMIN_USE_XHTML_STRICT` | Send XHTML strict headers? Defaults to `false`. |
| `PHP_PG_ADMIN_HELP_BASE` | Base URL for PostgreSQL documentation. '%s', if present, will be replaced with the PostgreSQL version (e.g. 8.4). Defaults to `http://www.postgresql.org/docs/%s/interactive/`. |
| `PHP_PG_ADMIN_AJAX_REFRESH` | Configuration for ajax scripts. Time in seconds. If set to `0`, refreshing data using ajax will be disabled (locks and activity pages). Defaults to `3`. |

## ENV Example

```bash
PHP_PG_ADMIN_SERVER_DESC=PostgreSQL
PHP_PG_ADMIN_SERVER_HOST=
PHP_PG_ADMIN_SERVER_PORT=5432
PHP_PG_ADMIN_SERVER_SSL_MODE=allow
PHP_PG_ADMIN_SERVER_DEFAULT_DB=template1
PHP_PG_ADMIN_SERVER_PG_DUMP_PATH=/usr/bin/pg_dump
PHP_PG_ADMIN_SERVER_PG_DUMPALL_PATH=/usr/bin/pg_dumpall
PHP_PG_ADMIN_DEFAULT_LANG=auto
PHP_PG_ADMIN_AUTO_COMPLETE=default on
PHP_PG_ADMIN_EXTRA_LOGIN_SECURITY=false
PHP_PG_ADMIN_OWNED_ONLY=false
PHP_PG_ADMIN_SHOW_COMMENTS=true
PHP_PG_ADMIN_SHOW_ADVANCED=false
PHP_PG_ADMIN_SHOW_SYSTEM=false
PHP_PG_ADMIN_MIN_PASSWORD_LENGTH=1
PHP_PG_ADMIN_LEFT_WIDTH=200
PHP_PG_ADMIN_THEME=default
PHP_PG_ADMIN_SHOW_OIDS=false
PHP_PG_ADMIN_MAX_ROWS=30
PHP_PG_ADMIN_MAX_CHARS=50
PHP_PG_ADMIN_USE_XHTML_STRICT=false
PHP_PG_ADMIN_HELP_BASE=http://www.postgresql.org/docs/%s/interactive/
PHP_PG_ADMIN_AJAX_REFRESH=3
```