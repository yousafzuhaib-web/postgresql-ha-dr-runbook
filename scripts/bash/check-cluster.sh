#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ENV_FILE="${ROOT_DIR}/config/environment"

[[ -f "${ENV_FILE}" ]] || {
  echo "ERROR: Missing ${ENV_FILE}"
  echo "Run: cp config/environment.example config/environment"
  exit 1
}

# shellcheck disable=SC1090
source "${ENV_FILE}"

pcp_watchdog_info -w -h "${PCP_HOST}" -p "${PCP_PORT}" -U "${PCP_USER}"

psql -h "${PGPOOL_HOST}" -p "${PGPOOL_PORT}"   -U "${PGPOOL_USER}" -d "${PGDATABASE}"   -c "SHOW pool_nodes;"
