# 04 — Failback

> Warning: rebuilding a standby deletes its existing data directories.

Preserve configuration:

```bash
mkdir -p /postgresql14/config-backup
cp "${PGDATA}"/*.conf /postgresql14/config-backup/
```

Clean target directories only after verifying the paths:

```bash
rm -rf "${PGDATA:?}"/*
rm -rf /postgresql14/tablespace/*
rm -rf "${PGWAL:?}"/*
```

Rebuild from the current primary:

```bash
/usr/pgsql-14/bin/pg_basebackup   -c fast -X stream -v   -D "${PGDATA}" --waldir "${PGWAL}"   -U "${REPLICATION_USER}"   -h CURRENT_PRIMARY_HOST -p "${PGPORT}"
```

Restore configuration and create the standby signal:

```bash
cp /postgresql14/config-backup/*.conf "${PGDATA}/"
touch "${PGDATA}/standby.signal"
```

Review `primary_conninfo`, `primary_slot_name`, `restore_command`, and
`recovery_target_timeline` before starting PostgreSQL.
