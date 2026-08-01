# PostgreSQL High Availability & Disaster Recovery Runbook

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14%2B-blue?logo=postgresql)
![Pgpool-II](https://img.shields.io/badge/Pgpool--II-4.x-success)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Linux-RHEL%20%7C%20Ubuntu-orange)

Production-ready PostgreSQL High Availability (HA) and Disaster Recovery (DR)
runbook based on **Pgpool-II**, **Streaming Replication**, **Replication Slots**,
**WAL Archiving**, and **pg_basebackup**.

---

# Architecture

<p align="center">
  <img src="images/00_postgresql_ha_dr_architecture.png"
       width="100%"
       alt="PostgreSQL High Availability Architecture">
</p>

---

# Features

- Pgpool-II Cluster
- Watchdog Quorum
- Connection Pooling
- Automatic Failover
- Streaming Replication
- Synchronous Standby
- Asynchronous Disaster Recovery
- Replication Slots
- WAL Archiving
- Point-in-Time Recovery (PITR)
- pg_basebackup
- Standby Rebuild
- PostgreSQL Validation Scripts
- Operational Runbooks

---

# Supported Versions

| Component | Supported |
|-----------|-----------|
| PostgreSQL | 14, 15, 16, 17, 18 |
| Pgpool-II | 4.x |
| Linux | RHEL, Rocky Linux, AlmaLinux, Ubuntu |

---

# Architecture Components

| Component | Description |
|-----------|-------------|
| Applications | Client connections |
| Pgpool-II Node 1 | Active Leader |
| Pgpool-II Node 2 | Standby |
| Pgpool-II Node 3 | Watchdog Quorum (No PostgreSQL backend) |
| PostgreSQL Primary | Read/Write |
| PostgreSQL Standby | Synchronous Replica |
| DR Standby | Asynchronous Replica |

---

# Repository Structure

```text
postgresql-ha-dr-runbook/
├── config/
├── diagrams/
├── docs/
├── examples/
├── images/
├── scripts/
│   ├── bash/
│   └── sql/
├── .github/
├── LICENSE
└── README.md
```

---

# Quick Start

```bash
cp config/environment.example config/environment

chmod +x scripts/bash/*.sh

./scripts/bash/check-cluster.sh
./scripts/bash/check-replication.sh
```

---

# Runbooks

| Runbook | Description |
|----------|-------------|
| Prechecks | Validate cluster health |
| Switchover | Planned failover |
| DR Failover | Promote DR standby |
| Failback | Restore primary site |
| Validation | Verify PostgreSQL and Pgpool-II |

---

# SQL Scripts

| Script | Purpose |
|----------|---------|
| replication-status.sql | Streaming replication status |
| replication-slots.sql | Replication slot validation |

---

# Screenshots

## Pgpool-II Backend Nodes

![Pgpool](images/01_pgpool_show_pool_nodes.png)

## Streaming Replication

![Replication](images/02_pg_stat_replication.png)

## Replication Slots

![Slots](images/03_replication_slots.png)

## Replication Summary

![Summary](images/04_replication_status_summary.png)

## Promotion

![Promotion](images/05_promotion_output.png)

## Standby Rebuild

![Base Backup](images/06_basebackup_rebuild.png)

---

# Safety Notice

> **Warning**
>
> These procedures are intended as reference material.
> Always validate commands, test in a non-production environment, and adapt them to your infrastructure before executing them in production.

---

# Related Projects

- PostgreSQL Health Check Toolkit
  - https://github.com/yousafzuhaib-web/postgresql-health-check

---

# Author

**Zuhaib Yousaf Begum**

PostgreSQL Consultant

- PostgreSQL HA/DR
- Performance Tuning
- Backup & Recovery
- Automation
- Azure & AWS
