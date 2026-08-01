# 03 — DR Failover

Stop Pgpool-II at the unavailable primary site:

```bash
sudo systemctl stop "${PGPOOL_SERVICE}"
```

Stop PostgreSQL, preferably standby first and primary second:

```bash
sudo systemctl stop "${POSTGRES_SERVICE}"
```

Promote the DR standby:

```bash
/usr/pgsql-14/bin/pg_ctl -D "${PGDATA}" -w promote
```

Validate:

```bash
psql -p "${PGPORT}" -d "${PGDATABASE}"   -c "SELECT pg_is_in_recovery();"
```

Expected result: `false`.

Temporarily point the application to the DR PostgreSQL endpoint.
