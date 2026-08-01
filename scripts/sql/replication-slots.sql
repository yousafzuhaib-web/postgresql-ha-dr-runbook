/*
Script: replication-slots.sql
Purpose: Display configured physical and logical replication slots.
Compatible with: PostgreSQL 14+
*/

SELECT slot_name,
       plugin,
       slot_type,
       database,
       active,
       active_pid,
       restart_lsn,
       confirmed_flush_lsn
FROM pg_replication_slots
ORDER BY slot_type, slot_name;
