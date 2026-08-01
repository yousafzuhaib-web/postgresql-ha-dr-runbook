# 02 — Planned Switchover

```bash
pcp_promote_node -U "${PCP_USER}" -h "${PCP_HOST}"   -p "${PCP_PORT}" -n TARGET_NODE_ID --switchover -w
```

A successful PCP response confirms communication only. Validate the real result:

```bash
psql -h "${PGPOOL_HOST}" -p "${PGPOOL_PORT}"   -U "${PGPOOL_USER}" -d "${PGDATABASE}"   -c "SHOW pool_nodes;"
```

Confirm that roles were exchanged and both nodes show `status = up` and
`pg_status = up`.
