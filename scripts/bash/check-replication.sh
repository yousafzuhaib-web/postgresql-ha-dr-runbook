#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ENV_FILE="${ROOT_DIR}/config/environment"

[[ -f "${ENV_FILE}" ]] || {
  echo "ERROR: Missing ${ENV_FILE}"
  exit 1
}

# shellcheck disable=SC1090
source "${ENV_FILE}"

psql -h "${PGPOOL_HOST}" -p "${PGPOOL_PORT}"   -U "${PGPOOL_USER}" -d "${PGDATABASE}"   -f "${ROOT_DIR}/scripts/sql/replication-status.sql"

psql -h "${PGPOOL_HOST}" -p "${PGPOOL_PORT}"   -U "${PGPOOL_USER}" -d "${PGDATABASE}"   -f "${ROOT_DIR}/scripts/sql/replication-slots.sql"
