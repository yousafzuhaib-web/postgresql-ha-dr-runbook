# 01 — Prechecks

## Pgpool-II Watchdog

```bash
pcp_watchdog_info -w -h "${PCP_HOST}" -p "${PCP_PORT}" -U "${PCP_USER}"
```

Expected: one `LEADER`, remaining members `STANDBY`.

## Backend Nodes

```bash
psql -h "${PGPOOL_HOST}" -p "${PGPOOL_PORT}"   -U "${PGPOOL_USER}" -d "${PGDATABASE}"   -c "SHOW pool_nodes;"
```

Validate:

- `status = up`
- `pg_status = up`
- Exactly one primary
- Expected standby nodes
- Acceptable replication delay

## PostgreSQL Replication

```sql
SELECT application_name, client_addr, state, sync_state,
       sent_lsn, write_lsn, flush_lsn, replay_lsn
FROM pg_stat_replication;
```

Expected:

- `sync_replica`: `streaming`, `sync`
- `replica_dr`: `streaming`, `async`
