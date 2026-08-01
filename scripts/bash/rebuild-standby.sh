#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ENV_FILE="${ROOT_DIR}/config/environment"
source "${ENV_FILE}"

SOURCE_HOST="${1:-}"
SLOT_NAME="${2:-}"

if [[ -z "${SOURCE_HOST}" || -z "${SLOT_NAME}" ]]; then
  echo "Usage: $0 <source-primary-host> <replication-slot>"
  exit 1
fi

echo "WARNING: this will delete ${PGDATA} and ${PGWAL}."
read -r -p "Type REBUILD to continue: " CONFIRM
[[ "${CONFIRM}" == "REBUILD" ]] || { echo "Cancelled."; exit 1; }

sudo systemctl stop "${POSTGRES_SERVICE}"

mkdir -p /postgresql14/config-backup
cp "${PGDATA}"/*.conf /postgresql14/config-backup/ 2>/dev/null || true

rm -rf "${PGDATA:?}"/*
rm -rf "${PGWAL:?}"/*

/usr/pgsql-14/bin/pg_basebackup   -c fast -X stream -S "${SLOT_NAME}" -v   -D "${PGDATA}" --waldir "${PGWAL}"   -U "${REPLICATION_USER}"   -h "${SOURCE_HOST}" -p "${PGPORT}"

cp /postgresql14/config-backup/*.conf "${PGDATA}/" 2>/dev/null || true
touch "${PGDATA}/standby.signal"

echo "Review recovery configuration before starting PostgreSQL."
