#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ENV_FILE="${ROOT_DIR}/config/environment"
source "${ENV_FILE}"

read -r -p "Promote PostgreSQL at ${PGDATA}? Type PROMOTE: " CONFIRM
[[ "${CONFIRM}" == "PROMOTE" ]] || { echo "Promotion cancelled."; exit 1; }

/usr/pgsql-14/bin/pg_ctl -D "${PGDATA}" -w promote

psql -p "${PGPORT}" -d "${PGDATABASE}"   -c "SELECT pg_is_in_recovery();"
