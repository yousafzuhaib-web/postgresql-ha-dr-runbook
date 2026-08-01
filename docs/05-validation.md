# 05 — Final Validation

## Server Role

```sql
SELECT CASE
         WHEN pg_is_in_recovery() THEN 'STANDBY'
         ELSE 'PRIMARY'
       END AS server_role;
```

## Replication

```sql
SELECT application_name, client_addr, state, sync_state,
       sent_lsn, write_lsn, flush_lsn, replay_lsn,
       write_lag, flush_lag, replay_lag
FROM pg_stat_replication;
```

Expected:

| Replica | State | Synchronization |
|---|---|---|
| `sync_replica` | `streaming` | `sync` |
| `replica_dr` | `streaming` | `async` |

## Pgpool-II

```bash
psql -h "${PGPOOL_HOST}" -p "${PGPOOL_PORT}"   -U "${PGPOOL_USER}" -d "${PGDATABASE}"   -c "SHOW pool_nodes;"
```
