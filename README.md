# PostgreSQL HA/DR Runbook

Vendor-neutral operational runbook and validation toolkit for PostgreSQL 14+,
Pgpool-II, synchronous local replication, asynchronous DR replication,
replication slots, pg_basebackup, pg_ctl promote, and standby.signal.

## Safety

- Replace all placeholders before use.
- Test in non-production first.
- Confirm backups, node roles, tablespaces, slots, and change approval.
- This public version contains no internal hostnames, IP addresses, credentials,
  company names, or confidential infrastructure details.

## Quick start

```bash
cp config/environment.example config/environment
vi config/environment
chmod +x scripts/bash/*.sh
./scripts/bash/check-cluster.sh
./scripts/bash/check-replication.sh
```

## Structure

```text
config/environment.example
diagrams/architecture.md
docs/01-prechecks.md
docs/02-switchover.md
docs/03-dr-failover.md
docs/04-failback.md
docs/05-validation.md
examples/myrecovery.conf.example
scripts/bash/check-cluster.sh
scripts/bash/check-replication.sh
scripts/bash/promote-node.sh
scripts/bash/rebuild-standby.sh
scripts/sql/replication-status.sql
scripts/sql/replication-slots.sql
```

## Author

Zuhaib Yousaf Begum  
PostgreSQL Consultant
