/*
Script: replication-status.sql
Purpose: Display the server role and physical streaming replication status.
Compatible with: PostgreSQL 14+
*/

SELECT current_database() AS database_name,
       CASE WHEN pg_is_in_recovery() THEN 'STANDBY' ELSE 'PRIMARY' END AS server_role,
       pg_is_in_recovery() AS is_in_recovery;

SELECT pid,
       usename AS replication_user,
       application_name,
       client_addr,
       state,
       sync_state,
       sent_lsn,
       write_lsn,
       flush_lsn,
       replay_lsn,
       write_lag,
       flush_lag,
       replay_lag,
       reply_time
FROM pg_stat_replication
ORDER BY application_name;
