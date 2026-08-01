# PostgreSQL HA/DR Runbook

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-336791?logo=postgresql&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Active-success)
![Platform](https://img.shields.io/badge/Platform-Linux-blue)

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
## Screenshots

### Pgpool-II Backend Nodes

![Pgpool-II backend nodes](images/01_pgpool_show_pool_nodes.png)

### PostgreSQL Streaming Replication

![PostgreSQL streaming replication](images/02_pg_stat_replication.png)

### Replication Slots

![PostgreSQL replication slots](images/03_replication_slots.png)

### Replication Status Summary

![Replication status summary](images/04_replication_status_summary.png)

### DR Promotion

![PostgreSQL promotion output](images/05_promotion_output.png)

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
